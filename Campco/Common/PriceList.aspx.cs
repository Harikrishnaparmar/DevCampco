using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Web.Services;
using MasterSystem.Common;

// ---------------Nisha Patel -------------------------------
namespace Campco.Common
{
    public partial class PriceList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
               // Export_pricelist();
            }
        }
        // ---------------Nisha Patel(9-3-2017)-------------------------------
        #region  Record Export from database to pricelist
        public void Export_pricelist()
        {
            dbUtility dbutl = new dbUtility();
            DataTable dtexcel = new DataTable();
           // string strFilePath;
         //   strFilePath = Server.MapPath("~\\Download\\CampcoInventory.csv");
            dtexcel = dbutl.GetDatafromDatabaseToExcel();
            try
            {
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition","attachment;filename=CampcoInventory.csv");
                Response.Charset = "";
                Response.ContentType = "application/ms-excel";

                StringBuilder sb = new StringBuilder();

                for (int k = 0; k < dtexcel.Columns.Count; k++)
                {
                    //add separator
                    sb.Append(dtexcel.Columns[k].ColumnName + ',');
                }
                //append new line
                sb.Append("\n");
                for (int i = 0; i < dtexcel.Rows.Count; i++)
                {
                    for (int k = 0; k < dtexcel.Columns.Count; k++)
                    {
                        //add separator
                        sb.Append(dtexcel.Rows[i][k].ToString().Replace(",", ";") + ',');
                    }
                    //append new line
                    sb.Append("\n");
                }
                Response.Output.Write(sb.ToString());
                Response.Flush();
                Response.End();
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }
        //public void Export_pricelist()
        //{
        //   dbUtility dbutl = new dbUtility();
        //    try
        //    {
        //        Response.ClearContent();
        //        Response.Buffer = true;
        //        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "CampcoInventory.csv"));
        //        Response.ContentType = "application/ms-excel";
        //        string str = string.Empty;
        //        DataTable dtexcel = dbutl.GetDatafromDatabaseToExcel();
        //        foreach (DataColumn dtcol in dtexcel.Columns)
        //        {
        //            Response.Write(str + dtcol.ColumnName);
        //            str = "\t";
        //        }
        //        Response.Write("\n");
        //        foreach (DataRow dr in dtexcel.Rows)
        //        {
        //            str = " ";
        //            for (int j = 0; j < dtexcel.Columns.Count; j++)
        //            {
        //                Response.Write(str + Convert.ToString(dr[j]));
        //                str = "\t";
        //            }
        //            Response.Write("\n");
        //        }
        //        Response.End();
        //    }
        //    catch(Exception ex)
        //    {
        //        dbutl.logerrors(ex);
        //    }
        //}
        #endregion
        // ---------------Nisha Patel -------------------------------
        #region  Excel File Download Link
        protected void lnkExcelFileDownload_Click(object sender, EventArgs e)
        {
           Export_pricelist();
            dbUtility dbutl = new dbUtility();
            try
            {
                string strFilePath;
                strFilePath = Server.MapPath("~\\Download\\CampcoInventory.csv");
                Download_File(strFilePath);// Call Download_file method
            }
            catch(Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }
        #endregion
 // ---------------Nisha Patel -------------------------------
        #region Excel File Download Function
        private void Download_File(string FilePath)
        {
            dbUtility dbutl = new dbUtility();
            try
            {
                Response.ContentType = ContentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(FilePath));
                Response.WriteFile(FilePath);
                Response.End();
            }
            catch(Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }
        #endregion

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