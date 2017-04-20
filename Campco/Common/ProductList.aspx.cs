using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.IO;
using MasterSystem.Common;
using System.Data;

namespace Campco.Common
{
    public partial class ProductList : System.Web.UI.Page
    {
        #region Declare variable
        dbUtility dbUtl;
        public List<Product> productList;
        public List<Product> productListbyPrice;
        public List<Product> ProductListSearch;
        public List<CategoryList> categoryList;
        string Searchcriteria = "";
        public int IsSpecial = 0;
        public int cusType = 0;
        public int currentPage = 1;
        public int min = 1;
        public int max = 1000;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            dbUtl = new dbUtility();
            Product p = new Product();
            IsSpecial = SessionVariable.IsSpecial;
            cusType = SessionVariable.customerType;
            try
            {
                if (!IsPostBack)
                {
                    SessionVariable.PageName = Request.RawUrl;
                    HttpContext.Current.Session["Url"] = Request.RawUrl;
                    SessionVariable.minPrice = 0;
                    SessionVariable.maxPrice = 500;
                    GetFilterDropdownValue();
                    //}
                    string query = "";
                    int param = -1;
                    try
                    {
                        param = Request.QueryString["param"] != null ? Convert.ToInt32(Request.QueryString["param"]) : 0;
                        query = Request.QueryString["prod_cd"] != null ? Request.QueryString["prod_cd"].ToString() : "";
                        Searchcriteria = Request.QueryString["Search"] != null ? Request.QueryString["Search"].ToString() : "";
                        int number = Request.QueryString["page"] != null ? Convert.ToInt32(Request.QueryString["page"]) : 1;
                        if (number == 0)
                        {
                            HttpContext.Current.Session["pageNumber"] = Convert.ToInt32(HttpContext.Current.Session["pageNumber"]) + 1;
                        }
                        else if (number == -1)
                        {
                            HttpContext.Current.Session["pageNumber"] = Convert.ToInt32(HttpContext.Current.Session["pageNumber"]) != 0 ? Convert.ToInt32(HttpContext.Current.Session["pageNumber"]) - 1 : 1;
                        }
                        else
                        {
                            HttpContext.Current.Session["pageNumber"] = number;
                        }

                    }
                    catch (Exception ex)
                    {
                        query = "";
                        param = -1;
                        dbUtl.logerrors(ex);
                    }
                    var xxx = HttpContext.Current.Session["pageNumber"];
                    int pagenumber = HttpContext.Current.Session["pageNumber"] != null && HttpContext.Current.Session["pageNumber"].ToString() != "0" ? Convert.ToInt32(HttpContext.Current.Session["pageNumber"]) : 1;
                    currentPage = pagenumber;
                    if (query != "")
                    {
                        var prod_code = Convert.ToString(Request.QueryString["prod_cd"]);
                        dbUtl.AddToCart(prod_code, 1);
                        var url = RemoveQueryStringByKey(Request.Url.ToString(), "prod_cd");
                        Response.Redirect(url);
                    }
                    var xabv = HttpContext.Current.Session["sort"];
                    if (!IsPostBack)
                    {
                        HttpContext.Current.Session["sort"] = null;
                        if (HttpContext.Current.Session["sort"] == null)
                        {
                            if (param == 0)
                            {
                                ddlSearchcriteria.SelectedIndex = 0;
                            }
                            else if (param == 1)
                            {
                                ddlSearchcriteria.SelectedIndex = 1;
                            }
                            else
                            {
                                ddlSearchcriteria.SelectedIndex = HttpContext.Current.Session["sort"] != null ? (int)HttpContext.Current.Session["sort"] : 0;
                            }
                            HttpContext.Current.Session["sort"] = ddlSearchcriteria.SelectedIndex;
                        }
                        else
                        {
                            ddlSearchcriteria.SelectedIndex = (int)HttpContext.Current.Session["sort"];
                        }
                        //ddlSearchcriteria.SelectedIndex = (int)HttpContext.Current.Session["sort"];
                        //HttpContext.Current.Session["sort"] = ddlSearchcriteria.SelectedIndex;
                        ddlSearchcriteria.SelectedIndex = HttpContext.Current.Session["sort"] != null ? (int)HttpContext.Current.Session["sort"] : 0;
                    }

                    HttpContext.Current.Session["sort"] = ddlSearchcriteria.SelectedIndex;
                    p.CATEGORYID = Request.QueryString["CatId"] != null ? Request.QueryString["CatId"].ToString() : "0";
                    categoryList = dbUtl.GetProductCategory(Request.QueryString["CatId"] != null ? Convert.ToInt16(Request.QueryString["CatId"].ToString()) : 0);
                    if (HttpContext.Current.Session["pageNumber"] != null)
                    {
                        try
                        {
                            var catID = Request.QueryString["CatId"] != null ? Convert.ToInt16(Request.QueryString["CatId"].ToString()) : 0;
                            ProductListSearch = dbUtl.GetSearchProductlist(catID, (int)HttpContext.Current.Session["sort"], param, Convert.ToInt32(HttpContext.Current.Session["pageNumber"]), (Convert.ToInt32(ConfigurationManager.AppSettings["pageSize"])), Searchcriteria);
                            foreach (var item in ProductListSearch)
                            {
                                var x = dbUtl.finalPrice(item.PROD_CD);
                                item.FinalPrice = (SessionVariable.IsSpecial == 0 ? item.WHOLE_PRS : x.FinalPrice);
                            }

                            foreach (var item in ProductListSearch)
                            {
                                var path = Server.MapPath(@"~/Pic/" + item.LARGEPIC);
                                var pth = File.Exists(path) ? "../Pic/" + item.LARGEPIC : "../common/assets/images/placeholder.png";
                                item.LARGEPIC = pth;
                            }

                            productList = ProductListSearch;
                        }
                        catch (Exception ex)
                        {
                            dbUtl.logerrors(ex);
                        }
                    }
                }//remove
            }
            catch (Exception ex)
            {
                dbUtl.logerrors(ex);
            }
        }
        protected void btnfilter_click(object sender, EventArgs e)
        {
            int p1, p2;
            dbUtl = new dbUtility();
            try
            {
                p1 = Convert.ToInt16(Request.Form["min_price"]);
                p2 = Convert.ToInt16(Request.Form["max_price"]);
                SessionVariable.maxPrice = p2;
                SessionVariable.minPrice = p1;
                Searchcriteria = Request.QueryString["Search"] != null ? Request.QueryString["Search"].ToString() : "";
                var CATID = Request.QueryString["CatId"] != null ? Convert.ToInt16(Request.QueryString["CatId"].ToString()) : 0;
                productListbyPrice = dbUtl.GetSearchProductlist(CATID, (int)HttpContext.Current.Session["sort"], 2, Convert.ToInt32(HttpContext.Current.Session["pageNumber"]), Convert.ToInt32(ConfigurationManager.AppSettings["pageSize"]), Searchcriteria, p1, p2);//dbUtl.GetProductListByPrice(Convert.ToInt16(Request.QueryString["CatId"].ToString()), p1, p2);           
                foreach (var item in productListbyPrice)
                {
                    var path = Server.MapPath(@"~/Pic/" + item.LARGEPIC);
                    var pth = File.Exists(path) ? "../Pic/" + item.LARGEPIC : "../common/assets/images/placeholder.png";
                    item.LARGEPIC = pth;
                }
                productList = productListbyPrice;
                //UpdatePanel1.Update();
                UpdatePanel1.Update();
            }
            catch (Exception ex)
            {
                dbUtl.logerrors(ex);
            }
        }

        // [WebMethod]
        // public static void buttonfilter()
        // {         
        // dbUtility dbult = new dbUtility();      
        // int p1 = Convert.ToInt16(HttpContext.Current.Request.Form["min_price"]);
        // int p2 = Convert.ToInt16(HttpContext.Current.Request.Form["max_price"]);
        //var Searchcriteria = HttpContext.Current.Request.QueryString["Search"] != null ? HttpContext.Current.Request.QueryString["Search"].ToString() : "";
        //var CATID = HttpContext.Current.Request.QueryString["CatId"] != null ? Convert.ToInt16(HttpContext.Current.Request.QueryString["CatId"].ToString()) : 0;
        //var productListbyPrice = dbult.GetSearchProductlist(CATID, 1, 2, Convert.ToInt32(HttpContext.Current.Session["pageNumber"]), Convert.ToInt32(ConfigurationManager.AppSettings["pageSize"]), Searchcriteria, p1, p2);//dbUtl.GetProductListByPrice(Convert.ToInt16(Request.QueryString["CatId"].ToString()), p1, p2);           
        //var  productList = productListbyPrice;
        // }
        protected void ddlSearchcriteria_SelectedIndexChanged(object sender, EventArgs e)
        {
            dbUtl = new dbUtility();
            try
            {
                var p1 = Convert.ToInt16(Request.Form["min_price"]);
                var p2 = Convert.ToInt16(Request.Form["max_price"]);
                HttpContext.Current.Session["sort"] = ddlSearchcriteria.SelectedIndex;
                Searchcriteria = Request.QueryString["Search"] != null ? Request.QueryString["Search"].ToString() : "";
                var catID = Request.QueryString["CatId"] != null ? Convert.ToInt16(Request.QueryString["CatId"].ToString()) : 0;
                var param = Request.QueryString["param"] != null ? Convert.ToInt16(Request.QueryString["param"].ToString()) : 0;
                ProductListSearch = dbUtl.GetSearchProductlist(catID, (int)HttpContext.Current.Session["sort"], param, Convert.ToInt32(HttpContext.Current.Session["pageNumber"]), Convert.ToInt32(ConfigurationManager.AppSettings["pageSize"]), Searchcriteria,p1,p2);
                foreach (var item in ProductListSearch)
                {
                    var path = Server.MapPath(@"~/Pic/" + item.LARGEPIC);
                    var pth = File.Exists(path) ? "../Pic/" + item.LARGEPIC : "../common/assets/images/placeholder.png";
                    item.LARGEPIC = pth;
                }

                productList = ProductListSearch;
                UpdatePanel1.Update();
               
            }
            catch (Exception ex)
            {
                dbUtl.logerrors(ex);
            }
        }
        /// <summary>
        /// //remove key form query string
        /// </summary>
        /// harikrishna Parmar
        /// 8-11-2016
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
        //End query srting method
        public void GetFilterDropdownValue()
        {
            ListItemCollection Collection = new ListItemCollection();
            if (SessionVariable.customerType == 1)
            {
                Collection.Add(new ListItem("Best Sellers"));
                Collection.Add(new ListItem("Newness"));
                Collection.Add(new ListItem("Part Number"));
                Collection.Add(new ListItem("Sort by price: low to high"));
                Collection.Add(new ListItem("Sort by price: high to low"));
                ddlSearchcriteria.DataSource = Collection;
                ddlSearchcriteria.DataBind();
            }
            else if (SessionVariable.customerType == 3)
            {

                Collection.Add(new ListItem("Best Sellers"));
                Collection.Add(new ListItem("Newness"));
                Collection.Add(new ListItem("Part Number"));
                Collection.Add(new ListItem("Sort by price: low to high"));
                Collection.Add(new ListItem("Sort by price: high to low"));
                Collection.Add(new ListItem("Inventory"));
                ddlSearchcriteria.DataSource = Collection;
                ddlSearchcriteria.DataBind();
            }
            else
            {
                Collection.Add(new ListItem("Best Sellers"));
                Collection.Add(new ListItem("Newness"));
                Collection.Add(new ListItem("Part Number"));
                Collection.Add(new ListItem("Sort by price: low to high"));
                Collection.Add(new ListItem("Sort by price: high to low"));
                ddlSearchcriteria.DataSource = Collection;
                ddlSearchcriteria.DataBind();
            }
        }
        [System.Web.Services.WebMethod]
        public static Product[] Addtocart(string value)
        {
            dbUtility dbult = new dbUtility();
            dbult.AddToCart(value, 1);
            var Products = dbult.Cart(SessionVariable.AddToCart);
            foreach (var item in Products)
            {
                item.RETAIL_PRS = (SessionVariable.customerType != (int)custtype.WholeSaler ? item.RETAIL_PRS : SessionVariable.IsSpecial == 0 ? item.WHOLE_PRS : item.FinalPrice);
            }
            var x = Products.ToArray();
            return x;//SessionVariable.cart_Count.ToString();        
        }


        /// <summary>
        /// Paging 
        /// </summary>
        /// <param name="pageNumber"></param>
        [System.Web.Services.WebMethod]
        public static Product[] Paging(string value,string param,string CatId,string search)
        {
            //dbUtility dbult = new dbUtility();
            //dbult.AddToCart(value, 1);
            //var Products = dbult.Cart(SessionVariable.AddToCart);
            //foreach (var item in Products)
            //{
            //    item.RETAIL_PRS = (SessionVariable.customerType != (int)custtype.WholeSaler ? item.RETAIL_PRS : SessionVariable.IsSpecial == 0 ? item.WHOLE_PRS : item.FinalPrice);
            //}
            //var x = Products.ToArray();
            //return x;//SessionVariable.cart_Count.ToString();        

            ProductList pr = new ProductList();
            var productList=pr.pagging(value,param,CatId,search);
            if (productList != null)
            {
                var array=productList.ToArray();
                Product p = new Product();
                p.ACTIVE = Convert.ToInt32(value);
                productList.Add(p);
                //array. p.ACTIVE;
                return productList.ToArray();
            }
            else
            {
                return productList.ToArray();
            }
        }

         public List<Product> pagging(string pageNumber,string param,string catid,string search)
        {
            dbUtl = new dbUtility();
            try
            {
                HttpContext.Current.Session["pageNumber"] = Convert.ToInt32(pageNumber);
                var context = HttpContext.Current.Request.Form["min_price"];
                var p1 = SessionVariable.minPrice;//SessionVarible.min
                var p2 = SessionVariable.maxPrice;
                //HttpContext.Current.Session["sort"] = ddlSearchcriteria.SelectedIndex;
                Searchcriteria = search != "null" ? search : "";
                var catID = catid != "null" ? Convert.ToInt32(catid) : 0;
                param = param != "null" ? param : "0";
                //var param = Request.QueryString["param"] != null ? Convert.ToInt16(Request.QueryString["param"].ToString()) : 0;
               
                ProductListSearch = dbUtl.GetSearchProductlist(catID, (int)HttpContext.Current.Session["sort"], Convert.ToInt32(param), Convert.ToInt32(HttpContext.Current.Session["pageNumber"]), Convert.ToInt32(ConfigurationManager.AppSettings["pageSize"]), Searchcriteria,p1,p2);
                foreach (var item in ProductListSearch)
                {
                    var path = Server.MapPath(@"~/Pic/" + item.LARGEPIC);
                    var pth = File.Exists(path) ? "../Pic/" + item.LARGEPIC : "../common/assets/images/placeholder.png";
                    item.LARGEPIC = pth;
                }

                productList = ProductListSearch;

                return productList;

            }
            catch (Exception ex)
            {
                dbUtl.logerrors(ex);
                return productList=null;
            }
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

