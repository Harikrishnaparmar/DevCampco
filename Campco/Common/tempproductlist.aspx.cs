using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

//namespace Campco.Common
//{
//    public partial class WebForm3 : System.Web.UI.Page
//    {
//        #region Declare variable

//        dbUtility dbUtl;
//        public List<Product> productList;
//        public List<Product> productListbyPrice;
//        public List<Product> ProductListSearch;
//        public List<CategoryList> categoryList;
//        #endregion
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            dbUtl = new dbUtility();
//            Product p = new Product();
//            if (!IsPostBack)
//            {
//                GetFilterDropdownValue();
//            }


//            if (Request.QueryString["CatId"].ToString() != null)
//            {

//                p.CATEGORYID = Request.QueryString["CatId"].ToString();
//                productList = dbUtl.GetProductList(p);
//                rptProductlist.DataSource = productList;
//                rptProductlist.DataBind();
//                categoryList = dbUtl.GetProductCategory(Convert.ToInt16(Request.QueryString["CatId"].ToString()));

//            }
//            else
//            {

//            }
//        }
//        protected void btnfilter_click(object sender, EventArgs e)
//        {
//            int p1, p2;
//            dbUtl = new dbUtility();
//            p1 = Convert.ToInt16(Request.Form["min_price"]);
//            p2 = Convert.ToInt16(Request.Form["max_price"]);
//            productListbyPrice = dbUtl.GetProductListByPrice(Convert.ToInt16(Request.QueryString["CatId"].ToString()), p1, p2);
//            productList = productListbyPrice;
//            rptProductlist.DataSource = productList;
//            rptProductlist.DataBind();

//        }
//        protected void ddlSearchcriteria_SelectedIndexChanged(object sender, EventArgs e)
//        {
//            dbUtl = new dbUtility();
//            ProductListSearch = dbUtl.GetSearchProductlist(Convert.ToInt16(Request.QueryString["CatId"].ToString()), ddlSearchcriteria.SelectedIndex);
//            productList = ProductListSearch;
//            rptProductlist.DataSource = productList;
//            rptProductlist.DataBind();


//        }

//        public void GetFilterDropdownValue()
//        {
//            ListItemCollection Collection = new ListItemCollection();
//            if (SessionVariable.customerType == 1)
//            {
//                Collection.Add(new ListItem("Best Sellers"));
//                Collection.Add(new ListItem("Newness"));
//                Collection.Add(new ListItem("Part Number"));
//                Collection.Add(new ListItem("Sort by price: low to high"));
//                Collection.Add(new ListItem("Sort by price: high to low"));
//                ddlSearchcriteria.DataSource = Collection;
//                ddlSearchcriteria.DataBind();
//            }
//            else if (SessionVariable.customerType == 3)

//            {
//                Collection.Add(new ListItem("Best Sellers"));
//                Collection.Add(new ListItem("Newness"));
//                Collection.Add(new ListItem("Part Number"));
//                Collection.Add(new ListItem("Sort by price: low to high"));
//                Collection.Add(new ListItem("Sort by price: high to low"));
//                Collection.Add(new ListItem("Inventory (Dealers only)"));
//                ddlSearchcriteria.DataSource = Collection;
//                ddlSearchcriteria.DataBind();

//            }
//            else
//            {
//                Collection.Add(new ListItem("Best Sellers"));
//                Collection.Add(new ListItem("Newness"));
//                Collection.Add(new ListItem("Part Number"));
//                Collection.Add(new ListItem("Sort by price: low to high"));
//                Collection.Add(new ListItem("Sort by price: high to low"));
//                ddlSearchcriteria.DataSource = Collection;
//                ddlSearchcriteria.DataBind();


//            }
//        }

//        //private void PopulatePager(int recordCount, int currentPage)
//    //    {
//    //        List<ListItem> pages = new List<ListItem>();
//    //        int startIndex, endIndex;
//    //        int pagerSpan = 5;

//    //        //Calculate the Start and End Index of pages to be displayed.
//    //        double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(PageSize));
//    //        int pageCount = (int)Math.Ceiling(dblPageCount);
//    //        startIndex = currentPage > 1 && currentPage + pagerSpan - 1 < pagerSpan ? currentPage : 1;
//    //        endIndex = pageCount > pagerSpan ? pagerSpan : pageCount;
//    //        if (currentPage > pagerSpan % 2)
//    //        {
//    //            if (currentPage == 2)
//    //            {
//    //                endIndex = 5;
//    //            }
//    //            else
//    //            {
//    //                endIndex = currentPage + 2;
//    //            }
//    //        }
//    //        else
//    //        {
//    //            endIndex = (pagerSpan - currentPage) + 1;
//    //        }

//    //        if (endIndex - (pagerSpan - 1) > startIndex)
//    //        {
//    //            startIndex = endIndex - (pagerSpan - 1);
//    //        }

//    //        if (endIndex > pageCount)
//    //        {
//    //            endIndex = pageCount;
//    //            startIndex = ((endIndex - pagerSpan) + 1) > 0 ? (endIndex - pagerSpan) + 1 : 1;
//    //        }

//    //        //Add the First Page Button.
//    //        if (currentPage > 1)
//    //        {
//    //            pages.Add(new ListItem("First", "1"));
//    //        }

//    //        //Add the Previous Button.
//    //        if (currentPage > 1)
//    //        {
//    //            pages.Add(new ListItem("<<", (currentPage - 1).ToString()));
//    //        }

//    //        for (int i = startIndex; i <= endIndex; i++)
//    //        {
//    //            pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
//    //        }

//    //        //Add the Next Button.
//    //        if (currentPage < pageCount)
//    //        {
//    //            pages.Add(new ListItem(">>", (currentPage + 1).ToString()));
//    //        }

//    //        //Add the Last Button.
//    //        if (currentPage != pageCount)
//    //        {
//    //            pages.Add(new ListItem("Last", pageCount.ToString()));
//    //        }
//    //        rptProductlist.DataSource = pages;
//    //        rptProductlist.DataBind();
//    //    }


//    }

//}

namespace Campco.Common
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        #region Declare variable

        dbUtility dbUtl;
        public List<Product> productList;
        public List<Product> productListbyPrice;
        public List<Product> ProductListSearch;
        public List<CategoryList> categoryList;
        int pos = 0;
        PagedDataSource objPds;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
           
           // int currentpageindex = 0;

            if (!IsPostBack)
            {
                this.ViewState["vs"] = 0;
                GetFilterDropdownValue();
            }

            pos = (int)this.ViewState["vs"];
            if (Request.QueryString["CatId"].ToString() != null)
            {
                dbUtl = new dbUtility();
                Product p = new Product();
                p.CATEGORYID = Request.QueryString["CatId"].ToString(); 
                categoryList = dbUtl.GetProductCategory(Convert.ToInt16(Request.QueryString["CatId"].ToString()));
                GetProduct();
            }
            else
            {

            }
        }
        public void GetProduct()
        {
            dbUtl = new dbUtility();
            Product p = new Product();
            objPds = new PagedDataSource();
            p.CATEGORYID = Request.QueryString["CatId"]!=null ? Request.QueryString["CatId"].ToString() : "0";
            var param= Request.QueryString["param"] !=null?Request.QueryString["param"].ToString():"";
            productList = dbUtl.GetProductList(p,param);
            objPds.DataSource = productList;
            objPds.CurrentPageIndex = pos;
            objPds.AllowPaging = true;
            objPds.PageSize = 3;
            btnfirst.Enabled = !objPds.IsFirstPage;
            btnprevious.Enabled = !objPds.IsFirstPage;
            btnlast.Enabled = !objPds.IsLastPage;
            btnlast.Enabled = !objPds.IsLastPage;
            rptProductlist.DataSource = objPds;
            rptProductlist.DataBind();
            rptProductlist.BorderWidth = Unit.Pixel(0);
            rptProductlist.GridLines = GridLines.None;
            rptProductlist.BorderStyle = BorderStyle.None;
        }
        protected void btnfilter_click(object sender, EventArgs e)
        {
            int p1, p2;
            dbUtl = new dbUtility();
            objPds = new PagedDataSource();
            p1 = Convert.ToInt16(Request.Form["min_price"]);
            p2 = Convert.ToInt16(Request.Form["max_price"]);
            productListbyPrice = dbUtl.GetProductListByPrice(Convert.ToInt16(Request.QueryString["CatId"].ToString()), p1, p2);
            productList = productListbyPrice;
            objPds.DataSource = productList;
            objPds.CurrentPageIndex = pos;
            objPds.AllowPaging = true;
            objPds.PageSize = 3;
            btnfirst.Enabled = !objPds.IsFirstPage;
            btnprevious.Enabled = !objPds.IsFirstPage;
            btnlast.Enabled = !objPds.IsLastPage;
            btnlast.Enabled = !objPds.IsLastPage;
            rptProductlist.DataSource = objPds;
            rptProductlist.DataBind();
            rptProductlist.BorderWidth = Unit.Pixel(0);
            rptProductlist.GridLines = GridLines.None;
            rptProductlist.BorderStyle = BorderStyle.None;

        }
        protected void ddlSearchcriteria_SelectedIndexChanged(object sender, EventArgs e)
        {
            dbUtl = new dbUtility();
            objPds = new PagedDataSource();
            ProductListSearch = dbUtl.GetSearchProductlist(Convert.ToInt16(Request.QueryString["CatId"].ToString()), ddlSearchcriteria.SelectedIndex);
            productList = ProductListSearch;
            objPds.DataSource = productList;
            objPds.CurrentPageIndex = pos;
            objPds.AllowPaging = true;
            objPds.PageSize = 3;
            btnfirst.Enabled = !objPds.IsFirstPage;
            btnprevious.Enabled = !objPds.IsFirstPage;
            btnlast.Enabled = !objPds.IsLastPage;
            btnlast.Enabled = !objPds.IsLastPage;
            rptProductlist.DataSource = objPds;
            rptProductlist.DataBind();
            rptProductlist.BorderWidth = Unit.Pixel(0);
            rptProductlist.GridLines = GridLines.None;
            rptProductlist.BorderStyle = BorderStyle.None;


        }

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
                Collection.Add(new ListItem("Inventory (Dealers only)"));
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

        protected void btnfirst_Click(object sender, EventArgs e)
        {
            pos = 0;
            GetProduct();
            
        }

        protected void btnprevious_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos -= 1;
            this.ViewState["vs"] = pos;
            GetProduct();
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos += 1;
            this.ViewState["vs"] = pos;
            GetProduct();       

        }

        protected void btnlast_Click(object sender, EventArgs e)
        {
            pos = objPds.PageCount - 1;
            GetProduct();

        }

        //private void PopulatePager(int recordCount, int currentPage)
        //    {
        //        List<ListItem> pages = new List<ListItem>();
        //        int startIndex, endIndex;
        //        int pagerSpan = 5;

        //        //Calculate the Start and End Index of pages to be displayed.
        //        double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(PageSize));
        //        int pageCount = (int)Math.Ceiling(dblPageCount);
        //        startIndex = currentPage > 1 && currentPage + pagerSpan - 1 < pagerSpan ? currentPage : 1;
        //        endIndex = pageCount > pagerSpan ? pagerSpan : pageCount;
        //        if (currentPage > pagerSpan % 2)
        //        {
        //            if (currentPage == 2)
        //            {
        //                endIndex = 5;
        //            }
        //            else
        //            {
        //                endIndex = currentPage + 2;
        //            }
        //        }
        //        else
        //        {
        //            endIndex = (pagerSpan - currentPage) + 1;
        //        }

        //        if (endIndex - (pagerSpan - 1) > startIndex)
        //        {
        //            startIndex = endIndex - (pagerSpan - 1);
        //        }

        //        if (endIndex > pageCount)
        //        {
        //            endIndex = pageCount;
        //            startIndex = ((endIndex - pagerSpan) + 1) > 0 ? (endIndex - pagerSpan) + 1 : 1;
        //        }

        //        //Add the First Page Button.
        //        if (currentPage > 1)
        //        {
        //            pages.Add(new ListItem("First", "1"));
        //        }

        //        //Add the Previous Button.
        //        if (currentPage > 1)
        //        {
        //            pages.Add(new ListItem("<<", (currentPage - 1).ToString()));
        //        }

        //        for (int i = startIndex; i <= endIndex; i++)
        //        {
        //            pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
        //        }

        //        //Add the Next Button.
        //        if (currentPage < pageCount)
        //        {
        //            pages.Add(new ListItem(">>", (currentPage + 1).ToString()));
        //        }

        //        //Add the Last Button.
        //        if (currentPage != pageCount)
        //        {
        //            pages.Add(new ListItem("Last", pageCount.ToString()));
        //        }
        //        rptProductlist.DataSource = pages;
        //        rptProductlist.DataBind();
        //    }


    }

}