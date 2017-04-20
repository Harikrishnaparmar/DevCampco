<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="Campco.Common.CheckOut" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div id="page-title-qube" class="page-title-qube default-page-title">
        <div class="width-container-qube fade-header-qube">
            <div class="page-tite-left-qube">
                <h1 class="entry-title-qube-ezio">Checkout</h1>
            </div>
            <%--<div id="sharecrumb-qube-container">
                <a href="#" class="dot-irecommendthis" id="dot-irecommendthis-109" title="Recommend this"><span class="dot-irecommendthis-count">0</span> <span class="dot-irecommendthis-suffix"></span></a>
                <div id="sharecrumb-qube">
                    <div class="share-page-title-icon"><i class="fa fa-share-alt"></i></div>
                    <div class="share-page-title-container"><span class="extra-spacing-share-title"><a href="" title="Share on Facebook" class="tooltip facebook-share" target="_blank"><i class="fa fa-facebook"></i></a><a href="" title="Share on Twitter" class="tooltip twitter-share" target="_blank"><i class="fa fa-twitter"></i></a><a href="" title="Share on Pinterest" class="tooltip pinterest-share" target="_blank"><i class="fa fa-pinterest-p"></i></a><a href="" title="Share on Google+" class="tooltip google-share" target="_blank"><i class="fa fa-google-plus"></i></a><a href="" title="Share on VK" class="tooltip vk-share" target="_blank"><i class="fa fa-vk"></i></a><a href="" title="Share on Reddit" class="tooltip reddit-share" target="_blank"><i class="fa fa-reddit"></i></a><a href="" title="Share on LinkedIn" class="tooltip linkedin-share" target="_blank"><i class="fa fa-linkedin"></i></a><a href="" title="Share on Tumblr" class="tooltip tumblr-share" target="_blank"><i class="fa fa-tumblr"></i></a><a href="" title="Share on E-mail" class="tooltip mail-share" target="_blank"><i class="fa fa-envelope"></i></a></span></div>
                </div>
            </div>--%>
            <div class="clearfix-qube-ezio"></div>
        </div>
    </div>
    <%-- ------------- --%>
    <div class="width-container-qube">
        <div class="" style="padding-top: 12px;right: 2%;float: right;position: relative;"> 
                    <%--<a href="CheckOut.aspx" class="checkout-button button alt wc-forward"> Proceed to Checkout</a>--%>
            <asp:Button ID="Button1" runat="server" class="button alt" name="woocommerce_checkout_place_order" OnClick="btnProcessOrder_Click" Text="Place order"></asp:Button> 
        </div>
    </div>

     <%--<div class="form-row place-order">
                   
                    <%--<input type="submit" class="button alt" name="woocommerce_checkout_place_order" id="place_order" value="Place order" data-value="Place order" />-%>
                        <asp:Button ID="Button1" runat="server" class="button alt" name="woocommerce_checkout_place_order" OnClick="btnProcessOrder_Click" Text="Place order"></asp:Button>               
                  </div>--%>
                    <div class="clearfix-qube-ezio"></div>
    <div id="content-qube">
        <div class="width-container-qube">
            <article id="post-109" class="post-109 page type-page status-publish hentry">
        <div class="page-content-pro">
          <div class="woocommerce">
           <% 
               var x = HttpContext.Current.Session["CustomerID"] == null ? "GUEST" : HttpContext.Current.Session["CustomerID"];
               if (x.ToString() == "GUEST")
               { %> 
           <div class="woocommerce-info">Returning customer?<a href="Login.aspx" class="showlogin">Click here to login</a></div>
            <div class="woocommerce-info">New Customer ?<a href="Registration.aspx?Reg=1" class="showlogin">Click here to Sign up</a></div>
              <%} %>
           <%-- <form method="post" class="login" style="display:none;" action="Login.aspx">
              
            </form>--%>
            <%--<div class="woocommerce-info">Have a coupon? <a href="#" class="showcoupon">Click here to enter your code</a></div>--%>

              <asp:Label ID="lblError" runat="server" Text="Label" Enabled="false" ForeColor="Red" Visible="False"></asp:Label>
            <div class="checkout_coupon" method="post" style="display:none">
              <p class="form-row form-row-first">
                <input type="text" name="coupon_code" class="input-text" placeholder="Coupon code" id="coupon_code" value="" />
              </p>
              <p class="form-row form-row-last">
                <input type="submit" class="button" name="apply_coupon" value="Apply Coupon" />
              </p>
              <div class="clear"></div>--%>
            </div>

            <div   class="checkout woocommerce-checkout"  enctype="multipart/form-data">
              <div class="col2-set vc_row" id="customer_details">
                <div class="vc_col-md-4">
                  <div class="woocommerce-billing-fields">
                    <h5>SHIPPING ADDRESS</h5>

                      <%if (drop == 0)
                          {
                              if (cusID != "GUEST")
                              {
                                  if (addressList != null)
                                  {
                                      result=addressList.Find(y => y.customerAddressId == addID);
                                      if(result!=null)
                                      {%>
                      <div class="add-page-details" name="<%=result.customerAddressId %>">
                          
                          <%--<p name="id"><%=i.customerAddressId %></p>--%>
                          <p name="fname"><%=result.firstName + " " + result.lastName %></p>
                          <p name="address"><%=result.address %></p>
                          <p name="city"><%=result.city%></p>
                          <p name="state"><%=result.state%></p>
                          <p name="zip"><%=result.zip%></p>
                          <p name="country"><%=result.country%></p>
                          <p name="company"><%=result.company%></p>
                          <p name="email"><%=result.email%></p>
                          <p name="faxNumber"><%=result.faxNumber%></p>
                          <p name="phoneNumber"><%=result.phoneNumber%></p>
                          

                          <%--<input type="radio" name="ADDdefault" id="<%=i.customerAddressId %>" value="make default"/>--%>
                          <% if (result.customerAddressId == addID)
    { %>
                          <div class="radio radio-danger">
                                        <input type="radio" name="ADDdefault" id="<%=result.customerAddressId %>" value="<%=result.customerAddressId %>" checked="checked">
                                        <label for="<%=result.customerAddressId %>">Use This Address</label>
                                    </div>
                          <%}
    else
    { %>
                          <div class="radio radio-danger">
                                        <input type="radio" name="ADDdefault" id="<%=result.customerAddressId %>" value="<%=result.customerAddressId %>">
                                        <label for="<%=result.customerAddressId %>">Use This Address</label>
                                    </div>
                          <%}%>
                           
                      </div>
                                      <%}addressList.Remove(addressList.Find(y => y.customerAddressId == addID));
                                      foreach (var i in addressList)
                                      { %>
                      <div class="add-page-details" name="<%=i.customerAddressId %>">
                          
                          <%--<p name="id"><%=i.customerAddressId %></p>--%>
                          <p name="fname"><%=i.firstName + " " + i.lastName %></p>
                          <p name="address"><%=i.address %></p>
                          <p name="city"><%=i.city%></p>
                          <p name="state"><%=i.state%></p>
                          <p name="zip"><%=i.zip%></p>
                          <p name="country"><%=i.country%></p>
                          <p name="company"><%=i.company%></p>
                          <p name="email"><%=i.email%></p>
                          <p name="faxNumber"><%=i.faxNumber%></p>
                          <p name="phoneNumber"><%=i.phoneNumber%></p>
                          

                          <%--<input type="radio" name="ADDdefault" id="<%=i.customerAddressId %>" value="make default"/>--%>
                          <% if (i.customerAddressId == addID)
    { %>
                          <div class="radio radio-danger">
                                        <input type="radio" name="ADDdefault" id="<%=i.customerAddressId %>" value="<%=i.customerAddressId %>" checked="checked">
                                        <label for="<%=i.customerAddressId %>">Use This Address</label>
                                    </div>
                          <%}
    else
    { %>
                          <div class="radio radio-danger">
                                        <input type="radio" name="ADDdefault" id="<%=i.customerAddressId %>" value="<%=i.customerAddressId %>">
                                        <label for="<%=i.customerAddressId %>">Use This Address</label>
                                    </div>
                          <%}%>
                           
                      </div>
                      <%}%>
                      <p class="" >
                                      <a href="#" class="button alt addnewAdd" >Use different shipping address. </a><a href="#" class="button right-icon close" >Close</a>
                          </p>
                                      <% } else{%><p class="form-row form-row notes" id="">
                      <label  class="noADD">No Shipping Address on Profile</label>                    
                    </p><%} }}%>
                      
                      <input id="hdnshipAddress" value="<%=addID %>"" name="ShippAddressID" type="hidden"/>
                      <div id="newshipping">
                    <p class="form-row form-row form-row-first validate-required" >
                      <label for="billing_first_name" class="">First Name <abbr class="required" title="required">*</abbr></label>
                      <%--<input type="text" class="input-text " name="firstname" id="billing_first_name" placeholder=""  value=""  />--%>
                        <asp:TextBox ID="txtfname" runat="server" class="input-text " placeholder="First Name" name="firstname" required="required"></asp:TextBox>
                        <label id="fname_error" style="display:none; color:red;">Please enter alphabates only.</label>
                    </p>
                    <p class="form-row form-row form-row-first validate-required" >
                      <label for="txtMname" class="">Middle Name/Initial<%--<abbr class="required" title="required">*</abbr>--%></label>
                      <%--<input type="text" class="input-text " name="MiddleName" id="billing_middle_name" placeholder=""  value=""  />--%>
                        <asp:TextBox ID="txtMname" runat="server" class="input-text " placeholder="Middle Name/Initial" name="middleName"></asp:TextBox>
                    </p>
                          <div class="clear"></div>
                    <p class="form-row form-row" >
                      <label for="txtLname" class="">Last Name <abbr class="required" title="required">*</abbr></label>
                      <%--<input type="text" class="input-text " name="LastName" id="billing_last_name" placeholder=""  value=""  />--%>
                        <asp:TextBox ID="txtLname" runat="server" class="input-text " placeholder="Last Name" name="LastName" required="required"></asp:TextBox>
                        <label id="lname_error" style="display:none; color:red;">Please enter alphabates only.</label>
                    </p>
                    <%--<div class="clear"></div>--%>
                    <p class="form-row form-row validate-required" id="billing_company_field">
                      <label for="billing_company" class="">Company Name</label>
                      <%--<input type="text" class="input-text " name="CompanyName" id="billing_company" placeholder=""  value=""  />--%>
                        <asp:TextBox ID="txtCompany" runat="server" class="input-text " placeholder="Company" name="Company"></asp:TextBox>
                    </p>
                          <% if (custype != 3)
                              {%>
                    <p class="form-row form-row  validate-required validate-email" id="billing_email_field">
                      <label for="billing_email" class="">Email Address <abbr class="required" title="required">*</abbr></label>
                      <%--<input type="email" class="input-text " name="Email" id="billing_email" placeholder=""  value=""  />--%>
                        <asp:TextBox ID="txtEmail" runat="server" class="input-text " placeholder="Email" name="Email" required="required"></asp:TextBox>
                        <label id="email_error" style="display:none; color:red;">Please enter valid email</label>
                    </p>
                    <%} %>
                    <div class="clear"></div>
                    <p class="form-row form-row form-row-wide address-field update_totals_on_change validate-required" id="billing_country_field">
                      <label for="billing_country" class="">Country <abbr class="required" title="required">*</abbr></label>
                        
                      <asp:DropDownList ID="DrpCountry" name="Country"  CssClass="country_to_state country_select  Shipping" AutoPostBack="false" runat="server" required="required">
                          
                          <asp:ListItem value="">Select a country&hellip;</asp:ListItem>
                          <asp:ListItem value="US" >United States (US)</asp:ListItem>
                        <asp:ListItem value="AX" >&#197;land Islands</asp:ListItem>
                        <asp:ListItem value="AF" >Afghanistan</asp:ListItem>
                        <asp:ListItem value="AL" >Albania</asp:ListItem>
                        <asp:ListItem value="DZ" >Algeria</asp:ListItem>
                        <asp:ListItem value="AD" >Andorra</asp:ListItem>
                        <asp:ListItem value="AO" >Angola</asp:ListItem>
                        <asp:ListItem value="AI" >Anguilla</asp:ListItem>
                        <asp:ListItem value="AQ" >Antarctica</asp:ListItem>
                        <asp:ListItem value="AG" >Antigua and Barbuda</asp:ListItem>
                        <asp:ListItem value="AR" >Argentina</asp:ListItem>
                        <asp:ListItem value="AM" >Armenia</asp:ListItem>
                        <asp:ListItem value="AW" >Aruba</asp:ListItem>
                        <asp:ListItem value="AU" >Australia</asp:ListItem>
                        <asp:ListItem value="AT" >Austria</asp:ListItem>
                        <asp:ListItem value="AZ" >Azerbaijan</asp:ListItem>
                        <asp:ListItem value="BS" >Bahamas</asp:ListItem>
                        <asp:ListItem value="BH" >Bahrain</asp:ListItem>
                        <asp:ListItem value="BD" >Bangladesh</asp:ListItem>
                        <asp:ListItem value="BB" >Barbados</asp:ListItem>
                        <asp:ListItem value="BY" >Belarus</asp:ListItem>
                        <asp:ListItem value="PW" >Belau</asp:ListItem>
                        <asp:ListItem value="BE" >Belgium</asp:ListItem>
                        <asp:ListItem value="BZ" >Belize</asp:ListItem>
                        <asp:ListItem value="BJ" >Benin</asp:ListItem>
                        <asp:ListItem value="BM" >Bermuda</asp:ListItem>
                        <asp:ListItem value="BT" >Bhutan</asp:ListItem>
                        <asp:ListItem value="BO" >Bolivia</asp:ListItem>
                        <asp:ListItem value="BQ" >Bonaire, Saint Eustatius and Saba</asp:ListItem>
                        <asp:ListItem value="BA" >Bosnia and Herzegovina</asp:ListItem>
                        <asp:ListItem value="BW" >Botswana</asp:ListItem>
                        <asp:ListItem value="BV" >Bouvet Island</asp:ListItem>
                        <asp:ListItem value="BR" >Brazil</asp:ListItem>
                        <asp:ListItem value="IO" >British Indian Ocean Territory</asp:ListItem>
                        <asp:ListItem value="VG" >British Virgin Islands</asp:ListItem>
                        <asp:ListItem value="BN" >Brunei</asp:ListItem>
                        <asp:ListItem value="BG" >Bulgaria</asp:ListItem>
                        <asp:ListItem value="BF" >Burkina Faso</asp:ListItem>
                        <asp:ListItem value="BI" >Burundi</asp:ListItem>
                        <asp:ListItem value="KH" >Cambodia</asp:ListItem>
                        <asp:ListItem value="CM" >Cameroon</asp:ListItem>
                        <asp:ListItem value="CA" >Canada</asp:ListItem>
                        <asp:ListItem value="CV" >Cape Verde</asp:ListItem>
                        <asp:ListItem value="KY" >Cayman Islands</asp:ListItem>
                        <asp:ListItem value="CF" >Central African Republic</asp:ListItem>
                        <asp:ListItem value="TD" >Chad</asp:ListItem>
                        <asp:ListItem value="CL" >Chile</asp:ListItem>
                        <asp:ListItem value="CN" >China</asp:ListItem>
                        <asp:ListItem value="CX" >Christmas Island</asp:ListItem>
                        <asp:ListItem value="CC" >Cocos (Keeling) Islands</asp:ListItem>
                        <asp:ListItem value="CO" >Colombia</asp:ListItem>
                        <asp:ListItem value="KM" >Comoros</asp:ListItem>
                        <asp:ListItem value="CG" >Congo (Brazzaville)</asp:ListItem>
                        <asp:ListItem value="CD" >Congo (Kinshasa)</asp:ListItem>
                        <asp:ListItem value="CK" >Cook Islands</asp:ListItem>
                        <asp:ListItem value="CR" >Costa Rica</asp:ListItem>
                        <asp:ListItem value="HR" >Croatia</asp:ListItem>
                        <asp:ListItem value="CU" >Cuba</asp:ListItem>
                        <asp:ListItem value="CW" >Cura&Ccedil;ao</asp:ListItem>
                        <asp:ListItem value="CY" >Cyprus</asp:ListItem>
                        <asp:ListItem value="CZ" >Czech Republic</asp:ListItem>
                        <asp:ListItem value="DK" >Denmark</asp:ListItem>
                        <asp:ListItem value="DJ" >Djibouti</asp:ListItem>
                        <asp:ListItem value="DM" >Dominica</asp:ListItem>
                        <asp:ListItem value="DO" >Dominican Republic</asp:ListItem>
                        <asp:ListItem value="EC" >Ecuador</asp:ListItem>
                        <asp:ListItem value="EG" >Egypt</asp:ListItem>
                        <asp:ListItem value="SV" >El Salvador</asp:ListItem>
                        <asp:ListItem value="GQ" >Equatorial Guinea</asp:ListItem>
                        <asp:ListItem value="ER" >Eritrea</asp:ListItem>
                        <asp:ListItem value="EE" >Estonia</asp:ListItem>
                        <asp:ListItem value="ET" >Ethiopia</asp:ListItem>
                        <asp:ListItem value="FK" >Falkland Islands</asp:ListItem>
                        <asp:ListItem value="FO" >Faroe Islands</asp:ListItem>
                        <asp:ListItem value="FJ" >Fiji</asp:ListItem>
                        <asp:ListItem value="FI" >Finland</asp:ListItem>
                        <asp:ListItem value="FR" >France</asp:ListItem>
                        <asp:ListItem value="GF" >French Guiana</asp:ListItem>
                        <asp:ListItem value="PF" >French Polynesia</asp:ListItem>
                        <asp:ListItem value="TF" >French Southern Territories</asp:ListItem>
                        <asp:ListItem value="GA" >Gabon</asp:ListItem>
                        <asp:ListItem value="GM" >Gambia</asp:ListItem>
                        <asp:ListItem value="GE" >Georgia</asp:ListItem>
                        <asp:ListItem value="DE" >Germany</asp:ListItem>
                        <asp:ListItem value="GH" >Ghana</asp:ListItem>
                        <asp:ListItem value="GI" >Gibraltar</asp:ListItem>
                        <asp:ListItem value="GR" >Greece</asp:ListItem>
                        <asp:ListItem value="GL" >Greenland</asp:ListItem>
                        <asp:ListItem value="GD" >Grenada</asp:ListItem>
                        <asp:ListItem value="GP" >Guadeloupe</asp:ListItem>
                        <asp:ListItem value="GT" >Guatemala</asp:ListItem>
                        <asp:ListItem value="GG" >Guernsey</asp:ListItem>
                        <asp:ListItem value="GN" >Guinea</asp:ListItem>
                        <asp:ListItem value="GW" >Guinea-Bissau</asp:ListItem>
                        <asp:ListItem value="GY" >Guyana</asp:ListItem>
                        <asp:ListItem value="HT" >Haiti</asp:ListItem>
                        <asp:ListItem value="HM" >Heard Island and McDonald Islands</asp:ListItem>
                        <asp:ListItem value="HN" >Honduras</asp:ListItem>
                        <asp:ListItem value="HK" >Hong Kong</asp:ListItem>
                        <asp:ListItem value="HU" >Hungary</asp:ListItem>
                        <asp:ListItem value="IS" >Iceland</asp:ListItem>
                        <asp:ListItem value="IN"  >India</asp:ListItem>
                        <asp:ListItem value="ID" >Indonesia</asp:ListItem>
                        <asp:ListItem value="IR" >Iran</asp:ListItem>
                        <asp:ListItem value="IQ" >Iraq</asp:ListItem>
                        <asp:ListItem value="IM" >Isle of Man</asp:ListItem>
                        <asp:ListItem value="IL" >Israel</asp:ListItem>
                        <asp:ListItem value="IT" >Italy</asp:ListItem>
                        <asp:ListItem value="CI" >Ivory Coast</asp:ListItem>
                        <asp:ListItem value="JM" >Jamaica</asp:ListItem>
                        <asp:ListItem value="JP" >Japan</asp:ListItem>
                        <asp:ListItem value="JE" >Jersey</asp:ListItem>
                        <asp:ListItem value="JO" >Jordan</asp:ListItem>
                        <asp:ListItem value="KZ" >Kazakhstan</asp:ListItem>
                        <asp:ListItem value="KE" >Kenya</asp:ListItem>
                        <asp:ListItem value="KI" >Kiribati</asp:ListItem>
                        <asp:ListItem value="KW" >Kuwait</asp:ListItem>
                        <asp:ListItem value="KG" >Kyrgyzstan</asp:ListItem>
                        <asp:ListItem value="LA" >Laos</asp:ListItem>
                        <asp:ListItem value="LV" >Latvia</asp:ListItem>
                        <asp:ListItem value="LB" >Lebanon</asp:ListItem>
                        <asp:ListItem value="LS" >Lesotho</asp:ListItem>
                        <asp:ListItem value="LR" >Liberia</asp:ListItem>
                        <asp:ListItem value="LY" >Libya</asp:ListItem>
                        <asp:ListItem value="LI" >Liechtenstein</asp:ListItem>
                        <asp:ListItem value="LT" >Lithuania</asp:ListItem>
                        <asp:ListItem value="LU" >Luxembourg</asp:ListItem>
                        <asp:ListItem value="MO" >Macao S.A.R., China</asp:ListItem>
                        <asp:ListItem value="MK" >Macedonia</asp:ListItem>
                        <asp:ListItem value="MG" >Madagascar</asp:ListItem>
                        <asp:ListItem value="MW" >Malawi</asp:ListItem>
                        <asp:ListItem value="MY" >Malaysia</asp:ListItem>
                        <asp:ListItem value="MV" >Maldives</asp:ListItem>
                        <asp:ListItem value="ML" >Mali</asp:ListItem>
                        <asp:ListItem value="MT" >Malta</asp:ListItem>
                        <asp:ListItem value="MH" >Marshall Islands</asp:ListItem>
                        <asp:ListItem value="MQ" >Martinique</asp:ListItem>
                        <asp:ListItem value="MR" >Mauritania</asp:ListItem>
                        <asp:ListItem value="MU" >Mauritius</asp:ListItem>
                        <asp:ListItem value="YT" >Mayotte</asp:ListItem>
                        <asp:ListItem value="MX" >Mexico</asp:ListItem>
                        <asp:ListItem value="FM" >Micronesia</asp:ListItem>
                        <asp:ListItem value="MD" >Moldova</asp:ListItem>
                        <asp:ListItem value="MC" >Monaco</asp:ListItem>
                        <asp:ListItem value="MN" >Mongolia</asp:ListItem>
                        <asp:ListItem value="ME" >Montenegro</asp:ListItem>
                        <asp:ListItem value="MS" >Montserrat</asp:ListItem>
                        <asp:ListItem value="MA" >Morocco</asp:ListItem>
                        <asp:ListItem value="MZ" >Mozambique</asp:ListItem>
                        <asp:ListItem value="MM" >Myanmar</asp:ListItem>
                        <asp:ListItem value="NA" >Namibia</asp:ListItem>
                        <asp:ListItem value="NR" >Nauru</asp:ListItem>
                        <asp:ListItem value="NP" >Nepal</asp:ListItem>
                        <asp:ListItem value="NL" >Netherlands</asp:ListItem>
                        <asp:ListItem value="AN" >Netherlands Antilles</asp:ListItem>
                        <asp:ListItem value="NC" >New Caledonia</asp:ListItem>
                        <asp:ListItem value="NZ" >New Zealand</asp:ListItem>
                        <asp:ListItem value="NI" >Nicaragua</asp:ListItem>
                        <asp:ListItem value="NE" >Niger</asp:ListItem>
                        <asp:ListItem value="NG" >Nigeria</asp:ListItem>
                        <asp:ListItem value="NU" >Niue</asp:ListItem>
                        <asp:ListItem value="NF" >Norfolk Island</asp:ListItem>
                        <asp:ListItem value="KP" >North Korea</asp:ListItem>
                        <asp:ListItem value="NO" >Norway</asp:ListItem>
                        <asp:ListItem value="OM" >Oman</asp:ListItem>
                        <asp:ListItem value="PK" >Pakistan</asp:ListItem>
                        <asp:ListItem value="PS" >Palestinian Territory</asp:ListItem>
                        <asp:ListItem value="PA" >Panama</asp:ListItem>
                        <asp:ListItem value="PG" >Papua New Guinea</asp:ListItem>
                        <asp:ListItem value="PY" >Paraguay</asp:ListItem>
                        <asp:ListItem value="PE" >Peru</asp:ListItem>
                        <asp:ListItem value="PH" >Philippines</asp:ListItem>
                        <asp:ListItem value="PN" >Pitcairn</asp:ListItem>
                        <asp:ListItem value="PL" >Poland</asp:ListItem>
                        <asp:ListItem value="PT" >Portugal</asp:ListItem>
                        <asp:ListItem value="QA" >Qatar</asp:ListItem>
                        <asp:ListItem value="IE" >Republic of Ireland</asp:ListItem>
                        <asp:ListItem value="RE" >Reunion</asp:ListItem>
                        <asp:ListItem value="RO" >Romania</asp:ListItem>
                        <asp:ListItem value="RU" >Russia</asp:ListItem>
                        <asp:ListItem value="RW" >Rwanda</asp:ListItem>
                        <asp:ListItem value="ST" >S&atilde;o Tom&eacute; and Pr&iacute;ncipe</asp:ListItem>
                        <asp:ListItem value="BL" >Saint Barth&eacute;lemy</asp:ListItem>
                        <asp:ListItem value="SH" >Saint Helena</asp:ListItem>
                        <asp:ListItem value="KN" >Saint Kitts and Nevis</asp:ListItem>
                        <asp:ListItem value="LC" >Saint Lucia</asp:ListItem>
                        <asp:ListItem value="SX" >Saint Martin (Dutch part)</asp:ListItem>
                        <asp:ListItem value="MF" >Saint Martin (French part)</asp:ListItem>
                        <asp:ListItem value="PM" >Saint Pierre and Miquelon</asp:ListItem>
                        <asp:ListItem value="VC" >Saint Vincent and the Grenadines</asp:ListItem>
                        <asp:ListItem value="SM" >San Marino</asp:ListItem>
                        <asp:ListItem value="SA" >Saudi Arabia</asp:ListItem>
                        <asp:ListItem value="SN" >Senegal</asp:ListItem>
                        <asp:ListItem value="RS" >Serbia</asp:ListItem>
                        <asp:ListItem value="SC" >Seychelles</asp:ListItem>
                        <asp:ListItem value="SL" >Sierra Leone</asp:ListItem>
                        <asp:ListItem value="SG" >Singapore</asp:ListItem>
                        <asp:ListItem value="SK" >Slovakia</asp:ListItem>
                        <asp:ListItem value="SI" >Slovenia</asp:ListItem>
                        <asp:ListItem value="SB" >Solomon Islands</asp:ListItem>
                        <asp:ListItem value="SO" >Somalia</asp:ListItem>
                        <asp:ListItem value="ZA" >South Africa</asp:ListItem>
                        <asp:ListItem value="GS" >South Georgia/Sandwich Islands</asp:ListItem>
                        <asp:ListItem value="KR" >South Korea</asp:ListItem>
                        <asp:ListItem value="SS" >South Sudan</asp:ListItem>
                        <asp:ListItem value="ES" >Spain</asp:ListItem>
                        <asp:ListItem value="LK" >Sri Lanka</asp:ListItem>
                        <asp:ListItem value="SD" >Sudan</asp:ListItem>
                        <asp:ListItem value="SR" >Suriname</asp:ListItem>
                        <asp:ListItem value="SJ" >Svalbard and Jan Mayen</asp:ListItem>
                        <asp:ListItem value="SZ" >Swaziland</asp:ListItem>
                        <asp:ListItem value="SE" >Sweden</asp:ListItem>
                        <asp:ListItem value="CH" >Switzerland</asp:ListItem>
                        <asp:ListItem value="SY" >Syria</asp:ListItem>
                        <asp:ListItem value="TW" >Taiwan</asp:ListItem>
                        <asp:ListItem value="TJ" >Tajikistan</asp:ListItem>
                        <asp:ListItem value="TZ" >Tanzania</asp:ListItem>
                        <asp:ListItem value="TH" >Thailand</asp:ListItem>
                        <asp:ListItem value="TL" >Timor-Leste</asp:ListItem>
                        <asp:ListItem value="TG" >Togo</asp:ListItem>
                        <asp:ListItem value="TK" >Tokelau</asp:ListItem>
                        <asp:ListItem value="TO" >Tonga</asp:ListItem>
                        <asp:ListItem value="TT" >Trinidad and Tobago</asp:ListItem>
                        <asp:ListItem value="TN" >Tunisia</asp:ListItem>
                        <asp:ListItem value="TR" >Turkey</asp:ListItem>
                        <asp:ListItem value="TM" >Turkmenistan</asp:ListItem>
                        <asp:ListItem value="TC" >Turks and Caicos Islands</asp:ListItem>
                        <asp:ListItem value="TV" >Tuvalu</asp:ListItem>
                        <asp:ListItem value="UG" >Uganda</asp:ListItem>
                        <asp:ListItem value="UA" >Ukraine</asp:ListItem>
                        <asp:ListItem value="AE" >United Arab Emirates</asp:ListItem>
                        <asp:ListItem value="GB" >United Kingdom (UK)</asp:ListItem>
                        <%--<asp:ListItem value="US" >United States (US)</asp:ListItem>--%>
                        <asp:ListItem value="UY" >Uruguay</asp:ListItem>
                        <asp:ListItem value="UZ" >Uzbekistan</asp:ListItem>
                        <asp:ListItem value="VU" >Vanuatu</asp:ListItem>
                        <asp:ListItem value="VA" >Vatican</asp:ListItem>
                        <asp:ListItem value="VE" >Venezuela</asp:ListItem>
                        <asp:ListItem value="VN" >Vietnam</asp:ListItem>
                        <asp:ListItem value="WF" >Wallis and Futuna</asp:ListItem>
                        <asp:ListItem value="EH" >Western Sahara</asp:ListItem>
                        <asp:ListItem value="WS" >Western Samoa</asp:ListItem>
                        <asp:ListItem value="YE" >Yemen</asp:ListItem>
                        <asp:ListItem value="ZM" >Zambia</asp:ListItem>
                        <asp:ListItem value="ZW" >Zimbabwe</asp:ListItem>
                      </asp:DropDownList>
            
                        <%--<select name="Country" id="billing_country" class="country_to_state country_select " >
                        <asp:ListItem value="">Select a country&hellip;</asp:ListItem>
                        <asp:ListItem value="AX" >&#197;land Islands</asp:ListItem>
                        <asp:ListItem value="AF" >Afghanistan</option>
                        <asp:ListItem value="AL" >Albania</option>
                        <asp:ListItem value="DZ" >Algeria</option>
                        <asp:ListItem value="AD" >Andorra</option>
                        <asp:ListItem value="AO" >Angola</option>
                        <asp:ListItem value="AI" >Anguilla</option>
                        <asp:ListItem value="AQ" >Antarctica</option>
                        <asp:ListItem value="AG" >Antigua and Barbuda</option>
                        <asp:ListItem value="AR" >Argentina</option>
                        <asp:ListItem value="AM" >Armenia</option>
                        <asp:ListItem value="AW" >Aruba</option>
                        <asp:ListItem value="AU" >Australia</option>
                        <asp:ListItem value="AT" >Austria</option>
                        <asp:ListItem value="AZ" >Azerbaijan</option>
                        <asp:ListItem value="BS" >Bahamas</option>
                        <asp:ListItem value="BH" >Bahrain</option>
                        <asp:ListItem value="BD" >Bangladesh</option>
                        <asp:ListItem value="BB" >Barbados</option>
                        <asp:ListItem value="BY" >Belarus</option>
                        <asp:ListItem value="PW" >Belau</option>
                        <asp:ListItem value="BE" >Belgium</option>
                        <asp:ListItem value="BZ" >Belize</option>
                        <asp:ListItem value="BJ" >Benin</option>
                        <asp:ListItem value="BM" >Bermuda</option>
                        <asp:ListItem value="BT" >Bhutan</option>
                        <asp:ListItem value="BO" >Bolivia</option>
                        <asp:ListItem value="BQ" >Bonaire, Saint Eustatius and Saba</option>
                        <asp:ListItem value="BA" >Bosnia and Herzegovina</option>
                        <asp:ListItem value="BW" >Botswana</option>
                        <asp:ListItem value="BV" >Bouvet Island</option>
                        <asp:ListItem value="BR" >Brazil</option>
                        <asp:ListItem value="IO" >British Indian Ocean Territory</option>
                        <asp:ListItem value="VG" >British Virgin Islands</option>
                        <asp:ListItem value="BN" >Brunei</option>
                        <asp:ListItem value="BG" >Bulgaria</option>
                        <asp:ListItem value="BF" >Burkina Faso</option>
                        <asp:ListItem value="BI" >Burundi</option>
                        <asp:ListItem value="KH" >Cambodia</option>
                        <asp:ListItem value="CM" >Cameroon</option>
                        <asp:ListItem value="CA" >Canada</option>
                        <asp:ListItem value="CV" >Cape Verde</option>
                        <asp:ListItem value="KY" >Cayman Islands</option>
                        <asp:ListItem value="CF" >Central African Republic</option>
                        <asp:ListItem value="TD" >Chad</option>
                        <asp:ListItem value="CL" >Chile</option>
                        <asp:ListItem value="CN" >China</option>
                        <asp:ListItem value="CX" >Christmas Island</option>
                        <asp:ListItem value="CC" >Cocos (Keeling) Islands</option>
                        <asp:ListItem value="CO" >Colombia</option>
                        <asp:ListItem value="KM" >Comoros</option>
                        <asp:ListItem value="CG" >Congo (Brazzaville)</option>
                        <asp:ListItem value="CD" >Congo (Kinshasa)</option>
                        <asp:ListItem value="CK" >Cook Islands</option>
                        <asp:ListItem value="CR" >Costa Rica</option>
                        <asp:ListItem value="HR" >Croatia</option>
                        <asp:ListItem value="CU" >Cuba</option>
                        <asp:ListItem value="CW" >Cura&Ccedil;ao</option>
                        <asp:ListItem value="CY" >Cyprus</option>
                        <asp:ListItem value="CZ" >Czech Republic</option>
                        <asp:ListItem value="DK" >Denmark</option>
                        <asp:ListItem value="DJ" >Djibouti</option>
                        <asp:ListItem value="DM" >Dominica</option>
                        <asp:ListItem value="DO" >Dominican Republic</option>
                        <asp:ListItem value="EC" >Ecuador</option>
                        <asp:ListItem value="EG" >Egypt</option>
                        <asp:ListItem value="SV" >El Salvador</option>
                        <asp:ListItem value="GQ" >Equatorial Guinea</option>
                        <asp:ListItem value="ER" >Eritrea</option>
                        <asp:ListItem value="EE" >Estonia</option>
                        <asp:ListItem value="ET" >Ethiopia</option>
                        <asp:ListItem value="FK" >Falkland Islands</option>
                        <asp:ListItem value="FO" >Faroe Islands</option>
                        <asp:ListItem value="FJ" >Fiji</option>
                        <asp:ListItem value="FI" >Finland</option>
                        <asp:ListItem value="FR" >France</option>
                        <asp:ListItem value="GF" >French Guiana</option>
                        <asp:ListItem value="PF" >French Polynesia</option>
                        <asp:ListItem value="TF" >French Southern Territories</option>
                        <asp:ListItem value="GA" >Gabon</option>
                        <asp:ListItem value="GM" >Gambia</option>
                        <asp:ListItem value="GE" >Georgia</option>
                        <asp:ListItem value="DE" >Germany</option>
                        <asp:ListItem value="GH" >Ghana</option>
                        <asp:ListItem value="GI" >Gibraltar</option>
                        <asp:ListItem value="GR" >Greece</option>
                        <asp:ListItem value="GL" >Greenland</option>
                        <asp:ListItem value="GD" >Grenada</option>
                        <asp:ListItem value="GP" >Guadeloupe</option>
                        <asp:ListItem value="GT" >Guatemala</option>
                        <asp:ListItem value="GG" >Guernsey</option>
                        <asp:ListItem value="GN" >Guinea</option>
                        <asp:ListItem value="GW" >Guinea-Bissau</option>
                        <asp:ListItem value="GY" >Guyana</option>
                        <asp:ListItem value="HT" >Haiti</option>
                        <asp:ListItem value="HM" >Heard Island and McDonald Islands</option>
                        <asp:ListItem value="HN" >Honduras</option>
                        <asp:ListItem value="HK" >Hong Kong</option>
                        <asp:ListItem value="HU" >Hungary</option>
                        <asp:ListItem value="IS" >Iceland</option>
                        <asp:ListItem value="IN"  >India</option>
                        <asp:ListItem value="ID" >Indonesia</option>
                        <asp:ListItem value="IR" >Iran</option>
                        <asp:ListItem value="IQ" >Iraq</option>
                        <asp:ListItem value="IM" >Isle of Man</option>
                        <asp:ListItem value="IL" >Israel</option>
                        <asp:ListItem value="IT" >Italy</option>
                        <asp:ListItem value="CI" >Ivory Coast</option>
                        <asp:ListItem value="JM" >Jamaica</option>
                        <asp:ListItem value="JP" >Japan</option>
                        <asp:ListItem value="JE" >Jersey</option>
                        <asp:ListItem value="JO" >Jordan</option>
                        <asp:ListItem value="KZ" >Kazakhstan</option>
                        <asp:ListItem value="KE" >Kenya</option>
                        <asp:ListItem value="KI" >Kiribati</option>
                        <asp:ListItem value="KW" >Kuwait</option>
                        <asp:ListItem value="KG" >Kyrgyzstan</option>
                        <asp:ListItem value="LA" >Laos</option>
                        <asp:ListItem value="LV" >Latvia</option>
                        <asp:ListItem value="LB" >Lebanon</option>
                        <asp:ListItem value="LS" >Lesotho</option>
                        <asp:ListItem value="LR" >Liberia</option>
                        <asp:ListItem value="LY" >Libya</option>
                        <asp:ListItem value="LI" >Liechtenstein</option>
                        <asp:ListItem value="LT" >Lithuania</option>
                        <asp:ListItem value="LU" >Luxembourg</option>
                        <asp:ListItem value="MO" >Macao S.A.R., China</option>
                        <asp:ListItem value="MK" >Macedonia</option>
                        <asp:ListItem value="MG" >Madagascar</option>
                        <asp:ListItem value="MW" >Malawi</option>
                        <asp:ListItem value="MY" >Malaysia</option>
                        <asp:ListItem value="MV" >Maldives</option>
                        <asp:ListItem value="ML" >Mali</option>
                        <asp:ListItem value="MT" >Malta</option>
                        <asp:ListItem value="MH" >Marshall Islands</option>
                        <asp:ListItem value="MQ" >Martinique</option>
                        <asp:ListItem value="MR" >Mauritania</option>
                        <asp:ListItem value="MU" >Mauritius</option>
                        <asp:ListItem value="YT" >Mayotte</option>
                        <asp:ListItem value="MX" >Mexico</option>
                        <asp:ListItem value="FM" >Micronesia</option>
                        <asp:ListItem value="MD" >Moldova</option>
                        <asp:ListItem value="MC" >Monaco</option>
                        <asp:ListItem value="MN" >Mongolia</option>
                        <asp:ListItem value="ME" >Montenegro</option>
                        <asp:ListItem value="MS" >Montserrat</option>
                        <asp:ListItem value="MA" >Morocco</option>
                        <asp:ListItem value="MZ" >Mozambique</option>
                        <asp:ListItem value="MM" >Myanmar</option>
                        <asp:ListItem value="NA" >Namibia</option>
                        <asp:ListItem value="NR" >Nauru</option>
                        <asp:ListItem value="NP" >Nepal</option>
                        <asp:ListItem value="NL" >Netherlands</option>
                        <asp:ListItem value="AN" >Netherlands Antilles</option>
                        <asp:ListItem value="NC" >New Caledonia</option>
                        <asp:ListItem value="NZ" >New Zealand</option>
                        <asp:ListItem value="NI" >Nicaragua</option>
                        <asp:ListItem value="NE" >Niger</option>
                        <asp:ListItem value="NG" >Nigeria</option>
                        <asp:ListItem value="NU" >Niue</option>
                        <asp:ListItem value="NF" >Norfolk Island</option>
                        <asp:ListItem value="KP" >North Korea</option>
                        <asp:ListItem value="NO" >Norway</option>
                        <asp:ListItem value="OM" >Oman</option>
                        <asp:ListItem value="PK" >Pakistan</option>
                        <asp:ListItem value="PS" >Palestinian Territory</option>
                        <asp:ListItem value="PA" >Panama</option>
                        <asp:ListItem value="PG" >Papua New Guinea</option>
                        <asp:ListItem value="PY" >Paraguay</option>
                        <asp:ListItem value="PE" >Peru</option>
                        <asp:ListItem value="PH" >Philippines</option>
                        <asp:ListItem value="PN" >Pitcairn</option>
                        <asp:ListItem value="PL" >Poland</option>
                        <asp:ListItem value="PT" >Portugal</option>
                        <asp:ListItem value="QA" >Qatar</option>
                        <asp:ListItem value="IE" >Republic of Ireland</option>
                        <asp:ListItem value="RE" >Reunion</option>
                        <asp:ListItem value="RO" >Romania</option>
                        <asp:ListItem value="RU" >Russia</option>
                        <asp:ListItem value="RW" >Rwanda</option>
                        <asp:ListItem value="ST" >S&atilde;o Tom&eacute; and Pr&iacute;ncipe</option>
                        <asp:ListItem value="BL" >Saint Barth&eacute;lemy</option>
                        <asp:ListItem value="SH" >Saint Helena</option>
                        <asp:ListItem value="KN" >Saint Kitts and Nevis</option>
                        <asp:ListItem value="LC" >Saint Lucia</option>
                        <asp:ListItem value="SX" >Saint Martin (Dutch part)</option>
                        <asp:ListItem value="MF" >Saint Martin (French part)</option>
                        <asp:ListItem value="PM" >Saint Pierre and Miquelon</option>
                        <asp:ListItem value="VC" >Saint Vincent and the Grenadines</option>
                        <asp:ListItem value="SM" >San Marino</option>
                        <asp:ListItem value="SA" >Saudi Arabia</option>
                        <asp:ListItem value="SN" >Senegal</option>
                        <asp:ListItem value="RS" >Serbia</option>
                        <asp:ListItem value="SC" >Seychelles</option>
                        <asp:ListItem value="SL" >Sierra Leone</option>
                        <asp:ListItem value="SG" >Singapore</option>
                        <asp:ListItem value="SK" >Slovakia</option>
                        <asp:ListItem value="SI" >Slovenia</option>
                        <asp:ListItem value="SB" >Solomon Islands</option>
                        <asp:ListItem value="SO" >Somalia</option>
                        <asp:ListItem value="ZA" >South Africa</option>
                        <asp:ListItem value="GS" >South Georgia/Sandwich Islands</option>
                        <asp:ListItem value="KR" >South Korea</option>
                        <asp:ListItem value="SS" >South Sudan</option>
                        <asp:ListItem value="ES" >Spain</option>
                        <asp:ListItem value="LK" >Sri Lanka</option>
                        <asp:ListItem value="SD" >Sudan</option>
                        <asp:ListItem value="SR" >Suriname</option>
                        <asp:ListItem value="SJ" >Svalbard and Jan Mayen</option>
                        <asp:ListItem value="SZ" >Swaziland</option>
                        <asp:ListItem value="SE" >Sweden</option>
                        <asp:ListItem value="CH" >Switzerland</option>
                        <asp:ListItem value="SY" >Syria</option>
                        <asp:ListItem value="TW" >Taiwan</option>
                        <asp:ListItem value="TJ" >Tajikistan</option>
                        <asp:ListItem value="TZ" >Tanzania</option>
                        <asp:ListItem value="TH" >Thailand</option>
                        <asp:ListItem value="TL" >Timor-Leste</option>
                        <asp:ListItem value="TG" >Togo</option>
                        <asp:ListItem value="TK" >Tokelau</option>
                        <asp:ListItem value="TO" >Tonga</option>
                        <asp:ListItem value="TT" >Trinidad and Tobago</option>
                        <asp:ListItem value="TN" >Tunisia</option>
                        <asp:ListItem value="TR" >Turkey</option>
                        <asp:ListItem value="TM" >Turkmenistan</option>
                        <asp:ListItem value="TC" >Turks and Caicos Islands</option>
                        <asp:ListItem value="TV" >Tuvalu</option>
                        <asp:ListItem value="UG" >Uganda</option>
                        <asp:ListItem value="UA" >Ukraine</option>
                        <asp:ListItem value="AE" >United Arab Emirates</option>
                        <asp:ListItem value="GB" >United Kingdom (UK)</option>
                        <asp:ListItem value="US" >United States (US)</option>
                        <asp:ListItem value="UY" >Uruguay</option>
                        <asp:ListItem value="UZ" >Uzbekistan</option>
                        <asp:ListItem value="VU" >Vanuatu</option>
                        <asp:ListItem value="VA" >Vatican</option>
                        <asp:ListItem value="VE" >Venezuela</option>
                        <asp:ListItem value="VN" >Vietnam</option>
                        <asp:ListItem value="WF" >Wallis and Futuna</option>
                        <asp:ListItem value="EH" >Western Sahara</option>
                        <asp:ListItem value="WS" >Western Samoa</option>
                        <asp:ListItem value="YE" >Yemen</option>
                        <asp:ListItem value="ZM" >Zambia</option>
                        <asp:ListItem value="ZW" >Zimbabwe</option>
                      </select>--%>
                        <input type="hidden" id="hdnCountry" name="country" />
                      <noscript>
                      <input type="submit" name="woocommerce_checkout_update_totals" value="Update country" />
                      </noscript>
                    </p>
                    <p class="form-row form-row form-row-wide address-field validate-required" id="billing_address_1_field">
                      <label for="billing_address_1" class="">Address <abbr class="required" title="required">*</abbr></label>
                      <%--<input type="text" class="input-text " name="billing_address1" id="billing_address_1" placeholder="Street address"  value=""  />--%>
                        <asp:TextBox ID="txtAddress1" runat="server" class="input-text " placeholder="Street address" name="Address1" required="required"></asp:TextBox>
                    </p>
                    <p class="form-row form-row form-row-wide address-field" id="billing_address_2_field">
                      <%--<input type="text" class="input-text " name="billing_address2" id="billing_address_2" placeholder="Apartment, suite, unit etc. (optional)"  value=""  />--%>
                        <asp:TextBox ID="txtAddress2" runat="server" class="input-text " placeholder="Apartment, suite, unit etc. (optional)" name="Address2"></asp:TextBox>
                    </p>
                    <p class="form-row form-row form-row-wide address-field validate-required" id="billing_city_field">
                      <label for="billing_city" class="">Town / City <abbr class="required" title="required">*</abbr></label>
                      <%--<input type="text" class="input-text " name="billing_city" id="billing_city" placeholder=""  value=""  />--%>
                        <asp:TextBox ID="txtCity" runat="server" class="input-text " placeholder="City" name="City" required="required"></asp:TextBox>
                        <label id="city_error" style="display:none; color:red;">Please enter alphabates only.</label>
                    </p>
                    <p class="form-row form-row form-row-first address-field validate-required validate-state" id="billing_state_field">
                      <label for="txtState" class="">State / County <abbr class="required" title="required">*</abbr></label>
                        
                        <%--<asp:DropDownList ID="DrpStates" CssClass="state_select" name="billing_state" runat="server"></asp:DropDownList>--%>
         <%--<input type="text"name="billing_state" id="billing_state" class="input-text " />--%>
                        <asp:TextBox ID="txtState" runat="server" class="input-text " placeholder="State" name="State" required="required"></asp:TextBox>
                        <label id="state_error" style="display:none; color:red;">Please enter alphabates only.</label>
                      <%--<select name="billing_state" id="billing_state" class="state_select "  data-placeholder="">
                        <option value="">Select a state&hellip;</option>
                        <option value="AP" >Andhra Pradesh</option>
                        <option value="AR" >Arunachal Pradesh</option>
                        <option value="AS" >Assam</option>
                        <option value="BR" >Bihar</option>
                        <option value="CT" >Chhattisgarh</option>
                        <option value="GA" >Goa</option>
                        <option value="GJ" >Gujarat</option>
                        <option value="HR" >Haryana</option>
                        <option value="HP" >Himachal Pradesh</option>
                        <option value="JK" >Jammu and Kashmir</option>
                        <option value="JH" >Jharkhand</option>
                        <option value="KA" >Karnataka</option>
                        <option value="KL" >Kerala</option>
                        <option value="MP" >Madhya Pradesh</option>
                        <option value="MH" >Maharashtra</option>
                        <option value="MN" >Manipur</option>
                        <option value="ML" >Meghalaya</option>
                        <option value="MZ" >Mizoram</option>
                        <option value="NL" >Nagaland</option>
                        <option value="OR" >Orissa</option>
                        <option value="PB" >Punjab</option>
                        <option value="RJ" >Rajasthan</option>
                        <option value="SK" >Sikkim</option>
                        <option value="TN" >Tamil Nadu</option>
                        <option value="TS" >Telangana</option>
                        <option value="TR" >Tripura</option>
                        <option value="UK" >Uttarakhand</option>
                        <option value="UP" >Uttar Pradesh</option>
                        <option value="WB" >West Bengal</option>
                        <option value="AN" >Andaman and Nicobar Islands</option>
                        <option value="CH" >Chandigarh</option>
                        <option value="DN" >Dadar and Nagar Haveli</option>
                        <option value="DD" >Daman and Diu</option>
                        <option value="DL" >Delhi</option>
                        <option value="LD" >Lakshadeep</option>
                        <option value="PY" >Pondicherry (Puducherry)</option>
                      </select>--%>
                    </p>
                    <p class="form-row form-row form-row-last address-field validate-required validate-postcode" id="billing_postcode_field">
                      <label for="billing_postcode" class="">Postcode / ZIP <abbr class="required" title="required">*</abbr></label>
                      <%--<input type="text" class="input-text " name="billing_postcode" id="billing_postcode" placeholder=""  value=""  />--%>
                        <asp:TextBox ID="txtzip" MaxLength="6" runat="server" class="input-text numeric" placeholder="Zip Code" name="zipcode" required="required"></asp:TextBox>
                    </p>

                          
                    <div class="clear"></div>

                    <p class="form-row form-row form-row-first form-row-wide" id="billing_company_field">
                      <label for="billing_company" class="">Telephone<abbr class="required" title="required">*</abbr></label>
                      <%--<input type="text" class="input-text " name="billing_number" id="Telephone" placeholder=""  value=""  />--%>
                        <asp:TextBox ID="txtTelephone" runat="server" class="input-text  numeric" MaxLength="10" placeholder="Telephone" name="telephone" pattern="^\d{10}$" required="required"></asp:TextBox>
                    </p>
                    <p class="form-row form-row form-row-first validate-required validate-email" >
                      <label for="billing_email" class="">fax</label>
                      <%--<input type="text" class="input-text " name="billing_fax" id="email" placeholder=""  value=""  />--%>
                        <asp:TextBox ID="txtFax" runat="server" class="input-text numeric" placeholder="Fax" name="Fax" ></asp:TextBox>
                    </p>
                    <div class="clear"></div>
                    <fieldset>
                      <input id="ham1" class="input-text" type="checkbox" name="SaveShip" value="ham"/><label for="ham1">Save this address on Profile?</label>
                    </fieldset>
                   
                    <div class="clear"></div>
                    
                    <div class="clear"></div>
                    <%--<p class="form-row form-row-wide create-account">
                      <input class="input-checkbox" id="createaccount"  type="checkbox" name="createaccount" value="1" />
                      <label for="createaccount" class="checkbox">Create an account?</label>
                    </p>                   
                    
                    <div class="create-account">
                     <!--  <p>Create an account by entering the information below. If you are a returning customer please login at the top of the page.</p> -->
                      <p class="form-row form-row validate-required" id="account_password_field">
                        <label for="account_password" class="">Account password <abbr class="required" title="required">*</abbr></label>
                        <input type="password" class="input-text " name="account_password" id="account_password" placeholder="Password"  value=""  />
                      </p>
                      <div class="clear"></div>
                    </div>--%>
                    </div>
                  </div>

                </div>
                <div class="vc_col-md-4">
                  <%--<div class="woocommerce-shipping-fields">
                    <h3>SHIPPING METHOD</h3>
                      
                    <p class="form-row form-row notes" id="order_comments_field">
                      <label for="order_comments" class="">Sorry, no quotes are available for this order at this time.</label>                     
                    </p>
                  </div>--%>
                  <div class="woocommerce-shipping-fields ccTerm">
                    <h5>PAYMENT METHOD</h5>
                     <% if (cusID != "GUEST")
    {
        if(UserTerm =="CREDIT CARD") { 
        if (ccList != null)
        {
            foreach (var i in ccList)
            { %>
                      <div class="add-page-details" name="<%=i.cardType %>">
                         
                          <%--<p ><%=i.cardType %></p>--%>
                          <p name="CCnumber">Card Number :<%=i.cardNumber%></p>
                          <%--<p name="exdate">Exp. Date :<%=i.expirationDate%></p>--%>
                          <p class="form-row form-row form-row-wide address-field" ><%--<input type="text" class="cvv" name="<%=i.cardType %>"  placeholder="CVV" />--%> 
                              <asp:TextBox ID="txtCVVVarify" runat="server" MaxLength="3" class="input-text cvv numeric" placeholder="CVV" name="CVV_Varify" required="required"></asp:TextBox>
                          </p>
                          <%--<input id="ham" type="radio" class="ultsl-radio-unchecked " name="CCdefault" value="<%=i.cardType %>"/><label>Make Default</label>--%>
                           <% if (i.cardType == CCID)
    { %>
                          <div class="radio radio-danger">
                                        <input type="radio" name="CCdefault" id="<%=i.cardType %>" value="<%=i.cardType %>" checked="checked">
                                        <label for="<%=i.cardType %>">Use This</label>
                                    </div>
                          <%}
    else
    {%>
                          <div class="radio radio-danger">
                                        <input type="radio" name="CCdefault" id="<%=i.cardType %>" value="<%=i.cardType %>">
                                        <label for="<%=i.cardType %>">Use This</label>
                                    </div>
                              <%} %>
                          
                      </div>
                      <%}%>
                      <p class="" >
                      <a href="#" class="button alt addnewCC" >Use different Credit card. </a><a href="#" class="button right-icon CCclose" >Close</a>
                          </p>
                                   <%}
                                       
    else
    {%><p class="form-row form-row notes" id="">
                      <label  class="noCC">No CC on Profile</label>                    
                    </p><%
        }}
                                       else { %><p class="form-row form-row notes" id="">
                      <label  class="noCC"><%=UserTerm %></label>                    
                    </p><%
                                } 
                            } %>

                      
                      <input id="hdnCCNumber" name="paymentProfileID" value="<%=CCID %>"" type="hidden"/>
                     
                      <div class="cc">
                    <p class="form-row form-row notes" id="order_comments_field">
                      <label for="order_comments" class="">Credit Card - Swipe</label>                    
                    </p>
                    <p class="form-row form-row  validate-required" id="billing_last_name_field">
                      <label for="billing_last_name" class="">Name on Card<abbr class="required" title="required">*</abbr></label>
                      <%--<input type="text" class="input-text " name="CardName" id="billing_last_name" placeholder="" value="">--%>
                        <asp:TextBox ID="txtCardName" runat="server" class="input-text " placeholder="Name on card" name="CardName" required="required"></asp:TextBox>
                    </p>
                    <p class="form-row form-row  validate-required" id="billing_last_name_field">
                      <label for="txtCardNumber" class="">Card Number<abbr class="required" title="required">*</abbr></label>
                      <%--<input type="text" class="input-text " name="CardNumber" id="billing_last_name" placeholder="" value="">--%>
                        <asp:TextBox ID="txtCardNumber" MaxLength="16" Names="CardNumber" runat="server" class="input-text numeric" placeholder="Credit card Number" required="required"></asp:TextBox>
                        <label id="card_error" style="display:none; color:red;">Please enter valid Card Number between 14 and 16 digit.</label>
                    </p>

                    

                    <p class="form-row form-row  form-row-wide" id="billing_company_field">
                      <label for="billing_country" class="">Expiration Date<abbr class="required" title="required">*</abbr></label>
                    </p>
                    <p class="form-row form-row form-row-first form-row-wide" id="billing_company_field">
                      <asp:DropDownList name="Exp_Month" ID="DrpMonth" runat="server" class="country_to_state country_select " required="required">
                        <asp:ListItem value="">Month</asp:ListItem>
                        <asp:ListItem value="01">January</asp:ListItem>
                        <asp:ListItem value="02">February</asp:ListItem>
                        <asp:ListItem value="03">March</asp:ListItem>
                        <asp:ListItem value="04">April</asp:ListItem>
                        <asp:ListItem value="05">May</asp:ListItem>
                        <asp:ListItem value="06">June</asp:ListItem>
                        <asp:ListItem value="07">July</asp:ListItem>
                        <asp:ListItem value="08">August</asp:ListItem>
                        <asp:ListItem value="09">September</asp:ListItem>
                        <asp:ListItem value="10">October</asp:ListItem>
                        <asp:ListItem value="11">November</asp:ListItem>
                        <asp:ListItem value="12">December</asp:ListItem>          
                      </asp:DropDownList>
                      <%--<select name="Exp_Month" id="billing_company" class="country_to_state country_select ">
                        <option value="">Month</option>
                        <option value="01">January</option>
                        <option value="02">February</option>
                        <option value="03">March</option>
                        <option value="04">April</option>
                        <option value="05">May</option>
                        <option value="06">June</option>
                        <option value="07">July</option>
                        <option value="08">August</option>
                        <option value="09">September</option>
                        <option value="10">October</option>
                        <option value="11">November</option>
                        <option value="12">December</option>                       
                      </select>  --%>                    
                      <noscript>
                      &lt;input type="submit" name="woocommerce_checkout_update_totals" value="Update country" /&gt;
                      </noscript>
                    </p>
                  <p class="form-row form-row form-row-first validate-required validate-email" id="billing_email_field">
                      <asp:DropDownList name="Exp_year" ID="DrpYear" runat="server" class="country_to_state country_select numeric" required="required"></asp:DropDownList>
                      <%--<select name="Exp_year" id="billing_company" class="country_to_state country_select ">
                         
                        <option value="">Year</option>
                        <option value="17">2017</option>
                        <option value="18">2018</option>
                        <option value="19">2019</option>
                        <option value="20">2020</option>
                        <option value="21">2021</option>
                        <option value="22">2022</option>
                        <option value="23">2023</option>
                        <option value="24">2024</option>
                        <option value="25">2025</option>
                        <option value="26">2026</option>
                        <option value="27">2027</option>
                        <option value="28">2028</option>     
                        <option value="29">2029</option>                     
                        <option value="30">2030</option>                     
                                          
                      </select>--%>
                      </p>     
                      <div class="clear"></div>
                       <p class="form-row form-row  validate-required" id="billing_last_name_field">
                          <label for="billing_last_name" class="">Card Verification Number<abbr class="required" title="required">*</abbr></label>
                      <%--<input type="text" class="input-text " name="CardVarificationNumber" id="Card_Verification_Number" placeholder="" value=""/>--%>
                           <asp:TextBox ID="txtCVV" runat="server" MaxLength="3" class="input-text numeric" placeholder="CVV" name="CardVarificationNumber" required="required"></asp:TextBox>
                   </p> 
                          
                    <fieldset>                   
                      <input id="ham" type="checkbox" name="SaveCC" value="ham"/><label for="ham">Save on Profile?</label>
                    </fieldset>
                               
                  </div>
                     </div>
                  <div class="clear"></div>
                  <%--<p class="form-row form-row  validate-required" id="billing_last_name_field">
                      <label for="billing_last_name" class="">Card Verification Number<abbr class="required" title="required">*</abbr></label>
                      <input type="text" class="input-text " name="" id="billing_last_name" placeholder="" value="">
                   </p>--%>

                  <%-- <div class="woocommerce-shipping-fields">
                    <h3>DISCOUNT CODES</h3>
                    <p class="form-row form-row  validate-required" id="billing_last_name_field">
                      <label for="billing_last_name" class="">Enter your coupon code:<abbr class="required" title="required">*</abbr></label>
                      <input type="text" class="input-text " name="CouponCode" id="billing_last_name" placeholder="" value="">
                    </p>
                   
                    <input type="submit" class="button-view alt" name="woocommerce_checkout_place_order" id="apply" value="Apply" data-value="Apply">
                    
                  </div>--%>

                </div>

                <div class="vc_col-md-4">
                  <div class="woocommerce-shipping-fields">
                    <h5>REVIEW YOUR ORDER</h5>
                    <p class="form-row form-row notes" id="order_comments_field">
                     <div id="order_review" class="woocommerce-checkout-review-order">
                <table class="shop_table woocommerce-checkout-review-order-table">
                  <thead>
                    <tr>
                      <th class="product-name">Product</th>                      
                      <th class="product-total">Total</th>
                    </tr>
                  </thead>
                  <tbody>
                      <%if (Products != null)
                          {
                              foreach (var item in Products)
                              {%>  
                      <tr class="cart_item">
                      <td class="product-name"><%=item.PROD_CD %>&nbsp;<strong class="product-quantity">&times; <%=item.QTYinCart %></strong></td>
                       <td class="product-total">
                       <span class="amount">&#36;<%= Convert.ToDouble(item.RETAIL_PRS * item.QTYinCart).ToString("0.00") %></span></td>
                       </tr>
                       <%}
                           }
                           else
                           { 
        %>
                               <tr class="cart_item"><td>No product selected for Order process.</td></tr>
                         <%  }%>
                    <%--<tr class="cart_item">
                      <td class="product-name"> Anderson Anorak&nbsp; <strong class="product-quantity">&times; 1</strong></td>                      
                      <td class="product-total"><span class="amount">&#36;249.00</span></td>
                    </tr>--%>
                  </tbody>

                  <tfoot>
                    <tr class="cart-subtotal">
                      <th>Subtotal</th>
                      <td><span class="amount">&#36;<span class="subtotal"><%=Convert.ToDouble(totalAmount).ToString("0.00") %></span></span></td>
                    </tr>
                      <%if (Convert.ToInt32(HttpContext.Current.Session["drop"]) != 0)
                          {%>
                      <tr class="cart-subtotal">
                      <th>Dropship fee</th>
                      <td><span class="amount">&#36;<%=Convert.ToDouble(HttpContext.Current.Session["drop"]).ToString("0.00") %></span></td>
                    </tr>
                     <%}
                         if (custype == 1)
                         {%>
                  <tr class="cart-subtotal ShippingCharge">
                  <th>Shipping Charge</th>
                  <td data-title="Subtotal"><span class="amount">&#36;<span class="shipamnt"><%= Convert.ToDouble(HttpContext.Current.Session["ShippingCharge"]!=null?HttpContext.Current.Session["ShippingCharge"]:0).ToString("0.00")%></span></span></td>
                </tr>
                  <%} %>
                    <tr class="order-total">
                      <th>Total</th>
                      <td><strong><span class="amount">&#36;<span class="grandtotal"><%=Convert.ToDouble(totalAmount + Convert.ToDouble(HttpContext.Current.Session["ShippingCharge"]!=null?HttpContext.Current.Session["ShippingCharge"]:0)+Convert.ToDouble(HttpContext.Current.Session["drop"])).ToString("0.00")%></span></strong></td>
                    </tr>
                  </tfoot>

                </table>
                
                <div id="payment" class="woocommerce-checkout-payment">
                  <!-- <ul class="wc_payment_methods payment_methods methods">
                    <li class="wc_payment_method payment_method_cheque">
                      <input id="payment_method_cheque" type="radio" class="input-radio" name="payment_method" value="cheque"  checked='checked' data-order_button_text="" />
                      <label for="payment_method_cheque"> Cheque Payment </label>
                      <div class="payment_box payment_method_cheque" >
                        <p>Please send your cheque to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p>
                      </div>
                    </li>
                    <li class="wc_payment_method payment_method_paypal">
                      <input id="payment_method_paypal" type="radio" class="input-radio" name="payment_method" value="paypal"  data-order_button_text="Proceed to PayPal" />
                      <label for="payment_method_paypal"> PayPal <img src="https://www.paypalobjects.com/webstatic/mktg/logo/AM_mc_vs_dc_ae.jpg" alt="PayPal Acceptance Mark" /><a href="https://www.paypal.com/us/webapps/mpp/paypal-popup" class="about_paypal" onclick="javascript:window.open('https://www.paypal.com/us/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;" title="What is PayPal?">What is PayPal?</a> </label>
                      <div class="payment_box payment_method_paypal" style="display:none;">
                        <p>Pay via PayPal; you can pay with your credit card if you don&#8217;t have a PayPal account.</p>
                      </div>
                    </li>
                  </ul> -->
                  <div class="form-row place-order">
                   
                    <%--<input type="submit" class="button alt" name="woocommerce_checkout_place_order" id="place_order" value="Place order" data-value="Place order" />--%>
                        <asp:Button CssClass="campco-btn button" ID="btnProcessOrder" runat="server"  name="woocommerce_checkout_place_order" OnClick="btnProcessOrder_Click" Text="Place order"></asp:Button>               
                  </div>
                </div>
              </div>
                   
                  </div>
                </div>
              </div>

              <!-- <h3 id="order_review_heading">Your order</h3>
              <div id="order_review" class="woocommerce-checkout-review-order">
                <table class="shop_table woocommerce-checkout-review-order-table">
                  <thead>
                    <tr>
                      <th class="product-name">Product</th>
                      <th class="product-total">Total</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr class="cart_item">
                      <td class="product-name"> Anderson Anorak&nbsp; <strong class="product-quantity">&times; 1</strong></td>
                      <td class="product-total"><span class="amount">&#36;249.00</span></td>
                    </tr>
                  </tbody>
                  <tfoot>
                    <tr class="cart-subtotal">
                      <th>Subtotal</th>
                      <td><span class="amount">&#36;249.00</span></td>
                    </tr>
                    <tr class="order-total">
                      <th>Total</th>
                      <td><strong><span class="amount">&#36;249.00</span></strong></td>
                    </tr>
                  </tfoot>
                </table>
                <div id="payment" class="woocommerce-checkout-payment">
                  <ul class="wc_payment_methods payment_methods methods">
                    <li class="wc_payment_method payment_method_cheque">
                      <input id="payment_method_cheque" type="radio" class="input-radio" name="payment_method" value="cheque"  checked='checked' data-order_button_text="" />
                      <label for="payment_method_cheque"> Cheque Payment </label>
                      <div class="payment_box payment_method_cheque" >
                        <p>Please send your cheque to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p>
                      </div>
                    </li>
                    <li class="wc_payment_method payment_method_paypal">
                      <input id="payment_method_paypal" type="radio" class="input-radio" name="payment_method" value="paypal"  data-order_button_text="Proceed to PayPal" />
                      <label for="payment_method_paypal"> PayPal <img src="https://www.paypalobjects.com/webstatic/mktg/logo/AM_mc_vs_dc_ae.jpg" alt="PayPal Acceptance Mark" /><a href="https://www.paypal.com/us/webapps/mpp/paypal-popup" class="about_paypal" onclick="javascript:window.open('https://www.paypal.com/us/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;" title="What is PayPal?">What is PayPal?</a> </label>
                      <div class="payment_box payment_method_paypal" style="display:none;">
                        <p>Pay via PayPal; you can pay with your credit card if you don&#8217;t have a PayPal account.</p>
                      </div>
                    </li>
                  </ul>
                  <div class="form-row place-order">
                    <noscript>
                    Since your browser does not support JavaScript, or it is disabled, please ensure you click the <em>Update Totals</em> button before placing your order. You may be charged more than the amount stated above if you fail to do so. <br/>
                    <input type="submit" class="button alt" name="woocommerce_checkout_update_totals" value="Update totals" />
                    </noscript>
                    <input type="submit" class="button alt" name="woocommerce_checkout_place_order" id="place_order" value="Place order" data-value="Place order" />
                    <input type="hidden" id="_wpnonce" name="_wpnonce" value="4d986669c5" />
                    <input type="hidden" name="_wp_http_referer" value="/demo/ezio-modern-shop/checkout/" />
                  </div>
                </div>
              </div> -->
            </div>
            </div>
          </div>
                 </article>
        </div>
        <!-- .entry-content -->


        <!-- #post-## -->

    </div>
    <!-- close .width-container-qube -->
    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery(".ShippingCharge").hide();
        //    jQuery('input[name=ADDdefault]').each(function(){
        //        jQuery(this).is('checked')
        //        {
        //            jQuery('#hdn').val()
        //        }
        //    });
        //    jQuery('input[name=CCdefault]').each(function(){
        //        jQuery("").is('checked')
        //    });
       
            
            jQuery('#newshipping').hide();
            jQuery('a.close').hide();
            jQuery('.cc').hide();
            jQuery('.CCclose').hide();
            //jQuery('.addnewCC').hide();
            jQuery('input.cvv').hide();
              var cc=jQuery('.noCC').text();
                var ADD=jQuery('.noADD').text();
             if(cc.lenth>0){
                jQuery('.addnewCC').show();
                }
                if(ADD.lenth>0){
                jQuery('#newshipping').show();
                }
            <% var a = HttpContext.Current.Session["drop"] != null ? HttpContext.Current.Session["drop"].ToString() : "0";
        var b = HttpContext.Current.Session["CustomerID"] != null ? HttpContext.Current.Session["CustomerID"].ToString() : "GUEST";
        var term = HttpContext.Current.Session["Term"] != null ? HttpContext.Current.Session["Term"].ToString().ToUpper() : "CREDIT CARD";
        
        %>
            var x= <%=a%>;
            var y="<%=b%>";
            var z="<%=term%>";
            var cc="<%=cc%>";
            var add="<%=add%>";

            if(cc=="0")
            {
                jQuery('.cc').show();
            }
            if(z!="CREDIT CARD")
            {
                //alert("hello");
                jQuery('.addnewCC').hide();
                jQuery('.cc').hide();
            }
            else{
                if(cc=="0")
                {
                    jQuery('.cc').show();
                }
            }
            // alert(y);
            
            
            if(add=="0")
            {
                jQuery('#newshipping').show();
                //jQuery('a.addnewAdd').hide();
                
                //jQuery('.addnewCC').hide();
            }
            if(y=="GUEST")
            {
                jQuery('#newshipping').show();
                jQuery('a.addnewAdd').hide();
                jQuery('.cc').show();
                jQuery('.addnewCC').hide();
                
            }
            else if (x!=0)
            {
                jQuery('#newshipping').show();
                jQuery('a.addnewAdd').hide();
            }
            
            //jQuery('a.close').hide();
            jQuery('a.addnewAdd').click(function () {
                jQuery('#newshipping').show();
                jQuery('a.close').show();
                jQuery('input[name=ADDdefault]').removeAttr("checked");
                jQuery('#hdnshipAddress').val("");
            });
            
            jQuery('a.close').click(function () {
                jQuery('#newshipping').hide();
                jQuery('a.close').hide();
               jQuery("#ContentPlaceHolder1_txtfname").val("");
                
            });
            jQuery('.addnewCC').click(function(){
                jQuery('.cc').show();
                jQuery('a.CCclose').show();
                jQuery('input[name=CCdefault]').removeAttr("checked");
                jQuery('#hdnCCNumber').val("");
                jQuery('input.cvv').hide();

            });
            jQuery('.CCclose').click(function(){
                jQuery('.cc').hide();
                jQuery('a.CCclose').hide();
                jQuery("#ContentPlaceHolder1_txtCardNumber").val("");
            });

            jQuery('input[name=CCdefault]').click(function(){
                //alert( jQuery(this).val());
                jQuery('.cvv').hide();
                jQuery('div[name='+jQuery(this).val()+']  input').show();
                //jQuery('div[name='+jQuery(this).val()+']  input').val('');
                jQuery('#hdnCCNumber').val(jQuery(this).val());
                jQuery('div[name='+jQuery(this).val()+']  input[type=text]').val('');
                

            });

            jQuery('.Shipping').change(function () {
                var country=jQuery(this).val();
                //alert("sip");
                if(country=="")
                {
                    InternationalShipping("-1");
                }
                else if (country!="US") {
                            //$('tr.dropship').fadeIn(1000);
                            //var x =<%=totalAmount+=3%>
                            //$('tr.order-total td[data-title] span.amount').text('$' + x)
                            InternationalShipping(1);
                            //drop(3);
                }
                 
                        else {
                            //$('tr.dropship').fadeOut(1000);
                           // var x =<%=totalAmount-=3%>
                           /// $('tr.order-total td[data-title] span.amount').text('$' + x)
                            //drop(0);
                            InternationalShipping(0);
                        }
            });
            function InternationalShipping(drop)
            {
                jQuery(".ShippingCharge").show();
                var dataString = "{value:'" + drop + "'}";
                var URL = window.location.origin + window.location.pathname + '/Shipping_charge';
                jQuery.ajax({
                    type: "POST",
                    url: URL,//+"/Addtocart",
                    contentType: "application/json; charset=utf-8",
                    data: dataString,//"{value:'"+pr_code+"'}",
                    dataType: "json",
                    success: function (response) {
                        jQuery("span.shipamnt").text(response.d.toFixed(2));
                        var subtotal=parseFloat(jQuery("span.subtotal").text());
                        var total=subtotal+parseFloat(response.d);
                        jQuery("span.grandtotal").text(total.toFixed(2));
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });

                   
            }
            var txtname=jQuery("#ContentPlaceHolder1_txtfname").val();
            var txtcardnumber=jQuery("#ContentPlaceHolder1_txtCardNumber").val();
            if(txtname!="")
            {
                jQuery("#newshipping").show();
                jQuery('.close').show();
                jQuery("#hdnshipAddress").val("");
                jQuery('input[name=ADDdefault]').removeAttr("checked");
            }
            if(txtcardnumber!="")
            {
                jQuery(".cc").show();
                jQuery(".CCclose").show();
                jQuery("#hdnCCNumber").val("");
                jQuery('input[name=SaveCC]').removeAttr("checked");
            }
            jQuery('input[name=ADDdefault]').click(function(){
                var id=jQuery(this).val();
                var fname=jQuery('div[name='+id+'] p[name=fname]').text();
                var address=jQuery('div[name='+id+'] p[name=address]').text();
                var city= jQuery('div[name='+id+'] p[name=city]').text();
                var state=jQuery('div[name='+id+'] p[name=state]').text();
                var zip=jQuery('div[name='+id+'] p[name=zip]').text();
                var company=jQuery('div[name='+id+'] p[name=company]').text();
                var faxNumber=jQuery('div[name='+id+'] p[name=faxNumber]').text();
                var phoneNumber=jQuery('div[name='+id+'] p[name=phoneNumber]').text();
                var country=jQuery('div[name='+id+'] p[name=country]').text();
                var email=jQuery('div[name='+id+'] p[name=email]').text();

                
                //jQuery('#ContentPlaceHolder1_txtfname').val(fname.split(' ')[0]);
                //jQuery('#ContentPlaceHolder1_txtLname').val(fname.split(' ')[1]);
                //jQuery('#ContentPlaceHolder1_txtEmail').val(email);
                //jQuery('#ContentPlaceHolder1_txtAddress1').val(address.split(',')[0]);
                //jQuery('#ContentPlaceHolder1_txtAddress2').val(address.split(',')[1]);
                //jQuery('#ContentPlaceHolder1_txtCity').val(city);
                //jQuery('#ContentPlaceHolder1_txtState').val(state);
                //jQuery('#ContentPlaceHolder1_DrpCountry').val(country);
                //jQuery('#ContentPlaceHolder1_txtzip').val(zip);
                //jQuery('#ContentPlaceHolder1_txtCompany').val(company);
                
                // jQuery('input[name=CompanyName]').val(company);

                jQuery('#hdnshipAddress').val(id);
                jQuery('#hdncountry').val(country);
                if(country=="")
                {
                    InternationalShipping("-1");
                } 
                else if (country!="US") {
                            //$('tr.dropship').fadeIn(1000);
                            //var x =<%=totalAmount+=3%>
                            //$('tr.order-total td[data-title] span.amount').text('$' + x)
                            InternationalShipping(1);
                            //drop(3);
                }
                else  {
                    //$('tr.dropship').fadeOut(1000);
                   // var x =<%=totalAmount-=3%>
                   /// $('tr.order-total td[data-title] span.amount').text('$' + x)
                    //drop(0);
                    InternationalShipping(0);
                }
            });
        });
                    jQuery('input[name=SaveCC]').click(function () {
                        if (jQuery(this).is(':checked')) {
                            Save(1,"SaveCC");
                        }
                        else {
                            Save(0,"SaveCC");
                        }
                    });
                jQuery('input[name=SaveShip]').click(function () {
                        if (jQuery(this).is(':checked')) {
                            Save(1,"SaveADD");
                        }
                        else {
                            Save(0,"SaveADD");
                        }
                    });
        function Save(drop,string)
            {
                var dataString = "{value:'" + drop + "'}";
                var URL = window.location.origin + window.location.pathname + '/'+string;
                jQuery.ajax({
                    type: "POST",
                    url: URL,//+"/Addtocart",
                    contentType: "application/json; charset=utf-8",
                    data: dataString,//"{value:'"+pr_code+"'}",
                    dataType: "json",
                    success: function (response) {
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
        }
    </script>
    <%--<script src="assets/js/validation/jquery-1.11.1.js"></script>--%>
    <script type="text/javascript" src="assets/js/validation/jquery.validate.js"></script>
       <script type="text/javascript" src="assets/js/validation/additional-methods.min.js"></script>
    <script type="text/javascript">
        jQuery.validator.addMethod("ValidEmail",function(value,element){
            //alert("In addtional method.");
            var emailstr = /^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
            if(!emailstr.test(value)){
                return false;
            } else {
                return true;
            }
        }, 'Please enter a valid email address.');

        jQuery.validator.addMethod("alphabet",function(value,element){
            //alert("In addtional method.");
            var emailstr = /^[A-z]+$/;
            if(!emailstr.test(value)){
                return false;
            } else {
                return true;
            }
        }, 'Please enter a alphabats only.');

        jQuery.validator.addMethod("digit",function(value,element){
            //alert("In addtional method.");
            var emailstr = /^[0-9]+$/;
            if(!emailstr.test(value)){
                return false;
            } else {
                return true;
            }
        }, 'Please enter numeric only.');
        </script>
    <script type="text/javascript">
        

        jQuery(document).ready(function() {
            
            jQuery('.button').click(function(){
                
                var x=jQuery("#form1").validate({
                    rules :{
                        ctl00$ContentPlaceHolder1$txtfname:{required:true,alphabet:true},
                        ctl00$ContentPlaceHolder1$txtLname:{required:true,alphabet:true},
                        ctl00$ContentPlaceHolder1$txtEmail:{
                            required:true,
                            ValidEmail:true
                        },
                        ctl00$ContentPlaceHolder1$DrpCountry:"required",
                        ctl00$ContentPlaceHolder1$txtAddress1:"required",
                        ctl00$ContentPlaceHolder1$txtCity:"required",
                        ctl00$ContentPlaceHolder1$txtState:"required",
                        ctl00$ContentPlaceHolder1$txtzip:{required:true,rangelength:[5,7],digit:true},
                        ctl00$ContentPlaceHolder1$txtTelephone:{required:true,rangelength:[10,12],digit:true},
                        ctl00$ContentPlaceHolder1$txtCardName:"required",
                        ctl00$ContentPlaceHolder1$txtCardNumber:{required:true,rangelength:[14,16],digit:true},
                        ctl00$ContentPlaceHolder1$DrpMonth:"required",
                        ctl00$ContentPlaceHolder1$DrpYear:"required",
                        ctl00$ContentPlaceHolder1$txtCVV:"required",
                        ctl00$ContentPlaceHolder1$txtCVVVarify:"required"
                    },
                    
                    messages: {
                        ctl00$ContentPlaceHolder1$txtfname:{required:"Please enter first name."},
                        ctl00$ContentPlaceHolder1$txtLname:{required:"Please enter last name."},
                        ctl00$ContentPlaceHolder1$txtEmail:{required:"Please enter email.",ValidEmail:"Email is not valid,please enter valid Email."},
                        ctl00$ContentPlaceHolder1$DrpCountry:"Please select country.",
                        ctl00$ContentPlaceHolder1$txtAddress1:"Please enter address.",
                        ctl00$ContentPlaceHolder1$txtCity:"Please enter city.",
                        ctl00$ContentPlaceHolder1$txtState:"Please enter state.",
                        ctl00$ContentPlaceHolder1$txtzip:{required:"Please enter zip.",rangelength:"Please enter valid zip code."},
                        ctl00$ContentPlaceHolder1$txtTelephone:{required:"Please enter valid phone number.",rangelength:"Please enter valid phone number."},
                        ctl00$ContentPlaceHolder1$txtCardName:"Please enter card name.",
                        ctl00$ContentPlaceHolder1$txtCardNumber:{required:"Please enter card number.",rangelength:"Please enter card number between 14 to 16 number"},
                        ctl00$ContentPlaceHolder1$DrpMonth:"Please select month.",
                        ctl00$ContentPlaceHolder1$DrpYear:"Please select year.",
                        ctl00$ContentPlaceHolder1$txtCVV:"Please enter CVV."
                    }
                });
                });
            });

            jQuery(".numeric").keydown(function (e) {
                // Allow: backspace, delete, tab, escape, enter and .
                if (jQuery.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                    // Allow: Ctrl+A, Command+A
                    (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
                    // Allow: home, end, left, right, down, up
                    (e.keyCode >= 35 && e.keyCode <= 40)) {
                    // let it happen, don't do anything
                    return;
                }
                // Ensure that it is a number and stop the keypress
                if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                    
                    e.preventDefault();
                }
            });
            
        </script>
</asp:Content>
