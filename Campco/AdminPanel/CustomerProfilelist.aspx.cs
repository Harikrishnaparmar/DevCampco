using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
namespace Campco.AdminPanel
{
    public partial class CustomerProfilelist : System.Web.UI.Page
    {
        dbUtility dbutl = new dbUtility();
        Registration_Property rp = new Registration_Property(); 
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
       
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {

            
            GetCustomer();
                txtseach.Text = "";
            }
            catch(Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }
        #region Get Customer Detail   
        public void GetCustomer()
        {
            try
            {
                DataSet ds = new DataSet();
                //rp.CUS_ID = txtseach.Text.Trim();
                //rp.LoginName = txtseach.Text.Trim();
                ds = dbutl.GetCustomerDetail_MyProfile_search("1", txtseach.Text.Trim());
                if (ds.Tables[0].Columns[0] != null)
                {
                    GVCustomer.DataSource = ds;
                    GVCustomer.DataBind();
                }
                else
                {
                    GVCustomer.DataSource = null;
                    GVCustomer.DataBind();
                    
                }
            }
            catch(Exception ex)
            {
                dbutl.logerrors(ex);
            }   
        }
        #endregion
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            { 
            GVCustomer.PageIndex = e.NewPageIndex;
            GetCustomer();
             }
            catch(Exception ex)
            {
                dbutl.logerrors(ex);
            }

        }
    }
}