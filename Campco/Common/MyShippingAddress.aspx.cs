using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using AuthorizeNet.Api.Contracts.V1;
using System.Web.Services;
using MasterSystem.Common;
using System.Data;
//------------Nisha Patel -----------------------
namespace Campco.Common
{
    public partial class MyShippingAddress : System.Web.UI.Page
    {
//------------Nisha Patel -----------------------
        #region varibel Declaration
        public List<customerAddressExType> addressList = null;
        public List<Registration_Property> addressList1 = null;
        public customerAddressExType result = null;
        public string AddressId = "";
        #endregion
//------------Nisha Patel -----------------------
        #region Page load of shipping page
        protected void Page_Load(object sender, EventArgs e)
        {
            //------------Nisha Patel -----------------------
            dbUtility dbUtl = new dbUtility();
            try
            {
                if (!IsPostBack)
                {
                    SessionVariable.AddressList = null;
                    Registration_Property RP = new Registration_Property();
                    if (SessionVariable.CustomerID != "GUEST")
                    {
                        // var drop = Convert.ToInt32(HttpContext.Current.Session["drop"]);
                     
                        SessionVariable.CustomerProfileId = dbUtl.GETCustomerINFO(SessionVariable.CustomerID, "", "", "", 0, 1);
                        if (SessionVariable.CustomerProfileId != "")
                        {
                            dbUtl.GetCustomer(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), SessionVariable.CustomerProfileId);
                            addressList = SessionVariable.AddressList;
                            AddressId = SessionVariable.CusAuthoAddId.ToString();
                        }

                    }
                }
            }
            catch(Exception ex)
            {
                dbUtl.logerrors(ex);
            }
        }
        #endregion
//------------Nisha Patel -----------------------
        #region Add Address detail in authorized.net
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            clsPayment clspay = new clsPayment();
            Payment pay = new Payment();
            customerAddressType CusAdd = new customerAddressType();
            try
            {
                if (SessionVariable.CustomerID != null)
                {
                    if (Convert.ToInt64(SessionVariable.CustprofileId) != 0)
                    {
                        CusAdd.firstName = txtFirstName.Text.Trim();
                        CusAdd.lastName = txtLastName.Text.Trim();
                        CusAdd.address = txtaddress.Text.Trim();
                        CusAdd.city = txtCity.Text.Trim();
                        CusAdd.state = txtState.Text.Trim();
                        //  CusAdd.country = txtCountry.Text.Trim();
                        CusAdd.country = ddlShippingCountry.SelectedItem.Text.Trim();
                        CusAdd.zip = txtPincode.Text.Trim();
                        CusAdd.phoneNumber = "";
                        CusAdd.email = "";
                        var customerInformation = clspay.AddShippingInfo(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), SessionVariable.CustprofileId.ToString(), CusAdd);
                        if (customerInformation.messages.resultCode == messageTypeEnum.Ok)
                        {
                            ClearTextBox();
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('address Added sucessfully.');", true);
                            //return;
                            if (SessionVariable.CusAuthoAddId == 0)
                            {
                                dbutl.GETCustomerINFO(SessionVariable.CustomerID, "", customerInformation.customerAddressId, customerInformation.customerProfileId, 0, 4);
                            }
                            Response.Redirect(Request.RawUrl);
                        }
                        else
                        {
                            ClearTextBox();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Enter Valid information');", true);
                            Response.Redirect(Request.RawUrl);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Enter Valid information');", true);
                    }
                }
                 
        }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }
        #endregion
//------------Nisha Patel -----------------------
        #region Delete Address  from Database
        [WebMethod]
        public static string deleteAddress(string ID)
        {
            dbUtility dbutl = new dbUtility();
            string msg = "";
            try
            {
              
                clsPayment clspay = new clsPayment();
                Payment pay = new Payment();
                creditCardType CCT = new creditCardType();

                if (SessionVariable.customerType == 3)
                {
                    if (SessionVariable.CusAuthoAddId.ToString() != ID)
                    {
                        if (SessionVariable.CustomerID != null)
                        {
                            if (Convert.ToInt64(SessionVariable.CustprofileId) != 0)
                            {

                                var customerinformation = clspay.DeleteShippingAddress(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), SessionVariable.CustprofileId.ToString(), ID);
                                if (customerinformation.messages.resultCode == messageTypeEnum.Ok)
                                {

                                    msg = "Address deleted successfully.";

                                }
                                else
                                {
                                    msg = "Please Enter Valid information";
                                }
                            }
                        }

                    }
                    else
                    {

                        msg = "Default Address Can't be Deleted.";
                    }
                }
                else if (SessionVariable.customerType == 1)
                {
                    if (SessionVariable.CustomerID != null)
                    {
                        if (Convert.ToInt64(SessionVariable.CustprofileId) != 0)
                        {

                            var customerinformation = clspay.DeleteShippingAddress(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), SessionVariable.CustprofileId.ToString(), ID);
                            if (customerinformation.messages.resultCode == messageTypeEnum.Ok)
                            {
                                if (SessionVariable.CusAuthoAddId.ToString() == ID)
                                {
                                    dbutl.GETCustomerINFO(SessionVariable.CustomerID, "", "0", SessionVariable.CustprofileId.ToString(), 0, 4);
                                }
                                msg = "Address deleted successfully.";

                            }
                            else
                            {
                                msg = "Please Enter Valid information";
                            }
                        }
                    }
                }

                else {
                }
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
                return msg;
            }
            return msg;
        }
        #endregion
//------------Nisha Patel -----------------------
        #region Update Default Address From Database
        [WebMethod]
       public static void Update_Default_Address(string ID, string City)
        {
           
            dbUtility dbutl = new dbUtility();
            try
            {
                string addid = "";             
                clsPayment clspay = new clsPayment();
                Payment pay = new Payment();
                creditCardType CCT = new creditCardType();
                Autho_Detail aud = new Autho_Detail();
                Registration_Property RP = new Registration_Property();
                Page page = HttpContext.Current.CurrentHandler as Page;
                if (SessionVariable.CustomerID != null)
                {
                    if (Convert.ToInt64(SessionVariable.CustprofileId) != 0)
                    {
                        addid = dbutl.Default_ShippingAddress_CardAddress(SessionVariable.CustprofileId.ToString(), ID, "", 1);

                        if (addid != "0")
                        {
                            //msg= "You Select This Address As Default Address";
                            SessionVariable.CusAuthoAddId = Convert.ToInt64(addid);
                        }
                        else
                        {
                            //msg = " Can't Default address ";
                            page.ClientScript.RegisterStartupScript(page.GetType(), "alert", "<script>alert('Can't Default address ');</script>");
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
//----------------Nisha Patel -----------------------
        public void ClearTextBox()
        {
            txtaddress.Text = "";
            txtCity.Text = "";
            txtPincode.Text = "";
            txtState.Text = "";
        }

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