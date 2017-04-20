<%-- Created By - Nisha Patel---%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="UpdateMyProfile.aspx.cs" Inherits="Campco.Common.UpdateMyProfile" %>
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
     <article id="post-85" class="post-85 page type-page status-publish hentry">
        <div class="page-content-pro">
          <div data-vc-full-width="true" data-vc-full-width-init="false" class="vc_row wpb_row vc_row-fluid vc_custom_1452037142280 vc_row-has-fill">
            <div class="wpb_column vc_column_container vc_col-sm-12">
              <div class="vc_column-inner ">
                <div class="wpb_wrapper">
                  <div class="wpb_text_column">
                    <div class="wpb_wrapper">
                      <div role="form" class="wpcf7" id="wpcf7-f101-p85-o1" lang="en-US" dir="ltr">
                        <div class="screen-reader-response"></div>
                        <div class="vc_col-sm-8">                        
                          <div class="form-style-2">                            
                               <div class="form-style-2-heading">General Information</div>
                              <%--<asp:Panel ID="pnlWholesaler" runat="server" Visible="false">--%>
                                 <div class="dealer">
                          <label for="field1"><span>Login Name <span class="required"> <asp:Label ID="lbllname" runat="server" Text="*"/>
                             <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtAccId" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                          <%--    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="" ValidationExpression=" /^[a-zA-Z ]*$/" ControlToValidate="txtAccId"></asp:RegularExpressionValidator>--%>
                                                               </span></span>                            
                         <asp:TextBox runat="server" ID="txtAccId" CssClass="input-field" MaxLength="9" placeHolder="Enter Only AlphaNumeric" Enabled="false" name="txtAccId" required="required"></asp:TextBox>                            
                          </label>
                          <label for="field2"><span>Company Name<span class="required"><asp:Label ID="lblcname" runat="server" Text="*" />
                             <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtCompName" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                              </span></span>
                          <asp:TextBox runat="server" ID="txtCompName" CssClass="input-field" name="txtCompName" required="required"></asp:TextBox>                               
                          </label>
                          <label for="field3"><span>Contact Name <span class="required"><asp:Label ID="lblconname" runat="server" Text="*"/>  
                             <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtContName" ForeColor="Red"></asp:RequiredFieldValidator> --%>
                            </span></span>
                          <asp:TextBox runat="server" CssClass="input-field" ID="txtContName" name="txtContName" required="required" ></asp:TextBox>                             
                          </label>                        
                          <label for="field5"><span>Web Address<span class="required"><%--<asp:Label ID="lblwadd" runat="server" Text="*"/> --%>
                         <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtWebAddress" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                           </span></span>
                          <asp:TextBox runat="server" CssClass="input-field" ID="txtWebAddress" name="txtWebAddress"></asp:TextBox>
                          </label>
                          <label for="field6"><span>Email Address <span class="required"> <asp:Label ID="lblEadd" runat="server" Text="*"/> 
                         <%--     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtEmailAdd" ForeColor="Red"></asp:RequiredFieldValidator> --%>
                            </span></span>
                          <asp:TextBox runat="server" CssClass="input-field" ID="txtEmailAdd" name="txtEmailAdd" required="required"></asp:TextBox>
                          </label>                         
                          <label for="field8"><span>Tel 1<span class="required"> <asp:Label ID="lblTel1" runat="server" Text="*"/> 
       <%--                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtTel1" ForeColor="Red"></asp:RequiredFieldValidator> --%>
                             </span></span>
                       
                              <asp:TextBox runat="server" CssClass="input-field" ID="txtTel1" name="txtTel1" required="required"></asp:TextBox>
                          </label>
                          <label for="field9"><span>Tel 2<span class="required"> <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtTel2" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                          </span></span>
                          <asp:TextBox runat="server" CssClass="input-field" ID="txtTel2"></asp:TextBox>
                          </label>
                          <label for="field10"><span>Fax </span>
                         <asp:TextBox runat="server" CssClass="input-field" ID="txtFax"></asp:TextBox>
                          </label>
                          <label for="field11"><span>Password<span class="required"><asp:Label ID="lblpass" runat="server" Text="*"/> 
                              <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator> --%>

                                 </span></span>
                                <asp:TextBox runat="server" CssClass="input-field" ID="txtPassword" TextMode="Password" name="txtpassword" required="required"></asp:TextBox>
                          </label>
                          <div class="form-style-2">
                          <div class="form-style-2-heading">Billing Address</div>                 
                          <label for="fieldb1"><span>Billing Address<span class="required"><asp:Label ID="lblbAdd" runat="server" Text="*"/>
                              <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*" ControlToValidate="txtBillingadd" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                                                                    </span></span>                                            
                         <asp:TextBox runat="server"  ID="txtBillingadd" CssClass ="input-field" name="txtBillingadd" required="required" ></asp:TextBox>
                          </label>
                          <label for="fieldb2"><span>Billing Address 2<span class="required"></span></span>                                            
                            <asp:TextBox runat="server"  ID="txtBillingadd2" CssClass ="input-field" name="txtBillingadd2" ></asp:TextBox>                        
                          </label>
                          <label for="fieldb3"><span>Billing City <span class="required"> <asp:Label ID="lblbcity" runat="server" Text="*"/>
                              <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="*" ControlToValidate="txtBillingcity" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                            </span></span>                                            
                            <asp:TextBox runat="server"  ID="txtBillingcity" CssClass ="input-field" name="txtBillingcity" required="required"></asp:TextBox>                      
                          </label>
                          <label for="fieldb4"><span>Billing State <span class="required"> <asp:Label ID="lblbState" runat="server" Text="*"/>
                              <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="*" ControlToValidate="txtBillingstate" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                                                                   </span></span>                                            
                            <asp:TextBox runat="server"  ID="txtBillingstate" CssClass ="input-field" name="txtBillingstate" required="required"></asp:TextBox>                        
                          </label>
                          <label for="fieldb5"><span>Billing Zip Code <span class="required"><asp:Label ID="lblbZipCode" runat="server" Text="*"/>
                              <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="*" ControlToValidate="txtBillingzip" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                                                                      </span></span>                                            
                            <asp:TextBox runat="server"  ID="txtBillingzip" CssClass ="input-field" name="txtBillingzip" required="required"></asp:TextBox>
                        
                          </label>
                          <label for="fieldb6"><span>Billing Country <span class="required"><asp:Label ID="lblbCountry" runat="server" Text="*"/>
                             <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="*" ControlToValidate="txtBillingcountry" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                           </span></span>                                            
                          <%--  <asp:TextBox runat="server"  ID="txtBillingcountry" CssClass ="input-field"></asp:TextBox>                  --%>
                              <asp:DropDownList ID="ddlBillingCountry" name="Country"  CssClass="select-field" AutoPostBack="false" runat="server" ValidationGroup="ddlgrp1" required="required">                                                  
                        <asp:ListItem value="0">Select a country&hellip;</asp:ListItem>
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
                        <asp:ListItem value="US" >United States (US)</asp:ListItem>
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
                          </div>  
                            </div>
                           <%-- </asp:Panel>--%>

                             <%-- <asp:Panel ID="pnlRetailer" runat="server" Visible="True">     --%>
                               <div class="retailer">                            
                          <label for="field1"><span>Login Name <span class="required"> <asp:Label ID="lblRLoginName" runat="server" Text="*" Visible="true"/>
                              <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtRAccId" ForeColor="Red" ></asp:RequiredFieldValidator>--%>
                                                               </span></span>
                         <asp:TextBox runat="server" ID="txtRAccId" CssClass="input-field" MaxLength="9" placeholder="Enter Only AlphaNumeric" Enabled="false" name="txtRAccId" required="required"></asp:TextBox>
                          </label>
                          <label for="field2"><span>First Name <span class="required"><asp:Label ID="lblRFName" runat="server" Text="*"/>  
                              <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtFName" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                                                               </span></span>
                          <asp:TextBox runat="server" ID="txtFName" CssClass="input-field" name="txtFName" required="required"></asp:TextBox>                         
                          </label>
                          <label for="field3"><span>Last Name<span class="required"> <asp:Label ID="lblRLname" runat="server" Text="*"/> 
                              <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="txtLName" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                                                             </span></span>                         
                          <asp:TextBox runat="server" CssClass="input-field" ID="txtLName" name="txtLName" required="required"></asp:TextBox>
                          </label>                        
                          <label for="field6"><span>Email Address<span class="required"> <asp:Label ID="lblREAdd" runat="server" Text="*"/>
                               <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="txtEAddress" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                 </span></span>
                          <asp:TextBox runat="server" CssClass="input-field" ID="txtEAddress" name="txtEAddress" required="required" Enabled="false"></asp:TextBox>
                          </label> 
                      
                          <label for="field11"><span>Password<span class="required"> <asp:Label ID="lblRPass" runat="server" Text="*"/>
                           <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="txtFName" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                            </span></span>
                           <asp:TextBox runat="server" CssClass="input-field" ID="txtRPassword" TextMode="Password" name="txtRPassword" required="required"></asp:TextBox>
                          </label>
                           </div>
                         <%--   </asp:Panel> --%>                                                            
                          </div>
                         
                     
                     
                         <%-- </asp:Panel>--%>
                          
                       <%--     <asp:Panel ID="PnlShipping" runat="server" Visible="true">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                       <div class="form-style-2">
                          <div class="form-style-2-heading">Shipping Address </div>                         
                               </br>           
                          <label for="fieldb1"><span>shipping Address<span class="required"><asp:Label ID="Label1" runat="server" Text="*"/>
                             <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="*" ControlToValidate="txtshippingAdd" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                          <%--    </span></span>                                            
                         <asp:TextBox runat="server"  ID="txtshippingAdd" CssClass ="input-field"></asp:TextBox>
                          </label>
                          <label for="fieldb2"><span>shipping Address 2<span class="required"></span></span>                                            
                            <asp:TextBox runat="server"  ID="txtshippingadd2" CssClass ="input-field"></asp:TextBox>                        
                          </label>
                          <label for="fieldb3"><span>shipping City <span class="required"> <asp:Label ID="Label2" runat="server" Text="*"/>
                            <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="txtshippingcity" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                         <%--    </span></span>                                            
                            <asp:TextBox runat="server"  ID="txtshippingcity" CssClass ="input-field"></asp:TextBox>                      
                          </label>
                          <label for="fieldb4"><span>shipping State <span class="required"> <asp:Label ID="Label3" runat="server" Text="*"/>
                             <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" ControlToValidate="txtshippingState" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                          <%--   </span></span>                                            
                            <asp:TextBox runat="server"  ID="txtshippingState" CssClass ="input-field"></asp:TextBox>
                        
                          </label>
                          <label for="fieldb5"><span>shipping Zip Code <span class="required"><asp:Label ID="Label4" runat="server" Text="*"/>
                             <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="*" ControlToValidate="txtshippingZip" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                       <%--  </span></span>                                            
                            <asp:TextBox runat="server"  ID="txtshippingZip" CssClass ="input-field"></asp:TextBox>
                        
                          </label>
                          <label for="fieldb6"><span>shipping Country <span class="required"><asp:Label ID="Label5" runat="server" Text="*"/>
                           <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="*" ControlToValidate="txtShippingCountry" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                             <%--                                           </span></span>                                            
                            <asp:TextBox runat="server"  ID="txtShippingCountry" CssClass ="input-field"></asp:TextBox>                  
                          </label>                       
                          </div>  
                             </ContentTemplate>
                             </asp:UpdatePanel>
                       
                          </asp:Panel>  --%>  
                            <div class="vc_col-md-12 upadtebtntop vc_row">
                                <asp:Button runat="server" Text="update Profile" ID="btnupdateprofile" CssClass="wpcf7-form-control wpcf7-submit updateprofile" OnClick="btnupdateprofile_Click"></asp:Button>
                                <asp:Button runat="server" Text="Cancel"  ID="btnCancel" CssClass = "wpcf7-form-control wpcf7-submit"></asp:Button>
                            </div>
                          </div>                                                                 
                          <br/>                                                                          
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="vc_row-full-width vc_clearfix"></div>
    </div>         
          <div class="vc_row-full-width vc_clearfix"></div>
    </div>
      <script type="text/javascript" src="assets/js/validation/jquery.validate.js"></script>
       <script type="text/javascript" src="assets/js/validation/additional-methods.min.js"></script>
       <script type="text/javascript">
           jQuery(document).ready(function () {
               var count = 0;                            
               var custtype = '<%= Session["CustomerType"] %>';
              // alert(custtype);
               if (custtype == "1")
               {
                   jQuery('.retailer').show();
                   jQuery('.dealer').hide();
               }
               else
               {
                   jQuery('.retailer').hide();
                   jQuery('.dealer').show();
               }
           });
           jQuery.validator.addMethod("ValidEmail", function (value, element) {
               // alert("In addtional method.");
               var emailstr = /^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
               if (!emailstr.test(value)) {
                   return false;
               } else {
                   return true;
               }

           }, 'Please enter a valid email address.');

           jQuery.validator.addMethod("noSpace", function (value, element) {
               return value.indexOf(" ") != 0;
           }, "Please don't leave it empty");

           jQuery('.updateprofile').click(function ()
           {
               //alert("hi");
               count++;
               var x = jQuery("#form1").validate({
                   rules: {
                       ctl00$ContentPlaceHolder1$txtAccId: {
                           required: true,
                           maxlength: 9,
                           alphanumeric: true,
                           noSpace: true
                       },
                       ctl00$ContentPlaceHolder1$txtCompName: 
                           {
                           required: true,                  
                           noSpace:true
                         },
                       ctl00$ContentPlaceHolder1$txtContName: {
                           required: true,
                           noSpace: true
                       },
                       ctl00$ContentPlaceHolder1$txtEmailAdd: {
                           required: true,
                           ValidEmail: true,
                           noSpace:true
                       },
                       ctl00$ContentPlaceHolder1$txtWebAddress: {
                           //required: true,
                           //noSpace: true
                       },
                       ctl00$ContentPlaceHolder1$txtTel1: {
                           required: true,
                           noSpace: true
                       },
                       ctl00$ContentPlaceHolder1$txtTel2:{
                           noSpace: true
                       },
                       ctl00$ContentPlaceHolder1$txtPassword: {
                           required: true,
                           noSpace: true
                       },
                       ctl00$ContentPlaceHolder1$txtBillingadd: {
                           required: true,
                           noSpace: true
                       },
                       ctl00$ContentPlaceHolder1$txtBillingcity: {
                           required: true,
                           noSpace: true
                       },
                       ctl00$ContentPlaceHolder1$txtBillingstate: {
                           required: true,
                           noSpace: true
                       },
                       ctl00$ContentPlaceHolder1$txtBillingzip: {
                           required: true,                          
                           noSpace: true
                       },
                       ctl00$ContentPlaceHolder1$ddlBillingCountry: {
                           required: true,
                           maxlength: 25,
                           noSpace: true
                       },
                       ctl00$ContentPlaceHolder1$txtRAccId:{
                           required: true,
                           maxlength: 9,
                           alphanumeric: true
                       },
                       ctl00$ContentPlaceHolder1$txtFName: {
                           required: true,
                           noSpace: true
                       },
                       ctl00$ContentPlaceHolder1$txtLName: {
                           required: true,
                           noSpace: true
                       },
                       ctl00$ContentPlaceHolder1$txtEAddress: {
                           required: true,
                           ValidEmail: true,
                           noSpace: true
                       },
                       ctl00$ContentPlaceHolder1$txtRPassword: {
                           required: true,
                           noSpace: true
                       },                      
                   },
                   messages: {
                       ctl00$ContentPlaceHolder1$txtAccId: { required: "Please enter login name" },
                       ctl00$ContentPlaceHolder1$txtContName: { required: "Please enter contact name." },                     
                       ctl00$ContentPlaceHolder1$txtEmailAdd: { required: "Please enter email."},
                       //ctl00$ContentPlaceHolder1$txtWebAddress:{required: "Please enter Web address" }, 
                       ctl00$ContentPlaceHolder1$txtTel1: { required: "Please enter telephone."},
                   ctl00$ContentPlaceHolder1$txtPassword:"required",
                   ctl00$ContentPlaceHolder1$txtBillingadd:"Please enter address.",
                   ctl00$ContentPlaceHolder1$txtBillingcity:"Please enter city.",
                   ctl00$ContentPlaceHolder1$txtBillingstate:"Please enter state.",
                   ctl00$ContentPlaceHolder1$txtBillingzip: { required: "Please enter zip."},
                   ctl00$ContentPlaceHolder1$ddlBillingCountry: "Please select country.",
                   ctl00$ContentPlaceHolder1$txtRAccId: { required: "Please enter login name" },
                   ctl00$ContentPlaceHolder1$txtLName:  { required: "Please enter first name" }, 
                   ctl00$ContentPlaceHolder1$txtFName: { required: "Please enter last name" },
                   ctl00$ContentPlaceHolder1$txtEAddress: { required: "Please enter email address" },
                   ctl00$ContentPlaceHolder1$txtRPassword:{ required: "Please enter password" } 
                   }
               }).form();

              //alert(x);
           });
           </script>
</asp:Content>
