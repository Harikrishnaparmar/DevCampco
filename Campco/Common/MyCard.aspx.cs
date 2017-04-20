using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using AuthorizeNet.Api.Contracts.V1;
using System.Web.Services;
using System.Data;
using MasterSystem.Common;
//-------------- Nisha Patel ------------------------- 
namespace Campco.Common
{
    public partial class MyCard : System.Web.UI.Page
    {
//-------------- Nisha Patel ------------------------- 
        #region vriable declaration
        dbUtility dbutl = new dbUtility();
        public List<creditCardMaskedType> ccList = null;
        public string PaymentId = "";
        #endregion
//-------------- Nisha Patel ------------------------- 
        #region Mycard page load
        protected void Page_Load(object sender, EventArgs e)
        {
            dbUtility dbUtl = new dbUtility();
            try
            {
                if (!IsPostBack)
                {

                    var year = Convert.ToInt32(DateTime.UtcNow.Year);
                    var addyear = Convert.ToInt32(DateTime.UtcNow.AddYears(25).ToString("yyyy"));
                    do
                    {
                        ddlYear.Items.Add(year.ToString());
                        year++;
                    } while (year != addyear);


                    SessionVariable.CCs = null;
                    if (SessionVariable.CustomerID != null)
                    {
                        if (Convert.ToInt64(SessionVariable.CustprofileId) != 0)
                        {
                           
                            clsPayment clspay = new clsPayment();
                            Payment pay = new Payment();
                            SessionVariable.CustomerProfileId = dbUtl.GETCustomerINFO(SessionVariable.CustomerID, "", "", "", 0, 1);
                            dbUtl.GetCustomer(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), SessionVariable.CustomerProfileId);
                            ccList = SessionVariable.CCs;//SessionVariable.CCList;
                            PaymentId = SessionVariable.CusAuthoPaymentId.ToString();
                        }
                    }

                }

            }
            catch(Exception ex)
            {
                dbutl.logerrors(ex);
            }

        }
        #endregion
//-------------- Nisha Patel ------------------------- 
        #region add Credit card Info
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
                clsPayment clspay = new clsPayment();
                Payment pay = new Payment();
                creditCardType CCT = new creditCardType();
                if (SessionVariable.CustomerID != null)
                {
                    if (Convert.ToInt64(SessionVariable.CustprofileId) != 0)
                    {
                        CCT.cardNumber = txtCardNo.Text.Trim();
                        CCT.cardCode = txtCardCode.Text.Trim();
                        string expdate = ddlmonth.SelectedItem.Text.Trim() + ddlYear.Text.Trim();
                        CCT.expirationDate = expdate;
                        var customerInformation = clspay.AddCreditCard(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), SessionVariable.CustprofileId.ToString(), CCT);
                        if (customerInformation.messages.resultCode == messageTypeEnum.Ok)
                        {
                            ClearTextBox();
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Card Added sucessfully.');", true);
                            Response.Redirect(Request.RawUrl);

                        }
                        else
                        {
                            ClearTextBox();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + customerInformation.messages.message[0].ToString() + "');", true);
                            return;
                            //Response.Redirect(Request.RawUrl);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }

        }
        #endregion
        //-------------- Nisha Patel ------------------------- 
        public void ClearTextBox()
        {
            txtCardCode.Text = "";
            txtCardNo.Text = "";
            //txtExpDate.Text = "";
        }
//-------------- Nisha Patel ------------------------- 
        #region Delelte card Detail
        [WebMethod]
        public static string deleteAddress(string ID)
        {
            dbUtility dbutl = new dbUtility();
            string msg = "";
            try
            {
                //if (SessionVariable.CusAuthoPaymentId.ToString() != ID)
                //{
                
                    clsPayment clspay = new clsPayment();
                    Payment pay = new Payment();
                    creditCardType CCT = new creditCardType();
                    if (SessionVariable.CustomerID != null)
                    {
                        if (Convert.ToInt64(SessionVariable.CustprofileId) != 0)
                        {

                            var customerinformation = clspay.DeleteCreditCard(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), SessionVariable.CustprofileId.ToString(), ID);
                            if (customerinformation.messages.resultCode == messageTypeEnum.Ok)
                            {
                                // ClearTextBox();
                                dbutl.GetCustomer(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), SessionVariable.CustomerProfileId);
                                msg = "Card deleted sucessfully.";
                                // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Card delete sucessfully.');", true);


                            }
                            else
                            {
                                msg = "Please Enter Valid Card Information";

                            }
                        }
                    }
                //}
                //else
                //{

                //    msg = "Can't delete Credit Card Due To This is Default Credit Card";
                //}
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
            return msg;
        }
        #endregion
//-------------- Nisha Patel ------------------------- 
        #region Update Card Detail
        [WebMethod]
        public static string Update_Default_Card(string ID)
        {
            string PId = "";
            string msg = "";
            dbUtility dbutl = new dbUtility();
            try
            {              
                clsPayment clspay = new clsPayment();
                Payment pay = new Payment();
                creditCardType CCT = new creditCardType();
                Autho_Detail aud = new Autho_Detail();
                //SessionVariable.CusAuthoPaymentId = 0;
                if (SessionVariable.CustomerID != null)
                {
                    if (Convert.ToInt64(SessionVariable.CustprofileId) != 0)
                    {
                        PId = dbutl.Default_ShippingAddress_CardAddress(SessionVariable.CustprofileId.ToString(),"",ID,2);                    
                        if (PId != "")
                        {
                           // msg = "You Select This Card As Default Card.";
                            SessionVariable.CusAuthoPaymentId = Convert.ToInt64(PId);                          
                        }
                        else
                        {
                            msg = "You Can't be this card Default";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
            return msg;
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
    }
 }

