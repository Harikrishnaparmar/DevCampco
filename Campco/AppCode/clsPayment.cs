using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AuthorizeNet.Api.Controllers;
using AuthorizeNet.Api.Contracts.V1;
using AuthorizeNet.Api.Controllers.Bases;

namespace Campco
{
    public class clsPayment
    {
        #region Payment
        dbUtility dbutl = new dbUtility();
        public createTransactionResponse Payment(String ApiLoginID, String ApiTransactionKey, Payment Payment)
        {
            dbutl.LogInfo("Charge Credit Card Sample");

            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;

            // define the merchant information (authentication / transaction id)
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey
            };

            var creditCard = new creditCardType
            {
                cardNumber = Payment.CardDetail.cardNumber,//"4111111111111111",
                expirationDate = Payment.CardDetail.expirationDate,//"0718",
                cardCode = Payment.CardDetail.cardCode//"123"
            };

            var billingAddress = new customerAddressType
            {
                firstName = Payment.cust_address.firstName,//"John",
                lastName = Payment.cust_address.lastName,//"Doe",
                address = Payment.cust_address.address,//"123 My St",
                city = Payment.cust_address.city,//"OurTown",
                zip = Payment.cust_address.zip, //"98004"
                email= Payment.cust_address.email
            };

            var shippingAddress = new customerAddressType
            {
                firstName = Payment.cust_address.firstName,//"John",
                lastName = Payment.cust_address.lastName,//"Doe",
                address = Payment.cust_address.address,//"123 My St",
                city = Payment.cust_address.city,//"OurTown",
                zip = Payment.cust_address.zip,//"98004"
                email = Payment.cust_address.email
            };

            //standard api call to retrieve response
            var paymentType = new paymentType { Item = creditCard };
            var orderInformation = new orderType { invoiceNumber = SessionVariable.orderID.ToString(),description=Payment.cust_address.email };
            var profile = new customerDataType { email=Payment.cust_address.email}; 

            // Add line Items
            //var lineItems = new lineItemType[2];
            //lineItems[0] = new lineItemType { itemId = "1", name = "t-shirt", quantity = 2, unitPrice = new Decimal(15.00) };
            //lineItems[1] = new lineItemType { itemId = "2", name = "snowboard", quantity = 1, unitPrice = new Decimal(450.00) };
            // lineItems = Payment.lineItems.ToArray();
           // var email = customerDataType{ email=""};
           
            var transactionRequest = new transactionRequestType
            {
                transactionType = transactionTypeEnum.authOnlyTransaction.ToString(),    // charge the card
                //profile =new customerProfilePaymentType  } profile,//Payment.cust_address.email,
                customer=profile,
                amount = SessionVariable.Amount,
                payment = paymentType,
                billTo = Payment.cust_address,
                shipTo=Payment.cust_address,//billingAddress,
                lineItems = Payment.lineItems,
                order=orderInformation,
                
                
            };

            var request = new createTransactionRequest { transactionRequest = transactionRequest };

            // instantiate the contoller that will call the service
            var controller = new createTransactionController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();

            //validate
            if (response != null)
            {
                if (response.messages.resultCode == messageTypeEnum.Ok)
                {
                    if (response.transactionResponse.messages != null)
                    {
                        dbutl.LogInfo("Successfully created transaction with Transaction ID: " + response.transactionResponse.transId);
                        dbutl.LogInfo("Response Code: " + response.transactionResponse.responseCode);
                        dbutl.LogInfo("Message Code: " + response.transactionResponse.messages[0].code);
                        dbutl.LogInfo("Description: " + response.transactionResponse.messages[0].description);
                        dbutl.LogInfo("Success, Auth Code : " + response.transactionResponse.authCode);
                    }
                    else
                    {
                        dbutl.LogInfo("PaymentMethod");
                        dbutl.LogInfo("Failed Transaction.");
                        if (response.transactionResponse.errors != null)
                        {
                            dbutl.LogInfo("Error Code: " + response.transactionResponse.errors[0].errorCode);
                            dbutl.LogInfo("Error message: " + response.transactionResponse.errors[0].errorText);
                        }
                    }
                }
                else
                {
                    dbutl.LogInfo("Failed Transaction.");
                    if (response.transactionResponse != null && response.transactionResponse.errors != null)
                    {
                        dbutl.LogInfo("Error Code: " + response.transactionResponse.errors[0].errorCode);
                        dbutl.LogInfo("Error message: " + response.transactionResponse.errors[0].errorText);
                    }
                    else
                    {
                        dbutl.LogInfo("Error Code: " + response.messages.message[0].code);
                        dbutl.LogInfo("Error message: " + response.messages.message[0].text);
                    }
                }
            }
            else
            {
                dbutl.LogInfo("Null Response.");
            }

            return response;
        }
        #endregion

        #region Customer Profile
        public createCustomerProfileResponse CreateCustomerProfile(string ApiLoginID, string ApiTransactionKey, Payment payment, int reg=0)
        {            
            dbutl.LogInfo("CreateCustomerProfile Sample");
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey,
            };

            //var creditCard = new creditCardType
            //{
            //    cardNumber = payment.CardDetail.cardNumber.ToString(),//"4111111111111111",
            //    expirationDate = payment.CardDetail.expirationDate.ToString() //"0718"
            //};
            //var bankAccount = new bankAccountType
            //{
            //    accountNumber = "231323342",
            //    routingNumber = "000000224",
            //    accountType = bankAccountTypeEnum.checking,
            //    echeckType = echeckTypeEnum.WEB,
            //    nameOnAccount = "test",
            //    bankName = "Bank Of America"
            //};
            //standard api call to retrieve response
            //paymentType cc = new paymentType { Item = creditCard };
            //paymentType echeck = new paymentType { Item = bankAccount };
            //List<customerPaymentProfileType> paymentProfileList = new List<customerPaymentProfileType>();
            //customerPaymentProfileType ccPaymentProfile = new customerPaymentProfileType();
            // ccPaymentProfile.payment = cc;
            //customerPaymentProfileType echeckPaymentProfile = new customerPaymentProfileType();
            //echeckPaymentProfile.payment = echeck;
            //  paymentProfileList.Add(ccPaymentProfile);
            //paymentProfileList.Add(echeckPaymentProfile);
            //customerAddressType officeAddress = new customerAddressType();
            //officeAddress.address = payment.cust_address.address;
            //officeAddress.city = payment.cust_address.city; 
            //officeAddress.zip = payment.cust_address.zip; 
            //addressInfoList.Add(officeAddress);
            // customerProfile.paymentProfiles = paymentProfileList.ToArray();
            List<customerAddressType> addressinfolist = new List<customerAddressType>();
            customerAddressType homeaddress = new customerAddressType();
            customerProfileType customerProfile = new customerProfileType();
            //if (reg != 0)
            //{
            //    customerProfile.merchantCustomerId = SessionVariable.CustomerID;
            //    customerProfile.email = payment.Cust_Prof.email;
            //}
             if (reg == 1)
            {
                customerProfile.merchantCustomerId = SessionVariable.CustomerID;
                customerProfile.email = payment.Cust_Prof.email;
            }
            else if(reg==3)
            {
                homeaddress.address = payment.cust_address.address;//"10900 ne 8th st";
                homeaddress.city = payment.cust_address.city; //"seattle";
                homeaddress.zip = payment.cust_address.zip; //"98006";
                homeaddress.country = payment.cust_address.country;
                homeaddress.state = payment.cust_address.state;
                homeaddress.firstName = payment.cust_address.firstName;
                homeaddress.lastName = payment.cust_address.lastName;
                addressinfolist.Add(homeaddress);
                customerProfile.merchantCustomerId = SessionVariable.CustomerID;
                customerProfile.email = payment.Cust_Prof.email;
                customerProfile.shipToList = addressinfolist.ToArray();

            }
            else
            {
                homeaddress.address = payment.cust_address.address;//"10900 ne 8th st";
                homeaddress.city = payment.cust_address.city; //"seattle";
                homeaddress.zip = payment.cust_address.zip; //"98006";
                homeaddress.country = payment.cust_address.country;
                homeaddress.state = payment.cust_address.state;
                homeaddress.firstName = payment.cust_address.firstName;
                homeaddress.lastName = payment.cust_address.lastName;
                addressinfolist.Add(homeaddress);
                customerProfile.merchantCustomerId = SessionVariable.CustomerID;
                customerProfile.email = payment.Cust_Prof.email;
                customerProfile.shipToList = addressinfolist.ToArray();
            }         
            var request = new createCustomerProfileRequest { profile = customerProfile, validationMode = validationModeEnum.none };
            var controller = new createCustomerProfileController(request);          // instantiate the contoller that will call the service
            controller.Execute();
            createCustomerProfileResponse response = controller.GetApiResponse();   // get the response from the service (errors contained if any)
            //validate
            if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
            {
                if (response != null && response.messages.message != null)
                {
                    dbutl.LogInfo("Success, CustomerProfileID : " + response.customerProfileId);
                    //dbutl.LogInfo("Success, CustomerPaymentProfileID : " + response.customerPaymentProfileIdList[0]);
                    if(reg==1)
                    {

                    }
                    else if(reg==3)
                    { 
                    dbutl.LogInfo("Success, CustomerShippingProfileID : " + response.customerShippingAddressIdList[0]);
                    }
                    else
                    {
                        dbutl.LogInfo("Success, CustomerShippingProfileID : " + response.customerShippingAddressIdList[0]);
                    }
                }
            }
            else if (response != null)
            {
                dbutl.LogInfo("Error: " + response.messages.message[0].code + "  " + response.messages.message[0].text);
            }

            return response;

        }

        #endregion

        #region Get Customer Profile
        public  getCustomerProfileResponse GetCustomerProfile(String ApiLoginID, String ApiTransactionKey, string customerProfileId)
        {
            dbutl.LogInfo("Get Customer Profile sample");

            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
            // define the merchant information (authentication / transaction id)
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey,
            };

            var request = new getCustomerProfileRequest();
            request.customerProfileId = customerProfileId;
            
            

            // instantiate the controller that will call the service
            var controller = new getCustomerProfileController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();

            if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
            {
                dbutl.LogInfo(response.messages.message[0].text);
                dbutl.LogInfo("Customer Profile Id: " + response.profile.customerProfileId);

                if (response.subscriptionIds != null && response.subscriptionIds.Length > 0)
                {
                    dbutl.LogInfo("List of subscriptions : ");
                    for (int i = 0; i < response.subscriptionIds.Length; i++)
                        dbutl.LogInfo(response.subscriptionIds[i]);
                }

            }
            else if (response != null)
            {
                dbutl.LogInfo("Error: " + response.messages.message[0].code + "  " +
                                  response.messages.message[0].text);
            }

            return response;
        }
        #endregion

        #region Get Customer Profile IDs
        public ANetApiResponse GetCustomerProfileIDs(String ApiLoginID, String ApiTransactionKey)
        {
            dbutl.LogInfo("Get Customer Profile Id sample");

            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
            // define the merchant information (authentication / transaction id)
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey,
            };

            var request = new getCustomerProfileIdsRequest();

            // instantiate the controller that will call the service
            var controller = new getCustomerProfileIdsController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();

            if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
            {
                dbutl.LogInfo(response.messages.message[0].text);
                dbutl.LogInfo("Customer Profile Ids: ");
                foreach (var id in response.ids)
                {
                    dbutl.LogInfo(id);
                }
            }
            else if (response != null)
            {
                dbutl.LogInfo("Error: " + response.messages.message[0].code + "  " +
                                  response.messages.message[0].text);
            }

            return response;
        }
        #endregion

        #region Update Customer Profile
        public static ANetApiResponse UpdateCustomerProfile(String ApiLoginID, String ApiTransactionKey, string customerProfileId)
        {
            dbUtility dbutl = new dbUtility();
            dbutl.LogInfo("Update customer profile sample");

            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
            // define the merchant information (authentication / transaction id)
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey,
            };

            var profile = new customerProfileExType
            {
                merchantCustomerId = "custId123",
                description = "some description",
                email = "newaddress@example.com",
                customerProfileId = customerProfileId
            };

            var request = new updateCustomerProfileRequest();
            request.profile = profile;

            // instantiate the controller that will call the service
            var controller = new updateCustomerProfileController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();

            if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
            {
                dbutl.LogInfo(response.messages.message[0].text);
            }
            else if (response != null)
            {
                dbutl.LogInfo("Error: " + response.messages.message[0].code + "  " +
                                  response.messages.message[0].text);
            }

            return response;
        }
        #endregion

        #region Delete Customer Profile
        public static ANetApiResponse DeleteCustomerProfile(String ApiLoginID, String ApiTransactionKey, string customerProfileId)
        {
            dbUtility dbutl = new dbUtility();
            dbutl.LogInfo("DeleteCustomerProfile Sample");
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey,
            };

            //please update the subscriptionId according to your PRODUCTIONcredentials
            var request = new deleteCustomerProfileRequest
            {
                customerProfileId = customerProfileId
            };

            //Prepare Request
            var controller = new deleteCustomerProfileController(request);
            controller.Execute();

            //Send Request to EndPoint
            deleteCustomerProfileResponse response = controller.GetApiResponse();
            if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
            {
                if (response != null && response.messages.message != null)
                {
                    dbutl.LogInfo("Success, ResultCode : " + response.messages.resultCode.ToString());
                }
            }
            else if (response != null && response.messages.message != null)
            {
                dbutl.LogInfo("Error: " + response.messages.message[0].code + "  " + response.messages.message[0].text);
            }

            return response;
        }
        #endregion

        #region Create Customer Payment Profile
        public static ANetApiResponse CreateCustomerPaymentProfile(String ApiLoginID, String ApiTransactionKey, string customerProfileId)
        {
            dbUtility dbutl = new dbUtility();
            dbutl.LogInfo("CreateCustomerPaymentProfile Sample");
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey,
            };

            var bankAccount = new bankAccountType
            {
                accountNumber = "01245524321",
                routingNumber = "000000204",
                accountType = bankAccountTypeEnum.checking,
                echeckType = echeckTypeEnum.WEB,
                nameOnAccount = "test",
                bankName = "Bank Of America"
            };

            paymentType echeck = new paymentType { Item = bankAccount };

            var billTo = new customerAddressType
            {
                firstName = "John",
                lastName = "Snow"
            };
            customerPaymentProfileType echeckPaymentProfile = new customerPaymentProfileType();
            echeckPaymentProfile.payment = echeck;
            echeckPaymentProfile.billTo = billTo;

            var request = new createCustomerPaymentProfileRequest
            {
                customerProfileId = customerProfileId,
                paymentProfile = echeckPaymentProfile,
                validationMode = validationModeEnum.none
            };

            //Prepare Request
            var controller = new createCustomerPaymentProfileController(request);
            controller.Execute();

            //Send Request to EndPoint
            createCustomerPaymentProfileResponse response = controller.GetApiResponse();
            if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
            {
                if (response != null && response.messages.message != null)
                {
                    dbutl.LogInfo("Success, createCustomerPaymentProfileID : " + response.customerPaymentProfileId);
                }
            }
            else
            {
                dbutl.LogInfo("Error: " + response.messages.message[0].code + "  " + response.messages.message[0].text);
                if (response.messages.message[0].code == "E00039")
                {
                    dbutl.LogInfo("Duplicate ID: " + response.customerPaymentProfileId);
                }
            }

            return response;

        }
        #endregion

        #region Authorize a Credit Card
        public static ANetApiResponse AuthorizeCreditCard(String ApiLoginID, String ApiTransactionKey, decimal amount)
        {
            dbUtility dbutl = new dbUtility();
            dbutl.LogInfo("Authorize Credit Card Sample");

            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;

            // define the merchant information (authentication / transaction id)
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey,

            };

            var creditCard = new creditCardType
            {
                cardNumber = "4111111111111111",
                expirationDate = "0718"
            };

            //standard api call to retrieve response
            var paymentType = new paymentType { Item = creditCard };

            var transactionRequest = new transactionRequestType
            {
                transactionType = transactionTypeEnum.authOnlyTransaction.ToString(),    // authorize only
                amount = amount,
                payment = paymentType
            };

            var request = new createTransactionRequest { transactionRequest = transactionRequest };

            // instantiate the contoller that will call the service
            var controller = new createTransactionController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();

            //validate
            if (response != null)
            {
                if (response.messages.resultCode == messageTypeEnum.Ok)
                {
                    if (response.transactionResponse.messages != null)
                    {
                        dbutl.LogInfo("Successfully created transaction with Transaction ID: " + response.transactionResponse.transId);
                        dbutl.LogInfo("Response Code: " + response.transactionResponse.responseCode);
                        dbutl.LogInfo("Message Code: " + response.transactionResponse.messages[0].code);
                        dbutl.LogInfo("Description: " + response.transactionResponse.messages[0].description);
                        dbutl.LogInfo("Success, Auth Code : " + response.transactionResponse.authCode);
                    }
                    else
                    {
                        dbutl.LogInfo("Failed Transaction.");
                        if (response.transactionResponse.errors != null)
                        {
                            dbutl.LogInfo("Error Code: " + response.transactionResponse.errors[0].errorCode);
                            dbutl.LogInfo("Error message: " + response.transactionResponse.errors[0].errorText);
                        }
                    }
                }
                else
                {
                    dbutl.LogInfo("Failed Transaction.");
                    if (response.transactionResponse != null && response.transactionResponse.errors != null)
                    {
                        dbutl.LogInfo("Error Code: " + response.transactionResponse.errors[0].errorCode);
                        dbutl.LogInfo("Error message: " + response.transactionResponse.errors[0].errorText);
                    }
                    else
                    {
                        dbutl.LogInfo("Error Code: " + response.messages.message[0].code);
                        dbutl.LogInfo("Error message: " + response.messages.message[0].text);
                    }
                }
            }
            else
            {
                dbutl.LogInfo("Null Response.");
            }

            return response;
        }
        #endregion

        #region Add Credit Card on customer Profile
        public createCustomerPaymentProfileResponse AddCreditCard(String ApiLoginID, String ApiTransactionKey, string customerProfileId, creditCardType card)
        {
            dbutl.LogInfo("CreateCustomerPaymentProfile Sample");
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey,
            };

            var creditCard = new creditCardType
            {
                cardNumber = card.cardNumber,//"4111111111111111",
                expirationDate = card.expirationDate,//Payment.CardDetail.expirationDate,//"0718",
                cardCode = card.cardCode//Payment.CardDetail.cardCode//"123"
            };
            //var bankAccount = new bankAccountType
            //{
            //    accountNumber = "01245524321",
            //    routingNumber = "000000204",
            //    accountType = bankAccountTypeEnum.checking,
            //    echeckType = echeckTypeEnum.WEB,
            //    nameOnAccount = "test",
            //    bankName = "Bank Of America"
            //};

            //paymentType echeck = new paymentType { Item = bankAccount };

            //var billTo = new customerAddressType
            //{
            //    firstName = "John",
            //    lastName = "Snow"
            //};
            paymentType cc = new paymentType { Item = creditCard };
            customerPaymentProfileType CCPaymentProfile = new customerPaymentProfileType();
            CCPaymentProfile.payment = cc;
            //echeckPaymentProfile.billTo = billTo;

            var request = new createCustomerPaymentProfileRequest
            {
                customerProfileId = customerProfileId,
                paymentProfile = CCPaymentProfile,
                validationMode = validationModeEnum.none
            };

            //Prepare Request
            var controller = new createCustomerPaymentProfileController(request);
            controller.Execute();

            //Send Request to EndPoint
            createCustomerPaymentProfileResponse response = controller.GetApiResponse();
            if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
            {
                if (response != null && response.messages.message != null)
                {
                    dbutl.LogInfo("Success, createCustomerPaymentProfileID : " + response.customerPaymentProfileId);
                }
            }
            else
            {
                dbutl.LogInfo("Error: " + response.messages.message[0].code + "  " + response.messages.message[0].text);
                if (response.messages.message[0].code == "E00039")
                {
                    dbutl.LogInfo("Duplicate ID: " + response.customerPaymentProfileId);
                }
            }

            return response;

        }
        #endregion

        #region Get CreditCard Detail
        public static ANetApiResponse GetCreditCardDetail(String ApiLoginID, String ApiTransactionKey, string customerProfileId,string customerPaymentProfileId)
        {
            dbUtility dbutl = new dbUtility();
            dbutl.LogInfo("Get Customer Payment Profile sample");

            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
            // define the merchant information (authentication / transaction id)
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey,
            };

            var request = new getCustomerPaymentProfileRequest();
            request.customerProfileId = customerProfileId;
            request.customerPaymentProfileId = customerPaymentProfileId;

            // Set this optional property to true to return an unmasked expiration date
            //request.unmaskExpirationDateSpecified = true;
            //request.unmaskExpirationDate = true;


            // instantiate the controller that will call the service
            var controller = new getCustomerPaymentProfileController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();

            if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
            {
                dbutl.LogInfo(response.messages.message[0].text);
                dbutl.LogInfo("Customer Payment Profile Id: " + response.paymentProfile.customerPaymentProfileId);
                if (response.paymentProfile.payment.Item is creditCardMaskedType)
                {
                    dbutl.LogInfo("Customer Payment Profile Last 4: " + (response.paymentProfile.payment.Item as creditCardMaskedType).cardNumber);
                    dbutl.LogInfo("Customer Payment Profile Expiration Date: " + (response.paymentProfile.payment.Item as creditCardMaskedType).expirationDate);

                    if (response.paymentProfile.subscriptionIds != null && response.paymentProfile.subscriptionIds.Length > 0)
                    {
                        dbutl.LogInfo("List of subscriptions : ");
                        for (int i = 0; i < response.paymentProfile.subscriptionIds.Length; i++)
                            dbutl.LogInfo(response.paymentProfile.subscriptionIds[i]);
                    }
                }
            }
            else if (response != null)
            {
                dbutl.LogInfo("Error: " + response.messages.message[0].code + "  " +
                                  response.messages.message[0].text);
            }

            return response;
        }
        #endregion

        #region Delete CreditCardDetail
        public  ANetApiResponse DeleteCreditCard(String ApiLoginID, String ApiTransactionKey, string customerProfileId,string customerPaymentProfileId)
        {
            dbutl.LogInfo("DeleteCustomerPaymentProfile Sample");
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey,
            };

            //please update the subscriptionId according to your PRODUCTIONcredentials
            var request = new deleteCustomerPaymentProfileRequest
            {
                customerProfileId = customerProfileId,
                customerPaymentProfileId = customerPaymentProfileId
            };

            //Prepare Request
            var controller = new deleteCustomerPaymentProfileController(request);
            controller.Execute();

            //Send Request to EndPoint
            deleteCustomerPaymentProfileResponse response = controller.GetApiResponse();
            if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
            {
                if (response != null && response.messages.message != null)
                {
                    dbutl.LogInfo("Success, ResultCode : " + response.messages.resultCode.ToString());
                }
            }
            else if (response != null)
            {
                dbutl.LogInfo("Error: " + response.messages.message[0].code + "  " + response.messages.message[0].text);
            }

            return response;
        }
        #endregion

        #region Add Shipping Address
        public createCustomerShippingAddressResponse AddShippingInfo(String ApiLoginID, String ApiTransactionKey, string customerProfileId, customerAddressType address)
        {
            dbutl.LogInfo("CreateCustomerShippingAddress Sample");
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey,
            };

            customerAddressType Shipping = new customerAddressType();
            Shipping.firstName = address.firstName;
            Shipping.lastName = address.lastName;
            Shipping.address = address.address;
            Shipping.city = address.city;
            Shipping.zip = address.zip;
            Shipping.phoneNumber = address.phoneNumber;
            Shipping.email = address.email;
            Shipping.country = address.country;
            Shipping.state = address.state;


            var request = new createCustomerShippingAddressRequest
            {
                customerProfileId = customerProfileId,
                address = Shipping,
            };

            //Prepare Request
            var controller = new createCustomerShippingAddressController(request);
            controller.Execute();

            //Send Request to EndPoint
            createCustomerShippingAddressResponse response = controller.GetApiResponse();
            if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
            {
                if (response != null && response.messages.message != null)
                {
                    dbutl.LogInfo("Success, customerAddressId : " + response.customerAddressId);
                }
            }
            else if (response != null)
            {
                dbutl.LogInfo("Error: " + response.messages.message[0].code + "  " + response.messages.message[0].text);
            }

            return response;
        }
        #endregion

        #region Get Shipping Address
        public static ANetApiResponse GetShippingAddress(String ApiLoginID, String ApiTransactionKey, string customerProfileId,string customerAddressId)
        {
            dbUtility dbutl = new dbUtility();
            dbutl.LogInfo("Get Customer Shipping Address sample");

            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
            // define the merchant information (authentication / transaction id)
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey,
            };

            var request = new getCustomerShippingAddressRequest();
            request.customerProfileId = customerProfileId;
            request.customerAddressId = customerAddressId;

            // instantiate the controller that will call the service
            var controller = new getCustomerShippingAddressController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();

            if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
            {
                dbutl.LogInfo(response.messages.message[0].text);
                if (response.subscriptionIds != null && response.subscriptionIds.Length > 0)
                {
                    dbutl.LogInfo("List of subscriptions : ");
                    for (int i = 0; i < response.subscriptionIds.Length; i++)
                        dbutl.LogInfo(response.subscriptionIds[i]);
                }

            }
            else if (response != null)
            {
                dbutl.LogInfo("Error: " + response.messages.message[0].code + "  " +
                                  response.messages.message[0].text);
            }

            return response;
        }
        #endregion

        #region Delete Shipping Address
        public ANetApiResponse DeleteShippingAddress(String ApiLoginID, String ApiTransactionKey, string customerProfileId,string customerAddressId)
        {
            dbutl.LogInfo("DeleteCustomerShippingAddress Sample");
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey,
            };

            //please update the subscriptionId according to your PRODUCTIONcredentials
            var request = new deleteCustomerShippingAddressRequest
            {
                customerProfileId = customerProfileId,
                customerAddressId = customerAddressId
            };

            //Prepare Request
            var controller = new deleteCustomerShippingAddressController(request);
            controller.Execute();

            //Send Request to EndPoint
            deleteCustomerShippingAddressResponse response = controller.GetApiResponse();
            if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
            {
                if (response != null && response.messages.message != null)
                {
                    dbutl.LogInfo("Success, ResultCode : " + response.messages.resultCode.ToString());
                }
            }
            else if (response != null)
            {
                dbutl.LogInfo("Error: " + response.messages.message[0].code + "  " + response.messages.message[0].text);
            }

            return response;
        }
        #endregion

        #region Charge Using Payment Profile ID And customer profile ID
        public createTransactionResponse ChargePaymentID(String ApiLoginID, String ApiTransactionKey, string customerProfileId,string customerPaymentProfileId, decimal Amount,string shippingID, Payment Payment)
        {
            dbutl.LogInfo("Charge Customer Profile");

            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;

            // define the merchant information (authentication / transaction id)
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey
            };

            //create a customer payment profile
            customerProfilePaymentType profileToCharge = new customerProfilePaymentType();
            profileToCharge.customerProfileId = customerProfileId;
            profileToCharge.paymentProfile = new paymentProfile { paymentProfileId = customerPaymentProfileId,cardCode=Payment.CardDetail.cardCode };
            customerAddressType ship = null;
            if (shippingID != "")
            {
                profileToCharge.shippingProfileId = shippingID;
            }
            else
            {
                 ship = Payment.cust_address;//new customerAddressType { firstName = Payment.cust_address.firstName, lastName = Payment.cust_address.lastName, email = Payment.cust_address.email };
            }
            //var addressList = SessionVariable.AddressList;
            //var address = addressList.Find(x => x.customerAddressId == shippingID);
            //customerAddressType bill_Address = new customerAddressType();
            //bill_Address.firstName = address.firstName;//txtfname.Text;//Request.Form["firstName"].ToString();
            //bill_Address.lastName = address.lastName;//txtLname.Text;//Request.Form["lastName"].ToString();
            //bill_Address.email = address.email;// txtEmail.Text;//Request.Form["email"].ToString();
            //bill_Address.address = address.address;// txtAddress1.Text + " , " + txtAddress2.Text;//Request.Form["billing_address1"].ToString() + " , " + Request.Form["billing_address2"].ToString();
            //bill_Address.city = address.city;// txtCity.Text;//Request.Form["billing_city"].ToString();
            //bill_Address.state = address.state;//txtState.Text;//Request.Form["billing_state"].ToString();
            //bill_Address.country = address.country;//DrpCountry.SelectedValue; //Request.Form["Country"].ToString();
            //bill_Address.faxNumber = address.faxNumber;//txtFax.Text;//Request.Form["billing_fax"].ToString();
            //bill_Address.phoneNumber = address.phoneNumber;//txtTelephone.Text;//Request.Form["billing_number"].ToString();
            //bill_Address.zip = address.zip;//txtzip.Text;//Request.Form["billing_postcode"].ToString();
            //bill_Address.company = address.company;//txtCompany.Text;//Request.Form["CompanyName"].ToString();


            var orderInformation = new orderType { invoiceNumber = SessionVariable.orderID.ToString(), description = SessionVariable.UName.Trim()};
            var bill = new customerAddressType { firstName = Payment.cust_address.firstName,lastName=Payment.cust_address.lastName,email=Payment.cust_address.email };
           
            //var authcode=new 
            var transactionRequest = new transactionRequestType
            {
                transactionType = transactionTypeEnum.authCaptureTransaction.ToString(),    // refund type
                amount = Amount,
                profile = profileToCharge,
                order = orderInformation,
                lineItems=Payment.lineItems
               
                //,shipTo=ship
                //billTo = bill
                
            };

            if (profileToCharge.shippingProfileId == null)
            {
                transactionRequest.shipTo = ship;
            }
            var request = new createTransactionRequest { transactionRequest = transactionRequest };

            // instantiate the collector that will call the service
            var controller = new createTransactionController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();

            //validate
            if (response != null)
            {
                if (response.messages.resultCode == messageTypeEnum.Ok)
                {
                    if (response.transactionResponse.messages != null)
                    {

                        dbutl.LogInfo("Successfully created transaction with Transaction ID: " + response.transactionResponse.transId);
                        dbutl.LogInfo("Response Code: " + response.transactionResponse.responseCode);
                        dbutl.LogInfo("Message Code: " + response.transactionResponse.messages[0].code);
                        dbutl.LogInfo("Description: " + response.transactionResponse.messages[0].description);
                        dbutl.LogInfo("Success, Auth Code : " + response.transactionResponse.authCode);
                    }
                    else
                    {
                        dbutl.LogInfo("Failed Transaction.");
                        if (response.transactionResponse.errors != null)
                        {
                            dbutl.LogInfo("Error Code: " + response.transactionResponse.errors[0].errorCode);
                            dbutl.LogInfo("Error message: " + response.transactionResponse.errors[0].errorText);
                        }
                    }
                }
                else
                {
                    dbutl.LogInfo("Failed Transaction.");
                    if (response.transactionResponse != null && response.transactionResponse.errors != null)
                    {
                        dbutl.LogInfo("Error Code: " + response.transactionResponse.errors[0].errorCode);
                        dbutl.LogInfo("Error message: " + response.transactionResponse.errors[0].errorText);
                    }
                    else
                    {
                        dbutl.LogInfo("Error Code: " + response.messages.message[0].code);
                        dbutl.LogInfo("Error message: " + response.messages.message[0].text);
                    }
                }
            }
            else
            {
                dbutl.LogInfo("Null Response.");
            }

            return response;
        }
        #endregion
    }
}