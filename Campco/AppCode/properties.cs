using AuthorizeNet.Api.Contracts.V1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Campco
{
    /// <Author>Harikrishna Parmar</Author>
    /// <create>20-09-2016</create>
    /// </summary>
    enum eOperation
    {
        Insert,
        Update,
        Delete,
        Select,
        Search
    }
    /// <summary>
    /// 
    /// </summary>
    enum custtype
    {
        Retailer=1,
        WholeSaler=3,
        admin=10
    }

    
    //enum searchcriteria
    //{
    //    string search[]= {"Best Sellers","Newness","Part Number","Sort by price: low to high","Sort by price: high to low","Inventory (Dealers only)"}
    //   //Newness,                  
    //   //Part Number,
    //   //Sort by price: low to high,

    //   // Sort by price: high to low    
    //   // Inventory (Dealers only)

    //}
    /// <summary>
    /// <Author>Harikrishna Parmar</Author>
    /// <create>20-09-2016</create>
    /// </summary>
    public class BrandList
    {
        public int BRANDID { get; set; }
        public string BRANDNAME { get; set; }
        public string BRANDPIC { get; set; }
        public string BRANDCOLOR { get; set; }
    }
    /// <summary>
    /// <Author>Nisha Patel</Author>
    /// <create>27-09-2016</create>
    /// </summary>
    public class CategoryList
    {

        public int CATEGORYID { get; set; }
        public int PARENTID { get; set; }
        public int SEQUENCE { get; set; }
        public string CATEGORYNAME { get; set; }
        public string SMALLPIC { get; set; }
        public string MEDIUMPIC { get; set; }
        public string LARGEPIC { get; set; }
        public string CATEGORYCOLOR { get; set; }
        public int ITEMPAGESIZE { get; set; }
        public int ITEMPAGECOLUMN { get; set; }
        public int ITEMPICWIDTH { get; set; }
        public int ITEMPICHEIGHT { get; set; }
        public int ACTIVE { get; set; }
        public int ISSPECIAL { get; set; }
        //public int  ISSPECIAL	{get;set;}
        public int ROOTID { get; set; }
        public string FIRSTSTATUSNAME { get; set; }
        public string SECONDSTATUSNAME { get; set; }
    }
    /// <summary>
    /// harikrishna parmar
    /// </summary>
    public class Category
    {
        public int CATEGORYID { get; set; }
        public int PARENTID { get; set; }
        public int SEQUENCE { get; set; }
        public string CATEGORYNAME { get; set; }
        public string SMALLPIC { get; set; }
        public string MEDIUMPIC { get; set; }
        public string LARGEPIC { get; set; }
        public string CATEGORYCOLOR { get; set; }
        public int ITEMPAGESIZE { get; set; }
        public int ITEMPAGECOLUMN { get; set; }
        public int ITEMPICWIDTH { get; set; }
        public int ITEMPICHEIGHT { get; set; }
        public int ACTIVE { get; set; }
        public int ISSPECIAL { get; set; }
        public int ROOTID { get; set; }
        public string FIRSTSTATUSNAME { get; set; }
        public string SECONDSTATUSNAME { get; set; }
    }


    /// <summary>
    /// <Author>Harikrishna Parmar</Author>
    /// <create>20-09-2016</create>
    /// </summary>

    //public class Product
    //{
    //    public string PROD_CD { get; set; }
    //    public int BRANDID { get; set; }
    //    public string SHORTDESCRIPTION { get; set; }
    //    public string SMALLPIC { get; set; }
    //    public string MEDIUMPIC { get; set; }
    //    public string LARGEPIC { get; set; }
    //    public string EXTRAPIC { get; set; }
    //    public string PRICEDISPLAYCUSTOMER { get; set;}
    //    public string CATEGORYID { get; set; }
    //}


    /// <summary>
    /// <Author>Harikrishna Parmar</Author>
    /// <create>20-09-2016</create>
    /// </summary>
    public class Product
    {
        public string CATEGORYNAME { get; set; }
        public string CATEGORYID { get; set; }
        public string catPic { get; set; }
        public string PROD_CD { get; set; }
        public int SHOWFORCUSTOMER { get; set; }
        public int SHOWFORSALES { get; set; }
        public int SHOWFORMANAGER { get; set; }
        public int ACTIVE { get; set; }
        public int BACKORDERCUSTOMER { get; set; }
        public int BACKORDERSALES { get; set; }
        public int BACKORDERMANAGER { get; set; }
        public int QTYCONTROLCUSTOMER { get; set; }
        public int QTYCONTROLSALES { get; set; }
        public int QTYCONTROLMANAGER { get; set; }
        public int QTYINFOCUSTOMER { get; set; }
        public int QTYINFOSALES { get; set; }
        public int QTYINFOMANAGER { get; set; }
        public string SHORTDESCRIPTION { get; set; }
        public string SMALLPIC { get; set; }
        public string MEDIUMPIC { get; set; }
        public string LARGEPIC { get; set; }
        public string EXTRAPIC { get; set; }
        public int MANUFACTUREID { get; set; }
        public int MODELID { get; set; }
        public int STYLEID { get; set; }
        public int FIRSTSTATUSID { get; set; }
        public int SECONDSTATUSID { get; set; }
        public int MISCID { get; set; }
        public int ISSPECIAL { get; set; }
        public int PRICEDISPLAYCUSTOMER { get; set; }
        public int PRICEDISPLAYSALES { get; set; }
        public int PRICEDISPLAYMANAGER { get; set; }
        public int BRANDID { get; set; }
        public int MODELSEQ { get; set; }
        public int STYLESEQ { get; set; }
        public int BRANDSEQ { get; set; }
        public int TARGETQTYOPTIONCUSTOMER { get; set; }
        public int TARGETQTYOPTIONSALES { get; set; }
        public int TARGETQTYOPTIONMANAGER { get; set; }
        public int LIMITQTYOPTIONCUSTOMER { get; set; }
        public int LIMITQTYOPTIONSALES { get; set; }
        public int LIMITQTYOPTIONMANAGER { get; set; }
        public int LIMITQTYCUSTOMER { get; set; }
        public int LIMITQTYSALES { get; set; }
        public int LIMITQTYMANAGER { get; set; }
        public int QTYinCart { get; set; }

        public double FinalPrice { get; set; }
        ////////////////////////////////////////
        public string DESCRIP { get; set; }
        public string DESCRIP1 { get; set; }
        public string DESCRIP2 { get; set; }
        public string DetailDescription { get; set; }
        public string unit_size { get; set; }
        public string UNIT_NM { get; set; }
        public string MyProperty { get; set; }
        public string MINSTOCK { get; set; }
        public string PRS_TYPE { get; set; }
        public double RETAIL_PRS { get; set; }
        public double WHOLE_PRS { get; set; }
        public string WHOLE_PRS2 { get; set; }
        public string WHOLE_PRS3 { get; set; }
        public string CORP_PRS { get; set; }
        public string PRICE_1 { get; set; }
        public string PRICE_2 { get; set; }
        public string PRICE_3 { get; set; }
        public string PRICE_4 { get; set; }
        public string PRICE_5 { get; set; }
        public string PRICE_6 { get; set; }
        public string RG_X { get; set; }
        public string RG_0 { get; set; }
        public string RG_1 { get; set; }
        public string RG_2 { get; set; }
        public string RG_3 { get; set; }
        public string RG_4 { get; set; }
        public string RG_5 { get; set; }
        public string RG_6 { get; set; }
        public string CLASS_CD { get; set; }
        //-------------------------------
        public List<ExtraPic> extraPic { get; set; }

    }
    public class ExtraPic
    {
        public string smallPic { get; set; }
        public string midPic { get; set; }
        public string LargePic { get; set; }
        public string XlargePic { get; set; }

    }
    /// <summary>

    /// <summary>
    /// <Author>Nisha Patel</Author>
    /// <create>23-09-2016</create>
    /// </summary>
    public class Registration_Property
    {
        public string CUS_ID { get; set; }
        public string CUS_NM { get; set; }
        public string CUS_TYPE { get; set; }
        public string EMAIL_ADR { get; set; }
        public string WEB_ADR { get; set; }
        public string PHONE { get; set; }
        public string PHONE_2 { get; set; }
        public string Password { get; set; }
        public string SHP_ADDRESS { get; set; }
        public string SHP_ADDRESS2 { get; set; }
        public string SHP_CITY { get; set; }
        public string SHP_STATE { get; set; }
        public string SHP_ZIP { get; set; }
        public string SHP_COUNTRY { get; set; }
        public string EMail { get; set; }
        public string ATTN { get; set; }
        public string FIRST_NM { get; set; }
        public string LAST_NM { get; set; }
        public string CUS_NT1 { get; set; }
        public string CUS_NT2 { get; set; }
        public string LoginName { get; set;}
        public string ADDRESS { get; set; }
        public string ADDRESS2 { get; set; }
        public string CITY { get; set; }
        public string STATE{get;set;}
        public string COUNTRY { get; set; }
        public string ZIP { get; set; }
        public string SLS_TYPE {get; set;}
        public string VALID { get; set; }
        public string SALES_NUM { get; set; }
        public string SALES_NUM2 { get; set; }
        public string Fax { get; set; }
    }

    /// <Author>Nisha Patel</Author>
    /// <create>27-09-2016</create>
    /// </summary>        
    /// 

    public class State
    {
        public int State_ID;
        public string StateName;
        public string StateBrief;
        public string Country;
    }

    public class Payment
    {
        public creditCardType CardDetail { get; set; }
        public lineItemType[] lineItems { get; set; }
        public customerAddressType cust_address { get; set; }
        public customerProfileType Cust_Prof { get; set; }
    }

   
     public class Item
    {
        public string description { get; set; }
        public string itemId { get; set; }
        public string name { get; set; }
        public decimal quantity { get; set; }
        public bool taxable { get; set; }
        public bool taxableSpecified { get; set; }
        public decimal unitPrice { get; set; }
    }

    public class Newssubscribe
    {

        public string Subscibe_Name { get; set; }
        public string Subscribe_Email { get; set; }
        public int Subscribe { get; set;}
    }
    public class OrderDetail
    {
        public string Cus_Id { get; set; }
        public string ORD_NUM { get; set; }
        public string ORD_DT { get; set; }
        public string ORDER_QTY { get; set; }
        public string ORD_AMT { get; set; }
        public string PO_NUM { get; set; }
        public string SmallPic { get; set; }
        public string UNIT_PRS { get; set; }
        public List<string> INVS_NUM { get; set; }
        public string DESC{ get; set; }

        public string PROD_CD { get; set; }
        public List<string> Traking { get; set; }

        public string HANDL_FEE { get; set; }
    }
    /// <Author>Nisha Patel</Author>
    /// </summary>        
    /// 
    public class Autho_Detail
    {
        public string CUS_ID { get; set;}
        public string CustInfoID { get; set; }
        public string CustPaymentProfId { get; set; }
        public string CustaddId { get; set; }


    }

    public class Banners_Photo
    {
        public string Brand_Banner_Id { get; set;}
        public string CategoryId { get; set;}
        public string Banner_Path { get; set;}
        public string Status {get; set;}
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string OrderBy { get; set; }
        public string Banner_Position { get; set; }

    }
}