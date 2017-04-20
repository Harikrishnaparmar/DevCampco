using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Campco.Common
{
    public partial class Admin_Brand_Banners : System.Web.UI.Page
    {
       
        dbUtility dbutl;
      
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                DropdownCategory();
            }
        }
        #region CategoryList
        public void DropdownCategory()
        {
          
            dbutl = new dbUtility();
            DataSet ds = new DataSet();
            ds = dbutl.GetCategorylist();
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryId";
            ddlCategory.DataSource = ds;
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("--------- Select ---------", "0"));
           // ddlCategory.Items.Insert(0, new ListItem("-----select-----", "0"));


        }
        #endregion

        protected void btnAdd_Click(object sender, EventArgs e)
        {           
                Insert_Banners();       
        }
        public void Insert_Banners()
        {
            if (fileuplaod1.HasFiles == false)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", "<script>alert('No File Uploaded.')</script>", false);
            }
            else
            {
                foreach (var uploadedFile in fileuplaod1.PostedFiles)
                {

                    string Image_path = Path.GetFileName(uploadedFile.FileName);
                    fileuplaod1.SaveAs(Server.MapPath("../Pic/Brand_Banner/" + Image_path));
                    Banners_Photo Objbp = new Banners_Photo();
                    dbUtility dbutl = new dbUtility();
                    Objbp.CategoryId = ddlCategory.SelectedValue;
                    Objbp.Banner_Path = "Brand_Banner/" + Image_path;
                    Objbp.Status = "1";
                    string Banner_Id = dbutl.Insert_Banner_Image(Objbp);
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", "<script>alert('File Uploaded Sucessfully.')</script>", false);
                }
            }
        }
    } 
}