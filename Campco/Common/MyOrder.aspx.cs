using MasterSystem.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Campco.Common
{
    public partial class MyOrder : System.Web.UI.Page
    {
        #region Declare Varible
        dbUtility dbutl = new dbUtility();
        public List<OrderDetail> OrderDetailList = null;
        public static string shipping = "";
        public int cus_type = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
                if (Page.IsPostBack == false)
                {
                    if (SessionVariable.CustomerID != null)
                    {
                        cus_type = SessionVariable.customerType;
                        //GetOrderDetail_History(SessionVariable.CustomerID);
                        OrderDetailList = dbutl.MyOrder(0, 1);
                    }
                }
            }
            catch(Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }
        #region Get Order Detail
        [WebMethod]
        public static List<OrderDetail> GetDetails(string number,int param)
        {
            dbUtility dbutl = new dbUtility();
            var  OrderDetailList = dbutl.OrderDetails(Convert.ToInt32(number), param);
            shipping = SessionVariable.ShippingCharge.ToString("0.00");
            return OrderDetailList;
        }


        [WebMethod]
        public static List<OrderDetail> GetINVOICEDetails(string number)
        {
            dbUtility dbutl = new dbUtility();
            var OrderDetailList = dbutl.OrderDetails(Convert.ToInt32(number), 3);
            shipping = SessionVariable.ShippingCharge.ToString("0.00");
            return OrderDetailList;
        }
        #endregion

       [WebMethod]
        public static Product[] Remove(string value)
        {
            var cart = SessionVariable.AddToCart;
            var dbutl = new dbUtility();
            try
            {
                if (cart != null)
                {
                    try
                    {
                        cart = cart.Select(string.Format("[Prod_cd] <> '{0}'", value)).CopyToDataTable();

                        dbutl.PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, value, "", 0, "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, "0", 3);
                    }
                    catch (Exception ex)
                    {
                        cart = null;
                        dbutl.PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, value, "", 0, "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, "0", 3);
                        dbutl.logerrors(ex);
                    }

                }

                SessionVariable.AddToCart = cart;
                var Products = dbutl.Cart(SessionVariable.AddToCart);

                if (SessionVariable.customerType == (Int32)custtype.WholeSaler)
                {
                    foreach (var item in Products)
                    {
                        item.RETAIL_PRS = SessionVariable.IsSpecial > 0 ? item.FinalPrice : item.WHOLE_PRS;
                    }
                }
                var x = Products.ToArray();
                SessionVariable.cart_Count = SessionVariable.AddToCart.Rows.Count;
                return x;
                //return "1";
            }
            catch (Exception ex)
            {
                SessionVariable.cart_Count = 0;
                return null;
            }
        }

        [WebMethod]
        public static Product[] Addtocart(string value)
        {
            dbUtility dbult = new dbUtility();
            dbult.AddToCart(value, 1);
            var Products = dbult.Cart(SessionVariable.AddToCart);

            if (SessionVariable.customerType == (Int32)custtype.WholeSaler)
            {
                foreach (var item in Products)
                {
                    item.RETAIL_PRS = SessionVariable.IsSpecial > 0 ? item.FinalPrice : item.WHOLE_PRS;
                }
            }
            var x = Products.ToArray();

            return x;
        }
    }
}