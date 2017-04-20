using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Campco.AppCode;

namespace Campco.AdminPanel
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // Session["Admin"] = "";

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if(txtAname.Text=="admin" && txtPassword.Text=="admin")
            {
                SessionVariable.CustomerName = "admin";
                Response.Redirect("BrandBanner.aspx");
              
             
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}