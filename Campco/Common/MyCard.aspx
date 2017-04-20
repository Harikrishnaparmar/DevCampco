<%-- Created By :- Nisha Patel---%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="MyCard.aspx.cs" Inherits="Campco.Common.MyCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style> 
  .navigation_MyProfile ul 
    { margin: 1px,0px,2px,0px; padding: 0px; list-style-type: none; text-align: left; 

} 
    .navigation_MyProfile ul li { display:inline-table; } 
    .navigation_MyProfile ul li a {     text-decoration: none;
    padding: .1em 1em;
    color: black;
    background-color: #dfdfdf;
    border: 1px solid black;
    padding: 15px 40px;
    border-radius: 7px 7px 0 0px; } 
    .navigation_MyProfile ul li a:hover { background-color: #436dc1; color: #fff; } </style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-title-qube" class="page-title-qube default-page-title">
    <div class="width-container-qube  fade-header-qube">
         <div  class="navigation_MyProfile">
          <%--      <ul class="tabs wc-tabs">--%>
            <ul>
                  <li> <a href="UpdateMyProfile.aspx">Profile</a> </li>
                   <li>  <a href="MyOrder.aspx">Orders</a></li>
                   <li>  <a href="MyCard.aspx">Payment Information</a> </li>
                  <li>  <a href="MyShippingAddress.aspx">Addresses</a> </li>
                 <%-- <li class="additional_information_tab"> <a href="#tab-additional_information">Additional Information</a> </li>--%>
                </ul>
           <%--   </div>--%>
              </div>
      <div class="page-tite-left-qube">
   <%--     <h1 class="entry-title-qube-ezio">My Profile</h1>--%>
    <%--  <div id="woocommerce-post-page">--%>
          <%--    <div class="woocommerce-tabs wc-tabs-wrapper">--%>
       
      <div class="clearfix-qube-ezio"></div>

          
    </div>  
         </div>
    </div>
    <%--<div id="page-title-qube" class="page-title-qube default-page-title">
        <div class="width-container-qube fade-header-qube">
            <div class="page-tite-left-qube">
                <h1 class="entry-title-qube-ezio">My Saved Cards</h1>
            </div>
           <%-- <div id="sharecrumb-qube-container">
             <a href="#" class="dot-irecommendthis" id="dot-irecommendthis-85" title="Recommend this"><span class="dot-irecommendthis-count">0</span> <span class="dot-irecommendthis-suffix"></span></a>
                <div id="sharecrumb-qube">
                    <div class="share-page-title-icon"><i class="fa fa-share-alt"></i></div>
                    <div class="share-page-title-container">
                        <span class="extra-spacing-share-title">
                            <a href="" title="Share on Facebook" class="tooltip facebook-share" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="" title="Share on Twitter" class="tooltip twitter-share" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="" title="Share on Pinterest" class="tooltip pinterest-share" target="_blank"><i class="fa fa-pinterest-p"></i></a>
                            <a href="" title="Share on Google+" class="tooltip google-share" target="_blank"><i class="fa fa-google-plus"></i></a>
                            <a href="" title="Share on VK" class="tooltip vk-share" target="_blank"><i class="fa fa-vk"></i></a>
                            <a href="" title="Share on Reddit" class="tooltip reddit-share" target="_blank"><i class="fa fa-reddit"></i></a>
                            <a href="" title="Share on LinkedIn" class="tooltip linkedin-share" target="_blank"><i class="fa fa-linkedin"></i></a>
                            <a href="" title="Share on Tumblr" class="tooltip tumblr-share" target="_blank"><i class="fa fa-tumblr"></i></a>
                            <a href="" title="Share on E-mail" class="tooltip mail-share" target="_blank"><i class="fa fa-envelope"></i></a></span>
                    </div>
                </div>
            </div>
            <div class="clearfix-qube-ezio"></div>
        </div>
    </div>--%>
   


    <div id="content-qube">
        <div class="width-container-qube">
            <div class="page-content-pro">
                <div class="" id="carddetails">
                    <h4>My Saved Cards</h4>
                    <p>
                        Making payments on Campco just got better! Use saved cards and place your order.
It's extremely <strong>convenient</strong> and completely <strong>secure.</strong>
                    </p>
                    <div class="save-card">
                        <div class="guaranteedbox">
                            <img src="assets/images/saved-card-sprite.png" style="height:100px; width:100px" />
                            <div class="lastUnit">
                                <h4>100% Security Guaranteed</h4>
                                <p>
                                    Your card details will be stored using world-class encryption technology<br>
                                </p>
                            </div>
                        </div>

                        <div class="add-new-card-btn">
                            <%--      <button class="btn btn-save-add" id='hideshow' type="submit">Add New Card</button>--%>
                        </div>

                        <div class="add-new-card-btn-1 vc_row">
                         <%--   <h4>Add Card</h4>--%>
                            <div class="vc_col-md-12">
                                <a href="javascript:void(0);" class="addcard">Add Card</a>
                            </div>

                            <div id="popupcard" class="simplePopupmycard">
                                
                                <div class="addcards">
                                    <div>
                                        <div class="monthrow">
                                            <span class="labelad">Card Number<span class="required">*</span></span>
                                            <asp:TextBox ID="txtCardNo" runat="server" CssClass="input-field" placeholder="Ex-4111111111111111" name="txtCardNo"></asp:TextBox>
                                        </div>

                                        <div class="monthrow">
                                            <span class="labelad">card code<span class="required">*</span></span>
                                            <asp:TextBox ID="txtCardCode" runat="server" CssClass="input-field" placeholder="Ex-123" name="txtCardCode"></asp:TextBox>
                                        </div>
                                        <div class="monthyear monthrow">
                                             <span class="labelad">Expiry Date<span class="required">*</span></span>
                                            <div class="btn-mycard">
                                            <asp:DropDownList ID="ddlmonth" runat="server" CssClass="select-field select-month" name ="ddlmonth" required="required">
                                                  <asp:ListItem>Select Month</asp:ListItem>
                                                <asp:ListItem>01</asp:ListItem>
                                                <asp:ListItem>02</asp:ListItem>
                                                <asp:ListItem>03</asp:ListItem>
                                                <asp:ListItem>04</asp:ListItem>
                                                <asp:ListItem>05</asp:ListItem>
                                                <asp:ListItem>06</asp:ListItem>
                                                <asp:ListItem>07</asp:ListItem>
                                                <asp:ListItem>08</asp:ListItem>
                                                <asp:ListItem>09</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                            </asp:DropDownList>
                                            </div>
                                            <div class="btn-mycard">
                                            <asp:DropDownList ID="ddlYear" runat="server" CssClass="select-field select-year"  name="ddlYear" required="required">
                                               <asp:ListItem>Select Year</asp:ListItem>
                                                 <%--  <asp:ListItem>16</asp:ListItem>
                                                <asp:ListItem>17</asp:ListItem>
                                                <asp:ListItem>18</asp:ListItem>
                                                <asp:ListItem>19</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>--%>
                                            </asp:DropDownList>
                                           </div>
                                        </div>
                                        <%--   <asp:Button ID="btnsubmit" runat="server" Text="Add Card" CssClass="btn btn-save-add" OnClick="btnsubmit_Click" Width="10%"></asp:Button>--%>
                                        <div class="btn-addcards">
                                            <asp:Button ID="btnsubmit" runat="server" Text="Add Card" CssClass="btn btn-save-add btnsubmit" OnClick="btnsubmit_Click"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <% if (ccList != null)
                                    {
                                        int x = 0;%>
                                <% foreach (var i in ccList)
                                    {
                                        x++; %>
                                <div class="save-address vc_col-md-3">
                                    <%--        <h5>Your Saved Addresses</h5>--%>
                                    <div class="add-page-details">
                                        <%-- <p ><%=i.cardType %></p>--%>
                                        <h5>Card Detail - <%=x%></h5>
                                        <p name="CCnumber">Card Number :<%=i.cardNumber%></p>
                                        <%--  <p name="exdate">Exp. Date :<%=i.expirationDate%></p>--%>
                                        <%if (PaymentId == i.cardType.ToString())
                                            { %>
                                        <div class="radio radio-danger">
                                            <input type="radio" name="address" class="Update" id="radio<%=x %>" addid="<%=i.cardType %>" value="option1"  checked="checked"  >
                                            <label for="radio<%=x%>">Default Card</label>
                                        </div>
                                        <%}
    else
    { %>
                                        <div class="radio radio-danger">
                                            <input type="radio" name="address" class="Update" id="radio<%=x %>" addid="<%=i.cardType %>" value="option1"   >
                                            <label for="radio<%=x%>">Default Card</label>
                                        </div>
                                        <%} %>
                                     <%--   <input type="button" name="AddressID" value="Delete" id="<%=i.cardType %>" class="delete button" />--%>
                                        <br /> <br /> <br />
                                        <input type="button" name="AddressID" value="Delete" id="<%=i.cardType %>" class="delete button btn btn-save-add"  /> 
                                    </div>
                                </div>


                                <%}
                                  }
                                %>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  
   

    
    <script type="text/javascript">

    jQuery(document).ready(function(){

        jQuery('.addcard').click(function(){
            jQuery('#popupcard').simplePopup();
        });
        
    });

    </script>
    

    <script type="text/javascript">
        jQuery('.delete').click(function () {
            var pr_code = jQuery(this).attr('id');
            if (pr_code == '')
                return;
            //alert(pr_code);
            var dataString = "{ID:'" + pr_code + "'}";
            var URL = window.location.origin + window.location.pathname + '/deleteAddress';
            jQuery.ajax({
                type: "POST",
                url: URL,//+"/Addtocart",
                contentType: "application/json; charset=utf-8",
                data: dataString,//"{value:'"+pr_code+"'}",
                dataType: "json",
                success: function (response) {
                    //jQuery("span#count").text(response.d);
                    //var x = jQuery.parseJSON(response.d);
                    alert(response.d)
                    location.reload();
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        });
        jQuery('.Update').click(function () {
            var pr_code = jQuery(this).attr('addID');
            if (pr_code == '')
                return;
            //alert(pr_code);
            var dataString = "{ID:'" + pr_code + "'}";
            var URL = window.location.origin + window.location.pathname + '/Update_Default_Card';
            jQuery.ajax({
                type: "POST",
                url: URL,//+"/Addtocart",
                contentType: "application/json; charset=utf-8",
                data: dataString,//"{value:'"+pr_code+"'}",
                dataType: "json",
                success: function (response) {
                    //jQuery("span#count").text(response.d);
                    //var x = jQuery.parseJSON(response.d);
                   // alert(response.d)
                    location.reload();
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        });
    </script>

    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery.validator.addMethod("digit", function (value, element) {
                //alert("In addtional method.");
                var emailstr = /^[0-9]+$/;
                if (!emailstr.test(value)) {
                    return false;
                } else {
                    return true;
                }

            }, 'Please enter numeric only.');
            jQuery.validator.addMethod("selectNone",
         function (value, element) {
             return this.optional(element) || element.selectedIndex != 0;
         },
        "Please select option."
       );
           jQuery.validator.addMethod("Nospace", function(value, element) {
               return value.indexOf(" ") != 0;
            },
            "Please don't leave it empty"
            );

            jQuery('.btnsubmit').click(function () {
                //alert("hi");
                var x = jQuery("#form1").validate({
                    rules: {
                        ctl00$ContentPlaceHolder1$txtCardNo: { required: true, rangelength: [14, 16], digit: true, Nospace: true },
                        ctl00$ContentPlaceHolder1$txtCardCode: { required: true, digit: true, Nospace: true },
                        ctl00$ContentPlaceHolder1$ddlmonth: { required: true, selectNone: true },
                        ctl00$ContentPlaceHolder1$ddlYear: { required: true, selectNone: true },
                        messages: {
                            ctl00$ContentPlaceHolder1$txtCardNo: { required: "Please enter cardno"  },
                            ctl00$ContentPlaceHolder1$txtCardCode: { required: "Please enter cardcode" },
                            ctl00$ContentPlaceHolder1$ddlmonth: { selectNone: "Please select month" },
                            ctl00$ContentPlaceHolder1$ddlYear: { selectNone: "Please select year" },

                        }

                    }

                }).form();

                if (!x) {


                }
            });
        });

    </script>
</asp:Content>
