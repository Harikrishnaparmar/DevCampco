using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Campco.AdminPanel
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        dbUtility dbutl = new dbUtility();
        AdminDBUtility Adbutl = new AdminDBUtility();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropdownCategory();
                // GetBrandBanner("0");
            }
        }
        #region CategoryList
        public void DropdownCategory()
        {
            dbutl = new dbUtility();
            try
            {

                DataSet ds = new DataSet();
                ds = dbutl.GetCategorylist();
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "CategoryId";
                ddlCategory.DataSource = ds;
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("-----select-----", ""));
                // ddlCategory.Items.Insert(0, new ListItem("-----select-----", "0"));
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }
        #endregion


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {

                Insert_Banners();
                GetBrandBanner(ddlCategory.SelectedValue.ToString());
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }
        public void Insert_Banners()
        {
            dbUtility dbutl = new dbUtility();
            // int a = Convert.ToInt16(ddlimgupl.SelectedValue);
            int i = 0;
            try
            {

                if (fupbannerimg.HasFiles == false)
                {

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", "<script>alert('Sorry no file selected')</script>", false);
                }
                else
                {
                    if (fupbannerimg.PostedFiles.Count >= 3)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", "<script>alert('Please upload less than 10 files')</script>", false);
                    }
                    else
                    {
                        foreach (var uploadedFile in fupbannerimg.PostedFiles)
                        {
                            
                            i++;
                            string Image_path = Path.GetFileName(uploadedFile.FileName);                        
                            if (File.Exists(Server.MapPath("../AdminPanel/Images/Brand_Banner/" + Image_path)))
                            {
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", "<script>alert('image already there.Please choose another image.')</script>", false);
                            }
                            else
                            {
                                fupbannerimg.SaveAs(Server.MapPath("../AdminPanel/Images/Brand_Banner/" + Image_path));
                                Banners_Photo Objbp = new Banners_Photo();
                                Objbp.CategoryId = ddlCategory.SelectedValue;
                                Objbp.Banner_Path = "Brand_Banner/" + Image_path;
                                Objbp.Status = "1";
                                Objbp.CreatedDate = System.DateTime.Today.ToString();
                                Objbp.CreatedBy = "admin";
                                Objbp.OrderBy = i.ToString();
                                Objbp.Banner_Position = ddlbannerposition.SelectedItem.Text.Trim();
                                string Banner_Id = dbutl.Insert_Banner_Image(Objbp);
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", "<script>alert('File Uploaded Sucessfully.')</script>", false);

                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }
        protected void ddlimgupl_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetBrandBanner(ddlCategory.SelectedValue.ToString());
            lblmsg.Visible = true;
            btnupdate.Visible = true;
        }
        public void GetBrandBanner(string CategoryId)
        {
            Adbutl = new AdminDBUtility();
            try
            {
                DataSet ds = new DataSet();
                ds = Adbutl.GetBrandBannerDetail(CategoryId);
                if (ds.Tables[0].Columns[0] != null)
                {
                    gvBanner.DataSource = ds;
                    gvBanner.DataBind();
                    //lblcus.Visible = false;
                }
                else
                {
                    gvBanner.DataSource = null;
                    gvBanner.DataBind();
                }
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {

            try { 
            int orderbyid = 1;            
          
                int[] BannerIds = (from p in Request.Form["BannerId"].Split(',')
                                   select int.Parse(p)).ToArray();
                foreach (int BannerId in BannerIds)
                {                 
                Adbutl.UpdateBannerDetail("OrderId",BannerId, orderbyid,0);
                orderbyid += 1;
               }
          
            GetBrandBanner(ddlCategory.SelectedValue.ToString());
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }

        protected void lnkbtnstatus_Click(object sender, EventArgs e)
        {
            try
            {
                //LinkButton lnk = (LinkButton)sender;
                //string StatusText = lnk.Text;
                //int flag = 0;
                LinkButton lnk = (LinkButton)sender;
                string Data = lnk.CommandArgument;
                string[] args = Data.Split('|');
                int Brand_Banner_Id = Convert.ToInt16(args[0].ToString());

                string var = (args[1].ToString());
                if (var == "Active")
                {
                    var = "0";


                }
                else
                {
                    var = "1";

                }

                Adbutl.UpdateBannerDetail("status", Brand_Banner_Id, 0, Convert.ToInt16(var));
                GetBrandBanner(ddlCategory.SelectedValue.ToString());
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }


        //public void Insert_Banners()
        //{
        //    dbUtility dbutl = new dbUtility();
        //    // int a = Convert.ToInt16(ddlimgupl.SelectedValue);
        //    int i = 0;
        //    try
        //    {

        //        if (fupbannerimg.HasFiles == false)
        //        {

        //            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", "<script>alert('Sorry no file selected')</script>", false);
        //        }
        //        else
        //        {
        //            if (fupbannerimg.PostedFiles.Count >= 3)
        //            {
        //                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", "<script>alert('Please upload less than 10 files')</script>", false);
        //            }
        //            else
        //            {
        //                foreach (var uploadedFile in fupbannerimg.PostedFiles)
        //                {

        //                    i++;
        //                    string Image_path = Path.GetFileName(uploadedFile.FileName);
        //                    fupbannerimg.SaveAs(Server.MapPath("../AdminPanel/Images/Brand_Banner/" + Image_path));
        //                    Banners_Photo Objbp = new Banners_Photo();
        //                    Objbp.CategoryId = ddlCategory.SelectedValue;
        //                    Objbp.Banner_Path = "~/Brand_Banner/" + Image_path;
        //                    Objbp.Status = "1";
        //                    Objbp.CreatedDate = System.DateTime.Today.ToString();
        //                    Objbp.CreatedBy = "admin";
        //                    Objbp.OrderBy = i.ToString();
        //                    Objbp.Banner_Position = ddlbannerposition.SelectedItem.Text.Trim();
        //                    string Banner_Id = dbutl.Insert_Banner_Image(Objbp);
        //                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", "<script>alert('File Uploaded Sucessfully.')</script>", false);
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        dbutl.logerrors(ex);
        //    }
        //}
    }   
}