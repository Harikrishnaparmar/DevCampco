using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Campco
{
    public class DBConnection
    {
        /// <summary>
        /// <author>Harikrushna Parmar</author>
        /// <create>20-09-2016</create>
        /// </summary>
        #region Variable Declaration
        DataSet dsReturns;
        SqlDataAdapter sqlDA;
        SqlConnection con;
        string ConnetionString;
        DataTable dtReturn;
        #endregion
        #region open Connection
        /// <summary>
        /// Get Connection open.
        /// </summary>
        /// <author>Harikrishna Parmar</author>
        /// <date>18/09/2016</date>
        /// <returns></returns>
        public void connection()
        {
            try
            {
               // ConnetionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
                ConnetionString = ConfigurationManager.AppSettings["omsdataConnectionString"];
                con = new SqlConnection(ConnetionString);
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                //return ConnetionString;
            }
            catch(Exception ex)
            {
                //retu
            }
        }
        #endregion
        #region Command Operations
        public DataSet command(string CommandString)
        {
            try
            {
                connection(); 
                sqlDA = new SqlDataAdapter(CommandString, con);
                dsReturns = new DataSet();
                sqlDA.Fill(dsReturns);
                CloseConnection();
                return dsReturns;
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            finally
            {
                CloseConnection();
            }
        }
        #endregion
        #region GetDatatable
        public DataTable getDataTable(SqlCommand cmd)
        {
            try
            {
                connection();
                cmd.Connection = con;
                sqlDA = new SqlDataAdapter(cmd);
                dtReturn = new DataTable();
                sqlDA.Fill(dtReturn);
                CloseConnection();
                return dtReturn;
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            finally
            {
                CloseConnection();
            }
          
        }
        #endregion
        #region GetData
        public DataSet GetDataSet(SqlCommand cmd)
       {
           try
            {
                connection();
                cmd.Connection = con;
                sqlDA = new SqlDataAdapter(cmd);
                dsReturns = new DataSet();
                sqlDA.Fill(dsReturns);
                CloseConnection();
                return dsReturns;
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            finally
            {
                CloseConnection();
            }
        }
        #endregion 
        #region ExecuteNonqury
        public  void executenonquery(SqlCommand cmd)
        {
            try
            {
                connection();
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                CloseConnection();   
            }
            catch (Exception ex)
            {
                CloseConnection();
            }    
        }

        public string executenonquery_Reg(SqlCommand cmd)
        {
            string Cus_id = "";
            try
            {
                connection();
                cmd.Connection = con;
                Cus_id = Convert.ToString(cmd.ExecuteNonQuery());
                CloseConnection();
            }
            catch (Exception ex)
            {
                CloseConnection();
            }

            return Cus_id;
        }
        #endregion
        #region Close Connetion
        public void CloseConnection()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        #endregion

        

        public DataSet CommandWithPara(SqlCommand cmd, string operation)
        {
            try
            {
                connection();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                if (eOperation.Insert.ToString() == operation || eOperation.Delete.ToString() == operation || eOperation.Update.ToString() == operation)
                {
                    cmd.ExecuteNonQuery();
                    return null;
                }
                else
                {
                    cmd.Connection = con;
                    dsReturns = new DataSet();
                    sqlDA = new SqlDataAdapter(cmd);
                    sqlDA.Fill(dsReturns);
                    return dsReturns;
                }

                //return null;
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            finally
            {
                CloseConnection();
            }
        }
        public string Command(SqlCommand cmd, string operation)
        {
            try
            {
                connection();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter param = cmd.Parameters["@OrderNum"];
                if (eOperation.Insert.ToString() == operation || eOperation.Delete.ToString() == operation || eOperation.Update.ToString() == operation)
                {
                  var x=  cmd.ExecuteNonQuery();
                   
                    return Convert.ToString(param.Value);
                }
                

                return "";
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            finally
            {
                CloseConnection();
            }
        }
    }
}