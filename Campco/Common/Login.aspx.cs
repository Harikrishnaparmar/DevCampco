using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Campco;
using System.Configuration;
using AuthorizeNet.Api.Contracts.V1;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Net.Mime;
using System.Web.Configuration;
using System.Web.Services;
using MasterSystem.Common;
//-------------------nisha Patel-------------------------------
namespace Campco.Common
{
    //-------------------nisha Patel-------------------------------
    public partial class Login : System.Web.UI.Page
    {
        //-------------------nisha Patel-------------------------------
        #region Variable Decalration
        dbUtility dbUtl = new dbUtility();
        #endregion
        //-------------------nisha Patel-------------------------------
        #region login page Load Event
        protected void Page_Load(object sender, EventArgs e)
        {
            lblpasswordmsg.Visible = false;
            if (!IsPostBack)
            {
                lblpasswordmsg.Visible = false;
                //-------------------nisha Patel-------------------------------
                #region Random Number Captcha Image
                FillCapctha();
                #endregion
            }
        }
        #endregion
        //-------------------nisha Patel-------------------------------
        #region submit Login detail Button
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            dbUtility dbUtl = new dbUtility();
            try
            {
                if (txtUname.Text == "admin" && txtPassword.Text == "C@mpC0")
                {
                    SessionVariable.customerType = (int)custtype.admin;
                    SessionVariable.CustomerName = "Admin";
                    SessionVariable.CustomerID = "Admin";
                    Response.Redirect("~/AdminPanel/admin.aspx",false);
                    //Response.Redirect("Admin_Brand_Banners.aspx");
                }
                else
                {
                    if (txtUname.Text != "" && txtPassword.Text != "")
                    {
                        lblUName.Visible = false;
                        lblpassword.Visible = false;
                        VerifyUserLogin();
                    }
                    else
                    {
                        if (txtUname.Text == "")
                        {
                            lblUName.Visible = true;
                        }
                        else
                        {
                            lblUName.Visible = false;
                        }
                        if (txtPassword.Text == "")
                        {
                            lblpassword.Visible = true;
                        }
                        else
                        {
                            lblpassword.Visible = false;
                        }
                        return;
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Redirect(SessionVariable.PageName,false);
                dbUtl.logerrors(ex, "btnLogin_Click");
            }
        }
        #endregion
        //-------------------nisha Patel-------------------------------
        #region VerifyUserLogin
        public void VerifyUserLogin()
        {
            try
            {
                if (txtUname.Text == "" && txtPassword.Text == "")
                {
                    lblUName.Visible = true;
                    lblpassword.Visible = true;
                    return;
                }

                clsSecurity encrypt = new clsSecurity();//Added by hR
                DataSet dsuser = new DataSet();
                Payment pay = new Payment();
                Registration_Property rp = new Registration_Property();
                clsPayment payment = new clsPayment();
                customerProfileType cusadd = new customerProfileType();
                customerAddressType cusAddType = new customerAddressType();
                rp.EMail = txtUname.Text.Trim();
                rp.Password = txtPassword.Text.Trim();//encrypt.Encrypt(txtPassword.Text.Trim());//Changed By HR
                dsuser = dbUtl.UserVerify(rp, 1);
                if (dsuser.Tables[0].Rows.Count > 0)
                {
                    if (dsuser.Tables[0].Rows[0]["CustInfoID"].ToString().Trim() != "")
                    {
                        if (dsuser.Tables[0].Rows[0]["SLS_TYPE"].ToString().Trim() == "1")
                        {
                            if (dsuser.Tables[0].Rows[0]["Password"].ToString().Trim() == txtPassword.Text.Trim())
                            {
                                var cus_id = dsuser.Tables[0].Rows[0]["CUS_ID"].ToString().Trim();
                                if (SessionVariable.CustomerID != cus_id)
                                {
                                    dbUtl.UpdateTempData(cus_id);
                                }
                                SessionVariable.CustomerID = dsuser.Tables[0].Rows[0]["CUS_ID"].ToString().Trim();

                                if (Convert.ToInt32(dsuser.Tables[0].Rows[0]["CUS_TYPE"].ToString().Trim()) == 1)
                                {
                                    SessionVariable.CustomerName = dsuser.Tables[0].Rows[0]["FIRST_NM"].ToString().Trim() + "  " + dsuser.Tables[0].Rows[0]["LAST_NM"].ToString().Trim();
                                }
                                else
                                {
                                    SessionVariable.CustomerName = Convert.ToString(dsuser.Tables[0].Rows[0]["ATTN"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["ATTN"] : "").Trim();
                                }
                                string c = dsuser.Tables[0].Rows[0]["CustaddId"].ToString().Trim();
                                SessionVariable.customerType = Convert.ToInt32(dsuser.Tables[0].Rows[0]["CUS_TYPE"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["CUS_TYPE"] : 0);
                                SessionVariable.UName = Convert.ToString(dsuser.Tables[0].Rows[0]["EMail"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["EMail"] : "").Trim();
                                SessionVariable.IsSpecial = Convert.ToInt32(dsuser.Tables[0].Rows[0]["IsSpecial"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["IsSpecial"] : 0);
                                SessionVariable.Term = Convert.ToString(dsuser.Tables[0].Rows[0]["TERM_DESC"] != DBNull.Value ? (dsuser.Tables[0].Rows[0]["TERM_DESC"]).ToString().Trim() : "").Trim();
                                //SessionVariable.CusAuthoAddId = Convert.ToInt64(dsuser.Tables[0].Rows[0]["CustaddId"] != DBNull.Value || dsuser.Tables[0].Rows[0]["CustaddId"].ToString() != "" ? dsuser.Tables[0].Rows[0]["CustaddId"] : 0);
                                SessionVariable.CusAuthoAddId = Convert.ToInt64(c != "" ? c : "0");
                                SessionVariable.CusAuthoPaymentId = Convert.ToInt64(dsuser.Tables[0].Rows[0]["CustPaymentProfId"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["CustPaymentProfId"] : 0);
                                if (SessionVariable.Term == "")
                                {
                                    SessionVariable.Term = ("CREDIT CARD").ToUpper();
                                }
                                SessionVariable.CustprofileId = Convert.ToInt64(dsuser.Tables[0].Rows[0]["CustInfoID"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["CustInfoID"] : 0);
                                //Response.Redirect("UpdateMyProfile.aspx");
                                Response.Redirect(SessionVariable.PageName, false);
                               // Response.Redirect("index.aspx");
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid username or password.');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Your account is not approved and activated yet. Please Contact us');", true);
                        }
                    }
                    else
                    {
                        cusadd.email = Convert.ToString(dsuser.Tables[0].Rows[0]["EMail"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["EMail"] : "").Trim();
                        cusAddType.address = Convert.ToString(dsuser.Tables[0].Rows[0]["ADDRESS"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["ADDRESS"] : "").Trim();
                        cusAddType.city = Convert.ToString(dsuser.Tables[0].Rows[0]["CITY"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["CITY"] : "").Trim();
                        cusAddType.country = Convert.ToString(dsuser.Tables[0].Rows[0]["COUNTRY"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["COUNTRY"] : "").Trim();
                        cusAddType.state = Convert.ToString(dsuser.Tables[0].Rows[0]["STATE"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["STATE"] : "").Trim();
                        cusAddType.zip = Convert.ToString(dsuser.Tables[0].Rows[0]["ZIP"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["ZIP"] : "").Trim();
                        pay.Cust_Prof = cusadd;
                        pay.cust_address = cusAddType;
                        SessionVariable.CustomerID = Convert.ToString(dsuser.Tables[0].Rows[0]["CUS_ID"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["CUS_ID"] : "").Trim();
                        var customerInformation = payment.CreateCustomerProfile(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), pay, Convert.ToInt16(dsuser.Tables[0].Rows[0]["CUS_TYPE"]));
                        {
                            if (customerInformation.messages.resultCode == messageTypeEnum.Ok)
                            {
                                if (Convert.ToInt32(dsuser.Tables[0].Rows[0]["CUS_TYPE"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["CUS_TYPE"] : 0) == 3)
                                {
                                    dbUtl.GETCustomerINFO(SessionVariable.CustomerID, "", customerInformation.customerShippingAddressIdList[0], customerInformation.customerProfileId, 0, 0);
                                    // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Login Again');", true);
                                    VerifyUserLogin();
                                }
                                else if (Convert.ToInt32(dsuser.Tables[0].Rows[0]["CUS_TYPE"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["CUS_TYPE"] : 0) == 1)
                                {
                                    dbUtl.GETCustomerINFO(SessionVariable.CustomerID, "", "", customerInformation.customerProfileId, 0, 0);
                                    // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Login Again');", true);
                                    VerifyUserLogin();

                                }
                            }
                            else if(customerInformation.messages.message[0].code == "E00039")
                            {
                                //"A duplicate record with ID 1806618717 already exists."
                                var profileId = customerInformation.messages.message[0].text.Split(' ')[5];
                                var detail=payment.GetCustomerProfile(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(),profileId);
                                if (detail.messages.resultCode == messageTypeEnum.Ok)
                                {
                                    //if (Convert.ToInt32(dsuser.Tables[0].Rows[0]["CUS_TYPE"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["CUS_TYPE"] : 0) == 3)
                                    //{
                                        //dbUtl.GETCustomerINFO(SessionVariable.CustomerID, "", detail.profile.shipToList[0].customerAddressId, detail.profile.customerProfileId, 0, 0);
                                        //// ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Login Again');", true);
                                        //VerifyUserLogin();
                                    //}
                                    //else
                                    if (Convert.ToInt32(dsuser.Tables[0].Rows[0]["CUS_TYPE"] != DBNull.Value ? dsuser.Tables[0].Rows[0]["CUS_TYPE"] : 0) == 1)
                                    {
                                        dbUtl.GETCustomerINFO(SessionVariable.CustomerID, "", "", detail.profile.customerProfileId, 0, 0);
                                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Login Again');", true);
                                        VerifyUserLogin();

                                    }
                                    else
                                    {
                                        dbUtl.LogInfo("Customer ID:" + SessionVariable.CustomerID+"... Customer Type:" + dsuser.Tables[0].Rows[0]["CUS_TYPE"].ToString());
                                        dbUtl.GETCustomerINFO(SessionVariable.CustomerID, "", detail.profile.shipToList[0].customerAddressId, detail.profile.customerProfileId, 0, 0);
                                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Login Again');", true);
                                        VerifyUserLogin();
                                    }
                                }
                            }

                        }
                        SessionVariable.CustomerID = null;
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid username or password.');", true);
                }

            }
            catch (Exception ex)
            {
                //Response.Redirect("UpdateMyProfile.aspx");
                Response.Redirect(SessionVariable.PageName, false);
                dbUtl.logerrors(ex);
            }
        }
        #endregion
        //-------------------nisha Patel-------------------------------
        #region Forgot Password Panel Visible
        protected void lnkForgot_Click(object sender, EventArgs e)
        {
           // lblpasswordmsg.Visible = false;
            pnlForgotPassword.Visible = true;
        }
        #endregion
        //-------------------nisha Patel-------------------------------
        #region Get Passoword function
        protected void btnforgotpass_Click(object sender, EventArgs e)
        {
            dbUtility dbUtl = new dbUtility();
            try
            {
                if (txtcaptch.Visible == true)
                {
                    if (txtcaptch.Text != Session["captcha"].ToString())
                    {
                        lblcaptcha.Visible = true;
                        lblcaptcha.Text = "Enter Valid Code";
                        txtcaptch.Text = "";
                        FillCapctha();// Reandom Number Captch iamge.
                    }
                    else
                    {
                        GetForgotPassword();
                        lblcaptcha.Visible = false;
                        txtcaptch.Text = "";
                        txtforgotEmail.Text = "";
                        FillCapctha();
                    }
                }
                else
                {
                    GetForgotPassword();
                    lblcaptcha.Visible = false;
                    txtcaptch.Text = "";
                    txtforgotEmail.Text = "";
                    FillCapctha();
                }
            }
            catch(Exception ex)
            {
                
                dbUtl.logerrors(ex );
            }
            }
          
        #endregion
        //-------------------nisha Patel-------------------------------
        #region Retirve Password 
        public void GetForgotPassword()
        {

            dbUtility dbutl = new dbUtility();
            DataSet dsuser = new DataSet();
            Registration_Property rp = new Registration_Property();
            rp.EMail = txtforgotEmail.Text.Trim();
            rp.Password = "";
            dsuser = dbutl.UserVerify(rp, 2);
            if (dsuser.Tables[0].Rows.Count > 0)
            {
                string Password = dsuser.Tables[0].Rows[0]["Password"].ToString();
                string EmailId = dsuser.Tables[0].Rows[0]["EMail"].ToString();
                if (txtforgotEmail.Text.Trim() == EmailId)
                {

                    Email_RetrivePassword(Password, txtforgotEmail.Text.Trim());
                }
                else
                {
                    Email_RetrivePassword(Password, EmailId);
                }
                //lblpasswordmsg.Visible = true;
                //lblpasswordmsg.Text = "Please Retrieve Your Password From Your Email Account.";
                //lblpasswordmsg.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblpasswordmsg.Visible = true;
                lblpasswordmsg.Text = "Please enter valid username.";
                lblpasswordmsg.ForeColor = System.Drawing.Color.Red;
                //  ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid UserName.');", true);
                //return;
            }
        }
        #endregion
        //-------------------nisha Patel-------------------------------
        #region send Email for retrive password
        public void Email_RetrivePassword(string password, string Email)
        {
            string Eamilmsg;
            dbUtility dbutl = new dbUtility();
            if (ConfigurationManager.AppSettings["EmailOnlyForgotPassword"] != "")
            {//don't create the customer, send email only
                string relativePath = "../Document/" + (ConfigurationManager.AppSettings["EmailOnlyForgotPassword"].ToString());
                string absolutePath = Server.MapPath(relativePath);
                if (File.Exists(absolutePath) == true)
                {
                    string bodyContent = File.ReadAllText(absolutePath).Trim();
                    if (bodyContent != string.Empty)
                    {
                        bodyContent = bodyContent.Replace("#Password#", password);
                        Eamilmsg = dbutl.SendEmaill(ConfigurationManager.AppSettings["CompanyEmailAddress"], ConfigurationManager.AppSettings["PasswordMail"], Email, ConfigurationManager.AppSettings["EmailRetrivePasswordSubject"], bodyContent, ConfigurationManager.AppSettings["CompanyEmailAddress"]);
                        if (Eamilmsg == "")
                        {
                            lblpasswordmsg.Visible = true;
                            lblpasswordmsg.Text = "Please Retrieve Your Password From Your Email Account.";
                            lblpasswordmsg.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblpasswordmsg.Visible = true;
                            lblpasswordmsg.Text = "Sorry! Invalid Eamil Id";
                            lblpasswordmsg.ForeColor = System.Drawing.Color.Green;

                        }
                        //lblpasswordmsg.Visible = false;
                    }

                  
                }

                //lblpasswordmsg.Visible = false;
            }
        }
        #endregion
        //-------------------nisha Patel-------------------------------
        #region Captchcode  For Random No
        //Name-nisha Patel
        void FillCapctha()
        {
            try
            {

                Random random = new Random();

                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

                StringBuilder captcha = new StringBuilder();

                for (int i = 0; i < 6; i++)

                    captcha.Append(combination[random.Next(combination.Length)]);

                Session["captcha"] = captcha.ToString();

                imgcaptcha.ImageUrl = "CreateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
            }

            catch(Exception ex)

            {
                dbUtl.logerrors(ex);
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