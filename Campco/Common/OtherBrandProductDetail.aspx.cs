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
    public partial class OtherBrandProductDetail : System.Web.UI.Page
    {
        #region Variable Declaration
        public Product Prod_Detail;
        public List<Product> relatedProd;
        public List<Product> alternateImage;
        public int IsSpecial = 0;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            SessionVariable.PageName = Request.RawUrl;
            dbUtility dbUtl = new dbUtility();
            try
            {
                if (!IsPostBack)
                {
                    HttpContext.Current.Session["Url"] = Request.RawUrl;
                }
                IsSpecial = SessionVariable.IsSpecial;
                if (Session["Cart_Count"] == null)
                { Session["Cart_Count"] = 0; }

                string ProdCode = Convert.ToString(Request.QueryString["prod_cd"]);
             
                if (ProdCode != "")
                {
                    Prod_Detail = dbUtl.GetProductDetail(ProdCode);
                    if (SessionVariable.IsSpecial != 0)
                    {

                        var x = dbUtl.finalPrice(ProdCode);
                        Prod_Detail.FinalPrice = x.FinalPrice;
                        //Prod_Detail.WHOLE_PRS = SessionVariable.IsSpecial == 0 ? Prod_Detail.WHOLE_PRS : Prod_Detail.FinalPrice;

                    }

                    if (Prod_Detail.extraPic.Count > 0)
                    {
                        foreach (var item in Prod_Detail.extraPic)
                        {
                            var path12 = Server.MapPath(@"~/Pic/" + item.LargePic);
                            var pth12 = File.Exists(path12) ? "../Pic/" + item.LargePic : "../common/assets/images/placeholder.png";
                            item.LargePic = pth12;

                            var path13 = Server.MapPath(@"~/Pic/" + item.midPic);
                            var pth13 = File.Exists(path13) ? "../Pic/" + item.midPic : "../common/assets/images/placeholder.png";
                            item.midPic = pth13;

                            var path14 = Server.MapPath(@"~/Pic/" + item.smallPic);
                            var pth14 = File.Exists(path13) ? "../Pic/" + item.smallPic : "../common/assets/images/placeholder.png";
                            item.smallPic = pth13;
                        }
                    }
                    // if (Prod_Detail.BRANDID != Convert.ToInt32(DBNull.Value) || Prod_Detail.BRANDID > 0)
                    // {
                    relatedProd = dbUtl.RelatedProduct(ProdCode);

                    //}
                    hdnF_prod_cd.Value = Prod_Detail.PROD_CD;
                }
                else
                {

                }
                //}
            }
            catch (Exception ex)
            {
                dbUtl.logerrors(ex);
            }
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            var prodCD = hdnF_prod_cd.Value;
            dbUtility dbutility = new dbUtility();
            try
            {
                //var qty = Convert.ToInt32(quantity.Text) + Convert.ToInt32(Session["Cart_Count"]);
                //Session["Cart_Count"] = qty;
                string ProdCode = Convert.ToString(Request.QueryString["prod_cd"]);
                //SessionVariable.PROD_CD = ProdCode;
                //DataTable dt = new DataTable();
                //dt.Columns.Add("Prod_cd", typeof(string));
                //dt.Columns.Add("QTY", typeof(int));
                //DataRow row = dt.NewRow();
                //var table = SessionVariable.AddToCart;

                //if (table != null)
                //{
                //    var rowsToUpdate = table.Select().Where(r => r.Field<string>("Prod_cd") == ProdCode);
                //    if (table.Select(string.Format("[Prod_cd] = '{0}'", ProdCode)).ToList<DataRow>().Count == 0)
                //    {
                //        DataRow dr = table.NewRow();
                //        dr["Prod_cd"] = ProdCode;
                //        dr["QTY"] = Convert.ToInt32(quantity.Text);
                //        table.Rows.Add(dr);
                //    }
                //    else
                //    {
                //        table.Select(string.Format("[Prod_cd] = '{0}'", ProdCode)).ToList<DataRow>()
                //         .ForEach(r =>
                //         {
                //             r["Prod_cd"] = ProdCode;
                //             r["QTY"] = Convert.ToInt32(quantity.Text);
                //         });
                //    }

                //    dt = table;
                //}
                //else
                //{
                //    row["Prod_cd"] = ProdCode;
                //    row["QTY"] = quantity.Text;
                //    dt.Rows.Add(row);
                //    //qty = Convert.ToInt32(quantity.Text) + Convert.ToInt32(Session["Cart_Count"]);
                //    //Session["Cart_Count"] = qty;
                //}

                //SessionVariable.AddToCart = dt;
                ////Session["Cart_Count"] = Convert.ToInt32(SessionVariable.AddToCart.Compute("SUM(QTY)", ""));
                //HttpContext.Current.Session["Cart_Count"]= Convert.ToInt32(SessionVariable.AddToCart.Compute("SUM(QTY)", ""));
                //var value = SessionVariable.AddToCart;

                //if(SessionVariable.CustomerID!= "")
                //{

                //}

                dbutility.AddToCart(ProdCode, Convert.ToInt32(quantity.Text));
                Response.Redirect(Request.RawUrl);
            }
            catch(Exception ex)
            {
                dbutility.logerrors(ex);
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