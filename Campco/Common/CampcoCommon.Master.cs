using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Services;

namespace Campco.Common

{
    public partial class CampcoCommon : System.Web.UI.MasterPage
    {
        /// <summary>
        /// <author> Nisha Patel</author>
        /// <create>21-09-2016</create>
        /// </summary>    
        #region Declare variable
        dbUtility dbUtl;//Nisha Patel /21-09-2016 
        public DataSet Brand;//Nisha Patel /21-09-2016 
        public List<BrandList> brandList;//Nisha Patel /21-09-2016 
        public List<List<CategoryList>> categoryList;//Nisha Patel /21-09-2016 
        public List<CategoryList> categoryList2;//Nisha Patel /21-09-2016 
        public List<CategoryList> itemList;//Nisha Patel /21-09-2016 
        public List<List<CategoryList>> footerCategoryList;//Nisha Patel /21-09-2016 
        public List<CategoryList> footerCategoryList2;//Nisha Patel /21-09-2016 
        public List<CategoryList> itemList2;//Nisha Patel /21-09-2016 
        public List<Product> Products = null;//harikrishna parmar /29-10-2016 /for cart icon update.
        public double totalAmount = 00.00;//harikrishna parmar /29-10-2016 /for cart icon update.
        public Category catelogo = null;//Nisha Patel /21-09-2016 
        public double shipCharge = 0.00;
        public int Drop = 0;
        public int custype = 0;
        public string custID = "";
        public int international = -1;
        public int isspecial = 0;
        #endregion;
        //--------------------Nisha Patel--------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
                isspecial = SessionVariable.IsSpecial;
                string sPagePath = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
                System.IO.FileInfo oFileInfo = new System.IO.FileInfo(sPagePath);
                string sPageName = oFileInfo.Name;
                if (!IsPostBack)
                {
                    //if (Request.QueryString["param1"] == "news1")
                    //{
                    //    if (Request.QueryString["Name1"] != "" && Request.QueryString["Email1"] != "")
                    //    {
                    //        Addbtnsubscriber();
                    //    }
                    //    else
                    //    {
                    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Enter Name & Email');", true);
                    //    }
                    //}
                }
                if (sPageName != "checkout.aspx")
                {
                    if (sPageName != "Thankyou.aspx")
                    {
                        SessionVariable.ShippingCharge = 0.00;
                        SessionVariable.InterNationalShipping_Charge = -1;
                    }
                }

                #region Cart
                var cart = SessionVariable.AddToCart;
                custype = SessionVariable.customerType;
                //var cusID = "";
                if (SessionVariable.CustomerID == "GUEST" || SessionVariable.CustomerID.StartsWith("G#"))
                {
                    custID = "GUEST";
                }
                else
                {
                    custID = SessionVariable.CustomerID;
                }

                international = SessionVariable.InterNationalShipping_Charge;
                if (cart == null)
                {
                    if (custID == "GUEST")
                    {
                        if (SessionVariable.DeleteTemp == 0)
                        {
                            SessionVariable.DeleteTemp = 1;
                            dbutl.DeleteTemp(custID);
                        }
                    }
                    dbutl.getCart();
                    cart = SessionVariable.AddToCart;
                }
                if (cart != null)
                {
                    dbUtility dbUtl = new dbUtility();
                    Products = dbUtl.Cart(cart);

                    foreach (var item in Products)
                    {

                        totalAmount += (SessionVariable.customerType != (int)custtype.WholeSaler ? item.RETAIL_PRS : SessionVariable.IsSpecial == 0 ? item.WHOLE_PRS : item.FinalPrice) * item.QTYinCart;
                        item.RETAIL_PRS = (SessionVariable.customerType != (int)custtype.WholeSaler ? item.RETAIL_PRS : SessionVariable.IsSpecial == 0 ? item.WHOLE_PRS : item.FinalPrice);
                    }
                }
                if (SessionVariable.customerType == (int)custtype.Retailer)
                {
                    shipCharge = SessionVariable.ShippingCharge;
                }
                else
                {
                    SessionVariable.ShippingCharge = 0;
                }
                if (HttpContext.Current.Session["drop"] == null)
                {
                    HttpContext.Current.Session["drop"] = 0;
                }
                Drop = HttpContext.Current.Session["drop"] == null ? 0 : Convert.ToInt32(HttpContext.Current.Session["drop"]);
            }
            catch (Exception ex)
            {
                dbUtl.logerrors(ex);
            }
            #endregion
            //--------------------Nisha Patel--------------------------------
            if (Page.IsPostBack == false)
            {
                try
                {
                    custype = SessionVariable.customerType;
                    #region CategoryLogo
                    if (Request.QueryString["CatId"] != null)
                    {
                        // logoimg.Visible = false;
                        dbUtl = new dbUtility();
                        int cid = Convert.ToInt16(Request.QueryString["CatId"]);
                        catelogo = dbUtl.GetCategoryLogo(cid);
                    }

                    #endregion
                    dbUtl = new dbUtility();
                    // Get_Header_Brand();
                    #region BrandList
                    //brandList = dbUtl.BrandList();
                    #endregion

                    #region CategoryList
                    categoryList = dbUtl.CategoryList();
                    categoryList2 = categoryList[0];
                    itemList = categoryList[1];
                    #endregion

                    #region FooterCategoryList
                    footerCategoryList = dbUtl.FooterCategoryList();
                    footerCategoryList2 = footerCategoryList[0];
                    itemList2 = footerCategoryList[1];
                    #endregion
                    if (Request.QueryString["prod_cd"] != null)
                    {
                        catelogo = dbUtl.GetCategoryLogo(0, Request.QueryString["prod_cd"].ToString());
                    }
                }
                catch (Exception ex)
                {
                    dbUtl.logerrors(ex);
                }
            }
            else
            {
                dbUtl = new dbUtility();
                // Get_Header_Brand();
                #region BrandList
                //brandList = dbUtl.BrandList();
                #endregion
                #region CategoryList
                categoryList = dbUtl.CategoryList();
                categoryList2 = categoryList[0];
                itemList = categoryList[1];
                #endregion
                #region FooterCategoryList
                footerCategoryList = dbUtl.FooterCategoryList();
                footerCategoryList2 = footerCategoryList[0];
                itemList2 = footerCategoryList[1];
                #endregion
            }
            lbluname.Text = "Welcome" + " " + SessionVariable.CustomerName;
            Label1.Visible = true;
            lbluname.Visible = true;
            //bool test = SessionVariable.CustomerID.StartsWith("GUEST");
            var cusID = "";
            if (SessionVariable.CustomerID == "GUEST" || SessionVariable.CustomerID.StartsWith("G#"))
            {
                cusID = "GUEST";
            }
            else if (SessionVariable.CustomerID == "Admin")
            {
                cusID = "Admin";
            }

            if (cusID != "GUEST")
            {
                lnkSinIn.Visible = false;
                lnkSignout.Visible = true;
                divdropdown.Visible = true;
            }
            else if (cusID == "Admin")
            {
                //Linkbutton1.Visible = true;
            }
            else
            {
                lbluname.Text = "Welcome GUEST";
                lnkSinIn.Visible = true;
                lnkSignout.Visible = false;
                divdropdown.Visible = false;
                custID = null;
            }
        }
        //--------------------Nisha Patel--------------------------------
        #region MyaccountLink to Myprofile 
        protected void lnkMyaccount_Click(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
                string cusID = "";
                if (SessionVariable.CustomerID == "GUEST" || SessionVariable.CustomerID.StartsWith("G#"))
                {
                    cusID = "GUEST";
                }

                if (cusID == "GUEST")
                {
                    Response.Redirect("Login.aspx");
                }
                else if (SessionVariable.CustomerID == null)
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    Response.Redirect("UpdateMyProfile.aspx");
                }
            }
            catch (Exception ex)
            {
                dbUtl.logerrors(ex);
            }
        }
        #endregion
        //--------------------Nisha Patel--------------------------------
        #region sign in for  login page
        protected void lnkSinIn_Click(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {

                if (SessionVariable.CustomerID.StartsWith("G#"))
                {
                    custID = "GUEST";
                }
                else
                {
                    custID = SessionVariable.CustomerID;
                }
                if (custID != "GUEST")
                {
                    Response.Redirect("UpdateMyProfile.aspx");

                }
                else
                {

                    Response.Redirect("Login.aspx");
                }
            }
            catch (Exception ex)
            {
                dbUtl.logerrors(ex);
            }
        }
        #endregion
        //--------------------Nisha Patel--------------------------------
        #region Sing out from login page and redirect to index Page.
        protected void lnkSignout_Click(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
                SessionVariable.DeleteTemp = 0;
                SessionVariable.CustomerID = null;
                SessionVariable.CustomerName = null;
                Session.Clear();
                Session.Abandon();
                Response.Redirect("index.aspx");
                lnkSinIn.Visible = true;
                lnkSignout.Visible = false;
            }
            catch (Exception ex)
            {
                dbUtl.logerrors(ex);
            }
        }
        #endregion
        //--------------------Nisha Patel--------------------------------
        #region Search text for Web
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
                var S = txtSearch.Text.Split(',');
                var s2 = S[1];
                if (s2 != "")
                    Response.Redirect("ProductList.aspx?Search=" + s2.Trim());
                txtSearch.Text = "";
            }
            catch (Exception ex)

            {
                dbUtl.logerrors(ex);
            }
        }
        #endregion
        //--------------------Nisha Patel--------------------------------
        #region search text for Mobile
        protected void txtmobsearch_TextChanged(object sender, EventArgs e)
        {
            //Response.Redirect("ProductList.aspx?Search=" + txtSearch.Text.Trim());
            dbUtility dbutl = new dbUtility();
            try
            {


                var S1 = txtmobsearch.Text.Split(',');
                var s2 = S1[1];
                if (s2 != "")
                    Response.Redirect("ProductList.aspx?Search=" + s2.Trim());
                txtSearch.Text = "";
            }
            catch (Exception ex)
            {
                dbUtl.logerrors(ex);
            }
        }
        #endregion

        //----------------nisha patel(30-3-2017)---------------------------

        //#region newssubscriber Added
       [WebMethod]
        public static string Addbtnsubscriber1(string Sname, string SEmailid)
        {
            dbUtility dbUtl = new dbUtility();
            Newssubscribe objNss = new Newssubscribe();
            string bodyContent = "";
            objNss.Subscibe_Name = Sname;
            objNss.Subscribe_Email = SEmailid;
            objNss.Subscribe = 1;
            dbUtl.AddNewssubscriber(objNss);
            bodyContent = "Dear Customer,\n \nThank you for subscribing to the Campco newsletter! \n \n Enjoy your shopping! \n The CampCo Team";
            dbUtl.SendEmaill(ConfigurationManager.AppSettings["CompanyEmailAddress"], ConfigurationManager.AppSettings["PasswordMail"], HttpContext.Current.Request.QueryString["Email"].ToString(), "subscribing to the CampCo newsletter!", bodyContent);
           // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Thank you for subscribing to the Campco newsletter!');", true);
            return "";

        }
    }
    // #endregion
    //---------------------------------------------
    //public void Addbtnsubscriber()
    //{
    //    dbUtl = new dbUtility();

    //    Newssubscribe objNss = new Newssubscribe();
    //    string bodyContent="";
    //    objNss.Subscibe_Name = Request.QueryString["Name1"].ToString();
    //    objNss.Subscribe_Email = Request.QueryString["Email1"].ToString();
    //    objNss.Subscribe = 1;
    //    dbUtl.AddNewssubscriber(objNss);
    //    bodyContent = "Dear Customer,\n \nThank you for subscribing to the Campco newsletter! \n \n Enjoy your shopping! \n The CampCo Team";
    //    dbUtl.SendEmaill(ConfigurationManager.AppSettings["CompanyEmailAddress"], ConfigurationManager.AppSettings["PasswordMail"], Request.QueryString["Email1"].ToString(), "subscribing to the CampCo newsletter!", bodyContent);
    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Thank you for subscribing to the Campco newsletter!');", true);
    //    return;

    //}


}

