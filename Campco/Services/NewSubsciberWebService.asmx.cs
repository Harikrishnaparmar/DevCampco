using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;

namespace Campco.Services
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [System.Web.Script.Services.ScriptMethod()]
        [WebMethod]
        public string Addbtnsubscriber1(string Sname, string SEmailid)
        //public string Addbtnsubscriber1()
        {
            //string Sname = "x333333", SEmailid = "y555555555";
            dbUtility dbUtl = new dbUtility();
            Newssubscribe objNss = new Newssubscribe();
            string bodyContent = "";
            objNss.Subscibe_Name = Sname;
            objNss.Subscribe_Email = SEmailid;
            objNss.Subscribe = 1;
            dbUtl.AddNewssubscriber(objNss);
            bodyContent = "Dear Customer,\n\nThank you for subscribing to the Campco newsletter! \n \n Enjoy your shopping! \n The CampCo Team";
            dbUtl.SendEmaill(ConfigurationManager.AppSettings["CompanyEmailAddress"], ConfigurationManager.AppSettings["PasswordMail"], SEmailid, "subscribing to the CampCo newsletter!", bodyContent);
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Thank you for subscribing to the Campco newsletter!');", true);
           return "Sucessfully";

        }
    }
}
