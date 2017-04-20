using System;
using System.Web;
using System.Web.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Linq;
using MasterSystem.Common;
//--------------created by(Nisha patel)(date - 12--03-2017)
using AuthorizeNet.Api.Contracts.V1;
using System.Net.Mail;
using System.Net.Mime;
using System.IO;
using System.Text;
using System.Net;
using CacheManager.Core;
using Campco.AppCode;

namespace Campco
{
    public class AdminDBUtility
    {
        #region varible Declaration

        #endregion
        #region Get Brand Banner Detail
        public DataSet GetBrandBannerDetail(string CategoryId)
        {
            dbUtility dbutl = new dbUtility();
            DataSet dsbrbann = new DataSet();
            try
            {
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();            
                cmd.CommandText = "SP_COTS_Admin_GetBrandBannerDetail";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CategoryId",CategoryId);
                dsbrbann = db.GetDataSet(cmd);
                return dsbrbann;
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
            return dsbrbann;
        }

        #endregion
        #region update Banner Detail     
        public  string UpdateBannerDetail( string param, int BannerId=0, int orderId=0,int BrandStatus = 0)
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SP_COTS_Admin_Update_Brand_Banner_Image";
            cmd.CommandType = CommandType.StoredProcedure;
            string c_Id = "";
            try
            {               
                cmd.Parameters.AddWithValue("@brand_Banner_Id", BannerId);
                cmd.Parameters.AddWithValue("@orderBy", orderId);
                cmd.Parameters.AddWithValue("@Param", param);
                cmd.Parameters.AddWithValue("@status", BrandStatus);
                c_Id = Convert.ToString(db.executenonquery_Reg(cmd));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return (c_Id);
        }
        #endregion      
    }
}