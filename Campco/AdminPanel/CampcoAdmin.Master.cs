using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Campco.AppCode;

namespace Campco.AdminPanel
{
    public partial class CampcoAdmin : System.Web.UI.MasterPage
    {
        dbUtility dbutl = new dbUtility();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {

                  
                    if (SessionVariable.CustomerName == "admin")
                    {
                        lnkSinIn.Visible = false;
                        lnkSignout.Visible = true;
                    }
                    else
                    {
                        lnkSinIn.Visible = false;
                        lnkSignout.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    dbutl.logerrors(ex);

                }
            }


        }

        //--------------------Nisha Patel(14-03-2017)-------------------------------
        #region sign in for  login page
        protected void lnkSinIn_Click(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
              Response.Redirect("Default.aspx");              
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }
        #endregion
        //--------------------Nisha Patel(14-03-2017)-------------------------------
        #region Sing out from login page and redirect to login Page.
        protected void lnkSignout_Click(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
                if (SessionVariable.CustomerName == "Admin")
                {
                    lnkSinIn.Visible = false;
                    lnkSignout.Visible = false;
                    SessionVariable.CustomerName = "";
                    HttpContext.Current.Session.RemoveAll();
                    HttpContext.Current.Session.Clear();
                    HttpContext.Current.Session.Abandon();
                    Response.Redirect("~/Common/login.aspx");                 
                  
                }
                else
                {
                    lnkSinIn.Visible = false;
                    lnkSignout.Visible = true;
                }
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }
        #endregion
    }
}