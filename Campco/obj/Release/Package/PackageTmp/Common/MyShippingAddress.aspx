<%-- Created By - Nisha Patel---%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="MyShippingAddress.aspx.cs" Inherits="Campco.Common.MyShippingAddress" %>
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
      <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
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
    <div id="content-qube">
        <div class="width-container-qube">
            <div class="page-content-pro">
                <div class="vc_row wpb_row vc_row-fluid vc_custom_1452037142280 vc_row-has-fill">
                    <div class="wpb_column vc_column_container vc_col-sm-12">
                        <div class="vc_column-inner vc_row">
                            <div class="wpb_wrapper">
                                <div class="wpb_text_column">
                                    <div class="wpb_wrapper">
                                        <div role="form">
                                            <div class="screen-reader-response"></div>
                                            <div class="vc_col-sm-12">

                                                <div id="popupcc3" class="simplePopup3">
                                                    <div class="form-style-2">
                                                        <%--     <div class="form-style-2-heading">Add Shipping Address</div>
                                                        --%>
                                                        <label for="field1">
                                                            <span>First Name<span class="required">*</span></span>
                                                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="textarea-address" name="txtFirstName" required="required"></asp:TextBox>
                                                        </label>
                                                        <label for="field2">
                                                            <span>Last Name<span class="required">*</span></span>
                                                            <asp:TextBox ID="txtLastName" runat="server" CssClass="textarea-address" name="txtLastName" required="required"></asp:TextBox>
                                                        </label>
                                                        <label for="field3">
                                                            <span>Address<span class="required">*</span></span>
                                                            <asp:TextBox ID="txtaddress" runat="server" CssClass="textarea-address" TextMode="MultiLine" name="txtaddress" required="required"></asp:TextBox>
                                                        </label>
                                                        <label for="field4">
                                                            <span>City<span class="required">*</span></span>
                                                            <asp:TextBox ID="txtCity" runat="server" CssClass="textarea-address" name="txtCity" required="required"></asp:TextBox>
                                                        </label>
                                                        <label for="field7">
                                                            <span>State<span class="required">*</span></span>
                                                            <asp:TextBox ID="txtState" runat="server" CssClass="textarea-address" name="txtState" required="required"></asp:TextBox>
                                                        </label>
                                                       
                                                              
                                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                    <ContentTemplate>
                                                         <label for="field9">
                                                            <span>Country<span class="required">*</span></span>
                                                                 <asp:DropDownList ID="ddlShippingCountry" name="ddlShippingCountry"  CssClass="select-field"  AutoPostBack="true" runat="server" required="required">                          
                         <asp:ListItem value="0">Select a country&hellip;</asp:ListItem>
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
                  <%--      <asp:ListItem value="US" >United States (US)</asp:ListItem>--%>
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
                                                             
                                                        </label>        
                                                                </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                           <label>

                                                           </label>

                                                        <label for="field8">
                                                            <span>Zip Code<span class="required">*</span></span>
                                                            <asp:TextBox ID="txtPincode" runat="server" CssClass="textarea-address" required="required" name="txtPincode"></asp:TextBox>

                                                        </label>
                                                        <div class="vc_col-md-6">
                                                        <asp:Button ID="btnsubmit" runat="server" Text="Add Address" CssClass="btn btn-save-add btnsubmit textarea-address" OnClick="btnsubmit_Click"></asp:Button>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="addresspopup"><a href="#" class="popupc3">Add Shipping Address.</a></div>


                                                <% if (addressList != null)
                                                    {
                                                        int x = 0;
                                                         if (x == 0)
                                                        {
                                                           result = addressList.Find(y => y.customerAddressId == AddressId);
                                                            x++;
                                                        }
                                                        %>

                                                <%if (result != null)
                                                { %>

                                                <div class="vc_row">
                                                <div class="save-address vc_col-md-3 vc_col-sm-6 Update">
                                                    <%-- <h5>Your Saved Address</h5>--%>
                                                    <div class="add-page-details">
                                                        <%--  <h5>Jack Peterson</h5>--%>
                                                        <%--     <h5><%=i.customerAddressId %></h5>--%>
                                                      <%--  <h5>Address - <%=x%></h5>--%>
                                                        <p name="ContacName"><%=result.firstName %>&nbsp;<%=result.lastName%></p>
                                                        <p name="shpadd"><%=result.address %></p>
                                                        <p name="city"><%=result.city%></p>
                                                        <p name="state"><%=result.state%></p>
                                                        <p name="zip"><%=result.zip%></p>
                                                        <p name="Country"><%=result.country%></p>
                                                        <%--<asp:RadioButton ID="rbDefault" runat="server" Text="Default Address" OnCheckedChanged="rbDefault_CheckedChanged" />--%>
                                                        <%if (AddressId == result.customerAddressId.ToString())
    { %>
                                                        <div class="radio radio-danger">
                                                            <input type="radio" name="address" class="Update" id="radio<%=x %>" addid="<%=result.customerAddressId %>" value="option1" checked="checked">
                                                            <label for="radio<%=x %>">Default Address</label>
                                                        </div>
                                                        <%}
    else
    { %>
                                                        <div class="radio radio-danger">
                                                            <input type="radio" name="address" class="Update" id="radio<%=x %>" addid="<%=result.customerAddressId %>" value="option1">
                                                            <label for="radio<%=x%>">Default Address</label>
                                                        </div>
                                                        <%} %>

                                                        <%--<input type="button" name="AddressID" value="Delete" id="<%=i.customerAddressId %>" class="<%=(x>1)?"delete button btn btn-save-add":"MycardDelete" %>"  />--%>
                                                        <input type="button" name="addressid" value="delete" id="<%=result.customerAddressId %>" class="delete button btn btn-save-add" />

                                                    </div>



                                                </div>
                                                <%} addressList.Remove(addressList.Find(y => y.customerAddressId == AddressId)); %>

                                                <% foreach (var i in addressList)
                                                    {
                                                        x++;
                                                        
                                                       
                                                        %>
    
                                                <div class="save-address vc_col-md-3 vc_col-sm-6 Update">
                                                    <%-- <h5>Your Saved Address</h5>--%>
                                                    <div class="add-page-details">
                                                        <%--  <h5>Jack Peterson</h5>--%>
                                                        <%--     <h5><%=i.customerAddressId %></h5>--%>
                                                       <%-- <h5>Address - <%=x%></h5>--%>
                                                        <p name="ContacName"><%=i.firstName %>&nbsp;<%=i.lastName%></p>
                                                        <p name="shpadd"><%=i.address %></p>
                                                        <p name="city"><%=i.city%></p>
                                                        <p name="state"><%=i.state%></p>
                                                        <p name="zip"><%=i.zip%></p>
                                                        <p name="Country"><%=i.country%></p>
                                                        <%--<asp:RadioButton ID="rbDefault" runat="server" Text="Default Address" OnCheckedChanged="rbDefault_CheckedChanged" />--%>
                                                        <%if (AddressId == i.customerAddressId.ToString())
    { %>
                                                        <div class="radio radio-danger">
                                                            <input type="radio" name="address" class="Update" id="radio<%=x %>" addid="<%=i.customerAddressId %>" value="option1" checked="checked">
                                                            <label for="radio<%=x %>">Default Address</label>
                                                        </div>
                                                        <%}
    else
    { %>
                                                        <div class="radio radio-danger">
                                                            <input type="radio" name="address" class="Update" id="radio<%=x %>" addid="<%=i.customerAddressId %>" value="option1">
                                                            <label for="radio<%=x%>">Default Address</label>
                                                        </div>
                                                        <%} %>

                                                        <%--<input type="button" name="AddressID" value="Delete" id="<%=i.customerAddressId %>" class="<%=(x>1)?"delete button btn btn-save-add":"MycardDelete" %>"  />--%>
                                                        <input type="button" name="addressid" value="delete" id="<%=i.customerAddressId %>" class="delete button btn btn-save-add" />

                                                    </div>



                                                </div>
                                                <%}
        
  }%>
                    
                                                </div>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <script type="text/javascript">

        jQuery(document).ready(function () {

            jQuery('.popupc3').click(function () {
                jQuery('#popupcc3').simplePopup();
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
            var city = jQuery('.add-page-details>p[name=city]').text();
            var State = jQuery('.add-page-details>p[name=state]').text();
            var address = jQuery('.add-page-details>p[name=shpadd]').text();
            var pincode = jQuery('.add-page-details>p[name=zip]').text();
            if (pr_code == '')
                return;
            //alert(pr_code);
            //  var dataString = "{ID:'" + pr_code + "',City:'"+ city +"'}";

            //var dataString = "{ID:'" + pr_code + "',City:'" + city + "'}";

            var URL = window.location.origin + window.location.pathname + '/Update_Default_Address';
            jQuery.ajax({
                type: "POST",
                url: URL,//+"/Addtocart",
                contentType: "application/json; charset=utf-8",
                // data: dataString,//"{value:'"+pr_code+"'}",
                data: JSON.stringify({ ID: pr_code, City: city }),
                dataType: "json",
                success: function (response) {
                    //jQuery("span#count").text(response.d);
                    //var x = jQuery.parseJSON(response.d);
                    //alert(response.d)
                    location.reload();
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        });
    </script>
    <%--  <script type="text/javascript" src="Scripts/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="Scripts/jquery.validate.min.js"></script>--%>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery.validator.addMethod("selectNone",
           function (value, element) {
               return this.optional(element) || element.selectedIndex != 0;
           },
          "Please select country."
         );
            jQuery.validator.addMethod("noSpace", function (value, element) {
                return value.indexOf(" ") != 0;
            }, "Please don't leave it empty");


             jQuery.validator.addMethod("digit", function (value, element) {
                 //alert("In addtional method.");
                 var emailstr = /^[0-9]+$/;
                 if (!emailstr.test(value)) {
                     return false;
                 } else {
                     return true;
                 }

             }, 'Please enter numeric only.');

        jQuery('.btnsubmit').click(function () {
           // alert("hi");
            var x = jQuery("#form1").validate({
                rules: {
                    ctl00$ContentPlaceHolder1$txtFirstName: {
                        required: true,
                        noSpace: true
                        
                    },
                    ctl00$ContentPlaceHolder1$txtLastName: {
                        required: true,
                        noSpace: true

                    },
                    ctl00$ContentPlaceHolder1$txtaddress: {
                        required: true,
                        noSpace: true

                    },
                    ctl00$ContentPlaceHolder1$txtCity: {
                        required: true,
                        noSpace: true

                    },
                    ctl00$ContentPlaceHolder1$txtState: {
                        required: true,
                        noSpace: true

                    },
                    ctl00$ContentPlaceHolder1$txtPincode:{
                        required: true,
                        digit: true,
                        minlength: 5,
                        maxlength: 10,
                        noSpace: true
                    },
                    ctl00$ContentPlaceHolder1$ddlShippingCountry:
                        {
                          //  required: true,
                            selectNone: true
                        }
                },
                messages: {
                    ctl00$ContentPlaceHolder1$txtFirstName: {
                        required: "Please enter firstname"
                    },
                    ctl00$ContentPlaceHolder1$txtLastName: { required: "Please enter lastname" },
                    ctl00$ContentPlaceHolder1$txtaddress: { required: "Please enter address" },
                    ctl00$ContentPlaceHolder1$txtCity: { required: "Please enter city" },
                    ctl00$ContentPlaceHolder1$txtState: { required: "Please enter state" },
                ctl00$ContentPlaceHolder1$txtPincode:
                    {
                        required: "Please enter pincode",
                        digit: "Please enter only numeric value",
                        minlength: "Please enter min 5 digit ",
                        maxlength: "Please enter max 10 digit ",
               
                
                },
                //ctl00$ContentPlaceHolder1$ddlShippingCountry:"Please enter country"

            }



            }).form();
           
            if (!x) {
              
            }
        });
        });
    </script>
</asp:Content>
