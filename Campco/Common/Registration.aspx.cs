using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Net.Mime;
using System.Configuration;
using AuthorizeNet.Api.Contracts.V1;
using System.Drawing;
using System.Management;
using System.Web.Services;
using System.Data;
using MasterSystem.Common;
// --------------Nisha Patel ------------------------------------------
namespace Campco.Common
{
    /// <summary>
    /// <Author>Nisha Patel</Author>
    /// <create>03-10-2016</create>
    /// </summary>
// --------------Nisha Patel ------------------------------------------
    public partial class Registration : System.Web.UI.Page
    {
        #region pageload
        protected void Page_Load(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
                dbutl.LogInfo("Registration page Load");

                string pwd = txtPassword.Text.Trim();
                string pwd1 = txtRPassword.Text.Trim();
                string pwd2 = txtRConfPass.Text.Trim();
                txtPassword.Attributes.Add("value", pwd);
                txtRPassword.Attributes.Add("value", pwd1);
                txtRConfPass.Attributes.Add("value", pwd2);

                if (!IsPostBack)
                {

                    if (Request.QueryString["Reg"] != null)
                    {
                        //pnlWholesaler.Visible = false;
                        //pnlRetailer.Visible = true;
                        //pnlAdditionalInfo.Visible = false;
                        //lblcaptcha.Visible = false;
                        txtcaptch.Visible = false;
                        //pnlretailerpage.Visible = true;
                        //pnlgeneralinfo.Visible = false;
                        //pnlDealerPage.Visible = false;
                        //pnlBillingInfo.Visible = false;
                        //PnlShipping.Visible = false;

                        //pnlCaptchcode.Visible = false;
                        FillCapctha(); //generate captacha code


                    }
                    else
                    {
                        //pnlBillingInfo.Visible = true;
                        //PnlShipping.Visible = true;
                        //pnlWholesaler.Visible = true;
                        //pnlRetailer.Visible = false;
                        //pnlAdditionalInfo.Visible = true;
                        //pnlgeneralinfo.Visible = true;
                        //pnlDealerPage.Visible = true;
                        txtreCaptcha.Visible = false;
                        //lblretcaptchmdg.Visible = false;
                        //pnlCaptchcode.Visible = true;
                        //generate captacha code
                        FillCapctha();
                    }

                }
            }
            catch(Exception ex)
            {
                dbutl.logerrors(ex,"Page Load");
            }
        }
        #endregion
        // --------------Nisha Patel ------------------------------------------
        #region registration To create customer in campco 
        protected void btnregister_Click(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
                if (!Page.IsValid)
                {
                    return;
                }
                var x = SessionVariable.Captcha.ToString();
                if (txtcaptch.Visible == true)
                {
                    if (txtcaptch.Text != SessionVariable.Captcha.ToString()) //Compare Captcha 
                    {
                        lblcaptcha.Visible = true;
                        lblcaptcha.Text = "Please enter valid captcha code";
                        txtcaptch.Text = "";
                        FillCapctha(); //Captcha Code For Random Number Generation.
                    }
                    else
                    {
                        Retailer_Wholesaler_Registration();
                    }
                }
                else if (txtreCaptcha.Visible == true)
                {
                    if (txtreCaptcha.Text != SessionVariable.Captcha.ToString()) //Compare Captcha 
                    {
                        //lblretcaptchmdg.Visible = true;
                        //lblretcaptchmdg.Text = "Please enter valid captcha code";
                        txtreCaptcha.Text = "";
                        FillCapctha(); //Captcha Code For Random Number Generation.
                    }
                    else
                    {
                        Retailer_Wholesaler_Registration();
                    }

                }
                else
                {
                    Retailer_Wholesaler_Registration();
                }
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex,"btnregister_Click");
            }

        }
        #endregion
        // --------------Nisha Patel ------------------------------------------
        #region Retailer & wholesaler Registraion
        //-----------NISHA PATEL Retailer & Wholesaler Registration method----------------------------------------------------
        public void Retailer_Wholesaler_Registration()
        {
            dbUtility dbuti = new dbUtility();
            customerProfileType cusadd = new customerProfileType();
            customerAddressType cusAddType = new customerAddressType();
            Payment pay = new Payment();
            Registration_Property RP = new Registration_Property();
            clsPayment payment = new clsPayment();
            try
            {
                if (Request.QueryString["Reg"] != null)
                {
                    RP.CUS_ID = txtRAccId.Text.Trim();
                    RP.ATTN = txtFName.Text + " " + txtLName.Text.Trim();
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
                    RP.SALES_NUM = "RET";
                    RP.SALES_NUM2 = "OTS";
                    RP.Fax = "";
                    cusadd.email = txtEAddress.Text.Trim();
                    // cusAddType.email= txtEAddress.Text.Trim();
                    //cusAddType.address = txtshippingAdd.Text.Trim();
                    //cusAddType.city = txtshippingcity.Text.Trim();
                    //cusAddType.country = txtShippingCountry.Text.Trim();
                    //cusAddType.zip = txtshippingZip.Text.Trim();
                    //cusAddType.state = txtshippingState.Text.Trim();
                    //pay.cust_address = cusAddType;     
                    pay.Cust_Prof = cusadd;

                    string cus_idResponce = txtRAccId.Text.Trim();
                    string CId = dbuti.Adduserdetail(RP);
                    if (CId != "")
                    {
                        SessionVariable.CustomerID = cus_idResponce;
                        var customerInformation = payment.CreateCustomerProfile(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), pay, Convert.ToInt16(Request.QueryString["Reg"].ToString()));
                        if (customerInformation.messages.resultCode == messageTypeEnum.Ok)
                        {
                            if (Request.QueryString["Reg"] != null)
                            {

                                dbuti.GETCustomerINFO(SessionVariable.CustomerID, "", "", customerInformation.customerProfileId, 0, 0);
                            }
                            else
                            {
                                dbuti.GETCustomerINFO(SessionVariable.CustomerID, "", customerInformation.customerShippingAddressIdList[0], customerInformation.customerProfileId, 0, 0);
                            }

                            Dealer_Email("CampCo Account Registration");
                        }
                        ClearRegistraion();
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('User Registered sucessfully');", true);
                        SessionVariable.CustomerID = null;
                        //lblthankyou.Text = "Thank you for registering your  account at CampCo!.";
                        //lblthankyou.Visible = true;
                        //lblthankyou.ForeColor = Color.Green;
                        //pnlWholesaler.Visible = false;
                        //pnlRetailer.Visible = false;
                        //pnlAdditionalInfo.Visible = false;
                        //lblcaptcha.Visible = false;
                        //txtcaptch.Visible = false;
                        //pnlretailerpage.Visible = false;
                        //pnlgeneralinfo.Visible = false;
                        //pnlDealerPage.Visible = false;
                        //pnlBillingInfo.Visible = false;
                        //PnlShipping.Visible = false;
                        Response.Redirect("RegistrationThankyou.aspx?RegTh=" + "Cons", false);
                    }
                    else
                    {
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Username  or Emailid is already used. Please select diffrent username or emailid.');", true);
                        txtRAccId.BorderColor = Color.Red;
                        // txtRAccId.ForeColor = Color.Red;                   
                        txtEAddress.BorderColor = Color.Red;
                        lblraccid.Visible = true;
                        lblraccid.Text = "Username  or emailid is already in used.Please select different  username or emailid.";
                        lblraccid.ForeColor = Color.Red;
                        FillCapctha();
                        return;
                    }
                    return;
                }
                else
                {
                    //dbUtility dbuti = new dbUtility();
                    //clsSecurity encrypt = new clsSecurity();//Added by HR
                    // Registration_Property RP = new Registration_Property();
                    RP.CUS_ID = txtAccId.Text.Trim();
                    RP.CUS_NM = txtCompName.Text.Trim();
                    RP.ATTN = txtDeFName.Text.Trim() + " " + txtDeLName.Text.Trim();
                    RP.FIRST_NM = txtDeFName.Text.Trim();
                    RP.LAST_NM = txtDeLName.Text.Trim();
                    RP.CUS_NT1 = "";
                    RP.CUS_NT2 = "";
                    RP.CUS_TYPE = "3";
                    RP.EMAIL_ADR = txtEmailAdd.Text.Trim();
                    RP.WEB_ADR = txtWebAddress.Text.Trim();
                    RP.PHONE = txtTel1.Text.Trim();
                    RP.PHONE_2 = txtTel2.Text.Trim();
                    //RP.Password =  encrypt.Encrypt(txtPassword.Text.Trim());// //Chnaged By HR
                    RP.Password = txtPassword.Text.Trim();
                    RP.ADDRESS = txtBillingadd.Text.Trim();
                    RP.ADDRESS2 = txtBillingadd2.Text.Trim();
                    RP.CITY = txtBillingcity.Text.Trim();                
                    RP.COUNTRY = ddlBillingCountry.SelectedItem.Text.Trim();
                    RP.STATE = txtBillingstate.Text.Trim();
                    RP.ZIP = txtBillingzip.Text.Trim();
                    RP.LoginName = txtAccId.Text.Trim();
                    RP.SHP_ADDRESS = txtshippingAdd.Text.Trim();
                    RP.SHP_ADDRESS2 = txtshippingadd2.Text.Trim();
                    RP.SHP_CITY = txtshippingcity.Text.Trim();                
                    RP.SHP_COUNTRY = ddlShippingCountry.SelectedItem.Text.Trim();
                    RP.SHP_STATE = txtshippingState.Text.Trim();
                    RP.SHP_ZIP = txtshippingZip.Text.Trim();
                    RP.SLS_TYPE = "0";
                    RP.VALID = "0";
                    RP.SALES_NUM = "";
                    RP.SALES_NUM2 = "";
                    RP.Fax = txtFax.Text.Trim();
                    cusadd.email = txtEAddress.Text.Trim();
                    // cusAddType.email= txtEAddress.Text.Trim();
                    cusAddType.address = txtshippingAdd.Text.Trim();
                    cusAddType.city = txtshippingcity.Text.Trim();
                    cusAddType.country = ddlShippingCountry.SelectedItem.Text.Trim();
                    cusAddType.zip = txtshippingZip.Text.Trim();
                    cusAddType.state = txtshippingState.Text.Trim();
                    cusAddType.firstName = txtDeFName.Text.Trim();
                    cusAddType.lastName = txtDeLName.Text.Trim();
                    pay.Cust_Prof = cusadd;
                    pay.cust_address = cusAddType;
                    string cus_idResponce = txtAccId.Text.Trim();
                    string CId = dbuti.Adduserdetail(RP);
                    if (CId != "")
                    {
                        SessionVariable.CustomerID = cus_idResponce;
                        var customerInformation = payment.CreateCustomerProfile(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), pay);
                        if (customerInformation.messages.resultCode == messageTypeEnum.Ok)
                        {
                            dbuti.GETCustomerINFO(SessionVariable.CustomerID, "", customerInformation.customerShippingAddressIdList[0], customerInformation.customerProfileId, 0, 0);
                            Dealer_Email("CampCo Account Registration -" + txtCompName.Text.Trim());
                        }


                        ClearRegistraion();
                        SessionVariable.CustomerID = null;
                        //lbldealerthankyou.Text = "Thank you for registering your dealer account at CampCo! Your account requires approval and activation. An account manager will contact you upon review of your registration should you qualify as an appropriate dealer.";
                        //lbldealerthankyou.Visible = true;
                        //lbldealerthankyou.ForeColor = Color.Green;                
                        Response.Redirect("RegistrationThankyou.aspx?RegTh=" + "Deal");

                    }
                    else
                    {
                        // ClearRegistraion();
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Username  or Emailid is already used. Please select diffrent username or emailid.');", true);
                        txtAccId.BorderColor = Color.Red;
                        //   txtAccId.ForeColor = Color.Red;
                        txtEmailAdd.BorderColor = Color.Red;
                        lbldealmsg.Visible = true;
                        lbldealmsg.Text = "Username  or emailid is already in used.Please select different username or emailid.";
                        lbldealmsg.ForeColor = Color.Red;

                        FillCapctha();
                        return;
                    }

                    return;
                }
            }
            catch(Exception ex)
            {
                dbuti.logerrors(ex, "Retailer_Wholesaler_Registration");
            }
        }
        #endregion
        // --------------Nisha Patel ------------------------------------------
        #region Captchcode  
        //Name-nisha Patel      
        void FillCapctha()
        {
            dbUtility dbutl = new dbUtility();
            dbutl.LogInfo("FillCapctcha.");
            try
            {
                Random random = new Random();
                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                StringBuilder captcha = new StringBuilder();
                for (int i = 0; i < 6; i++)
                {
                    captcha.Append(combination[random.Next(combination.Length)]);
                }
                SessionVariable.Captcha = captcha.ToString();

                imgcaptcha.ImageUrl = "CreateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
                imgretailerverifi.ImageUrl = "CreateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
            }

            catch(Exception ex)
            {
                
                dbutl.logerrors(ex,"fillcaptcha");
            }

        }
        #endregion

        [WebMethod]
        public static string FillCapctha1()
        {
            string result = "";
            try
            {

                Random random = new Random();

                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

                StringBuilder captcha = new StringBuilder();

                for (int i = 0; i < 6; i++)
                {
                    captcha.Append(combination[random.Next(combination.Length)]);
                }
                SessionVariable.Captcha = captcha.ToString();
                //imgcaptcha.ImageUrl = "CreateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
                //imgretailerverifi.ImageUrl = "CreateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
                result = "CreateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
                return result;
            }

            catch(Exception ex)

            {
                dbUtility dbutl = new dbUtility();
                dbutl.logerrors(ex,"FillCaptcha1_Web Method");
                return result;
            }

        }

        // --------------Nisha Patel ------------------------------------------
        #region Clear All Textbox
        public void ClearRegistraion()
        {
            txtAccId.Text = "";
            txtDeFName.Text = "";
            txtDeLName.Text = "";
            txtCompName.Text = "";
            txtEmailAdd.Text = "";
            txtWebAddress.Text = "";
            txtTel1.Text = "";
            txtTel2.Text = "";
            txtPassword.Text = "";
            txtBillingadd.Text = "";
            txtBillingadd2.Text = "";
            txtBillingcity.Text = "";
            //txtBillingcountry.Text = "";
            ddlBillingCountry.SelectedValue = "0";
            ddlShippingCountry.SelectedValue = "0";
            txtBillingstate.Text = "";
            txtBillingzip.Text = "";
            txtField1.Text = "";
            txtField2.Text = "";
            txtField3.Text = "";
            txtField4.Text = "";
            txtfield5.Text = "";
            txtField6.Text = "";
            txtRConfPass.Text = "";
            txtRPassword.Text = "";
            txtRAccId.Text = "";
            txtFName.Text = "";
            txtLName.Text = "";
            txtcaptch.Text = "";
            txtshippingAdd.Text = "";
            txtshippingadd2.Text = "";
            txtshippingcity.Text = "";
            txtshippingState.Text = "";
            txtshippingZip.Text = "";
            txtEAddress.Text = "";
            chkShippingadd.Checked = false;
            txtcaptch.Text = "";
            txtreCaptcha.Text = "";
        }
        #endregion
        // --------------Nisha Patel ------------------------------------------
        #region Cancel Registation
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearRegistraion();
        }

        #endregion
        // --------------Nisha Patel ------------------------------------------
        //#region Refresh captch code
        //protected void btnRefresh_Click(object sender, EventArgs e)
        //{
        //    lblcaptcha.Visible = false;
        //    FillCapctha();
        //    txtcaptch.Text = "";
        //}
        //#endregion
        // --------------Nisha Patel ------------------------------------------
        #region shipping address same as billing address
        protected void chkShippingadd_CheckedChanged(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            dbutl.LogInfo("chkShippingadd_CheckedChanged");
            if (chkShippingadd.Checked == true)
            {
                //shipping address same as billing address
                txtshippingAdd.Text = txtBillingadd.Text;
                txtshippingadd2.Text = txtBillingadd2.Text;
                txtshippingcity.Text = txtBillingcity.Text;
                //ddlShippingCountry.SelectedValue = ddlBillingCountry.SelectedValue;
                ddlShippingCountry.SelectedItem.Text = ddlBillingCountry.SelectedItem.Text;
                txtshippingState.Text = txtBillingstate.Text;
                txtshippingZip.Text = txtBillingzip.Text;

                //if (txtshippingAdd.Text.Trim() != txtBillingadd.Text.Trim() || txtshippingadd2.Text != txtBillingadd2.Text)
                //{
                //    chkShippingadd.Checked = false;
                //}
                //else
                //{
                //    chkShippingadd.Checked = true;
                //}


            }
            else
            {


                txtshippingAdd.Text = "";
                txtshippingadd2.Text = "";
                txtshippingcity.Text = "";
                // txtShippingCountry.Text = "";
                ddlShippingCountry.SelectedItem.Text = "United States (US)";
                txtshippingState.Text = "";
                txtshippingZip.Text = "";

            }
        }
        #endregion
        // --------------Nisha Patel ------------------------------------------
        #region Email Intigration
        public void Dealer_Email(string Submsg)
        {
            dbUtility dbutl = new dbUtility();
            dbutl.LogInfo("Dealer_Email");
            try
            {
                if (Request.QueryString["Reg"] == null)
                {
                    if (ConfigurationManager.AppSettings["EmailOnlyNewB2BCustomer"] != "")
                    {//don't create the customer, send email only
                        string relativePath = "../Document/" + (ConfigurationManager.AppSettings["EmailOnlyNewB2BCustomer"].ToString());
                        string absolutePath = Server.MapPath(relativePath);
                        if (File.Exists(absolutePath) == true)
                        {
                            string bodyContent = File.ReadAllText(absolutePath).Trim();
                            if (bodyContent != string.Empty)
                            {

                                bodyContent = bodyContent.Replace("#AccountId#", txtAccId.Text.Trim());
                                bodyContent = bodyContent.Replace("#Contact#", txtDeFName.Text.Trim() + " " + txtDeLName.Text.Trim());
                                bodyContent = bodyContent.Replace("#Company#", txtCompName.Text.Trim());
                                bodyContent = bodyContent.Replace("#WebSite#", txtWebAddress.Text.Trim());
                                bodyContent = bodyContent.Replace("#Tel#", txtTel1.Text.Trim());
                                bodyContent = bodyContent.Replace("#EMail#", txtEmailAdd.Text.Trim());
                                bodyContent = bodyContent.Replace("#Password#", txtPassword.Text.Trim());
                                bodyContent = bodyContent.Replace("#Address01#", txtBillingadd.Text.Trim());
                                bodyContent = bodyContent.Replace("#Address02#", txtBillingadd2.Text.Trim());
                                bodyContent = bodyContent.Replace("#City#", txtBillingcity.Text.Trim());
                                bodyContent = bodyContent.Replace("#State#", txtBillingstate.Text.Trim());
                                bodyContent = bodyContent.Replace("#Zip#", txtBillingzip.Text.Trim());
                                bodyContent = bodyContent.Replace("#Fax#", txtFax.Text.Trim());
                                bodyContent = bodyContent.Replace("#Country#", ddlShippingCountry.SelectedItem.Text.Trim());
                                bodyContent = bodyContent.Replace("#ShipAddress01#", txtshippingAdd.Text.Trim());
                                bodyContent = bodyContent.Replace("#ShipAddress02#", txtshippingadd2.Text.Trim());
                                bodyContent = bodyContent.Replace("#ShipCity#", txtshippingcity.Text.Trim());
                                bodyContent = bodyContent.Replace("#ShipState#", txtshippingState.Text.Trim());
                                bodyContent = bodyContent.Replace("#ShipZip#", txtshippingZip.Text.Trim());
                                bodyContent = bodyContent.Replace("#Question1#", "How long have you been in business?");
                                bodyContent = bodyContent.Replace("#Ans1#", txtField1.Text.Trim());
                                bodyContent = bodyContent.Replace("#Question2#", "Do you currently have a legal business license AND re - sellers permit ?");
                                bodyContent = bodyContent.Replace("#Ans2#", txtField2.Text.Trim());
                                bodyContent = bodyContent.Replace("#Question3#", "Do you operate a brick-and-mortar store or a website or both? If neither, please explain.");
                                bodyContent = bodyContent.Replace("#Ans3#", txtField3.Text.Trim());
                                bodyContent = bodyContent.Replace("#Question4#", "Will you be keeping your own inventory or relying on drop-ship (drop-shipping is not available for international customers)?");
                                bodyContent = bodyContent.Replace("#Ans4#", txtField4.Text.Trim());
                                bodyContent = bodyContent.Replace("#Question5#", "Which CampCo products do you plan on carrying? Please be specific.");
                                bodyContent = bodyContent.Replace("#Ans5#", txtfield5.Text.Trim());
                                bodyContent = bodyContent.Replace("#Question6#", "How did you find out about CampCo?");
                                bodyContent = bodyContent.Replace("#Ans6#", txtField6.Text.Trim());
                                //dbutl.SendEmaill(ConfigurationManager.AppSettings["CompanyEmailAddress"], ConfigurationManager.AppSettings["PasswordMail"], txtEmailAdd.Text.Trim(), ConfigurationManager.AppSettings["EmailRegSubject"], bodyContent, ConfigurationManager.AppSettings["CompanyEmailAddress"]);
                                dbutl.SendEmaill(ConfigurationManager.AppSettings["CompanyEmailAddress"], ConfigurationManager.AppSettings["PasswordMail"], txtEmailAdd.Text.Trim(), Submsg, bodyContent, ConfigurationManager.AppSettings["CompanyEmailAddress"]);
                            }

                        }

                    }
                    else
                    {
                        //NoTemplateMsg.Visible = true;
                        return;
                    }
                }
                else
                {
                    if (ConfigurationManager.AppSettings["EmailOnlyNewB2CCustomer"] != "")
                    {//don't create the customer, send email only
                        string relativePath = "../Document/" + (ConfigurationManager.AppSettings["EmailOnlyNewB2CCustomer"].ToString());
                        string absolutePath = Server.MapPath(relativePath);
                        if (File.Exists(absolutePath) == true)
                        {
                            string bodyContent = File.ReadAllText(absolutePath).Trim();
                            if (bodyContent != string.Empty)
                            {
                                bodyContent = bodyContent.Replace("#AccountId#", txtRAccId.Text.Trim());
                                bodyContent = bodyContent.Replace("#Contact#", txtFName.Text.Trim() + " " + txtLName.Text.Trim());
                                bodyContent = bodyContent.Replace("#EMail#", txtEAddress.Text.Trim());
                                bodyContent = bodyContent.Replace("#Password#", txtRPassword.Text.Trim());
                                dbutl.SendEmaill(ConfigurationManager.AppSettings["CompanyEmailAddress"], ConfigurationManager.AppSettings["PasswordMail"], txtEAddress.Text.Trim(), ConfigurationManager.AppSettings["EmailRegSubject"], bodyContent);
                            }
                        }
                    }
                    else
                    {
                        //NoTemplateMsg.Visible = true;
                        return;
                    }
                }
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex,"Registration Email");
            }
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