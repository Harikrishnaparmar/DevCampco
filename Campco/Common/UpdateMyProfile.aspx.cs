using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Web.Services;
using System.Data;
using MasterSystem.Common;
///<summary>
/// <Author>nisha Patel</Author>
/// <create>23-11-2016</create>
/// </summary>
//----------- Nisha Patel (Update My profile Page) -----------------
namespace Campco.Common
{
//----------Nisha Patel -----------------------------------------
    public partial class UpdateMyProfile : System.Web.UI.Page
    {
        #region Variable Declaration
        dbUtility dbUtl;
        Registration_Property RP;
        #endregion
//----------Nisha Patel -----------------------------------------
        #region Update profile pae Load
        protected void Page_Load(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
                if (SessionVariable.CustomerID != null)
                {
                    SessionVariable.PageName = Request.RawUrl;
                   // ViewState["DealerEmail"] = "";
                    if (Page.IsPostBack == false)
                    {

                        SessionVariable.PageName = Request.RawUrl;
                        Get_CustomerDetail(); // get Cuatomer Detail.
                        txtPassword.Attributes["value"] = txtPassword.Text;
                        txtRPassword.Attributes["value"] = txtRPassword.Text;
                    }

                    if (SessionVariable.customerType == 3)
                    {
                        //Show Dealer Content In Update profile Page
                        // pnlWholesaler.Visible = true;
                        //  PnlShipping.Visible = false;
                        //pnlBillingInfo.Visible = true;
                        // pnlRetailer.Visible = false;
                    }
                    else
                    {
                        //Show Retailer Content In Update profile Page
                        // pnlRetailer.Visible = true;
                        //pnlWholesaler.Visible = false;
                        // PnlShipping.Visible = false;
                        // pnlBillingInfo.Visible = false;
                    }

                }
            }
            catch(Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }
        #endregion
//----------Nisha Patel -----------------------------------------
        #region Get Customer Detail For Profie.
        public void Get_CustomerDetail()
        {
              dbUtl = new dbUtility();
              RP = new Registration_Property();
              RP.CUS_ID = SessionVariable.CustomerID;
              RP= dbUtl.GetCustomerDetail_MyProfile(RP);
            if (SessionVariable.customerType == 3)
            {
                txtAccId.Text = RP.CUS_ID.Trim();
                txtBillingadd.Text = RP.ADDRESS.Trim();
                txtBillingadd2.Text = RP.ADDRESS2.Trim();
                txtBillingcity.Text = RP.CITY.Trim();
                var value = RP.COUNTRY.Trim();
                ddlBillingCountry.SelectedValue = value;                
                txtBillingstate.Text = RP.STATE.Trim();
                txtBillingzip.Text = RP.ZIP.Trim();
                txtCompName.Text = RP.CUS_NM.Trim();
                txtContName.Text = RP.ATTN.Trim();
                txtEmailAdd.Text = RP.EMail.Trim();
              //  ViewState["DealerEmail"] = RP.EMail.Trim();                             
                txtFax.Text = RP.Fax.Trim();
                txtPassword.Text = RP.Password.Trim();               
                txtTel1.Text = RP.PHONE.Trim();
                txtTel2.Text = RP.PHONE_2.Trim();
                txtWebAddress.Text = RP.WEB_ADR.Trim();
            }
            else
            {
                txtRAccId.Text = SessionVariable.CustomerID.Trim();
                txtFName.Text = RP.FIRST_NM.Trim();
                txtLName.Text = RP.LAST_NM.Trim();
                txtEAddress.Text = RP.EMAIL_ADR.Trim();
                txtRPassword.Text = RP.Password.Trim();
            }     
        }
        #endregion
//----------Nisha Patel -----------------------------------------
        #region Refresh captch code
        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            //lblcaptcha.Visible = false;
            //FillCapctha();
           // txtcaptch.Text = "";
        }
        #endregion
//----------Nisha Patel -----------------------------------------
        #region Update Rewtailer / Dealer profile
        protected void btnupdateprofile_Click(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
                Retailer_Wholesaler_UpdateProfile();
            }
            catch(Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }
        #endregion
//----------Nisha Patel -----------------------------------------
        #region Update Function For User Profile
        public void Retailer_Wholesaler_UpdateProfile()
        {
            if (SessionVariable.CustomerID != null)
            {
                if (SessionVariable.customerType == 1)
                {
                    dbUtility dbuti = new dbUtility();
                    Registration_Property RP = new Registration_Property();
                    RP.CUS_ID = txtRAccId.Text.Trim();
                    RP.ATTN = txtFName.Text.Trim()+" "+txtLName.Text.Trim();
                    RP.CUS_NM = "";
                    RP.FIRST_NM = txtFName.Text.Trim();
                    RP.LAST_NM = txtLName.Text.Trim();
                    RP.CUS_NT1 = "";
                    RP.CUS_NT2 = "";
                    RP.CUS_TYPE = "1";
                    RP.Password = txtRPassword.Text.Trim();
                    RP.EMAIL_ADR = txtEAddress.Text.Trim();
                    RP.WEB_ADR = "";
                    RP.PHONE = "";
                    RP.PHONE_2 = "";
                    RP.ADDRESS = "";
                    RP.ADDRESS2 = "";
                    RP.CITY = "";
                    RP.COUNTRY = "";
                    RP.STATE = "";
                    RP.ZIP = "";
                    RP.LoginName = txtRAccId.Text.Trim();
                    RP.SHP_ADDRESS = "";
                    RP.SHP_ADDRESS2 = "";
                    RP.SHP_CITY = "";
                    RP.SHP_COUNTRY = "";
                    RP.SHP_STATE = "";
                    RP.SHP_ZIP = "";
                    RP.SLS_TYPE = "1";
                    RP.VALID = "1";
                    RP.SALES_NUM = "";
                    RP.SALES_NUM2 = "";
                    RP.Fax = "";
                    string CId=  dbuti.Updateduserdetail(RP);
                    if (CId != "")
                    {
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Customer profile is updated sucessfully');", true);                   
                       // Email_EmailAddressUpdation(RP.EMAIL_ADR, txtEAddress.Text.Trim());
                        Get_CustomerDetail(); // get Cuatomer Detail.
                        txtPassword.Attributes["value"] = txtPassword.Text;
                         Response.Redirect("UpdateMyProfile.aspx");
                        return;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Customer profile is not updated sucessfully');", true);
                        Get_CustomerDetail();
                        return;
                    }                   
                
               }         
               else
               {

                    dbUtility dbuti = new dbUtility();
                //clsSecurity encrypt = new clsSecurity();//Added by HR
                Registration_Property RP = new Registration_Property();
                RP.CUS_ID = txtAccId.Text.Trim();
                RP.CUS_NM = txtCompName.Text.Trim();
                RP.ATTN = txtContName.Text.Trim();
                RP.FIRST_NM = txtFName.Text.Trim();
                RP.LAST_NM = txtLName.Text.Trim();
                RP.CUS_NT1 = "";
                RP.CUS_NT2 = "";
                RP.CUS_TYPE = "3";
                RP.Fax = txtFax.Text.Trim();
                RP.EMAIL_ADR = txtEmailAdd.Text.Trim();
                RP.WEB_ADR = txtWebAddress.Text.Trim();
                RP.PHONE = txtTel1.Text.Trim();
                RP.PHONE_2 = txtTel2.Text.Trim();
                //RP.Password =  encrypt.Encrypt(txtPassword.Text.Trim());// //Chnaged By HR
                RP.Password = txtPassword.Text.Trim();
                RP.ADDRESS = txtBillingadd.Text.Trim();
                RP.ADDRESS2 = txtBillingadd2.Text.Trim();
                RP.CITY = txtBillingcity.Text.Trim();
               RP.COUNTRY = ddlBillingCountry.SelectedValue.Trim();
               RP.STATE = txtBillingstate.Text.Trim();
                RP.ZIP = txtBillingzip.Text.Trim();
                RP.LoginName = txtAccId.Text.Trim();
                RP.SLS_TYPE = "1";
                RP.VALID = "0";
                RP.SALES_NUM = "";
                RP.SALES_NUM2 = "";
               string CId = dbuti.Updateduserdetail(RP);

                    if (CId != "")
                    {
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Customer profile is updated sucessfully');", true);
                      //  Email_EmailAddressUpdation(ViewState["DealerEmail"].ToString(), txtEmailAdd.Text.Trim());
                        Get_CustomerDetail(); // get Cuatomer Detail.       
                        Response.Redirect("UpdateMyProfile.aspx");           
                         return;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Customer profile is not updated sucessfully');", true);
                        Get_CustomerDetail();
                        return;
                    }
                }
            }
        }
        #endregion
//----------Nisha Patel -----------------------------------------
        #region Blank All Textbox Feild
        public void ClearRegistraion()
        {
            txtAccId.Text = "";
            txtContName.Text = "";
            txtCompName.Text = "";
            txtEmailAdd.Text = "";
            txtWebAddress.Text = "";
            txtTel1.Text = "";
            txtTel2.Text = "";
            txtPassword.Text = "";
            txtBillingadd.Text = "";
            txtBillingadd2.Text = "";
            txtBillingcity.Text = "";
            ddlBillingCountry.SelectedValue = "0";
            txtBillingstate.Text = "";
            txtBillingzip.Text = "";
            txtRPassword.Text = "";
            txtRAccId.Text = "";
            txtFName.Text = "";
            txtLName.Text = "";
            txtEAddress.Text = "";
        }
        #endregion

        //#region send Email for retrive password
        //public void Email_EmailAddressUpdation(string CurrEmail,string NewEmail)
        //{
        //    string Eamilmsg;
        //    dbUtility dbutl = new dbUtility();
        //    if (ConfigurationManager.AppSettings["EmailAddressUpdate"] != "")
        //    {//don't create the customer, send email only
        //        string relativePath = "../Document/" + (ConfigurationManager.AppSettings["EmailAddressUpdate"].ToString());
        //        string absolutePath = Server.MapPath(relativePath);
        //        if (File.Exists(absolutePath) == true)
        //        {
        //            string bodyContent = File.ReadAllText(absolutePath).Trim();
        //            if (bodyContent != string.Empty)
        //            {
        //                bodyContent = bodyContent.Replace("#CurrEmail#",CurrEmail);
        //                bodyContent = bodyContent.Replace("#NewEmail#", NewEmail);
        //                Eamilmsg = dbutl.SendEmaill(ConfigurationManager.AppSettings["CompanyEmailAddress"], ConfigurationManager.AppSettings["PasswordMail"],txtEAddress.Text, ConfigurationManager.AppSettings["Emailupdationsubject"], bodyContent);

        //            }
        //        }
        //    }
        //}
        //#endregion

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
                SessionVariable.cart_Count = cart.Rows.Count;
                var Products = dbutl.Cart(SessionVariable.AddToCart);

                if (SessionVariable.customerType == (Int32)custtype.WholeSaler)
                {
                    foreach (var item in Products)
                    {
                        item.RETAIL_PRS = SessionVariable.IsSpecial > 0 ? item.FinalPrice : item.WHOLE_PRS;
                    }
                }
                var x = Products.ToArray();

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
