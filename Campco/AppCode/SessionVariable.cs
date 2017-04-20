using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using AuthorizeNet.Api.Contracts.V1;

namespace Campco
{
    /// <summary>
    /// <author>Harikrishna Parmar</author>
    /// <created>30-09-2016</created>
    /// </summary>

    public class SessionVariable
    {
        #region PROD_CD
        public static string PROD_CD
        {
            get
            {
                object value = HttpContext.Current.Session["PROD_CD"].ToString();
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["PROD_CD"] = value;
            }
        }
        #endregion

        #region AddToCart
        public static DataTable AddToCart
        {
            get
            {
                var value = (DataTable)HttpContext.Current.Session["AddToCart"];
                return value;
            }
            set
            {
                HttpContext.Current.Session["AddToCart"] = value;
            }
        }
        #endregion

        #region CategoryID
        public static int CategoryID
        {
            get
            {
                var value = (int)HttpContext.Current.Session["CategoryID"];
                return value;
            }
            set
            {
                HttpContext.Current.Session["CategoryID"] = value;
            }
        }
        #endregion

        #region CustomerID
        public static string CustomerID
        {
            get
            {
                string n = HttpContext.Current.Session.SessionID.Substring(0,8);//Convert.ToInt16(rnd.Next(1, 10000));
                var value = HttpContext.Current.Session["CustomerID"] != null ? (string)HttpContext.Current.Session["CustomerID"] : Convert.ToString("G#"+n);
                HttpContext.Current.Session["CustomerID"] = value;
                return value;
            }
            set
            {
                HttpContext.Current.Session["CustomerID"] = value;
            }
        }
        #endregion

        #region Term
        public static string Term
        {
            get
            {
              var  Value = HttpContext.Current.Session["Term"] != null ? HttpContext.Current.Session["Term"].ToString().ToUpper() : ("CREDIT CARD").ToUpper();
                return Value;
            }
            set
            {
                HttpContext.Current.Session["Term"] = value;
            }
        }
        #endregion

        #region IsSpecial
        public static int IsSpecial
        {
            get
            {
                var value = HttpContext.Current.Session["IsSpecial"] != null ? Convert.ToInt32(HttpContext.Current.Session["IsSpecial"]) : Convert.ToInt32(0);
                return value;
            }
            set
            {
                HttpContext.Current.Session["IsSpecial"] = value;
            }
        }
        #endregion

        #region CustomerName
        public static string CustomerName
        {
            get
            {
                var value = HttpContext.Current.Session["CustomerName"] != null ? (string)HttpContext.Current.Session["CustomerName"] : SessionVariable.CustomerID.ToString();
                return value;
            }
            set
            {
                HttpContext.Current.Session["CustomerName"] = value;
            }
        }
        #endregion

        #region Amount
        public static decimal Amount
        {
            get
            {
                var value = HttpContext.Current.Session["Amount"] != null ? (decimal)HttpContext.Current.Session["Amount"] : Convert.ToDecimal(00.00);
                return value;
            }
            set
            {
                HttpContext.Current.Session["Amount"] = value;
            }
        }
        #endregion

        #region Amount
        public static decimal Order_Amount
        {
            get
            {
                var value = HttpContext.Current.Session["OrderAmount"] != null ? (decimal)HttpContext.Current.Session["OrderAmount"] : Convert.ToDecimal(00.00);
                return value;
            }
            set
            {
                HttpContext.Current.Session["OrderAmount"] = value;
            }
        }
        #endregion

        #region UName
        public static string UName
        {

            get
            {
                var value = (string)HttpContext.Current.Session["UName"];
                return value;
            }
            set
            {
                HttpContext.Current.Session["UName"] = value;
            }

        }
        #endregion  region 

        #region cart_Count
        public static int cart_Count
        {
            get
            {
                var value = HttpContext.Current.Session["cart_Count"]!=null?(int)HttpContext.Current.Session["cart_Count"]:0;
                return value;
            }
            set
            {
                HttpContext.Current.Session["cart_Count"] = value;
            }
        }
        #endregion

        #region TempOrderID
        public static int TempOrderID
        {
            get
            {
                var value = HttpContext.Current.Session["TempOrderID"];
                return value == null ? 0 : (int)value;
            }
            set
            {
                HttpContext.Current.Session["TempOrderID"] = value;
            }
        }
        #endregion

        #region customerType
        public static int customerType
        {
            get
            {
                var value = HttpContext.Current.Session["customerType"] == null ? 1 : Convert.ToInt32(HttpContext.Current.Session["customerType"]);
                return value;//== null ? 0 : (int)value;
            }
            set
            {
                if (value == 2 || value == 5 || value == 0 || value == 4)
                {
                    value = 1;
                }
                HttpContext.Current.Session["customerType"] = value;
            }
        }
        #endregion

        #region 
        public static long  CustprofileId
        {
            get
            {
                var value = HttpContext.Current.Session["CustprofileId"] == null ? 0 : Convert.ToInt32(HttpContext.Current.Session["CustprofileId"]);
                return value;//== null ? 0 : (int)value;
            }
            set
            {
                HttpContext.Current.Session["CustprofileId"] = value;
            }
        }
        #endregion

        #region RedirectPage
        public static string PageRedirect
        {
            get
            {
                var value = (string)HttpContext.Current.Session["PageRedirect"];
                return value;
            }
            set
            {
                HttpContext.Current.Session["PageRedirect"] = value;
            }
        }
        #endregion

        #region Authoriz.net Customer Profile ID
        public static string CustomerProfileId
        {
            get
            {
                var value = HttpContext.Current.Session["CustomerProfileId"] != null ? HttpContext.Current.Session["CustomerProfileId"].ToString() : "";
                return value;
            }
            set
            {
                HttpContext.Current.Session["CustomerProfileId"] = value;
            }
        }
        #endregion

        #region Total Rows
        public static Int32 TotalRows
        {
            get
            {
                var value = HttpContext.Current.Session["TotalRows"] != null ? Convert.ToInt32(HttpContext.Current.Session["TotalRows"]) : 0;
                return value;
            }
            set
            {
                HttpContext.Current.Session["TotalRows"] = value;
            }
        }
        #endregion

        #region orderID
        public static Int32 orderID
        {
            get
            {
                var value = HttpContext.Current.Session["orderID"] != null ? Convert.ToInt32(HttpContext.Current.Session["orderID"]) : 0;
                return value;
            }
            set
            {
                HttpContext.Current.Session["orderID"] = value;
            }
        }
        #endregion

        #region DeleteTempTable
        public static int DeleteTemp
        {
            get
            {
                var value = HttpContext.Current.Session["DeleteTemp"] != null ? Convert.ToInt32(HttpContext.Current.Session["DeleteTemp"]) : 0;
                return value;
            }
            set
            {
                HttpContext.Current.Session["DeleteTemp"] = value;
            }
        }
        #endregion

        #region AddressList
        public static List<customerAddressExType> AddressList
        {
            get
            {
                var value = HttpContext.Current.Session["AddressList"] != null ? (List<customerAddressExType>)HttpContext.Current.Session["AddressList"] :null ;
                return value;
            }
            set
            {
                HttpContext.Current.Session["AddressList"] = value;
            }
        }
        #endregion

        #region CCList
        public static List<customerPaymentProfileMaskedType> CCList
        {
            get
            {
                var value = HttpContext.Current.Session["CCList"] != null ? (List<customerPaymentProfileMaskedType>)HttpContext.Current.Session["CCList"] : null;
                return value;
            }
            set
            {
                HttpContext.Current.Session["CCList"] = value;
            }
        }
        #endregion

        #region CCList
        public static List<creditCardMaskedType> CCs
        {
            get
            {
                var value = HttpContext.Current.Session["CCs"] != null ? (List<creditCardMaskedType>)HttpContext.Current.Session["CCs"] : null;
                return value;
            }
            set
            {
                HttpContext.Current.Session["CCs"] = value;
            }
        }
        #endregion

        #region InterNationalShipping_Charge
        public static int InterNationalShipping_Charge
        {
            get
            {
                var value = HttpContext.Current.Session["InterNationalShipping_Charge"] != null ? Convert.ToInt32(HttpContext.Current.Session["InterNationalShipping_Charge"]) : -1;
                return value;
            }
            set
            {
                HttpContext.Current.Session["InterNationalShipping_Charge"] = value;
            }
        }
        #endregion

        #region SaveAddress
        public static int SaveAddress
        {
            get
            {
                var value = HttpContext.Current.Session["SaveAddress"] != null ? Convert.ToInt32(HttpContext.Current.Session["SaveAddress"]) : -1;
                return value;
            }
            set
            {
                HttpContext.Current.Session["SaveAddress"] = value;
            }
        }
        #endregion

        #region SaveCC
        public static int SaveCC
        {
            get
            {
                var value = HttpContext.Current.Session["SaveCC"] != null ? Convert.ToInt32(HttpContext.Current.Session["SaveCC"]) : -1;
                return value;
            }
            set
            {
                HttpContext.Current.Session["SaveCC"] = value;
            }
        }
        #endregion

        #region QTYCHARGE
        public static double QTYCHARGE
        {
            get
            {
                var value = HttpContext.Current.Session["QTYCHARGE"] != null ? Convert.ToDouble(HttpContext.Current.Session["QTYCHARGE"]) : 0.00;
                return value;
            }
            set
            {
                HttpContext.Current.Session["QTYCHARGE"] = value;
            }
        }
        #endregion

        #region ShippingCharge
        public static double ShippingCharge
        {
            get
            {
                var value = HttpContext.Current.Session["ShippingCharge"] != null ? Convert.ToDouble(HttpContext.Current.Session["ShippingCharge"]) : 0.00;
                return value;
            }
            set
            {
                HttpContext.Current.Session["ShippingCharge"] = value;
            }
        }
        #endregion

        #region Customer authorizes AddressId
          public static long CusAuthoAddId
         {
            get
            {
                var value = HttpContext.Current.Session["CusAuthoAddId"] == null ? 0 : Convert.ToInt32(HttpContext.Current.Session["CusAuthoAddId"]);
                return value;//== null ? 0 : (int)value;
            }
            set
            {
                HttpContext.Current.Session["CusAuthoAddId"] = value;
            }
        }

        #endregion


        #region Customer authorized PaymentId
        public static long CusAuthoPaymentId
        {
            get
            {
                var value = HttpContext.Current.Session["CusAuthoPaymentId"] == null ? 0 : Convert.ToInt32(HttpContext.Current.Session["CusAuthoPaymentId"]);
                return value;
            }
            set
            {
                HttpContext.Current.Session["CusAuthoPaymentId"] = value;
            }
        }

        #endregion


        #region Page Name
        public static string PageName
        {
            get
            {
                var value = HttpContext.Current.Session["PageName"] != null ? (string)HttpContext.Current.Session["PageName"] : "UpdateMyProfile.aspx";
                return value;
            }
            set
            {
                HttpContext.Current.Session["PageName"] = value;
            }
        }
        #endregion

        #region Shipping Address
        public static customerAddressType ShipAddress
        {
            get
            {
                var value = HttpContext.Current.Session["ShipAddress"] == null ? 0 : HttpContext.Current.Session["ShipAddress"];
                return (customerAddressType)value;
            }
            set
            {
                HttpContext.Current.Session["ShipAddress"] = value;
            }
        }

        #endregion

        #region Captcha
        public static string Captcha
        {
            get
            {
                var value = HttpContext.Current.Session["Captcha"] == null ? 0 : HttpContext.Current.Session["Captcha"];
                return value.ToString();
            }
            set
            {
                HttpContext.Current.Session["Captcha"] = value;
            }
        }
        #endregion


        //min Price
        public static decimal minPrice
        {
            get
            {
                var value = HttpContext.Current.Session["minPrice"] == null ? 0 : HttpContext.Current.Session["minPrice"];
                return Convert.ToDecimal(value);
            }
            set
            {
                HttpContext.Current.Session["minPrice"] = value;
            }
        }
        //MAX Price
        public static decimal maxPrice
        {
            get
            {
                var value = HttpContext.Current.Session["maxPrice"] == null ? 500 : HttpContext.Current.Session["maxPrice"];
                return Convert.ToDecimal(value);
            }
            set
            {
                HttpContext.Current.Session["maxPrice"] = value;
            }
        }
    }
}