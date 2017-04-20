//----Created by - Nisha Patel --------------------------------------------
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
using System.Web.Configuration;
using System.Configuration;
using MasterSystem.Common;
using System.Data;
//----------Nisha Patel --------------------------------------------
namespace Campco.Common
{
    public partial class Contactus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
//----------Nisha Patel --------------------------------------------
        #region Submit Contact detail
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
                if (txtMessage.Text == "" || txtName.Text == "" || txtEamilId.Text == "" || txtsubject.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please fill mendatry field');", true);
                }
                else
                {
                    string result = Email_ContactUs();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Thank you for contacting us. A customer service representative will be in touch with you shortly.');", true);
                    txtMessage.Text = "";
                    txtName.Text = "";
                    txtsubject.Text = "";
                    txtEamilId.Text = "";
                }
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }
        #endregion
        //----------Nisha Patel --------------------------------------------
        #region send Contact Detail Email Function
        public string Email_ContactUs()
        {
            string result = "";
            dbUtility dbutl = new dbUtility();
            try
            {
              
                if (WebConfigurationManager.AppSettings["EmailOnlyContactUs"] != "")
                {//don't create the customer, send email only
                    string relativePath = "../Document/" + (ConfigurationManager.AppSettings["EmailOnlyContactUs"].ToString());
                    string absolutePath = Server.MapPath(relativePath);
                    if (File.Exists(absolutePath) == true)
                    {
                        string bodyContent = File.ReadAllText(absolutePath).Trim();
                        if (bodyContent != string.Empty)
                        {
                            bodyContent = bodyContent.Replace("#ContName#", txtName.Text.Trim());
                            bodyContent = bodyContent.Replace("#Name#", txtName.Text.Trim());
                            bodyContent = bodyContent.Replace("#EMail#", txtEamilId.Text.Trim());
                            bodyContent = bodyContent.Replace("#Subject#", txtsubject.Text.Trim());
                            bodyContent = bodyContent.Replace("#Message#", txtMessage.Text.Trim());
                            dbutl.SendEmaill(ConfigurationManager.AppSettings["CompanyEmailAddress"], ConfigurationManager.AppSettings["PasswordMail"], txtEamilId.Text.Trim(), ConfigurationManager.AppSettings["EmailContactSubject"], bodyContent);
                        }
                    }
                    string relativePath1 = "../Document/" + (ConfigurationManager.AppSettings["EmailOnlyContactUs"].ToString());
                    string absolutePath1 = Server.MapPath(relativePath1);
                    if (File.Exists(absolutePath1) == true)
                    {
                        string bodyContent = File.ReadAllText(absolutePath).Trim();
                        if (bodyContent != string.Empty)
                        {
                            bodyContent = bodyContent.Replace("#ContName#", "CampcoTeam");
                            bodyContent = bodyContent.Replace("#Name#", txtName.Text.Trim());
                            bodyContent = bodyContent.Replace("#EMail#", txtEamilId.Text.Trim());
                            bodyContent = bodyContent.Replace("#Subject#", txtsubject.Text.Trim());
                            bodyContent = bodyContent.Replace("#Message#", txtMessage.Text.Trim());
                            result = dbutl.SendEmaill(ConfigurationManager.AppSettings["CompanyEmailAddress"], ConfigurationManager.AppSettings["PasswordMail"], ConfigurationManager.AppSettings["EmailContactEmailId"], ConfigurationManager.AppSettings["EmailContactSubject"], bodyContent);
                            //result = dbutl.SendEmaill(ConfigurationManager.AppSettings["CompanyEmailAddress"], ConfigurationManager.AppSettings["PasswordMail"],"nisha.patel@ordextechnology.com", ConfigurationManager.AppSettings["EmailContactSubject"], bodyContent);
                            return (result);
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                dbutl.logerrors(ex);
                return (result);
            }
            return (result);
          }
        #endregion



        [System.Web.Services.WebMethod]
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