using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using AuthorizeNet.Api.Contracts.V1;
using MasterSystem.Common;
using System.Web.Services;

namespace Campco.Common
{
    public partial class CheckOut : System.Web.UI.Page
    {
        dbUtility dbUtl = new dbUtility();
        public List<State> stateList;
        public List<Product> Products = null;
        public double totalAmount = 00.00;
        //public string Customerid="";
        public string cusID = "";
        public List<customerAddressExType> addressList = null;
        public List<creditCardMaskedType> ccList = null;
        public int drop = 0;
        public string addID = "";
        public string CCID = "";
        public int cc = 0;
        public int add = 0;
        public double shipCharge = 0.00;
        public int custype = 0;
        public customerAddressExType result = null;
        public string UserTerm = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            dbUtility dbUtl = new dbUtility();
            lblError.Visible = false;

            //stateList = dbUtl.GetAllStateList();
            // ddlCountry.DataSource = stateList;
            // ddlCountry.DataBind();  
            //if(SessionVariable.CustomerID!= null)
            //{

            //    divnewcust.Visible = false;
            //}
            //else
            //{
            //    divnewcust.Visible = true;
            //}
            try
            {
                HttpContext.Current.Session["sort"] = null;
                if (!IsPostBack)
                {
                    var year = Convert.ToInt32(DateTime.UtcNow.Year);
                    var addyear = Convert.ToInt32(DateTime.UtcNow.AddYears(25).ToString("yyyy"));
                    do
                    {
                        DrpYear.Items.Add(year.ToString());
                        year++;
                    } while (year != addyear);

                }
                addID = Convert.ToString(SessionVariable.CusAuthoAddId);
                CCID = Convert.ToString(SessionVariable.CusAuthoPaymentId);
                cusID = SessionVariable.CustomerID;
                custype = SessionVariable.customerType;
                UserTerm = SessionVariable.Term.ToString();
                
                if (!SessionVariable.CustomerID.StartsWith("G#"))
                {
                    drop = Convert.ToInt32(HttpContext.Current.Session["drop"]);
                    // GetstateList();
                    SessionVariable.CustomerProfileId = dbUtl.GETCustomerINFO(SessionVariable.CustomerID, "", "", "", 0, 1);
                    if (SessionVariable.CustomerProfileId != "")
                    {
                        try
                        {
                            dbUtl.GetCustomer(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), SessionVariable.CustomerProfileId);
                            addressList = SessionVariable.AddressList;
                            ccList = SessionVariable.CCs;//SessionVariable.CCList;
                        }
                        catch (Exception ex)
                        {

                        }
                    }
                    if (addressList == null)
                    {
                        add = 0;
                    }
                    else
                    {
                        add = addressList.Count();
                    }
                    if (ccList == null)
                    {
                        cc = 0;
                    }
                    else
                    {
                        cc = ccList.Count();
                    }


                    if (addID != "0")
                    {
                        var address = addressList.Find(x => x.customerAddressId == addID);
                        if (address != null)
                        {
                            if (address.country == "US")
                            {
                                address.country = "United States";
                            }
                            if (!address.country.StartsWith("United States"))
                            {
                                SessionVariable.InterNationalShipping_Charge = 2;

                            }

                            else
                            {

                                SessionVariable.InterNationalShipping_Charge = 0;

                            }
                        }

                    }


                }

                //Harikrishna Parmar/13-10-2016/Start
                var cart = SessionVariable.AddToCart;
                if (cart != null)
                {
                    //dbUtility dbUtl = new dbUtility();
                    Products = dbUtl.Cart(cart);


                    foreach (var item in Products)
                    {
                        totalAmount += (SessionVariable.customerType == (int)custtype.Retailer ? item.RETAIL_PRS : SessionVariable.IsSpecial > 0 ? item.FinalPrice : item.WHOLE_PRS) * item.QTYinCart;
                        item.RETAIL_PRS = SessionVariable.customerType == (int)custtype.Retailer ? item.RETAIL_PRS : SessionVariable.IsSpecial > 0 ? item.FinalPrice : item.WHOLE_PRS;
                    }

                    SessionVariable.QTYCHARGE = totalAmount;
                    SessionVariable.cart_Count = SessionVariable.AddToCart == null ? 0 : Convert.ToInt32(SessionVariable.AddToCart.Compute("SUM(QTY)", ""));
                    if (SessionVariable.customerType == (int)custtype.Retailer || SessionVariable.CustomerID.StartsWith("G#"))
                    {
                        SessionVariable.ShippingCharge = Convert.ToDouble(dbUtl.ShippingCharge(SessionVariable.cart_Count, Convert.ToDecimal(totalAmount)));
                        shipCharge = (SessionVariable.ShippingCharge);
                    }
                }
                //if (HttpContext.Current.Session["drop"].ToString() == "3")
                //totalAmount += 3;
                SessionVariable.Order_Amount = (decimal)totalAmount;
                SessionVariable.Amount = (decimal)totalAmount + Convert.ToDecimal(SessionVariable.ShippingCharge) + Convert.ToDecimal(HttpContext.Current.Session["drop"] != null ? HttpContext.Current.Session["drop"] : 0);
                //Harikrishna Parmar/13-10-2016/End
            }
            catch (Exception ex)
            {
                dbUtl.logerrors(ex);
            }
        }

        //public void GetstateList(string country = "")
        //{
        //    DataTable dt = new DataTable();
        //    dt = dbUtl.Getdatatable("SP_COTS_GetStateList", country);
        //    //var country=
        //    if (dt.Rows.Count > 0)
        //    {
        //        if (country == "")
        //        {
        //            var x = dt.DefaultView.ToTable("Countries", true, "Country"); ;
        //            DrpCountry.DataTextField = "Country";
        //            DrpCountry.DataValueField = "Country";
        //            DrpCountry.DataSource = x;
        //            DrpCountry.DataBind();
        //            DrpCountry.Items.Insert(0, new ListItem("Select Country", "0"));
        //            DrpStates.Items.Insert(0, new ListItem("Select State", "0"));
        //        }
        //        else
        //        {
        //            dt = dbUtl.Getdatatable("SP_COTS_GetStateList", country);
        //            DrpStates.DataTextField = "StateName";
        //            DrpStates.DataValueField = "StateBrief";
        //            DrpStates.DataSource = dt;
        //            DrpStates.DataBind();

        //            DrpStates.Items.Insert(0, new ListItem("Select State", "0"));
        //        }
        //    }

        //}
        /// <summary>
        /// Harikrishna parmar
        /// <created>15-10-2016</created>
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnProcessOrder_Click(object sender, EventArgs e)
        {
            //var cvvcode = txtCVVVarify.Text.Remove(txtCVVVarify.Text.IndexOf(','));
            dbUtility dbutl = new dbUtility();
            try
            {
                lblError.Visible = false;
                //if (SessionVariable.customerType != 0)
                //{
                // var selectedRadio = Request.Form["payment_method"].ToString();
                //var paymentID = SessionVariable.CusAuthoAddId.ToString();
                // var ShippingAddressID = SessionVariable.CusAuthoPaymentId.ToString();
                var paymentID = Request.Form["paymentProfileID"].ToString();
                var ShippingAddressID = Request.Form["ShippAddressID"].ToString();
                dbUtl.LogInfo("ProcessOrders Buttom Click");
                if (paymentID != "")
                {
                    if (SessionVariable.SaveCC == 1)
                    {
                        SessionVariable.SaveCC = 0;
                    }
                }

                if (ShippingAddressID != "")
                {
                    if (SessionVariable.SaveAddress == 1)
                    {
                        SessionVariable.SaveCC = 0;
                    }
                }

                if (ShippingAddressID == "0")
                {
                    ShippingAddressID = "";
                }
                if (paymentID == "0")
                {
                    paymentID = "";
                }


                if (ShippingAddressID == "" && txtfname.Text == "")
                {

                    lblError.Text = "Please Select Existing address or Enter new address";
                    lblError.Visible = true;
                    return;
                    //ShippingAddressID = SessionVariable.CusAuthoAddId != 0 ? SessionVariable.CusAuthoAddId.ToString() : "";
                }
                if (SessionVariable.Term == "CREDIT CARD")
                {
                    if (paymentID == "" && txtCardNumber.Text == "")
                    {
                        lblError.Text = "Please Select Existing CC Detail or Enter new Credit Card Detail.";
                        lblError.Visible = true;
                        return;
                        // paymentID = SessionVariable.CusAuthoPaymentId != 0 ? SessionVariable.CusAuthoPaymentId.ToString() : "";
                    }
                }

                clsPayment payment = new clsPayment();
                Payment pay = new Payment();
                var ORD_NUM = dbUtl.GenerateOrderNumber();

                AuthorizeNet.Api.Contracts.V1.creditCardType card = new AuthorizeNet.Api.Contracts.V1.creditCardType();
                // var country=DrpCountry.SelectedValue.ToString();
                // var state = DrpStates.SelectedValue.ToString();
                //var x = Request.Form["Country"] + " " + Request.Form["billing_state"];
                if (Convert.ToInt32(HttpContext.Current.Session["drop"]) > 1)
                {
                    ShippingAddressID = "";
                }
                if (ShippingAddressID == "")
                {
                    //ShippingAddressID = "";

                    if (txtfname.Text != "" && txtLname.Text != "" && txtAddress1.ToString() != "" && txtCity.ToString() != "" && DrpCountry.SelectedValue != "0" && txtState.Text != "" && txtTelephone.Text != "" && txtzip.Text != "")
                    {

                        customerAddressType bill_Address = new customerAddressType();
                        bill_Address.firstName = txtfname.Text;//Request.Form["firstName"].ToString();
                        bill_Address.lastName = txtLname.Text;//Request.Form["lastName"].ToString();
                        bill_Address.email = txtEmail.Text == "" ? SessionVariable.UName : txtEmail.Text;//Request.Form["email"].ToString();
                        bill_Address.address = txtAddress2.Text != "" ? txtAddress1.Text + " , " + txtAddress2.Text : txtAddress1.Text;//Request.Form["billing_address1"].ToString() + " , " + Request.Form["billing_address2"].ToString();
                        bill_Address.city = txtCity.Text;//Request.Form["billing_city"].ToString();
                        bill_Address.state = txtState.Text;//Request.Form["billing_state"].ToString();
                        bill_Address.country = DrpCountry.SelectedItem.ToString();//Request.Form["Country"].ToString();
                        bill_Address.faxNumber = txtFax.Text;//Request.Form["billing_fax"].ToString();
                        bill_Address.phoneNumber = txtTelephone.Text;//Request.Form["billing_number"].ToString();
                        bill_Address.zip = txtzip.Text;//Request.Form["billing_postcode"].ToString();
                        bill_Address.company = txtCompany.Text;//Request.Form["CompanyName"].ToString();
                        if (HttpContext.Current.Session["drop"] == null)
                        {
                            HttpContext.Current.Session["drop"] = 0;
                        }
                        if (SessionVariable.customerType != 3)
                        {
                            SessionVariable.UName = txtEmail.Text;
                        }

                        pay.cust_address = bill_Address;
                    }
                    else
                    {
                        lblError.Text = "Please fill all details in shipping Address.";
                        lblError.Visible = true;
                        return;
                    }
                }
                else
                {
                    //var address=payment.GetCustomerProfile()
                    addressList = SessionVariable.AddressList;
                    var address = addressList.Find(x => x.customerAddressId == ShippingAddressID);
                    customerAddressType bill_Address = new customerAddressType();
                    bill_Address.firstName = address.firstName;//txtfname.Text;//Request.Form["firstName"].ToString();
                    bill_Address.lastName = address.lastName;//txtLname.Text;//Request.Form["lastName"].ToString();
                    bill_Address.email = address.email == null ? SessionVariable.UName : address.email;// txtEmail.Text;//Request.Form["email"].ToString();
                    bill_Address.address = address.address;// txtAddress1.Text + " , " + txtAddress2.Text;//Request.Form["billing_address1"].ToString() + " , " + Request.Form["billing_address2"].ToString();
                    bill_Address.city = address.city;// txtCity.Text;//Request.Form["billing_city"].ToString();
                    bill_Address.state = address.state;//txtState.Text;//Request.Form["billing_state"].ToString();
                    if (address.country == "US")
                    {
                        bill_Address.country = "United States (US)";
                    }
                    else
                    {
                        bill_Address.country = address.country;
                    }
                    //bill_Address.country = address.country;//DrpCountry.SelectedValue; //Request.Form["Country"].ToString();
                    bill_Address.faxNumber = address.faxNumber;//txtFax.Text;//Request.Form["billing_fax"].ToString();
                    bill_Address.phoneNumber = address.phoneNumber;//txtTelephone.Text;//Request.Form["billing_number"].ToString();
                    bill_Address.zip = address.zip;//txtzip.Text;//Request.Form["billing_postcode"].ToString();
                    bill_Address.company = address.company;//txtCompany.Text;//Request.Form["CompanyName"].ToString();
                                                           //SessionVariable.UName = txtEmail.Text;
                    var email = SessionVariable.UName;

                    pay.cust_address = bill_Address;


                }
                if (!pay.cust_address.country.StartsWith("United States"))
                {
                    SessionVariable.InterNationalShipping_Charge = 2;

                }

                else
                {
                    
                        SessionVariable.InterNationalShipping_Charge = 0;
                   
                }
                //Card Detail
                if (SessionVariable.customerType == (int)custtype.Retailer)
                {
                    if (txtCardNumber.Text != "")
                    {
                        paymentID = "";
                        if (txtCardNumber.Text != "" && txtCVV.Text != "" && DrpMonth.SelectedValue != "" && DrpYear.SelectedValue != "")
                        {
                            card.cardNumber = txtCardNumber.Text;//Request.Form["CardNumber"].ToString();//"4111111111111111";
                            card.expirationDate = DrpMonth.SelectedValue + DrpYear.SelectedValue.Substring(2);//"0718"
                            card.cardCode = txtCVV.Text;// "123";
                            card.isPaymentToken = false;
                            card.isPaymentTokenSpecified = false;

                            pay.CardDetail = card;
                        }
                        else
                        {
                            lblError.Text = "Please enter valid Card Details.";
                            lblError.Visible = true;
                            return;
                        }
                    }
                    else
                    {
                        card.cardNumber = txtCardNumber.Text;//Request.Form["CardNumber"].ToString();//"4111111111111111";
                        card.expirationDate = DrpMonth.SelectedValue + DrpYear.SelectedValue.Substring(2); ;// Convert.ToString(Request.Form["Exp_Month"] + Request.Form["Exp_year"]);//"0718"
                        card.cardCode = txtCVV.Text;//Request.Form["CardVarificationNumber"];// "123";
                        card.isPaymentToken = false;
                        card.isPaymentTokenSpecified = false;

                        pay.CardDetail = card;
                    }
                }
                else
                {
                    if (SessionVariable.Term == "CREDIT CARD")
                    {
                        if (txtCardNumber.Text != "")
                        {
                            paymentID = "";
                            if (txtCardNumber.Text != "" && DrpMonth.SelectedValue != "" && DrpYear.SelectedValue != "" && txtCVV.Text != "")
                            {
                                card.cardNumber = txtCardNumber.Text;// Request.Form["CardNumber"].ToString();//"4111111111111111";
                                card.expirationDate = DrpMonth.SelectedValue + DrpYear.SelectedValue.Substring(2);//Convert.ToString(Request.Form["Exp_Month"] + Request.Form["Exp_year"]);//"0718"
                                card.cardCode = txtCVV.Text;//Request.Form["CardVarificationNumber"];// "123";
                                card.isPaymentToken = false;
                                card.isPaymentTokenSpecified = false;

                                pay.CardDetail = card;
                            }
                            else
                            {
                                lblError.Text = "Please enter valid Card Details.";
                                lblError.Visible = true;
                                return;
                            }
                        }
                        else
                        {
                            card.cardNumber = txtCardNumber.Text;// Request.Form["CardNumber"].ToString();//"4111111111111111";
                            card.expirationDate = DrpMonth.SelectedValue + DrpYear.SelectedValue.Substring(2);//Convert.ToString(Request.Form["Exp_Month"] + Request.Form["Exp_year"]);//"0718"
                            card.cardCode = txtCVV.Text;//Request.Form["CardVarificationNumber"];// "123";
                            card.isPaymentToken = false;
                            card.isPaymentTokenSpecified = false;

                            pay.CardDetail = card;
                        }

                        if (paymentID == "" && pay.CardDetail.cardNumber == "")
                        {
                            lblError.Text = "Please select Card or provide credit card information.";
                            lblError.Visible = true;
                            return;
                        }
                    }
                }
                //customer billing address
                SessionVariable.ShipAddress = pay.cust_address;
                var cart = SessionVariable.AddToCart;
                var Cart_Products = dbUtl.Cart(cart);

                List<AuthorizeNet.Api.Contracts.V1.lineItemType> ItemList = new List<AuthorizeNet.Api.Contracts.V1.lineItemType>();
                foreach (var item in Cart_Products)
                {
                    AuthorizeNet.Api.Contracts.V1.lineItemType itm = new AuthorizeNet.Api.Contracts.V1.lineItemType();
                    itm.description = item.DESCRIP;
                    itm.itemId = item.PROD_CD;
                    itm.name = item.PROD_CD;
                    itm.quantity = item.QTYinCart;
                    itm.taxable = false;
                    itm.taxableSpecified = false;
                    itm.unitPrice = Convert.ToDecimal((SessionVariable.customerType == (int)custtype.Retailer ? item.RETAIL_PRS : SessionVariable.IsSpecial > 0 ? item.FinalPrice : item.WHOLE_PRS));
                    var PlaceOrder_response = dbUtl.PlaceOrder(Convert.ToInt32(SessionVariable.orderID), SessionVariable.TempOrderID, item.PROD_CD, item.DESCRIP, item.QTYinCart, "01", "", "", Clarion.TodayInt + 1, Clarion.TodayInt, "", Clarion.NowTimeInt, itm.unitPrice.ToString(), 1);
                    ItemList.Add(itm);


                }
                pay.lineItems = ItemList.ToArray<AuthorizeNet.Api.Contracts.V1.lineItemType>();


                if (SessionVariable.customerType == (int)custtype.Retailer || SessionVariable.CustomerID.StartsWith("G#"))
                {
                    SessionVariable.ShippingCharge = Convert.ToDouble(dbUtl.ShippingCharge(SessionVariable.cart_Count, Convert.ToDecimal(SessionVariable.Order_Amount)));
                    shipCharge = (SessionVariable.ShippingCharge);
                }
                //place order in Database

                //-----------------------
                var fee = drop > 0 ? 3 : 0;
                fee += Convert.ToInt32(SessionVariable.ShippingCharge);
                dbUtl.Update(pay, fee);

                if (SessionVariable.CustomerProfileId == "")
                {
                    if (SessionVariable.customerType != (int)custtype.WholeSaler)
                        if (SessionVariable.CustomerID != "GUEST")
                        {
                            var customerInformation = payment.CreateCustomerProfile(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), pay);
                            if (customerInformation.messages.resultCode == messageTypeEnum.Ok)
                            {
                                dbUtl.GETCustomerINFO(SessionVariable.CustomerID, "", customerInformation.customerProfileId, "", 0, 0);
                                SessionVariable.CustomerProfileId = customerInformation.customerProfileId;
                                paymentID = customerInformation.customerPaymentProfileIdList[0];
                            }
                            else
                            {
                                lblError.Text = customerInformation.messages.message.ToString();
                                lblError.Visible = true;
                                return;
                            }
                        }
                }
                else
                {
                    // if (ShippingAddressID == "")
                    // {
                    if (SessionVariable.SaveAddress == 1)
                    {
                        var response = payment.AddShippingInfo(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), SessionVariable.CustomerProfileId, pay.cust_address);
                        if (response != null)
                        {
                            if (response.messages.resultCode == messageTypeEnum.Ok)
                            {
                                ShippingAddressID = response.customerAddressId.ToString();
                                SessionVariable.SaveAddress = 0;
                            }
                            else
                            {
                                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + response.messages.message[0].text + "');", true);
                                //return;
                                ShippingAddressID = response.customerAddressId.ToString();
                                SessionVariable.SaveAddress = 0;
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please fill correct values.');", true);
                            SessionVariable.SaveAddress = 0;
                            return;
                        }
                    }
                    // }
                    //  if (paymentID == "")
                    // {
                    if (SessionVariable.SaveCC == 1)
                    {
                        var response = payment.AddCreditCard(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), SessionVariable.CustomerProfileId, pay.CardDetail);
                        if (response != null)
                        {
                            if (response.messages.resultCode == messageTypeEnum.Ok)
                            {
                                paymentID = response.customerPaymentProfileId.ToString();
                                SessionVariable.SaveCC = 0;
                                txtCVVVarify.Text = txtCVV.Text;
                            }
                            else
                            {
                                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + response.messages.message[0].text + "');", true);
                                lblError.Text = response.messages.message[0].text;
                                lblError.Visible = true;
                                return;
                            }
                        }
                        else
                        {
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please fill correct values.');", true);
                            lblError.Text = "Please fill correct values of Credit card.";//response.messages.message[0].text;
                            lblError.Visible = true;
                            txtCVVVarify.Text = "";
                            return;
                        }
                    }
                    // }

                }
                if ((int)custtype.Retailer == Convert.ToInt32(SessionVariable.customerType) || SessionVariable.CustomerID == "GUEST")
                {

                    if (paymentID == "" || paymentID == null)
                    {
                        var response = payment.Payment(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), pay);
                        //AuthorizeNet.Api.Contracts.V1.createTransactionResponse response = null;
                        if (response != null)
                        {
                            if (response.messages.resultCode == messageTypeEnum.Ok)
                            {
                                if (response.transactionResponse.messages != null)
                                {
                                    #region  place order in table
                                    dbUtl.newTempOrderID(2);
                                    dbUtl.GETCustomerINFO(SessionVariable.CustomerID, response.transactionResponse.transId.ToString(), "", "", SessionVariable.orderID, 2);
                                    #endregion
                                    lblError.Text = response.messages.message[0].ToString();
                                    lblError.Visible = true;
                                    Response.Redirect("Thankyou.aspx", false);
                                }
                                else
                                {
                                    Console.WriteLine("Failed Transaction.");
                                    if (response.transactionResponse.errors != null)
                                    {
                                        Console.WriteLine("Error Code: " + response.transactionResponse.errors[0].errorCode);
                                        lblError.Text = "Error message: " + response.transactionResponse.errors[0].errorText;
                                        lblError.Visible = true;
                                        return;
                                    }
                                }

                            }
                            else
                            {
                                lblError.Text = response.transactionResponse.errors[0].errorText.ToString();
                                lblError.Visible = true;
                                return;
                            }
                        }
                        else
                        {
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please fill currect detail.');", true);
                            lblError.Text = "Please fill currect Credit card detail.";//response.messages.message[0].text;
                            lblError.Visible = true;
                            return;
                        }
                    }
                    else
                    {
                        var arr = txtCVVVarify.Text.Split(',').Where(x => !string.IsNullOrEmpty(x)).ToArray();
                        txtCVVVarify.Text = arr[0];
                        if (txtCVVVarify.Text == "")
                        {
                            lblError.Text = "Please enter CVV number.";
                            lblError.Visible = true;
                            return;
                        }
                        pay.CardDetail.cardCode = txtCVVVarify.Text != "" ? txtCVVVarify.Text : txtCVV.Text;//.Remove(txtCVVVarify.Text.IndexOf(','))
                        var response = payment.ChargePaymentID(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), SessionVariable.CustomerProfileId, paymentID, SessionVariable.Amount, ShippingAddressID, pay);
                        if (response != null)
                        {
                            if (response.messages.resultCode == messageTypeEnum.Ok)
                            {
                                if (response.transactionResponse.messages != null)
                                {
                                    #region  place order in table
                                    dbUtl.newTempOrderID(2);
                                    dbUtl.GETCustomerINFO(SessionVariable.CustomerID, response.transactionResponse.transId.ToString(), "", "", 0, 2);
                                    #endregion

                                    lblError.Text = lblError.Text + " " + response.messages.message[0].ToString();
                                    lblError.Visible = true;
                                    Response.Redirect("Thankyou.aspx", false);
                                }
                                else
                                {
                                    txtCVVVarify.Text = "";
                                    Console.WriteLine("Failed Transaction.");
                                    if (response.transactionResponse.errors != null)
                                    {
                                        Console.WriteLine("Error Code: " + response.transactionResponse.errors[0].errorCode);
                                        lblError.Text = "Error message: " + response.transactionResponse.errors[0].errorText;
                                        lblError.Visible = true;
                                        return;
                                    }
                                }
                            }
                            else
                            {
                                txtCVVVarify.Text = String.Empty;
                                lblError.Text = lblError.Text + " " + response.transactionResponse.errors[0].errorText.ToString();
                                lblError.Visible = true;
                                return;
                            }
                        }
                        else
                        {
                            txtCVVVarify.Text = String.Empty;
                            lblError.Text = "Please fill currect detail.";
                            lblError.Visible = true;
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please fill currect detail.');", true);
                        }
                    }
                }
                else if ((int)custtype.WholeSaler == Convert.ToInt32(SessionVariable.customerType))
                {
                    // #region  place order in table
                    dbUtl.newTempOrderID(2);
                    //dbUtl.GETCustomerINFO(SessionVariable.CustomerID, "", "", 0, 2);
                    //var response = payment.ChargePaymentID(ConfigurationManager.AppSettings["ApiLoginID"].ToString(), ConfigurationManager.AppSettings["ApiTransactionKey"].ToString(), SessionVariable.CustomerProfileId, paymentID, SessionVariable.Amount);
                    // if (response.messages.resultCode == messageTypeEnum.Ok)
                    //  {
                    //    #region  place order in table
                    //     dbUtl.newTempOrderID(2);
                    //     dbUtl.GETCustomerINFO(SessionVariable.CustomerID, response.transactionResponse.transId.ToString(), "", 0, 2);
                    //   #endregion
                    //    lblError.Text = lblError.Text + " " + response.messages.message.ToString();
                    Response.Redirect("Thankyou.aspx", false);
                    //  }
                    // else
                    //  {
                    //      lblError.Text = lblError.Text + " " + response.messages.message.ToString();
                    ////  }
                    //  #endregion
                }

                else
                {
                    SessionVariable.PageRedirect = "~/common/checkout.aspx";
                    Response.Redirect("~/common/Login.aspx", false);
                }
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
        }

        //protected void DrpCountry_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //   // var selectedCountry = DrpCountry.SelectedValue;

        //    //GetstateList(selectedCountry);
        //}

        [System.Web.Services.WebMethod]
        public static decimal Shipping_charge(string value)
        {
            dbUtility dbutl = new dbUtility();
            decimal shipCharge = 000;
            try
            {
                SessionVariable.InterNationalShipping_Charge = Convert.ToInt32(value);

                dbUtility dbUtl = new dbUtility();
                if (SessionVariable.CustomerID.StartsWith("G#") || SessionVariable.CustomerID.StartsWith("GUEST"))
                {
                    SessionVariable.customerType = 1;
                }
                if (Convert.ToInt32(value) != -1)
                {


                    if (SessionVariable.customerType == (int)custtype.Retailer || SessionVariable.CustomerID.StartsWith("G#"))
                    {
                        shipCharge = dbUtl.ShippingCharge(SessionVariable.cart_Count, Convert.ToDecimal(SessionVariable.QTYCHARGE));
                    }
                    else
                    {
                        if (Convert.ToInt32(HttpContext.Current.Session["drop"]) != 0)
                        {
                            shipCharge = Convert.ToDecimal("3.00");
                        }
                    }
                    SessionVariable.Amount = Convert.ToDecimal(SessionVariable.QTYCHARGE) + shipCharge;

                }
                else
                {
                    shipCharge = 0;
                }
                // return shipCharge;
            }
            catch (Exception ex)
            {
                dbutl.logerrors(ex);
            }
            return shipCharge;
        }
        [System.Web.Services.WebMethod]
        public static void SaveADD(string value)
        {
            SessionVariable.SaveAddress = Convert.ToInt32(value);

        } 
        [System.Web.Services.WebMethod]
        public static void SaveCC(string value)
        {
            SessionVariable.SaveCC = Convert.ToInt32(value);

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