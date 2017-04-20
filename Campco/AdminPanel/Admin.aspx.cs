using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Campco.AdminPanel
{
    public partial class Admin : System.Web.UI.Page
    {
        #region Declare Varible
        dbUtility dbutl = new dbUtility();
        public List<OrderDetail> OrderDetailList = null;
        public static string shipping = "";
        public int cus_type = 0;
        string path = "";
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //path = Server.MapPath("~/Tracking_info.html");
                if (Page.IsPostBack == false)
                {

                    if (SessionVariable.CustomerID != null)
                    {
                        cus_type = SessionVariable.customerType;
                        //GetOrderDetail_History(SessionVariable.CustomerID);
                      //  OrderDetailList = dbutl.TrankingOrder(0, 0);

                    }
                }
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }           
        }

        #region Get Order Detail
        [WebMethod]
        public static List<OrderDetail> GetDetails(string number, int param)
        {
            List<OrderDetail> OrderDetailList = new List<OrderDetail>();
            dbUtility dbutl = new dbUtility();
            try
            {
                OrderDetailList = dbutl.AdminOrderDetails(0, Convert.ToInt32(number), 0);
                shipping = SessionVariable.ShippingCharge.ToString("0.00");
                return OrderDetailList;
            }
            catch(Exception ex)
            {
                dbutl.logerrors(ex);
            }
            return OrderDetailList; 
        }


        [WebMethod]
        public static List<OrderDetail> GetINVOICEDetails(string number)
        {
            dbUtility dbutl = new dbUtility();
            var OrderDetailList = dbutl.AdminOrderDetails(Convert.ToInt32(number),0, 0);
            shipping = SessionVariable.ShippingCharge.ToString("0.00");
            return OrderDetailList;
        }
        #endregion

        #region Update Invoice and Tracking

        [WebMethod]
        public static string UpdateINVOICEDetails(string cus_ID, string invs_num, string ord_num, string trackID, string param)
        {
            dbUtility dbutl = new dbUtility();
            var Tmp = dbutl.Tracking(cus_ID, Convert.ToInt32(invs_num), Convert.ToInt32(ord_num), trackID, Convert.ToInt32(param));
            var Datatable = Tmp.Tables[0];
            var name = Datatable.Rows[0]["ATTN"]!=DBNull.Value|| Datatable.Rows[0]["ATTN"].ToString() != ""? Datatable.Rows[0]["ATTN"].ToString(): Datatable.Rows[0]["SP_ADR"].ToString();
            string Email= Datatable.Rows[0]["email_adr"] != null || Datatable.Rows[0]["email_adr"].ToString() != "" ? Datatable.Rows[0]["email_adr"].ToString() : "";
            int CUSTYPE= Datatable.Rows[0]["CUS_TYPE"]!=DBNull.Value|| Datatable.Rows[0]["CUS_TYPE"].ToString()!=""? Convert.ToInt32(Datatable.Rows[0]["CUS_TYPE"]):1;
            string OrderDate= Convert.ToDateTime(Datatable.Rows[0]["OrderDate"]).ToString("yyyy-MM-dd"); 
            string fname = Datatable.Rows[0]["SP_ADR"].ToString().Trim();
            string address= Datatable.Rows[0]["SP_ADR_2"].ToString().Trim() +""+ (Datatable.Rows[0]["SP_ADR_22"].ToString()!=""? ","+Datatable.Rows[0]["SP_ADR_22"].ToString().Trim():"");
            string address2 = Datatable.Rows[0]["SP_ADR_3"].ToString().Trim();
            string address3 = Datatable.Rows[0]["SP_ADR_CT"].ToString().Trim() + ""+( Datatable.Rows[0]["SP_ADR_ST"].ToString().Trim() !=""? "," + Datatable.Rows[0]["SP_ADR_ST"].ToString().Trim():"") + "- "+ Datatable.Rows[0]["SP_ADR_ZP"].ToString().Trim();
            string email = Datatable.Rows[0]["email_adr"].ToString().Trim();
            //string Phone = Datatable.Rows[0]["ATTN"].ToString() + " " + Datatable.Rows[0]["ATTN"].ToString();


            string str = "";
            try
            {
                var OrderDetailList = dbutl.AdminOrderDetails(0, Convert.ToInt32(ord_num), 0);
                double totalAmount = 0;
                //double subtotal = 0;
                double ship_charge = 0;
                
                str += "<table border='1'>";
                str += "<thead>";
                str += "<tr>";
                str += "<td width='40%'><h5>Description</h5></td><td width='20%'><h5>Qty</h5></td><td width='20%'><h5>Price</h5></td><td width='20%'><h5>Item Total</h5></td>";
                str += "</tr>";
                str += "</thead>";
                str += "<tbody>";
                foreach (var item in OrderDetailList)
                {
                    totalAmount += Convert.ToDouble(item.UNIT_PRS) * Convert.ToInt32(item.ORDER_QTY);
                    str += "<tr>";
                    str += "<td>" + item.PROD_CD + "<p>" + item.DESC + "</p></td>";
                    str += "<td><p>" + item.ORDER_QTY + "</p></td>";
                    str += "<td><p>$" + item.UNIT_PRS + "</p></td>";
                    str += "<td><p>$" + Convert.ToDouble(item.UNIT_PRS) * Convert.ToInt32(item.ORDER_QTY )+ "</p></td>";
                    str += "</tr>";
                }
                str += "<tr><td class='thick - line'></td><td class='thick - line'></td><td class='thick - line text - center'><strong>Sub Total:</strong></td><td class='thick - line text - right'>$" + totalAmount + "</td></tr>";
                if (CUSTYPE == 3)
                {
                    //if (drop > 0)
                   // {
                        str += "<tr><td class='no - line'></td><td class='no - line'></td><td class='no - line text - center'><strong>Drop Ship Fee:</strong></td><td class='no - line text - right'>"+ Convert.ToDouble(OrderDetailList[0].HANDL_FEE).ToString("0.00") + "</td></tr>";
                    // }
                    if(OrderDetailList[0].HANDL_FEE!= "0.00")
                    {
                        totalAmount += Convert.ToDouble(OrderDetailList[0].HANDL_FEE);
                    }
                    
                }
                else
                {
                   // if (shippingCharge > 0)
                  //  {
                        str += "<tr><td></td><td></td><td><strong>Shipping Charge :</strong></td><td >$" + Convert.ToDouble(OrderDetailList[0].HANDL_FEE).ToString("00.00") + "</td></tr>";
                    if (OrderDetailList[0].HANDL_FEE != "0.00")
                    {
                        totalAmount += Convert.ToDouble(OrderDetailList[0].HANDL_FEE);
                    }
                    //  }
                }
                str += "<tr><td ></td><td ></td><td ><strong>Grand Total:</strong></td><td >$" + totalAmount + "</td></tr>";
                str += "</tbody>";
                str += "</table>";
            }
            catch
            {

            }
            #region Body

            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HostingEnvironment.MapPath("~/Tracking_info.html")))
            {
                body = reader.ReadToEnd();
            }
            
            body = body.Replace("{trackingID}", trackID.Trim());
            body = body.Replace("{username}", name.Trim());
            body = body.Replace("{order_number}", ord_num.Trim());
            body = body.Replace("{datetime}", OrderDate.Trim());
            body = body.Replace("{table}", str.Trim());
            body = body.Replace("{ShipName}", fname);
            body = body.Replace("{Street}", address );
            body = body.Replace("{State}", address2+" "+address3);
            body = body.Replace("{Email}", email);
            //body = body.Replace("{PhoneNumber}", Address.phoneNumber);

            #endregion
            if (Email != "")
            {
                var Mailsubject = "";
                if (CUSTYPE == 3)
                {
                    Mailsubject = "Your CampCo invoice# "+invs_num+" has shipped";
                }
                else
                {
                    Mailsubject = "Your CampCo Order # " + ord_num + " has shipped";
                }
                body = body.Replace("{ordernumber}", Mailsubject);
                var x = dbutl.SendEmaill(ConfigurationManager.AppSettings["CompanyEmailAddress"], ConfigurationManager.AppSettings["PasswordMail"], Email.Trim(), Mailsubject, body, ConfigurationManager.AppSettings["CompanyEmailAddress"],1);
                //shipping = SessionVariable.ShippingCharge.ToString("0.00");
                if (x == "")
                {
                    return "1";
                }
                else
                {
                    return "3";
                }
            }
            else
            {
                return "2";
            }
        }
        #endregion

        #region Filter
        [WebMethod]
        public static List<OrderDetail> Filter(string value)
        {
            List<OrderDetail> OrderDetailList = new List<OrderDetail>();
            dbUtility dbutl = new dbUtility();
            try
            {
                //OrderDetailList = dbutl.TrankingOrderFilter(value,0);
                shipping = SessionVariable.ShippingCharge.ToString("0.00");
                return OrderDetailList;
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
            return OrderDetailList;
        }
        #endregion
    }
}