using System;
using System.Web;
using System.Web.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Linq;
using MasterSystem.Common;
using AuthorizeNet.Api.Contracts.V1;
using System.Net.Mail;
using System.Net.Mime;
using System.IO;
using System.Text;
using System.Net;
using CacheManager.Core;
using Campco.AppCode;
using System.Web.Services;

namespace Campco
{
    public class dbUtility
    {
        /// <summary>
        /// <author>Harikrishna Parmar and Nisha Patel</author>
        /// <create>20-09-2016</create>
        /// </summary>
        /// 

        #region Variable Declaration

        DataSet dsBrandList;
        DataSet dsProductList;
        DataSet dsProCat;
        public List<ExtraPic> ExtraImages = null;
        ExtraPic ePic;
        public List<CategoryList> categoryList, footerCategoryList;
        public List<CategoryList> ItemList, ItemList2;
        public List<Registration_Property> UserList;
        public List<State> stateList;
        public List<Product> RelatedProd, ProductListByCategory, ShoppingCart, ProductList, productList;
        Product prdDetail;
        SqlDataAdapter da;
        public List<Category> brandList;
        public Category category;
        DBConnection db;
        SqlCommand cmd;
        DataTable dtState, dtsearchProd;
        public List<CategoryList> ProCatList;
        public List<Product> Prosearchlist;
        public List<OrderDetail> OrderDetail;
        public List<Banners_Photo> BrandBannerList;
        #endregion
 
        //----------- Nisha patel ---------------------------------------------------------------
        #region GetStateList
        public DataTable Getdatatable(string sqlproc, string country)
        {
            try
            {
                db = new DBConnection();
                cmd = new SqlCommand();
                cmd.CommandText = sqlproc;
                cmd.Parameters.AddWithValue("@Country", country);
                cmd.CommandType = CommandType.StoredProcedure;
                dtState = db.getDataTable(cmd);
                return dtState;
            }
            catch (Exception EX)
            {
                return null;
            }
        }
        #endregion


        //----------- Nisha patel ---------------------------------------------------------------
        #region Registration
        public string Adduserdetail(Registration_Property objReg)
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Sp_COTS_Insert_Customer";
            cmd.CommandType = CommandType.StoredProcedure;
            string c_Id = "";
            try
            {
                cmd.Parameters.AddWithValue("@Param", "Insert");
                cmd.Parameters.AddWithValue("@CUS_ID", objReg.CUS_ID);
                cmd.Parameters.AddWithValue("@CUS_NM", objReg.CUS_NM);
                cmd.Parameters.AddWithValue("@CUS_TYPE", objReg.CUS_TYPE);
                cmd.Parameters.AddWithValue("@EMAIL_ADR", objReg.EMAIL_ADR);
                cmd.Parameters.AddWithValue("@PHONE", objReg.PHONE);
                cmd.Parameters.AddWithValue("@PHONE_2", objReg.PHONE_2);
                cmd.Parameters.AddWithValue("@Password", objReg.Password);
                cmd.Parameters.AddWithValue("@SHP_ADDRESS", objReg.SHP_ADDRESS);
                cmd.Parameters.AddWithValue("@SHP_ADDRESS2", objReg.SHP_ADDRESS2);
                cmd.Parameters.AddWithValue("@SHP_CITY", objReg.SHP_CITY);
                cmd.Parameters.AddWithValue("@SHP_STATE", objReg.SHP_STATE);
                cmd.Parameters.AddWithValue("@SHP_ZIP", objReg.SHP_ZIP);
                cmd.Parameters.AddWithValue("@SHP_COUNTRY", objReg.SHP_COUNTRY);
                cmd.Parameters.AddWithValue("@ADDRESS", objReg.ADDRESS);
                cmd.Parameters.AddWithValue("@ADDRESS2", objReg.ADDRESS2);
                cmd.Parameters.AddWithValue("@CITY", objReg.CITY);
                cmd.Parameters.AddWithValue("@STATE", objReg.STATE);
                cmd.Parameters.AddWithValue("@COUNTRY", objReg.COUNTRY);
                cmd.Parameters.AddWithValue("@ZIP", objReg.ZIP);
                cmd.Parameters.AddWithValue("@ATTN", objReg.ATTN);
                cmd.Parameters.AddWithValue("@FIRST_NM", objReg.FIRST_NM);
                cmd.Parameters.AddWithValue("@LAST_NM", objReg.LAST_NM);
                cmd.Parameters.AddWithValue("@CUS_NT1", objReg.CUS_NT1);
                cmd.Parameters.AddWithValue("@CUS_NT2", objReg.CUS_NT2);
                cmd.Parameters.AddWithValue("@WEB_ADR", objReg.WEB_ADR);
                cmd.Parameters.AddWithValue("@Login_Name", objReg.LoginName);
                cmd.Parameters.AddWithValue("@SLS_TYPE", objReg.SLS_TYPE);
                cmd.Parameters.AddWithValue("@VALID", objReg.VALID);
                cmd.Parameters.AddWithValue("@FRD_Date", Clarion.TodayInt);
                cmd.Parameters.AddWithValue("@SALES_NUM", objReg.SALES_NUM);
                cmd.Parameters.AddWithValue("@SALES_NUM2", objReg.SALES_NUM2);
                cmd.Parameters.AddWithValue("@fax", objReg.Fax);

                c_Id = Convert.ToString(db.executenonquery_Reg(cmd));
                return c_Id;
            }

            catch (Exception ex)
            {
                throw ex;
            }
            //return Cust_Id;
            finally
            {
                db.connection();
            }
        }
        #endregion
        //----------- Nisha patel ---------UpdatemyProfile.com------------------------------------
        #region Update My Profile
        public string Updateduserdetail(Registration_Property objReg)
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Sp_COTS_Insert_Customer";
            string c_Id;
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.Parameters.AddWithValue("@Param", "Update");
                cmd.Parameters.AddWithValue("@CUS_ID", objReg.CUS_ID.Trim());
                cmd.Parameters.AddWithValue("@CUS_NM", objReg.CUS_NM.Trim());
                cmd.Parameters.AddWithValue("@CUS_TYPE", objReg.CUS_TYPE.Trim());
                cmd.Parameters.AddWithValue("@EMAIL_ADR", objReg.EMAIL_ADR.Trim());
                cmd.Parameters.AddWithValue("@PHONE", objReg.PHONE.Trim());
                cmd.Parameters.AddWithValue("@PHONE_2", objReg.PHONE_2.Trim());
                cmd.Parameters.AddWithValue("@Password", objReg.Password.Trim());
                cmd.Parameters.AddWithValue("@SHP_ADDRESS", "");
                cmd.Parameters.AddWithValue("@SHP_ADDRESS2", "");
                cmd.Parameters.AddWithValue("@SHP_CITY", "");
                cmd.Parameters.AddWithValue("@SHP_STATE", "");
                cmd.Parameters.AddWithValue("@SHP_ZIP", "");
                cmd.Parameters.AddWithValue("@SHP_COUNTRY", "");
                cmd.Parameters.AddWithValue("@ADDRESS", objReg.ADDRESS.Trim());
                cmd.Parameters.AddWithValue("@ADDRESS2", objReg.ADDRESS2.Trim());
                cmd.Parameters.AddWithValue("@CITY", objReg.CITY.Trim());
                cmd.Parameters.AddWithValue("@STATE", objReg.STATE.Trim());
                cmd.Parameters.AddWithValue("@COUNTRY", objReg.COUNTRY.Trim());
                cmd.Parameters.AddWithValue("@ZIP", objReg.ZIP.Trim());
                cmd.Parameters.AddWithValue("@ATTN", objReg.ATTN.Trim());
                cmd.Parameters.AddWithValue("@FIRST_NM", objReg.FIRST_NM.Trim());
                cmd.Parameters.AddWithValue("@LAST_NM", objReg.LAST_NM.Trim());
                cmd.Parameters.AddWithValue("@CUS_NT1", objReg.CUS_NT1.Trim());
                cmd.Parameters.AddWithValue("@CUS_NT2", objReg.CUS_NT2.Trim());
                cmd.Parameters.AddWithValue("@WEB_ADR", objReg.WEB_ADR.Trim());
                cmd.Parameters.AddWithValue("@Login_Name", objReg.LoginName.Trim());
                cmd.Parameters.AddWithValue("@SLS_TYPE", objReg.SLS_TYPE.Trim());
                cmd.Parameters.AddWithValue("@FRD_Date", Clarion.TodayInt);
                cmd.Parameters.AddWithValue("@SALES_NUM", objReg.SALES_NUM.Trim());
                cmd.Parameters.AddWithValue("@SALES_NUM2", objReg.SALES_NUM2.Trim());
                cmd.Parameters.AddWithValue("@VALID", objReg.VALID.Trim());
                cmd.Parameters.AddWithValue("@fax", objReg.Fax);
                //db.executenonquery(cmd);
                c_Id = Convert.ToString(db.executenonquery_Reg(cmd));
                return c_Id;
            }

            catch (Exception ex)
            {
                throw ex;
            }
            //return Cust_Id;
            finally
            {
                db.connection();
            }
        }
        #endregion


        //----------- Nisha patel ------------UpdateMyProfile.aspx---------------------------------
        #region Update Customer Profile
        public void Updateuserdetail(Registration_Property objReg)
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Sp_COTS_Insert_Customer";
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.Parameters.AddWithValue("@CUS_ID", objReg.CUS_ID);
                cmd.Parameters.AddWithValue("@CUS_NM", objReg.CUS_NM);
                cmd.Parameters.AddWithValue("@CUS_TYPE", objReg.CUS_TYPE);
                cmd.Parameters.AddWithValue("@EMAIL_ADR", objReg.EMAIL_ADR);
                cmd.Parameters.AddWithValue("@PHONE", objReg.PHONE);
                cmd.Parameters.AddWithValue("@PHONE_2", objReg.PHONE_2);
                cmd.Parameters.AddWithValue("@Password", objReg.Password);
                cmd.Parameters.AddWithValue("@SHP_ADDRESS", objReg.SHP_ADDRESS);
                cmd.Parameters.AddWithValue("@SHP_ADDRESS2", objReg.SHP_ADDRESS2);
                cmd.Parameters.AddWithValue("@SHP_CITY", objReg.SHP_CITY);
                cmd.Parameters.AddWithValue("@SHP_STATE", objReg.SHP_STATE);
                cmd.Parameters.AddWithValue("@SHP_ZIP", objReg.SHP_ZIP);
                cmd.Parameters.AddWithValue("@SHP_COUNTRY", objReg.SHP_COUNTRY);
                cmd.Parameters.AddWithValue("@ADDRESS", objReg.ADDRESS);
                cmd.Parameters.AddWithValue("@ADDRESS2", objReg.ADDRESS2);
                cmd.Parameters.AddWithValue("@CITY", objReg.CITY);
                cmd.Parameters.AddWithValue("@STATE", objReg.STATE);
                cmd.Parameters.AddWithValue("@COUNTRY", objReg.COUNTRY);
                cmd.Parameters.AddWithValue("@ZIP", objReg.ZIP);
                cmd.Parameters.AddWithValue("@ATTN", objReg.ATTN);
                cmd.Parameters.AddWithValue("@FIRST_NM", objReg.FIRST_NM);
                cmd.Parameters.AddWithValue("@LAST_NM", objReg.LAST_NM);
                cmd.Parameters.AddWithValue("@CUS_NT1", objReg.CUS_NT1);
                cmd.Parameters.AddWithValue("@CUS_NT2", objReg.CUS_NT2);
                cmd.Parameters.AddWithValue("@WEB_ADR", objReg.WEB_ADR);
                cmd.Parameters.AddWithValue("@Login_Name", objReg.LoginName);
                cmd.Parameters.AddWithValue("@SLS_TYPE", objReg.SLS_TYPE);
                cmd.Parameters.AddWithValue("@VALID", objReg.VALID);
                db.executenonquery(cmd);
                //return Cust_Id;
            }

            catch (Exception ex)
            {
                throw ex;
            }
            //return Cust_Id;
            finally
            {
                db.connection();
            }
        }
        #endregion
        //----------- Nisha patel ---------------------------------------------------------------
        #region Userverification
        public DataSet UserVerify(Registration_Property objReg, int Param = 0)
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Sp_COTS_VerifyUserLogin";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email", objReg.EMail);
            cmd.Parameters.AddWithValue("@Passowrd", objReg.Password);
            cmd.Parameters.AddWithValue("@param", Param);
            DataSet dsuserlist;
            dsuserlist = db.GetDataSet(cmd);
            return dsuserlist;
        }

        #endregion

        // ----------- Nisha patel ---------------------------------------------------------------
        #region Get Customer Profile
        public Registration_Property GetCustomerDetail_MyProfile(Registration_Property R)
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            DataSet dsCusdetail = new DataSet();
            Registration_Property objReg = new Registration_Property();
            cmd.CommandText = "Sp_COTS_GetCustomerDetail_Profile";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CUS_ID", R.CUS_ID);
            dsCusdetail = db.GetDataSet(cmd);
            objReg.CUS_ID = dsCusdetail.Tables[0].Rows[0]["CUS_ID"].ToString();
            objReg.FIRST_NM = dsCusdetail.Tables[0].Rows[0]["FIRST_NM"].ToString();
            objReg.LAST_NM = dsCusdetail.Tables[0].Rows[0]["LAST_NM"].ToString();
            objReg.EMail = dsCusdetail.Tables[0].Rows[0]["EMail"].ToString();
            objReg.ADDRESS = dsCusdetail.Tables[0].Rows[0]["ADDRESS"].ToString();
            objReg.ADDRESS2 = dsCusdetail.Tables[0].Rows[0]["ADDRESS2"].ToString();
            objReg.CITY = dsCusdetail.Tables[0].Rows[0]["CITY"].ToString();
            objReg.COUNTRY = dsCusdetail.Tables[0].Rows[0]["COUNTRY"].ToString();
            objReg.ZIP = dsCusdetail.Tables[0].Rows[0]["ZIP"].ToString();
            objReg.EMAIL_ADR = dsCusdetail.Tables[0].Rows[0]["EMAIL_ADR"].ToString();
            objReg.LoginName = dsCusdetail.Tables[0].Rows[0]["LoginName"].ToString();
            objReg.Password = dsCusdetail.Tables[0].Rows[0]["Password"].ToString();
            objReg.PHONE = dsCusdetail.Tables[0].Rows[0]["PHONE"].ToString();
            objReg.PHONE_2 = dsCusdetail.Tables[0].Rows[0]["PHONE_2"].ToString();
            objReg.SHP_ADDRESS = dsCusdetail.Tables[0].Rows[0]["SHP_ADDRESS"].ToString();
            objReg.SHP_ADDRESS2 = dsCusdetail.Tables[0].Rows[0]["SHP_ADDRESS2"].ToString();
            objReg.SHP_CITY = dsCusdetail.Tables[0].Rows[0]["SHP_CITY"].ToString();
            objReg.SHP_COUNTRY = dsCusdetail.Tables[0].Rows[0]["SHP_COUNTRY"].ToString();
            objReg.SHP_STATE = dsCusdetail.Tables[0].Rows[0]["SHP_STATE"].ToString();
            objReg.SHP_ZIP = dsCusdetail.Tables[0].Rows[0]["SHP_ZIP"].ToString();
            objReg.STATE = dsCusdetail.Tables[0].Rows[0]["STATE"].ToString();
            objReg.WEB_ADR = dsCusdetail.Tables[0].Rows[0]["WEB_ADR"].ToString();
            objReg.CUS_NM = dsCusdetail.Tables[0].Rows[0]["CUS_NM"].ToString();
            objReg.ATTN = dsCusdetail.Tables[0].Rows[0]["ATTN"].ToString();
            objReg.Fax = dsCusdetail.Tables[0].Rows[0]["PHONE_3"].ToString();
            return objReg;
        }

        #endregion
        //---------Nisha Patel--------------------------------------------------------------------

        #region Get Customer Profile
        public List<Registration_Property> GetCustomerDetail_MyProfile1(Registration_Property R)
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            DataSet dsCusdetail = new DataSet();
            Registration_Property objReg = new Registration_Property();
            UserList = new List<Registration_Property>();
            cmd.CommandText = "Sp_COTS_GetCustomerDetail_Profile";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CUS_ID", R.CUS_ID);
            dsCusdetail = db.GetDataSet(cmd);
            objReg.CUS_ID = dsCusdetail.Tables[0].Rows[0]["CUS_ID"].ToString();
            objReg.FIRST_NM = dsCusdetail.Tables[0].Rows[0]["FIRST_NM"].ToString();
            objReg.LAST_NM = dsCusdetail.Tables[0].Rows[0]["LAST_NM"].ToString();
            objReg.EMail = dsCusdetail.Tables[0].Rows[0]["EMail"].ToString();
            objReg.ADDRESS = dsCusdetail.Tables[0].Rows[0]["ADDRESS"].ToString();
            objReg.ADDRESS2 = dsCusdetail.Tables[0].Rows[0]["ADDRESS2"].ToString();
            objReg.CITY = dsCusdetail.Tables[0].Rows[0]["CITY"].ToString();
            objReg.COUNTRY = dsCusdetail.Tables[0].Rows[0]["COUNTRY"].ToString();
            objReg.ZIP = dsCusdetail.Tables[0].Rows[0]["ZIP"].ToString();
            objReg.EMAIL_ADR = dsCusdetail.Tables[0].Rows[0]["EMAIL_ADR"].ToString();
            objReg.LoginName = dsCusdetail.Tables[0].Rows[0]["LoginName"].ToString();
            objReg.Password = dsCusdetail.Tables[0].Rows[0]["Password"].ToString();
            objReg.PHONE = dsCusdetail.Tables[0].Rows[0]["PHONE"].ToString();
            objReg.PHONE_2 = dsCusdetail.Tables[0].Rows[0]["PHONE_2"].ToString();
            objReg.SHP_ADDRESS = dsCusdetail.Tables[0].Rows[0]["SHP_ADDRESS"].ToString();
            objReg.SHP_ADDRESS2 = dsCusdetail.Tables[0].Rows[0]["SHP_ADDRESS2"].ToString();
            objReg.SHP_CITY = dsCusdetail.Tables[0].Rows[0]["SHP_CITY"].ToString();
            objReg.SHP_COUNTRY = dsCusdetail.Tables[0].Rows[0]["SHP_COUNTRY"].ToString();
            objReg.SHP_STATE = dsCusdetail.Tables[0].Rows[0]["SHP_STATE"].ToString();
            objReg.SHP_ZIP = dsCusdetail.Tables[0].Rows[0]["SHP_ZIP"].ToString();
            objReg.STATE = dsCusdetail.Tables[0].Rows[0]["STATE"].ToString();
            objReg.WEB_ADR = dsCusdetail.Tables[0].Rows[0]["WEB_ADR"].ToString();
            objReg.CUS_NM = dsCusdetail.Tables[0].Rows[0]["CUS_NM"].ToString();
            objReg.ATTN = dsCusdetail.Tables[0].Rows[0]["ATTN"].ToString();
            UserList.Add(objReg);
            return UserList;
        }

        #endregion

       

        #region Get Footer Category
        public List<List<CategoryList>> FooterCategoryList()
        {
            try
            {
                List<List<CategoryList>> List = new List<List<Campco.CategoryList>>();
                DBConnection db = new DBConnection();
                string command = "SP_COTS_Get_Footer_Brands";
                dsBrandList = db.command(command);
                #region BrandList
                footerCategoryList = new List<CategoryList>();
                ItemList2 = new List<CategoryList>();
                if (dsBrandList.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsBrandList.Tables[0].Rows)
                    {
                        CategoryList CL = new CategoryList();
                        CL.CATEGORYID = Convert.ToInt32(dr[0]);
                        CL.PARENTID = Convert.ToInt32(dr[1]);
                        CL.CATEGORYNAME = dr[3] == DBNull.Value ? "" : Convert.ToString(dr[3]);
                        CL.SMALLPIC = dr[4] == DBNull.Value ? "" : Convert.ToString(dr[4]);
                        footerCategoryList.Add(CL);
                    }
                }

                if (dsBrandList.Tables[1].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsBrandList.Tables[1].Rows)
                    {
                        CategoryList CL = new CategoryList();
                        CL.CATEGORYID = Convert.ToInt32(dr[0]);
                        CL.PARENTID = Convert.ToInt32(dr[1]);
                        CL.CATEGORYNAME = dr[3] == DBNull.Value ? "" : Convert.ToString(dr[3]);
                        CL.SMALLPIC = dr[4] == DBNull.Value ? "" : Convert.ToString(dr[4]);
                        ItemList2.Add(CL);
                    }
                }
                List.Add(footerCategoryList);
                List.Add(ItemList2);
                #endregion
                return List;

            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {

            }
        }
        #endregion
        //---------Nisha Patel--------------------------------------------------------------------
        #region Get Category List
        public List<List<CategoryList>> CategoryList()
        {
            try
            {
                List<List<CategoryList>> List = new List<List<Campco.CategoryList>>();
                DBConnection db = new DBConnection();
                string command = "SP_COTS_Get_Brands";

                dsBrandList = db.command(command);
                #region BrandList
                categoryList = new List<CategoryList>();
                ItemList = new List<CategoryList>();
                if (dsBrandList.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsBrandList.Tables[0].Rows)
                    {
                        CategoryList CL = new CategoryList();
                        CL.CATEGORYID = Convert.ToInt32(dr[0]);
                        CL.PARENTID = Convert.ToInt32(dr[1]);
                        CL.CATEGORYNAME = dr[3] == DBNull.Value ? "" : Convert.ToString(dr[3]);
                        CL.SMALLPIC = dr[4] == DBNull.Value ? "" : Convert.ToString(dr[4]);
                        categoryList.Add(CL);
                    }
                }

                if (dsBrandList.Tables[1].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsBrandList.Tables[1].Rows)
                    {
                        CategoryList CL = new CategoryList();
                        CL.CATEGORYID = Convert.ToInt32(dr[0]);
                        CL.PARENTID = Convert.ToInt32(dr[1]);
                        CL.CATEGORYNAME = dr[3] == DBNull.Value ? "" : Convert.ToString(dr[3]);
                        CL.SMALLPIC = dr[4] == DBNull.Value ? "" : Convert.ToString(dr[4]);
                        ItemList.Add(CL);
                    }
                }
                List.Add(categoryList);
                List.Add(ItemList);
                #endregion
                return List;

            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {

            }
        }
        #endregion

        //-----------------nisha Patel (date:- 04-01-2017)-------------------
        #region CategoryName
        public DataSet GetCategorylist()
        {
            DataSet dsbrandlist = new DataSet();
            DBConnection db = new DBConnection();
            string command = "SP_COTS_Get_Brands";
            dsbrandlist = db.command(command);
            return (dsbrandlist);
        }
        #endregion
        //-----------------nisha Patel (date:- 04-01-2017)-------------------

        #region 
        public string Insert_Banner_Image(Banners_Photo B_Ph)
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SP_COTS_Insert_Brand_Banner_Image";
            cmd.CommandType = CommandType.StoredProcedure;
            string c_Id = "";
            try
            {
                cmd.Parameters.AddWithValue("@CategoryId", B_Ph.CategoryId);
                cmd.Parameters.AddWithValue("@Banner_Path", B_Ph.Banner_Path);
                cmd.Parameters.AddWithValue("@status", B_Ph.Status);
                cmd.Parameters.AddWithValue("@Banner_Position", B_Ph.Banner_Position);
                cmd.Parameters.AddWithValue("@CreateDate", B_Ph.CreatedDate);
                cmd.Parameters.AddWithValue("@CreatedBy", B_Ph.CreatedBy);
                cmd.Parameters.AddWithValue("@orderBy", B_Ph.OrderBy);         
                c_Id = Convert.ToString(db.executenonquery_Reg(cmd));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return (c_Id);
        }
        #endregion
        //---------Nisha Patel--------------------------------------------------------------------
        //chnaged by harikrishna/13-10-2016/
        #region MasterPage CategoryLogo
        public Category GetCategoryLogo(int categoryId = 0, string prod_cd = "", int param = 0)
        {
            category = new Category();
            SqlCommand cmd = new SqlCommand("[dbo].[SP_COTS_Get_Category_Logo]");
            cmd.Parameters.AddWithValue("@Cateid", categoryId);
            cmd.Parameters.AddWithValue("@PROD_CD", prod_cd);
            cmd.Parameters.AddWithValue("@param", param);
            DBConnection db = new DBConnection();
            var catlist = db.CommandWithPara(cmd, eOperation.Select.ToString());
            if (catlist.Tables[0].Rows[0]["SMALLPIC"].ToString() != "")
            {
                category.MEDIUMPIC = "../Pic/" + catlist.Tables[0].Rows[0]["MEDIUMPIC"].ToString();
                category.SMALLPIC = "../Pic/" + catlist.Tables[0].Rows[0]["SMALLPIC"].ToString();
                category.CATEGORYNAME = catlist.Tables[0].Rows[0]["CATEGORYNAME"].ToString();
                category.CATEGORYID = Convert.ToInt16(catlist.Tables[0].Rows[0]["CATEGORYID"]);

            }
            else
            {
                category = null;
            }
            return category;
        }
        #endregion
        //-----------NISHA PATEL Page-Productlist----------------------------------------------------
        #region ProductList
        public List<Product> GetProductList(Product p, string param)
        {
            try
            {
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();

                cmd.CommandText = "SP_COTS_GetProductByCategory";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CATEGORYID", p.CATEGORYID);
                cmd.Parameters.AddWithValue("@param", param);
                dsProductList = db.GetDataSet(cmd);
                productList = new List<Product>();
                if (dsProductList.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsProductList.Tables[0].Rows)
                    {
                        Product PL = new Product();
                        PL.PROD_CD = dr[0] == DBNull.Value ? "" : Convert.ToString(dr[0]);
                        PL.SMALLPIC = dr[15] == DBNull.Value ? "" : Convert.ToString(dr[15]);
                        PL.RETAIL_PRS = dr["RETAIL_PRS"] == DBNull.Value ? 0.0 : Convert.ToDouble(dr["RETAIL_PRS"]);
                        PL.WHOLE_PRS = dr["WHOLE_PRS"] == DBNull.Value ? 0.0 : Convert.ToDouble(dr["WHOLE_PRS"]);
                        //PL.FinalPrice = dr["FinalPrice"] == DBNull.Value ? 0.0 : Convert.ToDouble(dr["FinalPrice"]);
                        //PL.RETAIL_PRS = SessionVariable.customerType == (int)custtype.WholeSaler ? (dr["WHOLE_PRS"]) == null ? 0.0 : Convert.ToDouble(dr["WHOLE_PRS"]) : dr["RETAIL_PRS"] == null ? 0.0 : Convert.ToDouble(dr["RETAIL_PRS"]);
                        productList.Add(PL);
                    }
                }
            }
            catch (Exception ex)
            {
                return null;
            }
            return productList;
        }
        #endregion
        //-----------NISHA PATEL Page-Productlist----------------------------------------------------
        #region ProductListByPrice
        public List<Product> GetProductListByPrice(int catid, int minprice, int maxprice)
        {
            try
            {
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SP_COTS_GetProductByCategoryPrice";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CATEGORYID", catid);
                cmd.Parameters.AddWithValue("@minprice", minprice);
                cmd.Parameters.AddWithValue("@maxprice", maxprice);
                dsProductList = db.GetDataSet(cmd);
                productList = new List<Product>();
                if (dsProductList.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsProductList.Tables[0].Rows)
                    {
                        Product PL = new Product();
                        PL.PROD_CD = dr[0] == DBNull.Value ? "" : Convert.ToString(dr[0]);
                        PL.SMALLPIC = dr[15] == DBNull.Value ? "" : Convert.ToString(dr[15]);
                        PL.RETAIL_PRS = dr["RETAIL_PRS"] == DBNull.Value ? 0.0 : Convert.ToDouble(dr["RETAIL_PRS"]);
                        PL.WHOLE_PRS = dr["WHOLE_PRS"] == DBNull.Value ? 0.0 : Convert.ToDouble(dr["WHOLE_PRS"]);
                        //PL.FinalPrice = dr["FinalPrice"] == DBNull.Value ? 0.0 : Convert.ToDouble(dr["FinalPrice"]);
                        //PL.RETAIL_PRS = SessionVariable.customerType == (int)custtype.WholeSaler ? (dr["WHOLE_PRS"]) == null ? 0.0 : Convert.ToDouble(dr["WHOLE_PRS"]) : dr["RETAIL_PRS"] == null ? 0.0 : Convert.ToDouble(dr["RETAIL_PRS"]);
                        productList.Add(PL);
                    }
                }
            }
            catch (Exception ex)
            {
                return null;
            }
            return productList;
        }
        #endregion
        //-----------NISHA PATEL Page-Productlist----------------------------------------------------
        #region Product Search from Dropdownlist
        public List<Product> GetSearchProductlist(int CatId, int SearchValue = 1, int param = 1, int pagenumber = 1, int PageSize = 10, string SearchParam = "", decimal minPrice = 0, decimal maxPrice = 1000)
        {
            try
            {
                TotalRow(CatId, param, minPrice, maxPrice, SearchParam);
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SP_COTS_GetSelectedSearchProduct";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CATEGORYID", (CatId).ToString());
                cmd.Parameters.AddWithValue("@sort", SearchValue);
                cmd.Parameters.AddWithValue("@param", param);
                cmd.Parameters.AddWithValue("@PageNumber", pagenumber);
                cmd.Parameters.AddWithValue("@PageSize", PageSize);
                cmd.Parameters.AddWithValue("@minprice", minPrice);
                cmd.Parameters.AddWithValue("@maxprice", maxPrice);
                cmd.Parameters.AddWithValue("@search", SearchParam);
                cmd.Parameters.AddWithValue("@custype", SessionVariable.customerType);
                dsProCat = db.GetDataSet(cmd);
                Prosearchlist = new List<Product>();
                if (dsProCat.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsProCat.Tables[0].Rows)
                    {
                        Product PL = new Product();
                        PL.PROD_CD = dr[0] == DBNull.Value ? "" : Convert.ToString(dr[0]);
                        PL.SMALLPIC = dr[15] == DBNull.Value ? "" : Convert.ToString(dr[15]);
                        PL.RETAIL_PRS = dr["RETAIL_PRS"] == DBNull.Value ? 0.0 : Convert.ToDouble(dr["RETAIL_PRS"]);
                        PL.WHOLE_PRS = dr["WHOLE_PRS"] == DBNull.Value ? 0.0 : Convert.ToDouble(dr["WHOLE_PRS"]);//SessionVariable.customerType == (int)custtype.WholeSaler ? (dr["WHOLE_PRS"]) == null ? 0.0 : Convert.ToDouble(dr["WHOLE_PRS"]) : dr["RETAIL_PRS"] == null ? 0.0 : Convert.ToDouble(dr["RETAIL_PRS"]);
                        PL.MEDIUMPIC = dr["MediumPic"] == DBNull.Value ? "" : Convert.ToString(dr["MediumPic"]);
                        PL.LARGEPIC = dr["LargePic"] == DBNull.Value ? "" : Convert.ToString(dr["LargePic"]);
                        PL.MINSTOCK = dr["CurrentStock"] == DBNull.Value ? "" : Convert.ToString(dr["CurrentStock"]);
                        //PL.FinalPrice = dr["FinalPrice"] == DBNull.Value ? 0.0 : Convert.ToDouble(dr["FinalPrice"]);
                        //if (SessionVariable.customerType == (int)custtype.WholeSaler)
                        //{
                        //    PL.RETAIL_PRS = dr["WHOLE_PRS"] == null ? 0.0 : Convert.ToDouble(dr["WHOLE_PRS"]);
                        //
                        //}
                        //else
                        //{
                        //    PL.RETAIL_PRS = dr["RETAIL_PRS"] == null ? 0.0 : Convert.ToDouble(dr["RETAIL_PRS"]);
                        //
                        //}
                        //HttpContext.Current.Session["TotalRows"] = dsProCat.Tables[1].Rows[0]["COUNT"];
                        //var totalRow = HttpContext.Current.Session["TotalRows"].ToString();

                        //var path = 
                        //var picpath = File.Exists(path) ? PL.LARGEPIC : "/assets/images /logo - up1.png";
                        Prosearchlist.Add(PL);

                    }
                }
            }
            catch (Exception ex)
            {
                return null;
            }
            return Prosearchlist;
        }
        #endregion
        //-----------NISHA PATEL Page-Productlist----------------------------------------------------
        #region product Category
        public List<CategoryList> GetProductCategory(int catid=0)
        {
            dsProCat = new DataSet();

            SqlCommand cmd = new SqlCommand("SP_COTS_Get_Product_Category");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Cateid", catid);
            DBConnection db = new DBConnection();
            dsProCat = db.GetDataSet(cmd);
            ProCatList = new List<CategoryList>();
            if (dsProCat.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in dsProCat.Tables[0].Rows)
                {
                    CategoryList cl = new CategoryList();
                    cl.CATEGORYNAME = dr["CATEGORYNAME"] == DBNull.Value ? "" : Convert.ToString(dr["CATEGORYNAME"]);
                    cl.CATEGORYID = Convert.ToInt32(dr["CATEGORYID"]);
                    ProCatList.Add(cl);
                }
            }
            // HttpContext.Current.Session["TotalRows"] = dsProCat.Tables[1].Rows[0]["COUNT"];
            return ProCatList;
        }
        #endregion
        //-----------NISHA PATEL Page-order history----------------------------------------------------
        #region Order detail
        public List<OrderDetail> GetOrderDetail(string Cus_Id)
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            DataSet dsOrder = new DataSet();
            cmd.CommandText = "SP_COTS_webOrderHistory";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Cus_Id", Cus_Id);
            dsOrder = db.GetDataSet(cmd);
            OrderDetail = new List<OrderDetail>();
            foreach (DataRow dr in dsOrder.Tables[0].Rows)
            {
                //OrderDetail od = new OrderDetail();
                //od.Cus_Id = dr["CUS_ID"].ToString();
                //od.PROD_CD = dr["PROD_CD"] == DBNull.Value ? "" : Convert.ToString(dr["PROD_CD"]);
                //od.ORD_NUM = dr["ORD_NUM"] == DBNull.Value ? "" : Convert.ToString(dr["ORD_NUM"]);
                //od.ORDER_QTY = dr["ORDER_QTY"] == DBNull.Value ? "" : Convert.ToString(dr["ORDER_QTY"]);
                ////od.SmallPic = dr["SmallPic"] == DBNull.Value ? "" : Convert.ToString(dr["SmallPic"]);
                //od.UNIT_PRS = dr["UNIT_PRS"] == DBNull.Value ? "" : Convert.ToString(dr["UNIT_PRS"]);
                //od.ORD_DT = dr["ORD_DT"] == DBNull.Value ? "" : Convert.ToString(dr["ORD_DT"]);
                //// od.ORD_AMT = dr["UNIT_PRS"] == DBNull.Value ? "" : Convert.ToString(dr["UNIT_PRS"]);
                //od.ORD_AMT = Convert.ToString((Convert.ToInt32(dr["UNIT_PRS"])) * (Convert.ToInt32(dr["ORDER_QTY"])));
                //OrderDetail.Add(od);
            }
            return OrderDetail;

        }
        #endregion

        //---nisha PAtel Create Default Shipping Address-------------------------------------
        #region Default Shippingaddress
        public string Default_ShippingAddress_CardAddress(string CustInfoID, string CustaddId = "", string CustPaymentProfId = "", int param = 0)
        {
            string Updateid = "";
            try
            {

                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();
                DataSet ds = new DataSet();
                cmd.CommandText = "SP_COTS_Default_CreditCard_ShippingAddress";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CustaddId", CustaddId);
                cmd.Parameters.AddWithValue("@CustInfoID", CustInfoID);
                cmd.Parameters.AddWithValue("@CustPaymentProfId", CustPaymentProfId);
                cmd.Parameters.AddWithValue("@param", param);
                db.executenonquery(cmd);
                ds = db.GetDataSet(cmd);
                if (CustPaymentProfId != "")
                {
                    Updateid = ds.Tables[0].Rows[0]["CustPaymentProfId"].ToString();
                }
                else if (CustaddId != "")
                {
                    Updateid = ds.Tables[0].Rows[0]["CustaddId"].ToString();
                }
                else
                {
                    Updateid = "";
                }

            }
            catch (Exception ex)
            {
            }
            return (Updateid);
        }
        #endregion

        //------------- harikrishna --------------------------------------------------------------
        #region Cart
        public List<Product> Cart(DataTable Cart)
        {
            DataTable dt = new DataTable();
            ProductList = new List<Product>();
            foreach (DataRow drow in Cart.Rows)
            {
                //  string command = "SELECT * FROM WEBINV WHERE PROD_CD='" + drow["Prod_cd"].ToString()+ "'";
                SqlCommand cmd = new SqlCommand("[dbo].[SP_COTS_GetProductDetail]");
                cmd.Parameters.AddWithValue("@PROD_CD", drow["Prod_cd"].ToString());
                DBConnection db = new DBConnection();
                dsProductList = db.CommandWithPara(cmd, eOperation.Select.ToString());
                //ProductList = new List<Product>();
                if (dsProductList.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsProductList.Tables[0].Rows)
                    {
                        Product pr = new Product();
                        pr.PROD_CD = dr["PROD_CD"] == DBNull.Value ? "" : Convert.ToString(dr["PROD_CD"]);
                        pr.PRICEDISPLAYCUSTOMER = dr["PRICEDISPLAYCUSTOMER"] == DBNull.Value ? 0 : Convert.ToInt32(dr["PRICEDISPLAYCUSTOMER"]);
                        pr.FIRSTSTATUSID = dr["FIRSTSTATUSID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["FIRSTSTATUSID"]);
                        pr.MEDIUMPIC = dr["MEDIUMPIC"] == DBNull.Value || dr["MEDIUMPIC"].ToString() == "" ? "nopicture.gif" : Convert.ToString(dr["MEDIUMPIC"]);
                        pr.LARGEPIC = dr["LARGEPIC"] == DBNull.Value ? "" : Convert.ToString(dr["LARGEPIC"]);
                        pr.ACTIVE = dr["ACTIVE"] == DBNull.Value ? 0 : Convert.ToInt32(dr["ACTIVE"]);
                        pr.BRANDID = dr["BRANDID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["BRANDID"]);
                        pr.SMALLPIC = dr["SMALLPIC"] == DBNull.Value ? "nopicture.gif" : Convert.ToString(dr["SMALLPIC"]);
                        pr.SECONDSTATUSID = dr["SECONDSTATUSID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["SECONDSTATUSID"]);
                        pr.ISSPECIAL = dr["ISSPECIAL"] == DBNull.Value ? 0 : Convert.ToInt32(dr["ISSPECIAL"]);
                        pr.DESCRIP = dr["DESCRIP"] == null ? "" : Convert.ToString(dr["DESCRIP"]);
                        pr.DESCRIP1 = dr["DESCRIP1"] == null ? "" : Convert.ToString(dr["DESCRIP1"]);
                        pr.DESCRIP2 = dr["DESCRIP2"] == null ? "" : Convert.ToString(dr["DESCRIP2"]);
                        pr.RETAIL_PRS = dr["RETAIL_PRS"] == null ? 0.0 : Convert.ToDouble(Convert.ToDecimal(dr["RETAIL_PRS"]).ToString("0.00"));//SessionVariable.customerType == (int)custtype.WholeSaler ?( (dr["WHOLE_PRS"] == null ? 0.0 : Convert.ToDouble(dr["WHOLE_PRS"])) ): (dr["RETAIL_PRS"] == null ? 0.0 : Convert.ToDouble(dr["RETAIL_PRS"]));//
                        pr.WHOLE_PRS = dr["WHOLE_PRS"] == null ? 0.0 : Convert.ToDouble(Convert.ToDecimal(dr["WHOLE_PRS"]).ToString("0.00"));
                        pr.WHOLE_PRS2 = dr["WHOLE_PRS2"] == null ? "" : Convert.ToString(Convert.ToDecimal(dr["WHOLE_PRS2"]).ToString("0.00"));
                        pr.WHOLE_PRS3 = dr["WHOLE_PRS3"] == null ? "" : Convert.ToString(Convert.ToDecimal(dr["WHOLE_PRS2"]).ToString("0.00"));
                        pr.MINSTOCK = dr["CurrentStock"] == null ? "" : Convert.ToString(dr["CurrentStock"]);
                        pr.LARGEPIC = dr["LARGEPIC"] == null ? "" : Convert.ToString(dr["LARGEPIC"]);
                        pr.SMALLPIC = dr["SMALLPIC"] == null ? "" : Convert.ToString(dr["SMALLPIC"]);
                        if (SessionVariable.IsSpecial != 0)
                        {
                            var x = finalPrice(pr.PROD_CD);
                            pr.FinalPrice = x.FinalPrice;//DBNull.Value ? 0.0 : Convert.ToDouble(dr["FinalPrice"]);
                        }
                        pr.QTYinCart = Convert.ToInt32(drow["QTY"]);
                        ProductList.Add(pr);
                    }
                }

            }
            return ProductList;
        }
        #endregion
        //------------- harikrishna --------------------------------------------------------------
        #region ExampleFor SP with parameter
        public void insert(Product pr)
        {
            SqlCommand cmd = new SqlCommand("SP_Name");
            cmd.Parameters.AddWithValue("para1", pr.BACKORDERCUSTOMER);
            cmd.Parameters.AddWithValue("para2", pr.BACKORDERCUSTOMER);
            cmd.Parameters.AddWithValue("para3", pr.BACKORDERCUSTOMER);
            cmd.Parameters.AddWithValue("para4", pr.BACKORDERCUSTOMER);
            cmd.Parameters.AddWithValue("para6", pr.BACKORDERCUSTOMER);
            DBConnection db = new DBConnection();
            db.CommandWithPara(cmd, "insert");

        }
        #endregion

        #region GET AUTHORIZ.NET CUstomer profile ID
        public string GETCustomerINFO(string cust_id, string transactionID = "", string CustomerAddress = "", string customerInformation = "", int OrderID = 0, int param = -1)
        {
            string customerProfileID = "";
            try
            {
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();

                cmd.CommandText = "[SP_COTS_CustomerInformation]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CUS_ID", cust_id);
                cmd.Parameters.AddWithValue("@CustInfoID", customerInformation);
                cmd.Parameters.AddWithValue("@TransactionID", transactionID);
                cmd.Parameters.AddWithValue("@ORD_ID", OrderID);
                cmd.Parameters.AddWithValue("@CustaddId", CustomerAddress);
                cmd.Parameters.AddWithValue("@param", param);
                dsProductList = db.GetDataSet(cmd);
                productList = new List<Product>();
                if (dsProductList.Tables[0].Rows.Count > 0)
                {
                    customerProfileID = dsProductList.Tables[0].Rows[0]["CustInfoID"].ToString();
                    SessionVariable.CusAuthoAddId = Convert.ToInt64(dsProductList.Tables[0].Rows[0]["CustAddID"].ToString() != "" ? dsProductList.Tables[0].Rows[0]["CustAddID"].ToString() : "0");
                }
                //return customerProfileID;
            }
            catch (Exception ex)
            {
                return null;
            }
            return customerProfileID;
        }
        #endregion
        //------------- harikrishna --------------------------------------------------------------
        #region GET PRODUCT DETAIL BY CATEGORY ID
        public List<Product> GetProductByCategory(int categoryId)
        {

            SqlCommand cmd = new SqlCommand("[dbo].[SP_COTS_GetProductByCategory]");
            cmd.Parameters.AddWithValue("@CATEGORYID", categoryId);

            DBConnection db = new DBConnection();
            var prlist = db.CommandWithPara(cmd, eOperation.Select.ToString());

            return ProductListByCategory;
        }
        #endregion
        //------------- harikrishna --------------------------------------------------------------
        #region GEt Related Product
        public List<Product> RelatedProduct(string ProductCode)
        {
            try
            {
                // string command = "SELECT TOP 3 * FROM WEBINV WHERE BRANDID=" + brandId;
                SqlCommand cmd = new SqlCommand("[dbo].[SP_COTS_GetRealatedProductByProductID]");
                cmd.Parameters.AddWithValue("@PROD_CD", ProductCode);
                cmd.CommandType = CommandType.StoredProcedure;
                DBConnection db = new DBConnection();
                dsProductList = db.CommandWithPara(cmd, eOperation.Select.ToString());
                if (dsProductList.Tables[0].Rows.Count > 0)
                {
                    RelatedProd = new List<Product>();
                    foreach (DataRow dr in dsProductList.Tables[0].Rows)
                    {
                        Product pr = new Product();
                        //pr.PROD_CD= dr["PROD_CD"] == DBNull.Value ? "": Convert.ToString(dr["PROD_CD"]);
                        //pr.PRICEDISPLAYCUSTOMER = dr["PRICEDISPLAYCUSTOMER"] == DBNull.Value ? 0 : Convert.ToInt32(dr["PRICEDISPLAYCUSTOMER"]);
                        //pr.FIRSTSTATUSID = dr["FIRSTSTATUSID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["FIRSTSTATUSID"]);
                        //pr.MEDIUMPIC = dr["MEDIUMPIC"] == DBNull.Value || dr["MEDIUMPIC"].ToString() == "nopicture.gif" ? "nopicture.gif" : Convert.ToString(dr["MEDIUMPIC"]);
                        //pr.ACTIVE = dr["ACTIVE"] == DBNull.Value ? 0 : Convert.ToInt32(dr["ACTIVE"]);
                        //pr.BRANDID = dr["BRANDID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["BRANDID"]);
                        //pr.SMALLPIC = dr["SMALLPIC"] == DBNull.Value ? "nopicture.gif" : Convert.ToString(dr["SMALLPIC"]);
                        //pr.SECONDSTATUSID = dr["SECONDSTATUSID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["SECONDSTATUSID"]);
                        //pr.ISSPECIAL = dr["ISSPECIAL"] == DBNull.Value ? 0 : Convert.ToInt32(dr["ISSPECIAL"]);
                        pr.PROD_CD = dr["PROD_CD"] == DBNull.Value ? "" : Convert.ToString(dr["PROD_CD"]);
                        pr.PRICEDISPLAYCUSTOMER = dr["PRICEDISPLAYCUSTOMER"] == DBNull.Value ? 0 : Convert.ToInt32(dr["PRICEDISPLAYCUSTOMER"]);
                        pr.FIRSTSTATUSID = dr["FIRSTSTATUSID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["FIRSTSTATUSID"]);
                        pr.MEDIUMPIC = dr["MEDIUMPIC"] == DBNull.Value || dr["MEDIUMPIC"].ToString() == "" ? "nopicture.gif" : Convert.ToString(dr["MEDIUMPIC"]);
                        pr.LARGEPIC = dr["LARGEPIC"] == DBNull.Value || dr["MEDIUMPIC"].ToString() == "" ? "nopicture.gif" : Convert.ToString(dr["LARGEPIC"]);
                        pr.ACTIVE = dr["ACTIVE"] == DBNull.Value ? 0 : Convert.ToInt32(dr["ACTIVE"]);
                        pr.BRANDID = dr["BRANDID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["BRANDID"]);
                        pr.SMALLPIC = dr["SMALLPIC"] == DBNull.Value ? "nopicture.gif" : Convert.ToString(dr["SMALLPIC"]);
                        pr.SECONDSTATUSID = dr["SECONDSTATUSID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["SECONDSTATUSID"]);
                        pr.ISSPECIAL = dr["ISSPECIAL"] == DBNull.Value ? 0 : Convert.ToInt32(dr["ISSPECIAL"]);
                        pr.DESCRIP = dr["DESCRIP"] == null ? "" : Convert.ToString(dr["DESCRIP"]);
                        pr.DESCRIP1 = dr["DESCRIP1"] == null ? "" : Convert.ToString(dr["DESCRIP1"]);
                        pr.DESCRIP2 = dr["DESCRIP2"] == null ? "" : Convert.ToString(dr["DESCRIP2"]);
                        pr.RETAIL_PRS = dr["RETAIL_PRS"] == null ? 0.0 : Convert.ToDouble(dr["RETAIL_PRS"]);//SessionVariable.customerType == (int)custtype.WholeSaler ? (dr["WHOLE_PRS"] == null ? 0.0 : Convert.ToDouble(dr["WHOLE_PRS"])) : dr["RETAIL_PRS"] == null ? 0.0 : Convert.ToDouble(dr["RETAIL_PRS"]);//
                        pr.WHOLE_PRS = dr["WHOLE_PRS"] == null ? 0.0 : Convert.ToDouble(dr["WHOLE_PRS"]);
                        pr.WHOLE_PRS2 = dr["WHOLE_PRS2"] == null ? "" : Convert.ToString(dr["WHOLE_PRS2"]);
                        pr.WHOLE_PRS3 = dr["WHOLE_PRS3"] == null ? "" : Convert.ToString(dr["WHOLE_PRS2"]);
                        pr.MINSTOCK = dr["MINSTOCK"] == null ? "" : Convert.ToString(dr["MINSTOCK"]);
                        // pr.LARGEPIC = dr["LARGEPIC"] == null ? "" : Convert.ToString(dr["LARGEPIC"]);
                        // pr.SMALLPIC = dr["SMALLPIC"] == null ? "" : Convert.ToString(dr["SMALLPIC"]);
                        // pr.FinalPrice = dr["FinalPrice"] == DBNull.Value ? 0.0 : Convert.ToDouble(dr["FinalPrice"]);
                        RelatedProd.Add(pr);

                    }
                }
                return RelatedProd;
            }
            catch
            {
                return null;
            }
        }
        #endregion
        //------------- harikrishna --------------------------------------------------------------
        #region GET FINAL PRICE
        public Product finalPrice(string prod_cd)
        {
            try
            {

                SqlCommand cmd = new SqlCommand("[dbo].[SP_COTS_GetSpecialPrice]");
                cmd.Parameters.AddWithValue("@PROD_CD", prod_cd);
                cmd.Parameters.AddWithValue("@CUS_ID", SessionVariable.CustomerID);

                //string command = "SELECT * FROM WEBINV WHERE PROD_CD='" + productCode+"'";
                DBConnection db = new DBConnection();
                dsProductList = db.CommandWithPara(cmd, eOperation.Select.ToString());

                DataTable dt = new DataTable();
                dt = dsProductList.Tables[0];

                prdDetail = new Product();
                //prdDetail.PROD_CD = dt.Rows[0]["PROD_CD"] == null ? "" : Convert.ToString(dt.Rows[0]["PROD_CD"]);
                //prdDetail.PRICEDISPLAYCUSTOMER = dt.Rows[0]["PRICEDISPLAYCUSTOMER"] == null ? 0 : Convert.ToInt32(dt.Rows[0]["PRICEDISPLAYCUSTOMER"]);
                //prdDetail.MEDIUMPIC = dt.Rows[0]["MEDIUMPIC"] == null ? "" : Convert.ToString(dt.Rows[0]["MEDIUMPIC"]);
                //prdDetail.DESCRIP = dt.Rows[0]["DESCRIP"] == null ? "" : Convert.ToString(dt.Rows[0]["DESCRIP"]);
                //prdDetail.DESCRIP1 = dt.Rows[0]["DESCRIP1"] == null ? "" : Convert.ToString(dt.Rows[0]["DESCRIP1"]);
                //prdDetail.DESCRIP2 = dt.Rows[0]["DESCRIP2"] == null ? "" : Convert.ToString(dt.Rows[0]["DESCRIP2"]);
                //prdDetail.RETAIL_PRS = Convert.ToDouble(dt.Rows[0]["RETAIL_PRS"]);//SessionVariable.customerType == (int)custtype.WholeSaler ? (dt.Rows[0]["WHOLE_PRS"] == null ? 0.0 : Convert.ToDouble(dt.Rows[0]["WHOLE_PRS"])) : dt.Rows[0]["RETAIL_PRS"] == null ? 0.0 : Convert.ToDouble(dt.Rows[0]["RETAIL_PRS"]);
                //prdDetail.WHOLE_PRS = dt.Rows[0]["WHOLE_PRS"] == null ? 0.0 : Convert.ToDouble(dt.Rows[0]["WHOLE_PRS"]);
                //prdDetail.WHOLE_PRS2 = dt.Rows[0]["WHOLE_PRS2"] == null ? "" : Convert.ToString(dt.Rows[0]["WHOLE_PRS2"]);
                //prdDetail.WHOLE_PRS3 = dt.Rows[0]["WHOLE_PRS3"] == null ? "" : Convert.ToString(dt.Rows[0]["WHOLE_PRS2"]);
                //prdDetail.MINSTOCK = dt.Rows[0]["MINSTOCK"] == null ? "" : Convert.ToString(dt.Rows[0]["MINSTOCK"]);
                //prdDetail.LARGEPIC = dt.Rows[0]["LARGEPIC"] == null ? "" : Convert.ToString(dt.Rows[0]["LARGEPIC"]);
                //prdDetail.SMALLPIC = dt.Rows[0]["SMALLPIC"] == null ? "" : Convert.ToString(dt.Rows[0]["SMALLPIC"]);
                //prdDetail.EXTRAPIC = dt.Rows[0]["EXTRAPIC"] == null ? "" : Convert.ToString(dt.Rows[0]["EXTRAPIC"]);
                ////prdDetail.CATEGORYNAME = dt.Rows[0]["CATEGORYNAME"] == null ? "" : Convert.ToString(dt.Rows[0]["CATEGORYNAME"]);
                ////prdDetail.CATEGORYID = dt.Rows[0]["CATEGORYID"] == null ? "" : Convert.ToString(dt.Rows[0]["CATEGORYID"]);
                //prdDetail.DetailDescription = dt.Rows[0]["DetailDescription"] == null ? "" : Convert.ToString(dt.Rows[0]["DetailDescription"]);
                //prdDetail.unit_size = dt.Rows[0]["unit_size"] == null ? "" : Convert.ToString(dt.Rows[0]["unit_size"]);
                //prdDetail.DetailDescription = prdDetail.DetailDescription != "" ? prdDetail.DetailDescription.Replace("Weight:", "-") : prdDetail.DetailDescription;
                //prdDetail.catPic= dt.Rows[0]["catPic"] == null ? "" : Convert.ToString(dt.Rows[0]["catPic"]);
                prdDetail.FinalPrice = dt.Rows[0]["FinalPrice"] == null ? 0.0 : Convert.ToDouble(dt.Rows[0]["FinalPrice"]); //dr["FinalPrice"] == DBNull.Value ? 0.0 : Convert.ToDouble(dr["FinalPrice"]);
                //prdDetail.extraPic = ExtraImages;

                return prdDetail;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion

        #region Product Detail
        /// <summary>
        /// Get One product detail
        /// <date>21-09-2016</date>
        /// <developer>Harikrishna Parmar</developer>
        /// </summary>
        /// <param name="productCode"></param>
        /// <returns></returns>
        public Product GetProductDetail(string productCode)
        {
            try
            {

                SqlCommand cmd = new SqlCommand("[dbo].[SP_COTS_GetProductDetail]");
                cmd.Parameters.AddWithValue("@PROD_CD", productCode);
                
                DBConnection db = new DBConnection();
                dsProductList = db.CommandWithPara(cmd, eOperation.Select.ToString());
                DataTable extraImageTable = new DataTable();
                extraImageTable = dsProductList.Tables[1];
                ExtraImages = new List<ExtraPic>();
                foreach (DataRow edt in extraImageTable.Rows)
                {
                    ePic = new ExtraPic();
                    ePic.LargePic = edt["LARGEPIC"] == null ? "" : Convert.ToString(edt["LARGEPIC"]);
                    ePic.smallPic = edt["SMALLPIC"] == null ? "" : Convert.ToString(edt["SMALLPIC"]);
                    ePic.midPic = edt["MEDIUMPIC"] == null ? "" : Convert.ToString(edt["MEDIUMPIC"]);
                    ePic.XlargePic = edt["EXTRAPIC"] == null ? "" : Convert.ToString(edt["EXTRAPIC"]);
                    ExtraImages.Add(ePic);

                }
                DataTable dt = new DataTable();
                dt = dsProductList.Tables[0];

                prdDetail = new Product();
                prdDetail.PROD_CD = dt.Rows[0]["PROD_CD"] == null ? "" : Convert.ToString(dt.Rows[0]["PROD_CD"]);
                prdDetail.PRICEDISPLAYCUSTOMER = dt.Rows[0]["PRICEDISPLAYCUSTOMER"] == null ? 0 : Convert.ToInt32(dt.Rows[0]["PRICEDISPLAYCUSTOMER"]);
                prdDetail.MEDIUMPIC = dt.Rows[0]["MEDIUMPIC"] == null ? "" : Convert.ToString(dt.Rows[0]["MEDIUMPIC"]);
                prdDetail.DESCRIP = dt.Rows[0]["DESCRIP"] == null ? "" : Convert.ToString(dt.Rows[0]["DESCRIP"]);
                prdDetail.DESCRIP1 = dt.Rows[0]["DESCRIP1"] == null ? "" : Convert.ToString(dt.Rows[0]["DESCRIP1"]);
                prdDetail.DESCRIP2 = dt.Rows[0]["DESCRIP2"] == null ? "" : Convert.ToString(dt.Rows[0]["DESCRIP2"]);
                prdDetail.RETAIL_PRS = Convert.ToDouble(dt.Rows[0]["RETAIL_PRS"]);//SessionVariable.customerType == (int)custtype.WholeSaler ? (dt.Rows[0]["WHOLE_PRS"] == null ? 0.0 : Convert.ToDouble(dt.Rows[0]["WHOLE_PRS"])) : dt.Rows[0]["RETAIL_PRS"] == null ? 0.0 : Convert.ToDouble(dt.Rows[0]["RETAIL_PRS"]);
                prdDetail.WHOLE_PRS = dt.Rows[0]["WHOLE_PRS"] == null ? 0.0 : Convert.ToDouble(dt.Rows[0]["WHOLE_PRS"]);
                prdDetail.WHOLE_PRS2 = dt.Rows[0]["WHOLE_PRS2"] == null ? "" : Convert.ToString(dt.Rows[0]["WHOLE_PRS2"]);
                prdDetail.WHOLE_PRS3 = dt.Rows[0]["WHOLE_PRS3"] == null ? "" : Convert.ToString(dt.Rows[0]["WHOLE_PRS2"]);
                prdDetail.MINSTOCK = dt.Rows[0]["CurrentStock"] == null ? "" : Convert.ToString(dt.Rows[0]["CurrentStock"]);
                prdDetail.LARGEPIC = dt.Rows[0]["LARGEPIC"] == null ? "" : Convert.ToString(dt.Rows[0]["LARGEPIC"]);
                prdDetail.SMALLPIC = dt.Rows[0]["SMALLPIC"] == null ? "" : Convert.ToString(dt.Rows[0]["SMALLPIC"]);
                prdDetail.EXTRAPIC = dt.Rows[0]["EXTRAPIC"] == null ? "" : Convert.ToString(dt.Rows[0]["EXTRAPIC"]);
                //prdDetail.CATEGORYNAME = dt.Rows[0]["CATEGORYNAME"] == null ? "" : Convert.ToString(dt.Rows[0]["CATEGORYNAME"]);
                //prdDetail.CATEGORYID = dt.Rows[0]["CATEGORYID"] == null ? "" : Convert.ToString(dt.Rows[0]["CATEGORYID"]);
                prdDetail.DetailDescription = dt.Rows[0]["DetailDescription"] == null ? "" : Convert.ToString(dt.Rows[0]["DetailDescription"]);
                prdDetail.unit_size = dt.Rows[0]["unit_size"] == null ? "" : Convert.ToString(dt.Rows[0]["unit_size"]);
                prdDetail.DetailDescription = prdDetail.DetailDescription != "" ? prdDetail.DetailDescription.Replace("Weight:", "-") : prdDetail.DetailDescription;
                //prdDetail.catPic= dt.Rows[0]["catPic"] == null ? "" : Convert.ToString(dt.Rows[0]["catPic"]);
                //prdDetail.FinalPrice = dt.Rows[0]["FinalPrice"] == null ? 0.0 : Convert.ToDouble(dt.Rows[0]["FinalPrice"]); //dr["FinalPrice"] == DBNull.Value ? 0.0 : Convert.ToDouble(dr["FinalPrice"]);
                prdDetail.extraPic = ExtraImages;

                return prdDetail;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion
        //------------- harikrishna --------------------------------------------------------------
        #region Get Product List
        public List<Product> TopProductList()
        {
            try
            {
                DBConnection db = new DBConnection();
                string command = "SELECT TOP 10 * FROM WEBINV WHERE ACTIVE=1 AND SECONDSTATUSID=1 AND FIRSTSTATUSID=1";
                dsProductList = db.command(command);
                ProductList = new List<Product>();
                if (dsProductList.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsProductList.Tables[0].Rows)
                    {
                        Product pr = new Product();
                        pr.PROD_CD = dr["PROD_CD"] == DBNull.Value ? "" : Convert.ToString(dr["PROD_CD"]);
                        pr.PRICEDISPLAYCUSTOMER = dr["PRICEDISPLAYCUSTOMER"] == DBNull.Value ? 0 : Convert.ToInt32(dr["PRICEDISPLAYCUSTOMER"]);
                        pr.FIRSTSTATUSID = dr["FIRSTSTATUSID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["FIRSTSTATUSID"]);
                        pr.MEDIUMPIC = dr["MEDIUMPIC"] == DBNull.Value || dr["MEDIUMPIC"].ToString() == "" ? "nopicture.gif" : Convert.ToString(dr["MEDIUMPIC"]);
                        pr.LARGEPIC = dr["LARGEPIC"] == DBNull.Value ? "" : Convert.ToString(dr["LARGEPIC"]);
                        pr.ACTIVE = dr["ACTIVE"] == DBNull.Value ? 0 : Convert.ToInt32(dr["ACTIVE"]);
                        pr.BRANDID = dr["BRANDID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["BRANDID"]);
                        pr.SMALLPIC = dr["SMALLPIC"] == DBNull.Value ? "" : Convert.ToString(dr["SMALLPIC"]);
                        pr.SECONDSTATUSID = dr["SECONDSTATUSID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["SECONDSTATUSID"]);
                        pr.ISSPECIAL = dr["ISSPECIAL"] == DBNull.Value ? 0 : Convert.ToInt32(dr["ISSPECIAL"]);
                        ProductList.Add(pr);
                    }
                }
                return ProductList;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {

            }
        }
        #endregion
        //------------- harikrishna --------------------------------------------------------------
        #region Get Brand List
        public List<Category> BrandList()
        {
            try
            {

                //DBConnection db = new DBConnection();
                //SqlCommand command = new SqlCommand("[SP_COTS_GetTopProductANDBrand]");
                //dsBrandList = db.CommandWithPara(command, eOperation.Select.ToString());
                #region BrandList
                //Brand = dbUtl.BrandList();
                DataTable dsBrandList = (DataTable)HttpContext.Current.Session["BrandTable"];
                dsProductList = GetDataset(0);
                brandList = new List<Category>();
                if (dsProductList.Tables[2].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsProductList.Tables[2].Rows)
                    {
                        Category cat = new Category();

                        cat.CATEGORYID = Convert.ToInt32(dr["CATEGORYID"]);
                        cat.PARENTID = Convert.ToInt32(dr["PARENTID"]);
                        cat.SEQUENCE = Convert.ToInt32(dr["SEQUENCE"]);
                        //cat.CATEGORYNAME = Convert.ToString(dr["CATEGORYNAME"]);
                        cat.SMALLPIC = Convert.ToString(dr["SMALLPIC"]) == "" ? "nopicture.gif" : Convert.ToString(dr["SMALLPIC"]);
                        cat.MEDIUMPIC = Convert.ToString(dr["MEDIUMPIC"]) == "" ? "nopicture.gif" : Convert.ToString(dr["MEDIUMPIC"]);
                        cat.LARGEPIC = Convert.ToString(dr["LARGEPIC"]) == "" ? "nopicture.gif" : Convert.ToString(dr["LARGEPIC"]);
                        cat.CATEGORYCOLOR = Convert.ToString(dr["CATEGORYCOLOR"]);
                        cat.ITEMPAGESIZE = Convert.ToInt32(dr["ITEMPAGESIZE"]);
                        cat.ITEMPAGECOLUMN = Convert.ToInt32(dr["ITEMPAGECOLUMN"]);
                        cat.ITEMPICWIDTH = Convert.ToInt32(dr["ITEMPICWIDTH"]);
                        cat.ITEMPICHEIGHT = Convert.ToInt32(dr["ITEMPICHEIGHT"]);
                        cat.ACTIVE = Convert.ToInt32(dr["ACTIVE"]);
                        cat.ISSPECIAL = Convert.ToInt32(dr["ISSPECIAL"]);
                        cat.ROOTID = Convert.ToInt32(dr["ROOTID"]);
                        cat.FIRSTSTATUSNAME = Convert.ToString(dr["FIRSTSTATUSNAME"]);
                        cat.SECONDSTATUSNAME = Convert.ToString(dr["SECONDSTATUSNAME"]);
                        brandList.Add(cat);
                    }
                }
                #endregion


                return brandList;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {

            }
        }
        #endregion
        //------------- harikrishna --------------------------------------------------------------

        #region GET DataSet For BestSeller/New PRoduct/Brand
        public DataSet GetDataset(int? CategoryID)
        {
            dsProductList = (DataSet)CacheHelper.getCacheManager().Get("TopProductDataSet" + CategoryID);
            if (dsProductList == null)
            {
                DBConnection db = new DBConnection();
                SqlCommand command = new SqlCommand("[SP_COTS_GetTopProductANDBrand]");
                command.Parameters.AddWithValue("@CategoryID", CategoryID);
                dsProductList = db.CommandWithPara(command, eOperation.Select.ToString());
                CacheHelper.getCacheManager().Add("TopProductDataSet" + CategoryID, dsProductList);
            }

            return dsProductList;
        }
        #endregion

        #region Get Top First Product List
        public List<Product> TopProductFirstList(int? CategoryID = 0)
        {
            try
            {
                //System.Diagnostics.Debug.Write("TopProductFirstList : before db connection :" + DateTime.Now);
                //DBConnection db = new DBConnection();
                //System.Diagnostics.Debug.Write("TopProductFirstList : after db connection :" + DateTime.Now);

                //DBConnection db = new DBConnection();
                //SqlCommand command = new SqlCommand("[SP_COTS_GetTopProductANDBrand]");


                ////command.CommandType = CommandType.StoredProcedure;
                //command.Parameters.AddWithValue("@CategoryID", CategoryID);
                //dsProductList = db.CommandWithPara(command, eOperation.Select.ToString());
                dsProductList = GetDataset(CategoryID);
                //HttpContext.Current.Session["NewProductTable"] = dsProductList.Tables[1];
                //HttpContext.Current.Session["BrandTable"] = dsProductList.Tables[2];

                System.Diagnostics.Debug.Write("TopProductFirstList : after SP [SP_COTS_GetTopProductANDBrand] :" + DateTime.Now);
                ProductList = new List<Product>();
                if (dsProductList.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsProductList.Tables[0].Rows)
                    {
                        Product pr = new Product();
                        pr.PROD_CD = dr["PROD_CD"] == DBNull.Value ? "" : Convert.ToString(dr["PROD_CD"]);
                        pr.PRICEDISPLAYCUSTOMER = dr["PRICEDISPLAYCUSTOMER"] == DBNull.Value ? 0 : Convert.ToInt32(dr["PRICEDISPLAYCUSTOMER"]);
                        pr.FIRSTSTATUSID = dr["FIRSTSTATUSID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["FIRSTSTATUSID"]);
                        pr.MEDIUMPIC = dr["MEDIUMPIC"] == DBNull.Value || dr["MEDIUMPIC"].ToString() == "" ? "nopicture.gif" : Convert.ToString(dr["MEDIUMPIC"]);
                        pr.LARGEPIC = dr["LARGEPIC"] == DBNull.Value ? "" : Convert.ToString(dr["LARGEPIC"]);
                        pr.ACTIVE = dr["ACTIVE"] == DBNull.Value ? 0 : Convert.ToInt32(dr["ACTIVE"]);
                        pr.BRANDID = dr["BRANDID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["BRANDID"]);
                        pr.SMALLPIC = dr["SMALLPIC"] == DBNull.Value ? "nopicture.gif" : Convert.ToString(dr["SMALLPIC"]);
                        pr.SECONDSTATUSID = dr["SECONDSTATUSID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["SECONDSTATUSID"]);
                        pr.ISSPECIAL = dr["ISSPECIAL"] == DBNull.Value ? 0 : Convert.ToInt32(dr["ISSPECIAL"]);

                        pr.DESCRIP = dr["DESCRIP"] == null ? "" : Convert.ToString(dr["DESCRIP"]);
                        pr.DESCRIP1 = dr["DESCRIP1"] == null ? "" : Convert.ToString(dr["DESCRIP1"]);
                        pr.DESCRIP2 = dr["DESCRIP2"] == null ? "" : Convert.ToString(dr["DESCRIP2"]);
                        pr.RETAIL_PRS = dr["RETAIL_PRS"] == null ? 0.0 : Convert.ToDouble(dr["RETAIL_PRS"]);//SessionVariable.customerType == (int)custtype.WholeSaler ? (dr["WHOLE_PRS"] == null ? 0.0 : Convert.ToDouble(dr["WHOLE_PRS"])) : dr["RETAIL_PRS"] == null ? 0.0 : Convert.ToDouble(dr["RETAIL_PRS"]);//
                        pr.WHOLE_PRS = dr["WHOLE_PRS"] == null ? 0.0 : Convert.ToDouble(dr["WHOLE_PRS"]);
                        pr.WHOLE_PRS2 = dr["WHOLE_PRS2"] == null ? "" : Convert.ToString(dr["WHOLE_PRS2"]);
                        pr.WHOLE_PRS3 = dr["WHOLE_PRS3"] == null ? "" : Convert.ToString(dr["WHOLE_PRS2"]);
                        pr.MINSTOCK = dr["MINSTOCK"] == null ? "" : Convert.ToString(dr["MINSTOCK"]);
                        pr.LARGEPIC = dr["LARGEPIC"] == null ? "" : Convert.ToString(dr["LARGEPIC"]);
                        pr.SMALLPIC = dr["SMALLPIC"] == null ? "" : Convert.ToString(dr["SMALLPIC"]);

                        if (SessionVariable.IsSpecial != 0)
                        {
                            var x = finalPrice(pr.PROD_CD);
                            pr.FinalPrice = x.FinalPrice;//DBNull.Value ? 0.0 : Convert.ToDouble(dr["FinalPrice"]);
                        }
                        //pr.FinalPrice = dr["FinalPrice"] == DBNull.Value ? 0.0 : Convert.ToDouble(dr["FinalPrice"]);
                        ProductList.Add(pr);
                    }
                    System.Diagnostics.Debug.Write("TopProductFirstList : after List  :" + DateTime.Now);
                }




                return ProductList;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {

            }
        }
        #endregion
        //------------- harikrishna --------------------------------------------------------------
        #region Get Second Product List
        public List<Product> TopProductSectList(int? CategoryID = 0)
        {
            try
            {

                dsProductList = GetDataset(CategoryID);
                ProductList = new List<Product>();
                if (dsProductList.Tables[1].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsProductList.Tables[1].Rows)
                    {
                        Product pr = new Product();
                        pr.PROD_CD = dr["PROD_CD"] == DBNull.Value ? "" : Convert.ToString(dr["PROD_CD"]);
                        pr.PRICEDISPLAYCUSTOMER = dr["PRICEDISPLAYCUSTOMER"] == DBNull.Value ? 0 : Convert.ToInt32(dr["PRICEDISPLAYCUSTOMER"]);
                        pr.FIRSTSTATUSID = dr["FIRSTSTATUSID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["FIRSTSTATUSID"]);
                        pr.MEDIUMPIC = dr["MEDIUMPIC"] == DBNull.Value || dr["MEDIUMPIC"].ToString() == "" ? "nopicture.gif" : Convert.ToString(dr["MEDIUMPIC"]);
                        pr.LARGEPIC = dr["LARGEPIC"] == DBNull.Value ? "" : Convert.ToString(dr["LARGEPIC"]);
                        pr.ACTIVE = dr["ACTIVE"] == DBNull.Value ? 0 : Convert.ToInt32(dr["ACTIVE"]);
                        pr.BRANDID = dr["BRANDID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["BRANDID"]);
                        pr.SMALLPIC = dr["SMALLPIC"] == DBNull.Value ? "nopicture.gif" : Convert.ToString(dr["SMALLPIC"]);
                        pr.SECONDSTATUSID = dr["SECONDSTATUSID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["SECONDSTATUSID"]);
                        pr.ISSPECIAL = dr["ISSPECIAL"] == DBNull.Value ? 0 : Convert.ToInt32(dr["ISSPECIAL"]);
                        pr.DESCRIP = dr["DESCRIP"] == null ? "" : Convert.ToString(dr["DESCRIP"]);
                        pr.DESCRIP1 = dr["DESCRIP1"] == null ? "" : Convert.ToString(dr["DESCRIP1"]);
                        pr.DESCRIP2 = dr["DESCRIP2"] == null ? "" : Convert.ToString(dr["DESCRIP2"]);
                        pr.RETAIL_PRS = dr["RETAIL_PRS"] == null ? 0.0 : Convert.ToDouble(dr["RETAIL_PRS"]);//SessionVariable.customerType == (int)custtype.WholeSaler ? (dr["WHOLE_PRS"] == null ? 0.0 : Convert.ToDouble(dr["WHOLE_PRS"])) : dr["RETAIL_PRS"] == null ? 0.0 : Convert.ToDouble(dr["RETAIL_PRS"]);//
                        pr.WHOLE_PRS = dr["WHOLE_PRS"] == null ? 0.0 : Convert.ToDouble(dr["WHOLE_PRS"]);
                        pr.WHOLE_PRS2 = dr["WHOLE_PRS2"] == null ? "" : Convert.ToString(dr["WHOLE_PRS2"]);
                        pr.WHOLE_PRS3 = dr["WHOLE_PRS3"] == null ? "" : Convert.ToString(dr["WHOLE_PRS2"]);
                        pr.MINSTOCK = dr["MINSTOCK"] == null ? "" : Convert.ToString(dr["MINSTOCK"]);
                        pr.LARGEPIC = dr["LARGEPIC"] == null ? "" : Convert.ToString(dr["LARGEPIC"]);
                        pr.SMALLPIC = dr["SMALLPIC"] == null ? "" : Convert.ToString(dr["SMALLPIC"]);
                        if (SessionVariable.IsSpecial != 0)
                        {
                            var x = finalPrice(pr.PROD_CD);
                            pr.FinalPrice = x.FinalPrice;//DBNull.Value ? 0.0 : Convert.ToDouble(dr["FinalPrice"]);
                        }
                        ProductList.Add(pr);
                    }
                }
                return ProductList;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {

            }
        }
        #endregion

        #region Insert Cart in Temp Order

        #endregion

        #region PlaceOrder
        public string PlaceOrder(int OrderNumber, int TempOrderID, string PROD_CD, string UT_DESC, int ORDER_QTY, string WHS_NUM, string COMM_LN, string NT_NUM, int SHIP_DT, int OLG_DT, string PROD_COMP, int OLG_TIME, string UNIT_PRS, int param)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("[dbo].[SP_COTS_PlaceOrder]");
                cmd.Parameters.AddWithValue("@CUS_ID", SessionVariable.CustomerID);
                cmd.Parameters.AddWithValue("@OrderNumber", SessionVariable.orderID);
                cmd.Parameters.AddWithValue("@TempOrderID", TempOrderID);
                cmd.Parameters.AddWithValue("@PROD_CD", PROD_CD);
                cmd.Parameters.AddWithValue("@UT_DESC", UT_DESC);
                cmd.Parameters.AddWithValue("@ORDER_QTY", ORDER_QTY);
                cmd.Parameters.AddWithValue("@WHS_NUM", WHS_NUM);
                cmd.Parameters.AddWithValue("@COMM_LN", COMM_LN);
                cmd.Parameters.AddWithValue("@NT_NUM", NT_NUM);
                cmd.Parameters.AddWithValue("@SHIP_DT", SHIP_DT);
                cmd.Parameters.AddWithValue("@OLG_DT", OLG_DT);
                cmd.Parameters.AddWithValue("@PROD_COMP", PROD_COMP);
                cmd.Parameters.AddWithValue("@OLG_TIME", OLG_TIME);
                cmd.Parameters.AddWithValue("@UNIT_PRS", UNIT_PRS);
                cmd.Parameters.AddWithValue("@param", param);

                cmd.CommandType = CommandType.StoredProcedure;
                DBConnection db = new DBConnection();
                dsProductList = db.GetDataSet(cmd);

            }
            catch (Exception ex)
            {

            }
            return "";
        }
        #endregion

        #region Generate Order Number
        public string GenerateOrderNumber()
        {
            string OrderNumber = "0";
            try
            {
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "[proc_GenerateOrderNumber]";
                SqlParameter param = cmd.Parameters.AddWithValue("@OrderNum", (int)SqlDbType.Int);
                cmd.CommandType = CommandType.StoredProcedure;
                param.Direction = ParameterDirection.Output;
                var x = db.Command(cmd, eOperation.Insert.ToString());
                SessionVariable.orderID = Convert.ToInt32(x);
            }
            catch (Exception ex)
            {
                OrderNumber = "";
            }
            return OrderNumber;
        }
        #endregion

        #region Placed Temp Order
        public void InsertTmpOrder(string tmpID, string orderNumber, string custID, List<Product> product)
        {
            try
            {
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "[SP_COTS_PlaceOrder]";
                cmd.Parameters.AddWithValue("@OrderNumber", orderNumber);
                cmd.CommandType = CommandType.StoredProcedure;
                db.GetDataSet(cmd);
            }
            catch (Exception ex)
            {

            }

        }
        #endregion

        #region Add To Cart
        public void AddToCart(string Prod_CD, int qty = 1)
        {
            //var prodCD = hdnF_prod_cd.Value;
            //var qty = Convert.ToInt32(quantity.Text) + Convert.ToInt32(Session["Cart_Count"]);
            //Session["Cart_Count"] = qty;
            //string ProdCode = Convert.ToString(Request.QueryString["prod_cd"]);
            //SessionVariable.PROD_CD = ProdCode;
            var tempID = SessionVariable.TempOrderID;
            if (tempID == 0)
            {
                tempID = newTempOrderID(1);
                SessionVariable.TempOrderID = tempID;
            }
            //PlaceOrder();
            //PlaceOrder(0, SessionVariable.TempOrderID, item.PROD_CD, item.DESCRIP, item.QTYinCart, "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, 1);

            DataTable dt = new DataTable();
            dt.Columns.Add("Prod_cd", typeof(string));
            dt.Columns.Add("QTY", typeof(int));
            DataRow row = dt.NewRow();
            var table = SessionVariable.AddToCart;
            //var date = Convert.ToDateTime(Clarion.IntToDate + (Clarion.TodayInt - 36163));    
            if (table != null)
            {
                var rowsToUpdate = table.Select().Where(r => r.Field<string>("Prod_cd") == Prod_CD);
                if (table.Select(string.Format("[Prod_cd] = '{0}'", Prod_CD)).ToList<DataRow>().Count == 0)
                {
                    DataRow dr = table.NewRow();
                    dr["Prod_cd"] = Prod_CD;
                    dr["QTY"] = Convert.ToInt32(qty);
                    PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, Prod_CD, "", qty, "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, "0", 1);
                    table.Rows.Add(dr);
                }
                else
                {
                    table.Select(string.Format("[Prod_cd] = '{0}'", Prod_CD)).ToList<DataRow>()
                     .ForEach(r =>
                     {
                         r["Prod_cd"] = Prod_CD;
                         r["QTY"] = Convert.ToInt32(r["QTY"]) + Convert.ToInt32(qty);
                         PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, Prod_CD, "", Convert.ToInt32(r["QTY"]), "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, "0", 1);
                     });
                }

                dt = table;
            }
            else
            {
                row["Prod_cd"] = Prod_CD;
                row["QTY"] = qty;
                dt.Rows.Add(row);
                PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, Prod_CD, "", qty, "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, "0", 1);
                //qty = Convert.ToInt32(quantity.Text) + Convert.ToInt32(Session["Cart_Count"]);
                //Session["Cart_Count"] = qty;
            }

            SessionVariable.AddToCart = dt;
            //Session["Cart_Count"] = Convert.ToInt32(SessionVariable.AddToCart.Compute("SUM(QTY)", ""));
            SessionVariable.cart_Count = Convert.ToInt32(SessionVariable.AddToCart.Compute("SUM(QTY)", ""));
            var value = SessionVariable.AddToCart;

            if (SessionVariable.CustomerID != "")
            {

            }
        }
        #endregion

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
//----------------------nisha patel----------------------------------------------------
        public void AddNewssubscriber(Newssubscribe Nsb)
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SP_COTS_Insert_NewsSubscriber";
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.Parameters.AddWithValue("@Subscibe_Name", Nsb.Subscibe_Name);
                cmd.Parameters.AddWithValue("@Subscribe_Email", Nsb.Subscribe_Email);
                cmd.Parameters.AddWithValue("@Subscribe", Nsb.Subscribe);
                db.executenonquery(cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                db.connection();
            }

        }

        public int newTempOrderID(int param)
        {
            try
            {
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "[SP_COTS_webTempOrder]";
                cmd.Parameters.AddWithValue("@CUS_ID", SessionVariable.CustomerID != "" ? SessionVariable.CustomerID : "GUEST");
                cmd.Parameters.AddWithValue("@TempOrderID", SessionVariable.TempOrderID);
                cmd.Parameters.AddWithValue("@ORD_NUM", SessionVariable.orderID);
                cmd.Parameters.AddWithValue("@ORD_DT", Clarion.TodayInt);
                cmd.Parameters.AddWithValue("@SHIP_DT", Clarion.TodayInt);
                cmd.Parameters.AddWithValue("@CAN_DT", 0);
                cmd.Parameters.AddWithValue("@ORD_AMT", SessionVariable.Order_Amount);
                cmd.Parameters.AddWithValue("@param", param);
                cmd.CommandType = CommandType.StoredProcedure;
                var tmp = db.GetDataSet(cmd);

                if(param==2)
                {
                    SqlCommand cmd2 = new SqlCommand();
                    cmd2.CommandText = "[SP_COTS_Temp2Order]";
                    cmd2.Parameters.AddWithValue("@CUS_ID", SessionVariable.CustomerID != "" ? SessionVariable.CustomerID : "GUEST");
                    cmd2.Parameters.AddWithValue("@TempOrderID", SessionVariable.TempOrderID);
                    //cmd2.Parameters.AddWithValue("@ORD_NUM", SessionVariable.orderID);
                    //cmd2.Parameters.AddWithValue("@ORD_DT", Clarion.TodayInt);
                    //cmd2.Parameters.AddWithValue("@SHIP_DT", Clarion.TodayInt);
                    //cmd2.Parameters.AddWithValue("@CAN_DT", 0);
                    //cmd2.Parameters.AddWithValue("@ORD_AMT", SessionVariable.Amount);
                    //cmd2.Parameters.AddWithValue("@param", param);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    var tmp2 = db.GetDataSet(cmd2);
                    
                }
                SessionVariable.TempOrderID = Convert.ToInt32(tmp.Tables[0].Rows[0][0]);
                return Convert.ToInt32(tmp.Tables[0].Rows[0][0]);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        #region Total Products
        public int TotalRow(int CatId, int param, decimal minPrice = 1, decimal maxPrice = 1000, string search = "")
        {
            Int32 TotalRows = 0;
            try
            {
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "[SP_COTS_GetTotalRows]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CATEGORYID", CatId.ToString());
                //cmd.Parameters.AddWithValue("@sort", SearchValue);
                cmd.Parameters.AddWithValue("@param", param);
                //cmd.Parameters.AddWithValue("@PageNumber", pagenumber);
                cmd.Parameters.AddWithValue("@search", search);
                cmd.Parameters.AddWithValue("@minprice", minPrice);
                cmd.Parameters.AddWithValue("@maxprice", maxPrice);
                cmd.Parameters.AddWithValue("@custype", SessionVariable.customerType);
                dsProCat = db.GetDataSet(cmd);
                TotalRows = Convert.ToInt32(dsProCat.Tables[0].Rows[0]["COUNT"]);
                SessionVariable.TotalRows = TotalRows;
            }
            catch (Exception ex)
            {
                TotalRows = 0;
            }
            return TotalRows;
        }
        #endregion

        #region GetCart
        public void getCart()
        {
            try
            {
                if (SessionVariable.TempOrderID == 0)
                {
                    newTempOrderID(1);
                }
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "[SP_COTS_webTempOrder]";
                cmd.Parameters.AddWithValue("@CUS_ID", SessionVariable.CustomerID);
                cmd.Parameters.AddWithValue("@TempOrderID", SessionVariable.TempOrderID);
                cmd.Parameters.AddWithValue("@ORD_NUM", SessionVariable.orderID);
                cmd.Parameters.AddWithValue("@ORD_DT", Clarion.TodayInt);
                cmd.Parameters.AddWithValue("@SHIP_DT", Clarion.TodayInt);
                cmd.Parameters.AddWithValue("@CAN_DT", "");
                cmd.Parameters.AddWithValue("@ORD_AMT", SessionVariable.Order_Amount);
                cmd.Parameters.AddWithValue("@param", 0);
                cmd.CommandType = CommandType.StoredProcedure;
                var tmp = db.GetDataSet(cmd);
                var xtmp = tmp.Tables[0];
                if (SessionVariable.TempOrderID == 0)
                {
                    SessionVariable.TempOrderID = Convert.ToInt32(xtmp.Rows[0]["TempOrderId"]);
                }
                //var tempID = SessionVariable.TempOrderID;
                //if (tempID == 0)
                //{
                //    tempID = newTempOrderID(1);
                //    SessionVariable.TempOrderID = tempID;
                //}
                //PlaceOrder();
                // PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, "", "", 0, "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, "0", 0);
                if (xtmp.Rows.Count != 0)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("Prod_cd", typeof(string));
                    dt.Columns.Add("QTY", typeof(int));
                    DataRow row = dt.NewRow();
                    var table = SessionVariable.AddToCart;
                    foreach (DataRow datarow in xtmp.Rows)
                    {
                        row = dt.NewRow();
                        var Prod_CD = datarow["PROD_CD"].ToString();
                        var qty = Convert.ToInt32(datarow["ORDER_QTY"]);
                        if (table != null)
                        {
                            var rowsToUpdate = table.Select().Where(r => r.Field<string>("Prod_cd") == Prod_CD);
                            if (table.Select(string.Format("[Prod_cd] = '{0}'", Prod_CD)).ToList<DataRow>().Count == 0)
                            {
                                DataRow dr = table.NewRow();
                                dr["Prod_cd"] = Prod_CD;
                                dr["QTY"] = Convert.ToInt32(qty);
                                //PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, Prod_CD, "", qty, "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, "0", 1);
                                table.Rows.Add(dr);
                            }
                            else
                            {
                                table.Select(string.Format("[Prod_cd] = '{0}'", Prod_CD)).ToList<DataRow>()
                                 .ForEach(r =>
                                 {
                                     r["Prod_cd"] = Prod_CD;
                                     r["QTY"] = Convert.ToInt32(r["QTY"]) + Convert.ToInt32(qty);
                                     //PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, Prod_CD, "", Convert.ToInt32(r["QTY"]), "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, "0", 1);
                                 });
                            }

                            dt = table;
                        }
                        else
                        {
                            row["Prod_cd"] = Prod_CD;
                            row["QTY"] = qty;
                            dt.Rows.Add(row);
                            //PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, Prod_CD, "", qty, "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, "0", 1);
                            //qty = Convert.ToInt32(quantity.Text) + Convert.ToInt32(Session["Cart_Count"]);
                            //Session["Cart_Count"] = qty;
                        }
                    }
                    //dt=tmp
                    SessionVariable.AddToCart = dt;
                }
                SessionVariable.cart_Count = Convert.ToInt32(SessionVariable.AddToCart.Compute("SUM(QTY)", ""));

                foreach (DataRow item in SessionVariable.AddToCart.Rows)
                {
                    //AddToCart(item["Prod_cd"].ToString(), Convert.ToInt32(item["QTY"]));
                    PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, item["Prod_cd"].ToString(), "", Convert.ToInt32(item["QTY"]), "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, "0", 1);
                }
                //DeleteTemp();
                //return Convert.ToInt32(tmp.Tables[0].Rows[0][0]);
            }
            catch (Exception ex)
            {
                //return 0;
            }
        }
        #endregion

        #region DeleteTemp
        public void DeleteTemp(string cusID)
        {
            try
            {
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "[SP_COTS_DeleteWebTempOrders]";
                cmd.Parameters.AddWithValue("@CUS_ID", SessionVariable.CustomerID != "" ? SessionVariable.CustomerID : "GUEST");
                //cmd.Parameters.AddWithValue("@TempOrderID", SessionVariable.TempOrderID);
                //cmd.Parameters.AddWithValue("@ORD_NUM", SessionVariable.orderID);
                //cmd.Parameters.AddWithValue("@ORD_DT", Clarion.TodayInt);
                //cmd.Parameters.AddWithValue("@SHIP_DT", Clarion.TodayInt);
                //cmd.Parameters.AddWithValue("@CAN_DT", "");
                //cmd.Parameters.AddWithValue("@ORD_AMT", SessionVariable.Amount);
                //cmd.Parameters.AddWithValue("@param", param);
                cmd.CommandType = CommandType.StoredProcedure;
                var tmp = db.GetDataSet(cmd);
                SessionVariable.DeleteTemp = 1;
                //return Convert.ToInt32(tmp.Tables[0].Rows[0][0]);
            }
            catch (Exception ex)
            {
                //return 0;
            }

        }
        #endregion

        #region GET Customer Info
        public void GetCustomer(string ApiLoginID, string ApiTransactionKey, string CustomerProfileID)
        {
            SessionVariable.AddressList = null;
            SessionVariable.CCList = null;
            clsPayment pay = new clsPayment();
            var CustomerDetailRespoce = pay.GetCustomerProfile(ApiLoginID, ApiTransactionKey, CustomerProfileID);
            var CCList = CustomerDetailRespoce.profile.paymentProfiles;
            var ShippingAddressList = CustomerDetailRespoce.profile.shipToList;
            if (ShippingAddressList != null)
            {
                SessionVariable.AddressList = null;
                SessionVariable.AddressList = ShippingAddressList.ToList();
            }
            if (CCList != null)
            {
                SessionVariable.CCList = CCList.ToList();
                int id = 0;
                List<creditCardMaskedType> cD = new List<creditCardMaskedType>();
                foreach (var i in CCList.ToArray())
                {
                    // paymentMaskedType card = new paymentMaskedType();

                    // creditCardType c = new creditCardType();

                    //c.cardNumber = card.Item;
                    cD.Add((creditCardMaskedType)i.payment.Item);
                    cD[id].cardType = i.customerPaymentProfileId;
                    id++;
                    //SessionVariable.CCs = cD;
                }
                SessionVariable.CCs = cD;
            }


        }
        #endregion

        #region Update TempOrders
        public void Update(Payment pay, decimal fee)
        {
            try
            {
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "[SP_COTS_UpdateWebTempOrder]";
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    //@TempOrderID nvarchar(10),
                    //@CUST_ID nvarchar(10),
                    //@HANDL_FEE decimal,
                    //@SP_ADR nvarchar(45),
                    //@SP_ADR_2 nvarchar(45),
                    //@SP_ADR_22 nvarchar(45),
                    //@SP_ADR_3 nvarchar(45),
                    //@SP_ADR_CT nvarchar(45),
                    //@SP_ADR_ST nvarchar(35),
                    //@SP_ADR_ZP nvarchar(20),
                    //@email_adr nvarchar(50)
                    cmd.Parameters.AddWithValue("@TempOrderID", SessionVariable.TempOrderID);
                    if(SessionVariable.CustomerID.StartsWith("G#"))
                    {
                        SessionVariable.CustomerID= "GUEST";
                        SessionVariable.CustomerName = pay.cust_address.firstName + " " + pay.cust_address.lastName;
                    }
                    
                    cmd.Parameters.AddWithValue("@CUST_ID", SessionVariable.CustomerID.Trim());
                    cmd.Parameters.AddWithValue("@HANDL_FEE", fee);
                    cmd.Parameters.AddWithValue("@SP_ADR", pay.cust_address.firstName + " " + pay.cust_address.lastName);
                    cmd.Parameters.AddWithValue("@SP_ADR_2", pay.cust_address.address);
                    cmd.Parameters.AddWithValue("@SP_ADR_22", "");
                    cmd.Parameters.AddWithValue("@SP_ADR_3", pay.cust_address.state+" "+pay.cust_address.zip+", " + pay.cust_address.country);
                    cmd.Parameters.AddWithValue("@SP_ADR_CT", pay.cust_address.city);
                    cmd.Parameters.AddWithValue("@SP_ADR_ST", pay.cust_address.state);
                    cmd.Parameters.AddWithValue("@SP_ADR_ZP", pay.cust_address.zip);
                    cmd.Parameters.AddWithValue("@email_adr", pay.cust_address.email);
                    cmd.Parameters.AddWithValue("@SP_ADR_CN", pay.cust_address.country);


                    db.executenonquery(cmd);
                }
                catch (Exception ex)
                {
                    throw ex;
                }

                finally
                {
                    db.connection();
                }

            }
            catch (Exception ex)
            {

            }
        }
        #endregion

        #region Shipping Charge
        public decimal ShippingCharge(int cart, decimal amount)
        {
            decimal ShippingCharge = Convert.ToDecimal(0.00);
            if (SessionVariable.customerType == (int)custtype.Retailer || SessionVariable.CustomerID == "GUEST")
            {
                if (cart > 0)
                {

                    if (SessionVariable.InterNationalShipping_Charge > 0)
                    {
                        if (amount < 300)
                        {
                            ShippingCharge = 15 + (2 * (cart - 1));
                        }
                    }
                    else if (SessionVariable.InterNationalShipping_Charge == -1)
                    {
                        ShippingCharge = 0;
                    }
                    else
                    {
                        if (amount < 100)
                        {
                            ShippingCharge = 5 + (1 * (cart - 1));
                        }
                    }
                }
            }
            SessionVariable.ShippingCharge = Convert.ToDouble(ShippingCharge.ToString("0.00"));
            return Convert.ToDecimal(ShippingCharge.ToString("0.00"));
        }
        #endregion

        #region My Order
        public List<OrderDetail> MyOrder(int Number, int param = 0)
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "[SP_COTS_MYORDERS]";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CUS_ID", SessionVariable.CustomerID);
            cmd.Parameters.AddWithValue("@ord_num", Number);
            cmd.Parameters.AddWithValue("@param", param);
            cmd.Parameters.AddWithValue("@INVS_NUM", Number);

            var dsOrder = db.GetDataSet(cmd);
            //TotalRows = Convert.ToInt32(dsProCat.Tables[0].Rows[0]["COUNT"]);

            OrderDetail = new List<OrderDetail>();

            foreach (DataRow dr in dsOrder.Tables[0].Rows)
            {
                List<string> ListINVS = new List<string>();
                List<string> ListTracking = new List<string>();
                OrderDetail od = new OrderDetail();
                od.Cus_Id = dr["CUS_ID"].ToString();

                od.ORD_NUM = dr["ORD_NUM"] == DBNull.Value ? "" : Convert.ToString(dr["ORD_NUM"]);
                od.ORD_DT = dr["OrderDate"] == DBNull.Value ? "" : Convert.ToDateTime(dr["OrderDate"]).ToString("MM-dd-yyyy");
                try
                {
                    od.ORD_AMT = Convert.ToDecimal(dr["ORD_AMT"]).ToString("0.00");
                }
                catch (Exception ex)
                {
                    od.ORD_AMT = "0.00";
                }

                od.PO_NUM = Convert.ToString(dr["PO_NUM"]);
                var datatable = dsOrder.Tables[1].Select(string.Format("[ORD_NUM] = '{0}'", od.ORD_NUM)).ToList<DataRow>();
                if (datatable.Count > 0)
                {

                    foreach (DataRow dr2 in datatable)
                    {

                        ListINVS.Add(dr2["INVS_NUM"].ToString());
                        ListTracking.Add(dr2["Notes"] == null ? "" : dr2["Notes"].ToString());
                        od.INVS_NUM = ListINVS;
                        od.Traking = ListTracking;
                        // od.Traking = ListTracking;
                    }
                }

                OrderDetail.Add(od);
            }
            return OrderDetail;
        }
        #endregion

        #region TRACKING Order
        public List<OrderDetail> TrankingOrder(int Number = 0, int param = 0)
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "[SP_COTS_MYORDERS]";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CUS_ID", SessionVariable.CustomerID);
            cmd.Parameters.AddWithValue("@ord_num", Number);
            cmd.Parameters.AddWithValue("@param", param);
            cmd.Parameters.AddWithValue("@INVS_NUM", Number);

            var dsOrder = db.GetDataSet(cmd);
            //TotalRows = Convert.ToInt32(dsProCat.Tables[0].Rows[0]["COUNT"]);

            OrderDetail = new List<OrderDetail>();

            foreach (DataRow dr in dsOrder.Tables[0].Rows)
            {
                List<string> ListINVS = new List<string>();
                List<string> ListTracking = new List<string>();
                OrderDetail od = new OrderDetail();
                od.Cus_Id = dr["CUS_ID"].ToString();

                od.ORD_NUM = dr["ORD_NUM"] == DBNull.Value ? "" : Convert.ToString(dr["ORD_NUM"]);
                od.ORD_DT = dr["OrderDate"] == DBNull.Value ? "" : Convert.ToDateTime(dr["OrderDate"]).ToString("MM-dd-yyyy");
                try
                {
                    od.ORD_AMT = Convert.ToDecimal(dr["ORD_AMT"]).ToString("0.00");
                }
                catch (Exception ex)
                {
                    od.ORD_AMT = "0.00";
                }

                od.PO_NUM = Convert.ToString(dr["PO_NUM"]);
                var datatable = dsOrder.Tables[0].Select(string.Format("[ORD_NUM] = '{0}'", od.ORD_NUM)).ToList<DataRow>();
                if (datatable.Count > 0)
                {

                    foreach (DataRow dr2 in datatable)
                    {

                        ListINVS.Add(dr2["INVS_NUM"].ToString());
                        ListTracking.Add("");
                        od.INVS_NUM = ListINVS;
                        od.Traking = ListTracking;
                        // od.Traking = ListTracking;
                    }
                }

                OrderDetail.Add(od);
            }
            return OrderDetail;
        }
        #endregion

        #region TRACKING Order
        public List<OrderDetail> TrankingOrderFilter(string value,int param)
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "[SP_COTS_MYORDERS]";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CUS_ID", value);
            cmd.Parameters.AddWithValue("@ord_num", 0);
            cmd.Parameters.AddWithValue("@param", param);
            cmd.Parameters.AddWithValue("@INVS_NUM", 0);

            var dsOrder = db.GetDataSet(cmd);
            //TotalRows = Convert.ToInt32(dsProCat.Tables[0].Rows[0]["COUNT"]);

            OrderDetail = new List<OrderDetail>();

            foreach (DataRow dr in dsOrder.Tables[0].Rows)
            {
                List<string> ListINVS = new List<string>();
                List<string> ListTracking = new List<string>();
                OrderDetail od = new OrderDetail();
                od.Cus_Id = dr["CUS_ID"].ToString();

                od.ORD_NUM = dr["ORD_NUM"] == DBNull.Value ? "" : Convert.ToString(dr["ORD_NUM"]);
                od.ORD_DT = dr["OrderDate"] == DBNull.Value ? "" : Convert.ToDateTime(dr["OrderDate"]).ToString("MM-dd-yyyy");
                try
                {
                    od.ORD_AMT = Convert.ToDecimal(dr["ORD_AMT"]).ToString("0.00");
                }
                catch (Exception ex)
                {
                    od.ORD_AMT = "0.00";
                }

                od.PO_NUM = Convert.ToString(dr["PO_NUM"]);
                var datatable = dsOrder.Tables[0].Select(string.Format("[ORD_NUM] = '{0}'", od.ORD_NUM)).ToList<DataRow>();
                if (datatable.Count > 0)
                {

                    foreach (DataRow dr2 in datatable)
                    {

                        ListINVS.Add(dr2["INVS_NUM"].ToString());
                        ListTracking.Add("");
                        od.INVS_NUM = ListINVS;
                        od.Traking = ListTracking;
                        // od.Traking = ListTracking;
                    }
                }

                OrderDetail.Add(od);
            }
            return OrderDetail;
        }
        #endregion

        #region My Order
        public List<OrderDetail> OrderDetails(int Number, int param = 0)
        {
            try
            {
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "[SP_COTS_MYORDERS]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CUS_ID", SessionVariable.CustomerID);
                cmd.Parameters.AddWithValue("@ord_num", Number);
                cmd.Parameters.AddWithValue("@param", param);
                cmd.Parameters.AddWithValue("@INVS_NUM", Number);

                var dsOrder = db.GetDataSet(cmd);
                //TotalRows = Convert.ToInt32(dsProCat.Tables[0].Rows[0]["COUNT"]);

                var OrderDetail = new List<OrderDetail>();
                //  List<string> ListINVS = new List<string>();
                foreach (DataRow dr in dsOrder.Tables[0].Rows)
                {
                    OrderDetail od = new OrderDetail();
                    od.Cus_Id = dr["CUS_ID"].ToString();
                    od.ORD_NUM = dr["ORD_NUM"] == DBNull.Value ? "" : Convert.ToString(dr["ORD_NUM"]);
                    // od.ORD_DT = dr["OrderDate"] == DBNull.Value ? "" : Convert.ToDateTime(dr["OrderDate"]).ToString("dd-MM-yyyy");
                    od.ORDER_QTY = Convert.ToInt32(dr["ORDER_QTY"]).ToString();
                    od.UNIT_PRS = Convert.ToDouble(dr["UNIT_PRS"]).ToString("0.00");
                    od.DESC = dr["UT_DESC"].ToString();
                    od.PROD_CD = dr["PROD_CD"].ToString();
                    // od.HANDL_FEE = Convert.ToDouble(dr["HANDL_FEE"]).ToString("00.00");
                    //var datatable = dsOrder.Tables[1].Select(string.Format("[ORD_NUM] = '{0}'", od.ORD_NUM)).ToList<DataRow>();


                    OrderDetail.Add(od);
                }
                if (dsOrder.Tables[1].Rows.Count > 0)
                {
                    OrderDetail[0].HANDL_FEE = Convert.ToDouble(dsOrder.Tables[1].Rows[0]["HANDL_FEE"].ToString() == "" ? "0" : dsOrder.Tables[1].Rows[0]["HANDL_FEE"]).ToString("0.00");
                }
                else
                {
                    OrderDetail[0].HANDL_FEE = "0.00";
                }
                return OrderDetail;
            }
            catch (Exception ex)
            {
                return OrderDetail;
            }
            return OrderDetail;
        }
        #endregion

        #region Admin Order
        public List<OrderDetail> AdminOrderDetails(int INVS_Number = 0, int ORD_Number = 0, int param = 0)
        {
            try
            {
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "[SP_COTS_MYORDERS]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CUS_ID", SessionVariable.CustomerID);
                cmd.Parameters.AddWithValue("@ord_num", ORD_Number);
                cmd.Parameters.AddWithValue("@param", param);
                cmd.Parameters.AddWithValue("@INVS_NUM", INVS_Number);

                var dsOrder = db.GetDataSet(cmd);
                //TotalRows = Convert.ToInt32(dsProCat.Tables[0].Rows[0]["COUNT"]);

                var OrderDetail = new List<OrderDetail>();
                //  List<string> ListINVS = new List<string>();
                foreach (DataRow dr in dsOrder.Tables[0].Rows)
                {
                    OrderDetail od = new OrderDetail();
                    od.Cus_Id = dr["CUS_ID"].ToString();
                    od.ORD_NUM = dr["ORD_NUM"] == DBNull.Value ? "" : Convert.ToString(dr["ORD_NUM"]);
                    // od.ORD_DT = dr["OrderDate"] == DBNull.Value ? "" : Convert.ToDateTime(dr["OrderDate"]).ToString("dd-MM-yyyy");
                    od.ORDER_QTY = Convert.ToInt32(dr["ORDER_QTY"]).ToString();
                    od.UNIT_PRS = Convert.ToDouble(dr["UNIT_PRS"]).ToString("0.00");
                    od.DESC = dr["UT_DESC"].ToString();
                    od.PROD_CD = dr["PROD_CD"].ToString();
                    // od.HANDL_FEE = Convert.ToDouble(dr["HANDL_FEE"]).ToString("00.00");
                    //var datatable = dsOrder.Tables[1].Select(string.Format("[ORD_NUM] = '{0}'", od.ORD_NUM)).ToList<DataRow>();


                    OrderDetail.Add(od);
                }
                if (dsOrder.Tables[1].Rows.Count > 0)
                {
                    OrderDetail[0].HANDL_FEE = Convert.ToDouble(dsOrder.Tables[1].Rows[0]["HANDL_FEE"].ToString() == "" ? "0" : dsOrder.Tables[1].Rows[0]["HANDL_FEE"]).ToString("0.00");
                }
                else
                {
                    OrderDetail[0].HANDL_FEE = "0.00";
                }
                return OrderDetail;
            }
            catch (Exception ex)
            {
                return OrderDetail;
            }
            return OrderDetail;
        }
        #endregion
        //-----------------nisha Patel-------------------
        #region Email sending Function
        #region SendEmail
        public string SendEmaill(string CompanyEmailAddress, string Password, string CustEmailid, string subject, string Bodycont, string CC = "", int p = 0)
        {
            string result = "";
            try
            {
                SmtpClient smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com", // smtp server address here…
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    Credentials = new System.Net.NetworkCredential(CompanyEmailAddress, Password),
                    Timeout = 30000,
                };
                // MailMessage message = new MailMessage(CompanyEmailAddress, CustEmailid, EmailRegSubject, Bodycont);
                using (MailMessage mailMessage = new MailMessage())
                {
                    mailMessage.From = new MailAddress(CompanyEmailAddress);
                    mailMessage.Subject = subject;
                    mailMessage.Body = Bodycont;

                    if (CC == "")
                    {
                        mailMessage.To.Add(new MailAddress(CustEmailid));
                    }
                    else
                    {
                        mailMessage.CC.Add(CC);
                        mailMessage.To.Add(new MailAddress(CustEmailid));
                    }
                    if (subject == "Order Confirmation")
                    {
                        mailMessage.Subject = "CampCo New Order #" + SessionVariable.orderID.ToString();
                        mailMessage.IsBodyHtml = true;
                        mailMessage.CC.Add(CC);
                        mailMessage.To.Add(new MailAddress(CustEmailid));
                    }

                    if (p == 1)
                    {
                        mailMessage.Subject = subject;//"CampCo New Order #" + SessionVariable.orderID.ToString();
                        mailMessage.IsBodyHtml = true;
                        mailMessage.CC.Add(CC);
                        mailMessage.To.Add(new MailAddress(CustEmailid));
                    }
                    smtp.Send(mailMessage);
                    return (result);
                }
            }
            catch (Exception ex)
            {
                result = "Error";
                return (result);
            }

        }
        #endregion
        #endregion

        #region otherBrand
        public List<Category> Other(int catID)
        {
            try
            {
                List<Category> OtherBrand = new List<Category>();
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "[SP_COTS_webOtherBrand]";
                cmd.Parameters.AddWithValue("@CategoryID", catID);
                cmd.CommandType = CommandType.StoredProcedure;
                var tmp = db.GetDataSet(cmd);
                foreach (DataRow item in tmp.Tables[0].Rows)
                {
                    Category oB = new Category();
                    oB.CATEGORYID = Convert.ToInt32(item["CategoryId"]);
                    oB.MEDIUMPIC = item["MediumPic"].ToString();

                    OtherBrand.Add(oB);
                }

                return OtherBrand;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion

        #region Tracking
        public DataSet Tracking(string cus_ID, int invs_num, int ord_num, string trackID, int param)
        {
            try
            {

                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "[sp_cots_UpdateTracking]";
                cmd.Parameters.AddWithValue("@cus_id", cus_ID);
                cmd.Parameters.AddWithValue("@invs_num", invs_num);
                cmd.Parameters.AddWithValue("@ord_num", ord_num);
                cmd.Parameters.AddWithValue("@param", param);
                cmd.Parameters.AddWithValue("@track_id", trackID);
                cmd.CommandType = CommandType.StoredProcedure;
                var tmp = db.GetDataSet(cmd);
                string email = tmp.Tables[0].Rows[0]["email_adr"] != null || tmp.Tables[0].Rows[0]["email_adr"].ToString() != "" ? tmp.Tables[0].Rows[0]["email_adr"].ToString() : "";

                return tmp;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion

        //--------------------- Nisha patel-(27-02-2017 12:00pm)-------------------
        #region ErrorLogFile
        public void logerrors(Exception ex,string method="")
        {
            string pageName = Path.GetFileName(HttpContext.Current.Request.Path);
            string filename = "Log_" + DateTime.Now.ToString("dd-MM-yyyy") + ".log";
            string filepath = HttpContext.Current.Server.MapPath("~/LogFiles/" + filename);
            if (File.Exists(filepath))
            {
                using (StreamWriter stwriter = new StreamWriter(filepath, true))
                {
                    stwriter.WriteLine("-------------------------START-------------------------" + DateTime.Now);
                    stwriter.WriteLine("Page :" + pageName);
                    stwriter.WriteLine("----------------------------------------------------");
                    stwriter.WriteLine("Event :" + method);
                    stwriter.WriteLine("----------------------------------------------------");
                    stwriter.WriteLine("Stack Trace :" + ex.StackTrace);
                    stwriter.WriteLine("----------------------------------------------------");
                    stwriter.WriteLine(ex.ToString());
                    stwriter.WriteLine("-------------------------END-------------------------" + DateTime.Now);
                    stwriter.WriteLine("----------------------------------------------------");
                }
            }
            else
            {
                StreamWriter stwriter = File.CreateText(filepath);
                stwriter.WriteLine("-------------------------START-------------------------" + DateTime.Now);
                stwriter.WriteLine("Page :" + pageName);
                stwriter.WriteLine("----------------------------------------------------");
                stwriter.WriteLine("Stack Trace :" + ex.StackTrace);
                stwriter.WriteLine("----------------------------------------------------");
                stwriter.WriteLine(ex.ToString());
                stwriter.WriteLine("-------------------------END-------------------------" + DateTime.Now);
                stwriter.WriteLine("----------------------------------------------------"); stwriter.Close();
            }
        }
        #endregion


        #region ErrorLogFile
        public void LogInfo(string method = "")
        {
            string pageName = Path.GetFileName(HttpContext.Current.Request.Path);
            string filename = "Log_" + DateTime.Now.ToString("dd-MM-yyyy") + ".log";
            string filepath = HttpContext.Current.Server.MapPath("~/LogFiles/" + filename);
            if (File.Exists(filepath))
            {
                using (StreamWriter stwriter = new StreamWriter(filepath, true))
                {
                    stwriter.WriteLine("-------------------------START-------------------------" + DateTime.Now);
                    stwriter.WriteLine("Page :" + pageName);
                    stwriter.WriteLine("----------------------------------------------------");
                    stwriter.WriteLine("Event :" + method);
                    stwriter.WriteLine("-------------------------END-------------------------" + DateTime.Now);
                    stwriter.WriteLine("----------------------------------------------------");
                }
            }
            else
            {
                StreamWriter stwriter = File.CreateText(filepath);
                stwriter.WriteLine("-------------------------START-------------------------" + DateTime.Now);
                stwriter.WriteLine("Page :" + pageName);
                stwriter.WriteLine("----------------------------------------------------");
                stwriter.WriteLine("Event :" + method);
                stwriter.WriteLine("----------------------------------------------------");
                stwriter.WriteLine("-------------------------END-------------------------" + DateTime.Now);
                stwriter.WriteLine("----------------------------------------------------"); stwriter.Close();
            }
        }
        #endregion


        #region OrderLogFile
        public void orderloge(Exception ex)
        {
            string pageName = Path.GetFileName(HttpContext.Current.Request.Path);
            string filename = "OrderLog_" + DateTime.Now.ToString("dd-MM-yyyy") + ".log";
            string filepath = HttpContext.Current.Server.MapPath("~/LogFiles/" + filename);
            if (File.Exists(filepath))
            {
                using (StreamWriter stwriter = new StreamWriter(filepath, true))
                {
                    stwriter.WriteLine("-------------------------START-------------------------" + DateTime.Now);
                    stwriter.WriteLine("Page :" + pageName);
                    stwriter.WriteLine("----------------------------------------------------");
                    stwriter.WriteLine("Stack Trace :" + ex.StackTrace);
                    stwriter.WriteLine("----------------------------------------------------");
                    stwriter.WriteLine(ex.ToString());
                    stwriter.WriteLine("-------------------------END-------------------------" + DateTime.Now);
                    stwriter.WriteLine("----------------------------------------------------");
                }
            }
            else
            {
                StreamWriter stwriter = File.CreateText(filepath);
                stwriter.WriteLine("-------------------------START-------------------------" + DateTime.Now);
                stwriter.WriteLine("Page :" + pageName);
                stwriter.WriteLine("----------------------------------------------------");
                stwriter.WriteLine("Stack Trace :" + ex.StackTrace);
                stwriter.WriteLine("----------------------------------------------------");
                stwriter.WriteLine(ex.ToString());
                stwriter.WriteLine("-------------------------END-------------------------" + DateTime.Now);
                stwriter.WriteLine("----------------------------------------------------"); stwriter.Close();
            }
        }
        #endregion

        public void UpdateTempData(string cus_id)
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "[SP_COTS_UpdateTmpData]";
            cmd.Parameters.AddWithValue("@cus_id", cus_id);
            cmd.Parameters.AddWithValue("@tempId", SessionVariable.TempOrderID);
            cmd.Parameters.AddWithValue("@ord_dt", Clarion.TodayInt);

            cmd.Parameters.AddWithValue("@param", 1);
            cmd.CommandType = CommandType.StoredProcedure;
            var tmp = db.GetDataSet(cmd);

            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "[SP_COTS_UpdateTmpData]";
            cmd2.Parameters.AddWithValue("@cus_id", cus_id);
            cmd2.Parameters.AddWithValue("@tempId", SessionVariable.TempOrderID);
            cmd2.Parameters.AddWithValue("@ord_dt", Clarion.TodayInt);              
            cmd2.Parameters.AddWithValue("@param", 2);
            cmd2.CommandType = CommandType.StoredProcedure;
            var DelTmp = db.GetDataSet(cmd2);
            SessionVariable.CustomerID = cus_id;
            SessionVariable.AddToCart = null;
            foreach (DataRow datarow in tmp.Tables[0].Rows)
            {
                AddToCart(Convert.ToString(datarow["prod_cd"]), Convert.ToInt32(datarow["ORDER_QTY"]));
             }            
        }

 //--------------------- Nisha patel--------------------
        public DataTable GetDatafromDatabaseToExcel()
        {
            DBConnection db = new DBConnection();
            SqlCommand cmd = new SqlCommand();
            // DataSet dsexcel = new DataSet();
            DataTable dtexcel = new DataTable();
            cmd.CommandText = "[SP_COTS_Get_product_Pricelist_excel]"; 
            cmd.CommandType = CommandType.StoredProcedure;
            dtexcel = db.getDataTable(cmd);
            return dtexcel;
        }

//--------------------- Nisha patel-(16-3-2017)-------------------

#region Get Customer Profile
        public DataSet GetCustomerDetail_MyProfile_search(string param, string search)
        {
            DataSet dsCusdetail = new DataSet();
            try
            {
            
                DBConnection db = new DBConnection();
                SqlCommand cmd = new SqlCommand();              
                Registration_Property objReg = new Registration_Property();
                cmd.CommandText = "Sp_COTS_GetCustomerDetail_Profile_search";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Param",param);
                cmd.Parameters.AddWithValue("@search",search);
                dsCusdetail = db.GetDataSet(cmd);
                return dsCusdetail;
            }
            catch(Exception ex)
            {
                logerrors(ex);
            }
            return dsCusdetail;
        }


        #endregion

//--------------------- Nisha patel-(23-3-2017)-------------------
        #region Get brand Banner images
        public List<List<Banners_Photo>> Getbrandbannerlist(int CategoryId,int param=0)            
        {
            try
            {
                List<List<Banners_Photo>> List = new List<List<Campco.Banners_Photo>>();
                DataSet dsBrandBanner = new DataSet();
                SqlCommand cmd = new SqlCommand("SP_COTS_GetBrandBannerDetail");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@param", param);
                cmd.Parameters.AddWithValue("@CategoryId", CategoryId);
                DBConnection db = new DBConnection();
                dsBrandBanner = db.GetDataSet(cmd);

                BrandBannerList = new List<Banners_Photo>();
                List<Banners_Photo> BrandfooterBannerList = new List<Banners_Photo>();


                if (dsBrandBanner.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsBrandBanner.Tables[0].Rows)
                    {
                        Banners_Photo bbl = new Banners_Photo();
                        bbl.Brand_Banner_Id = dr[0] == DBNull.Value ? "" : Convert.ToString(dr[0]);
                        bbl.CategoryId = dr[1] == DBNull.Value ? "" : Convert.ToString(dr[1]);
                        bbl.Banner_Path = (dr[2] == DBNull.Value ? "" : Convert.ToString(dr[2]));
                        BrandBannerList.Add(bbl);
                    }
                }
                List.Add(BrandBannerList);
                //if (dsBrandBanner.Tables[1].Rows.Count > 0)
                //{
                //    foreach (DataRow dr in dsBrandBanner.Tables[1].Rows)
                //    {
                //        Banners_Photo bbl = new Banners_Photo();
                //        bbl.Brand_Banner_Id = dr[0] == DBNull.Value ? "" : Convert.ToString(dr[0]);
                //        bbl.CategoryId = dr[1] == DBNull.Value ? "" : Convert.ToString(dr[1]);
                //        bbl.Banner_Path = (dr[2] == DBNull.Value ? "" : Convert.ToString(dr[2]));
                //        BrandfooterBannerList.Add(bbl);
                //    }
                //}
                //List.Add(BrandBannerList);
                List.Add(BrandfooterBannerList);
                return List;
            }

            catch (Exception ex)
            {
                return null;
            }
            finally
            {

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

                return x;
                //return "1";
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}