using MasterSystem.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Campco.Common
{
    public partial class cart : System.Web.UI.Page
    {
        #region Declare Variables
        public List<Product> Cart_Products = null;
        public double totalAmount = 00.0;
        //public decimal shipCharge = Convert.ToDecimal(00.00);
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            SessionVariable.PageName = Request.RawUrl;
            try
            {
                HttpContext.Current.Session["sort"] = null;
                var cart = SessionVariable.AddToCart;
                if (HttpContext.Current.Session["drop"] == null)
                {
                    HttpContext.Current.Session["drop"] = 0;
                }
                //if(SessionVariable.InterNationalShipping_Charge<0)
                //{
                //    SessionVariable.InterNationalShipping_Charge = 0;
                //}
                if (SessionVariable.CustomerID.StartsWith("G#"))
                {
                    SessionVariable.customerType = 1;
                }

                //var prod_cd = Request.QueryString["prod_cd"].ToString();
                if (cart != null)
                {
                    Button1.Visible = true;
                }
                else
                {
                    Button1.Visible = false;
                }
                if (Request.QueryString["prod_cd"] != null)
                {
                    var prod_cd = Request.QueryString["prod_cd"].ToString();

                    if (cart != null)
                    {
                        try
                        {
                            cart = cart.Select(string.Format("[Prod_cd] <> '{0}'", prod_cd)).CopyToDataTable();

                            dbutl.PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, prod_cd, "", 0, "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, "0", 3);
                        }
                        catch (Exception ex)
                        {
                            cart = null;
                            dbutl.PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, prod_cd, "", 0, "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, "0", 3);
                            dbutl.logerrors(ex);
                        }

                    }

                    SessionVariable.AddToCart = cart;

                    SessionVariable.cart_Count = SessionVariable.AddToCart == null ? 0 : Convert.ToInt32(SessionVariable.AddToCart.Compute("SUM(QTY)", ""));
                    Response.Redirect("cart.aspx",false);

                }
                else
                {
                    if (cart != null)
                    {
                        dbUtility dbUtl = new dbUtility();
                        Cart_Products = dbUtl.Cart(cart);

                        foreach (var item in Cart_Products)
                        {
                            totalAmount += (SessionVariable.customerType != (int)custtype.WholeSaler ? item.RETAIL_PRS : SessionVariable.IsSpecial == 0 ? item.WHOLE_PRS : item.FinalPrice) * item.QTYinCart;
                            item.RETAIL_PRS = (SessionVariable.customerType != (int)custtype.WholeSaler ? item.RETAIL_PRS : SessionVariable.IsSpecial == 0 ? item.WHOLE_PRS : item.FinalPrice);
                        }

                        foreach (var item in Cart_Products)
                        {
                            var path = Server.MapPath(@"~/Pic/" + item.SMALLPIC);
                            var pth = File.Exists(path) ? "../Pic/" + item.SMALLPIC : "../common/assets/images/placeholder.png";
                            item.SMALLPIC = pth;
                        }
                        SessionVariable.QTYCHARGE = totalAmount;
                        SessionVariable.cart_Count = SessionVariable.AddToCart == null ? 0 : Convert.ToInt32(SessionVariable.AddToCart.Compute("SUM(QTY)", ""));
                        //if (SessionVariable.customerType == (int)custtype.Retailer || SessionVariable.CustomerID == "GUEST")
                        //{
                        //    shipCharge = dbUtl.ShippingCharge(SessionVariable.cart_Count, Convert.ToDecimal(totalAmount));
                        //}
                        //if (HttpContext.Current.Session["drop"].ToString() == "3")
                        //{
                        SessionVariable.Amount = (decimal)totalAmount + Convert.ToDecimal(SessionVariable.ShippingCharge) + Convert.ToDecimal(HttpContext.Current.Session["drop"] != null ? HttpContext.Current.Session["drop"] : 0);
                        // }
                    }
                }
            }
            catch(Exception ex)
            {
                dbutl.logerrors(ex);
            }            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
                string name = Request.Form["qty"];
                var table = SessionVariable.AddToCart;
                int i = 0;
                foreach (DataRow item in table.Rows)
                {

                    if (item["QTY"].ToString() != (name.Split(',')[i]).ToString())
                    {
                        item["QTY"] = name.Split(',')[i];
                    }
                    i++;
                }
                table.AcceptChanges();
                SessionVariable.AddToCart = table;
               // dbUtility dbutl = new dbUtility();
                //dbutl.PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, item["Prod_cd"].ToString(), "", Convert.ToInt32(item["QTY"]), "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, "0", 1);
                foreach (DataRow item in SessionVariable.AddToCart.Rows)
                {
                    //AddToCart(item["Prod_cd"].ToString(), Convert.ToInt32(item["QTY"]));
                    dbutl.PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, item["Prod_cd"].ToString(), "", Convert.ToInt32(item["QTY"]), "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, "0", 1);
                }
                SessionVariable.cart_Count = Convert.ToInt32(SessionVariable.AddToCart.Compute("SUM(QTY)", ""));
                // string email = .Value;
                //if (SessionVariable.customerType == (int)custtype.Retailer || SessionVariable.CustomerID == "GUEST")
                //{
                //    shipCharge = dbutl.ShippingCharge(SessionVariable.cart_Count, Convert.ToDecimal(totalAmount));
                //}
                Response.Redirect("cart.aspx",false);
            }
            catch(Exception ex)
            {
                dbutl.logerrors(ex);
            }
            }
        protected void btn_contiSopping_Click(object sender, EventArgs e)
        {
            dbUtility dbutl = new dbUtility();
            try
            {

                if (Request.UrlReferrer != null)
                {
                    string previousPageUrl = Request.UrlReferrer.AbsoluteUri;
                    string previousPageName = System.IO.Path.GetFileName(Request.UrlReferrer.AbsolutePath);
                    var x = Context.Request.QueryString["previousUrl"];
                    Response.Redirect(HttpContext.Current.Session["Url"].ToString());
                }
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }

        }

        [System.Web.Services.WebMethod]
        public static Product Addtocart(string value)
        {
            dbUtility dbutl = new dbUtility();
            Product product = new Product();
            try
            {
                 product = dbutl.GetProductDetail(value);
                //var product = dbutl.GetProductDetail(value);
                if (product!=null)
                {
                    dbutl.AddToCart(value,Convert.ToInt32(1));
                    return product;
                    //return Convert.ToString("{'Product':'" + product.PROD_CD.Trim() + "' , 'img':'"+product.SMALLPIC+"', 'unitPrice':'"+product.RETAIL_PRS+"', 'QTY':1}");
                }
                else
                {
                    product.PROD_CD = "Product is not available on this ID : '" + value + "'.";
                    return product;//"Product is not available on this ID : '" + value+"'.";
                }
               // HttpContext.Current.Response.Redirect("Cart.aspx",false);
            }
            catch(Exception ex)
            {
                dbutl.logerrors(ex);
                product.PROD_CD = "Product is not available on this ID " + value;
               
            }
            return product;//"Item added successfully.";
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="value"></param>
        [System.Web.Services.WebMethod]
        public static Product[] Addtocart(string value, string qty)
        {
            cart c = new cart();
            dbUtility dbult = new dbUtility();
            var product = dbult.GetProductDetail(value);
            if (product != null)
            {


                dbult.AddToCart(value, Convert.ToInt32(qty));
                var Products = dbult.Cart(SessionVariable.AddToCart);
                foreach (var item in Products)
                {
                    //c.totalAmount += (SessionVariable.customerType != (int)custtype.WholeSaler ? item.RETAIL_PRS : SessionVariable.IsSpecial == 0 ? item.WHOLE_PRS : item.FinalPrice) * item.QTYinCart;
                    item.RETAIL_PRS = (SessionVariable.customerType != (int)custtype.WholeSaler ? item.RETAIL_PRS : SessionVariable.IsSpecial == 0 ? item.WHOLE_PRS : item.FinalPrice);
                }
                //HttpServerUtility u = new HttpServerUtility();
                foreach (var item in Products)
                {
                    var path = HttpContext.Current.Server.MapPath(@"~/Pic/" + item.SMALLPIC);
                    var pth = File.Exists(path) ? "../Pic/" + item.SMALLPIC : "../common/assets/images/placeholder.png";
                    item.SMALLPIC = pth;
                }

                //SessionVariable.Amount = Convert.ToDecimal((c.totalAmount).ToString("0.00"));
                var x = Products.ToArray();
                return x;//SessionVariable.cart_Count.ToString(); 
            }
            else
            {
                List<Product> Product = new List<Product>();
                return Product.ToArray();
            }
             
                   
        }


        [System.Web.Services.WebMethod]
        public static void drop(string value)
        {
            cart c = new cart();
            HttpContext.Current.Session["drop"] = value;
            if (Convert.ToInt32(value) == 0){
                SessionVariable.Amount -= 3;
            }
            else
            {
                SessionVariable.Amount += 3;
            }
           // c.totalAmount = Convert.ToDouble(SessionVariable.Amount);
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
        //[System.Web.Services.WebMethod]
        //public static decimal Shipping_charge(string value)
        //{
        //    SessionVariable.InterNationalShipping_Charge = Convert.ToInt32(value);
        //    decimal shipCharge = 000;
        //    dbUtility dbUtl = new dbUtility();
        //    if (SessionVariable.customerType == (int)custtype.Retailer || SessionVariable.CustomerID == "GUEST")
        //    {
        //        shipCharge = dbUtl.ShippingCharge(SessionVariable.cart_Count, Convert.ToDecimal(SessionVariable.QTYCHARGE));
        //    }
        //    SessionVariable.Amount = Convert.ToDecimal(SessionVariable.QTYCHARGE) + shipCharge;
        //    //if (Convert.ToInt32(value) == 0)
        //    //{
        //    //    SessionVariable.Amount -= 3;
        //    //}
        //    //else
        //    //{
        //    //    SessionVariable.Amount += 3;
        //    //}
        //    return shipCharge;
        //}
    }
}
 