using Campco.AppCode;
using MasterSystem.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Campco.Common
{
    /// <summary>
    /// <author>Harikrishna Parmar</author>
    /// <create>20-09-2016</create>
    /// </summary>
    public partial class index : System.Web.UI.Page
    {
        #region Declare variable
        dbUtility dbUtl;
        public DataSet Brand;
        public List<Category> brandList;
        public List<Product> ProductFirstList,ProductSecList;
        public List<Product> ProdListByCat;
        public List<List<Banners_Photo>> brandbannerImage;
        public List<Banners_Photo> BrandHeaderBanner;
        public List<Banners_Photo> BrandFooterBanner;
        public Category categoryInfo = null;
        public int IsSpecial =0;
        public int catid = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
         dbUtl = new dbUtility();
        SessionVariable.PageName= Request.RawUrl;
            HttpContext.Current.Session["sort"] = null;
            // dbUtl
            try
            {
                if (!IsPostBack)
                {
                    //  Session["GoBackTo"] = Request.UrlReferrer.AbsolutePath;
                    // HttpContext.Current.Session["news"] = false;


                    HttpContext.Current.Session["Url"] = Request.RawUrl;
                    var count = HttpContext.Current.Session["Load"] != null ? HttpContext.Current.Session["Load"] : 0;
                    if (count.ToString() == "0")
                    {
                        HttpContext.Current.Session["Load"] = 1;
                    }
                    if (Request.QueryString["param"] == "news")
                    {
                        if (Request.QueryString["Name"] != "" && Request.QueryString["Email"] != "")
                        {
                            Addbtnsubscriber();
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Enter Name & Email');", true);
                        }
                    }
                }
                var c = HttpContext.Current.Session["Load"];
                IsSpecial = SessionVariable.IsSpecial;
                var catId = Convert.ToInt32(Request.QueryString["CatID"]);
                catid = catId;
                dbUtl = new dbUtility();
                #region Product List
                if (catId < 1)
                {
                    catId = 0;
                }
                //Console.WriteLine("Before top product first list(best seller) :"+DateTime.Now);
                ProductFirstList = (List<Product>)CacheHelper.getCacheManager().Get("BestSellerList" + catId);
                if (ProductFirstList == null)
                {
                    ProductFirstList = dbUtl.TopProductFirstList(catId);
                    foreach (var item in ProductFirstList)
                    {
                        var path = Server.MapPath(@"~/Pic/" + item.LARGEPIC);
                        var pth = File.Exists(path) ? "../Pic/" + item.LARGEPIC : "../common/assets/images/placeholder.png";
                        item.LARGEPIC = pth;
                    }
                    CacheHelper.getCacheManager().Add("BestSellerList" + catId, ProductFirstList);
                }
                ProductSecList = (List<Product>)CacheHelper.getCacheManager().Get("NewProductList" + catId);

                if (ProductSecList == null)
                {
                    ProductSecList = dbUtl.TopProductSectList(catId);
                    foreach (var item in ProductSecList)
                    {
                        var path = Server.MapPath(@"~/Pic/" + item.LARGEPIC);
                        var pth = File.Exists(path) ? "../Pic/" + item.LARGEPIC : "../common/assets/images/placeholder.png";
                        item.LARGEPIC = pth;
                    }
                    CacheHelper.getCacheManager().Add("NewProductList" + catId, ProductSecList);
                }
                #endregion
                #region BrandList
                brandList = (List<Category>)CacheHelper.getCacheManager().Get("BrandList");
                if (brandList == null)
                {
                    brandList = dbUtl.BrandList();
                    CacheHelper.getCacheManager().Add("BrandList", brandList);
                }
                #endregion
                //------------Nisha patel(23-03-2017)-----------------------



                #region ProListByCate
                // ProdListByCat = dbUtl.GetCategoryLogo(1);
                #endregion
                var x = HttpContext.Current.Session["news"];
                #region CategoryLogo
                if (Request.QueryString["CatId"] != null)
                {
                    // logoimg.Visible = false;
                    dbUtl = new dbUtility();
                    int cid = Convert.ToInt16(Request.QueryString["CatId"]);
                    categoryInfo = dbUtl.GetCategoryLogo(cid);
                }

                #endregion
                var x1 = Convert.ToInt32(Request.QueryString["CatID"]);
                #region Brand Banner Images
                brandbannerImage = dbUtl.Getbrandbannerlist(x1, 1);
                BrandHeaderBanner = brandbannerImage[0];
                BrandFooterBanner = brandbannerImage[1];
                #endregion
            }
            catch (Exception ex)
            {
                dbUtl.logerrors(ex);
            }
        }
        public static string RemoveQueryStringByKey(string url, string key)
        {
            var uri = new Uri(url);

            // this gets all the query string key value pairs as a collection
            var newQueryString = HttpUtility.ParseQueryString(uri.Query);

            // this removes the key if exists
            newQueryString.Remove(key);

            // this gets the page path from root without QueryString
            string pagePathWithoutQueryString = uri.GetLeftPart(UriPartial.Path);

            return newQueryString.Count > 0
                ? String.Format("{0}?{1}", pagePathWithoutQueryString, newQueryString)
                : pagePathWithoutQueryString;
        }

     
        [System.Web.Services.WebMethod]
        
        public static Product[] Addtocart(string value)
        {
            dbUtility dbult = new dbUtility();
            dbult.AddToCart(value, 1);
            var Products = dbult.Cart(SessionVariable.AddToCart);

            if (SessionVariable.customerType == (Int32)custtype.WholeSaler)
            {
                foreach (var item in Products)
                {
                    item.RETAIL_PRS = SessionVariable.IsSpecial > 0 ? item.FinalPrice : item.WHOLE_PRS;
                }
            }
            var x = Products.ToArray();
            
            return x;
        }
        public void Addbtnsubscriber()
        {
           dbUtl = new dbUtility();

             Newssubscribe objNss = new Newssubscribe();
            objNss.Subscibe_Name = Request.QueryString["Name"].ToString();
            objNss.Subscribe_Email = Request.QueryString["Email"].ToString();
            objNss.Subscribe = 1;
            dbUtl.AddNewssubscriber(objNss);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert(' User Subscribe');", true);
            return;

        }

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