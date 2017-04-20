<%-- Created By - Nisha Patel---%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Campco.Common.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<script type="text/javascript" src="Scripts/jquery-1.4.1.min.js"></script>--%>
    <script language="javascript" type="text/javascript">
        function captchreload() {
            var URL = window.location.origin + window.location.pathname + '/FillCapctha1';
            jQuery.ajax({
                type: "POST",
                url: URL,//+"/Addtocart",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var arr = response.d;
                    jQuery("#ContentPlaceHolder1_imgcaptcha").attr('src', arr);
                    jQuery("#ContentPlaceHolder1_imgretailerverifi").attr('src', arr);

                }
            });
        }
    </script>
    <style type="text/css">
        .loader_modal {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }

        .Loader_center {
            z-index: 1000;
            margin: 300px auto;
            padding: 10px;
            width: 130px;
            background-color: Black;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }

            .Loader_center img {
                height: 128px;
                width: 128px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="dealer">
        <div id="page-title-qube" class="page-title-qube default-page-title">
            <div class="width-container-qube fade-header-qube">
                <div class="page-tite-left-qube">
                    <h1 class="entry-title-qube-ezio">Registration</h1>
                </div>
                <%--<div id="sharecrumb-qube-container">
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
                </div>--%>
                <div class="clearfix-qube-ezio"></div>
            </div>
        </div>
        <div id="content-qube" class="content-sm">
            <div class="width-container-qube">
                <article id="post-85" class="post-85 page type-page status-publish hentry">
         
        <div class="page-content-pro">
            
          <div class="vc_row wpb_row vc_row-fluid vc_custom_1440586548569">
            <div class="wpb_column vc_column_container vc_col-sm-12">
              <div class="vc_column-inner ">
                <div class="wpb_wrapper vc_row">
                  <div class="vc_separator vc_separator_align_center vc_sep_width_100 vc_sep_pos_align_center vc_sep_color_grey vc_separator-has-text"><span class="vc_sep_holder vc_sep_holder_l"><span  class="vc_sep_line"></span></span>
                    <h4>Dealer Registration Page</h4>
                    <span class="vc_sep_holder vc_sep_holder_r"><span  class="vc_sep_line"></span></span> </div>
                </div>
              </div>
            </div>
          </div>
          <div data-vc-full-width="true" data-vc-full-width-init="false" class="vc_row wpb_row vc_row-fluid vc_custom_1452037142280 vc_row-has-fill">
            <div class="wpb_column vc_column_container vc_col-sm-12">
              <div class="vc_column-inner ">
                <div class="wpb_wrapper vc_row">
                  <div class="wpb_text_column vc_col-sm-12 ">
                    <div class="wpb_wrapper">                      
                      <p style="text-align: justify;">Create an account today and gain access to all of CampCo's exlcusive products, including UZI Gear, Humvee Gear, and Smith & Wesson Pepper Spray and Watches! Receive the latest product information, price drops, and special offers via e-mail. Save time at checkout with pre-populated forms.</p>
                      <p style="text-align: justify;">An account manager will contact you upon review of your application should you qualify as an appropriate dealer. To qualify as a CampCo dealer, you must have an already established business and a verifiable outlet for sale of product.  All new dealers must be ready with an initial order of $300 in exclusive CampCo products* <strong>($500 + shipping charges for international customers. &nbsp;Drop shipping is not available for international customers).</strong>.
                      </p>                      
                      <p>*(UZI Gear, Humvee Gear, Smith & Wesson Pepper Spray and Watches)</p>
                      <%--<span style="color:#ff0000;">Choose your own Account ID, do not use more than 9 characters.</span>--%>
                        <asp:Label ID="lbldealmsg" runat="server" Text="" Visible="false" Font-Bold="true" Font-Size="Medium"></asp:Label>
                    </div>
                  </div>
                 
                </div>
              </div>
            </div>
            <div class="wpb_column vc_column_container vc_col-sm-12">
              <div class="vc_column-inner ">
                <div class="wpb_wrapper vc_row">
                  <div class="wpb_text_column">
                    <div class="wpb_wrapper">
                      <div role="form" class="wpcf7" id="wpcf7-f101-p85-o1" lang="en-US" dir="ltr">
                        <div class="screen-reader-response"></div>
                        <div class="vc_col-sm-8">
                        
                          <div class="form-style-2">
                          <div class="form-style-2-heading">General Information</div>
                          <%--<form action="" method="post">--%>
                          <label for="field1"><span>Login Name <span class="required">*</span></span>
                              <asp:TextBox runat="server" ID="txtAccId" CssClass="input-field" MaxLength="9" placeHolder="Enter Only AlphaNumeric" class="alpha" name="txtAccId" required="required"></asp:TextBox>
                          </label>
                          <label for="field2"><span>Company Name<span class="required">*</span></span>
                              <asp:TextBox runat="server" ID="txtCompName" CssClass="input-field" name="ComapnyNameWhol" required="required"></asp:TextBox>
                          </label>
                          <label for="field3"><span>First Name <span class="required">*</span></span>
                              <asp:TextBox runat="server" CssClass="input-field" ID="txtDeFName" name="txtDeFName" required="required"></asp:TextBox>
                          </label>
                          <label for="field3"><span>Last Name <span class="required">*</span></span>
                              <asp:TextBox runat="server" CssClass="input-field" ID="txtDeLName" name="txtDeLName" required="required"></asp:TextBox>
                           </label>
                          
                          <label for="field5"><span>Web Address <span class="required"></span></span>
                              <asp:TextBox runat="server" CssClass="input-field" ID="txtWebAddress" name="txtWebAddress"></asp:TextBox>
                          </label>
                          <label for="field6"><span>Email Address <span class="required">*</span></span>
                              <asp:TextBox runat="server" CssClass="input-field" ID="txtEmailAdd" name="txtEmailAdd" required="required"></asp:TextBox>
                          </label>

                          <%--<label for="field7"><span>Customer Type </span><select name="field4" class="select-field">
                          <option value="">Select Value</option>
                          <option value="">I am a Consumer for personal use</option>
                          <option value="">I represent a Retail Outlet</option>
                          <option value="">I represent a Website Store</option>
                          <option value="">I represent a Wholesale Distributor</option>
                          <option value="">I represent a Mail Order Catalog</option>
                          </select></label>--%>

                          <label for="field8"><span>Tel 1 <span class="required">*</span></span>
                              <asp:TextBox runat="server" CssClass="input-field numeric" ID="txtTel1" name="ctl00$ContentPlaceHolder1$txtEmailAdd" required="required"></asp:TextBox>
                          </label>
                          <label for="field9"><span>Tel 2</span>
                              <asp:TextBox runat="server" CssClass="input-field numeric" ID="txtTel2"></asp:TextBox>
                          </label>
                          <label for="field10"><span>Fax </span>
                              <asp:TextBox runat="server" CssClass="input-field numeric" ID="txtFax" name="txtFax" ></asp:TextBox>
                          </label>
                          <label for="field11"><span>Password <span class="required">*</span></span>
                              <asp:TextBox runat="server" CssClass="input-field" ID="txtPassword" TextMode="Password" name="txtPassword" required="required" MaxLength="8"></asp:TextBox>
                          </label>
                          <!--
                          <label for="field5"><span>Message <span class="required">*</span></span><textarea name="field5" class="textarea-field"></textarea></label>

                          <label><span>&nbsp;</span><input type="submit" value="Submit" /></label>
                          -->
                          <%--</form>--%>
                          </div>

                          <br/>

                          <div class="form-style-2">
                          <div class="form-style-2-heading">Billing Address</div>
                          <%--<form action="" method="post">--%>
                          <label for="fieldb1"><span>Billing Address <span class="required">*</span></span><asp:TextBox runat="server"  ID="txtBillingadd" CssClass ="input-field" name="txtBillingadd" required="required"></asp:TextBox></label>
                          <label for="fieldb2"><span>Billing Address 2</span><asp:TextBox runat="server"  ID="txtBillingadd2" CssClass ="input-field"></asp:TextBox></label>
                          <label for="fieldb3"><span>Billing City <span class="required">*</span></span><asp:TextBox runat="server"  ID="txtBillingcity" CssClass ="input-field" name="txtBillingcity" required="required"></asp:TextBox></label>
                          <label for="fieldb4"><span>Billing State <span class="required">*</span></span><asp:TextBox runat="server"  ID="txtBillingstate" CssClass ="input-field" name="txtBillingstate" required="required"></asp:TextBox></label>
                          <label for="fieldb5"><span>Billing Zip Code <span class="required">*</span></span><asp:TextBox runat="server"  ID="txtBillingzip" CssClass ="input-field numeric" name="txtBillingzip" required="required" MaxLength="6"></asp:TextBox></label>
                          <label for="fieldb6"><span>Billing Country <span class="required">*</span></span>
                         <asp:DropDownList ID="ddlBillingCountry" name="Country"  CssClass="select-field"  AutoPostBack="false" runat="server" required="required">                                                  
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
                    <%--    <asp:ListItem value="US" >United States (US)</asp:ListItem>--%>
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

                          <%--</form>--%>
                          </div>  

                            <br/>

                          <div class="form-style-2">
                          <div class="form-style-2-heading">Shipping Address</div>

                              <div class="checkbox  checkboxleft input">
                                     
                                  <asp:CheckBox ID="chkShippingadd" runat="server" Text="Same As Billing Address" CssClass="same"  AutoPostBack="false"></asp:CheckBox>  <%--OnCheckedChanged="chkShippingadd_CheckedChanged"--%>
                              <%--<input type="checkbox" class="same" name="chkSameAddress" id="same_address"/>--%>
                                         </div>  
                               </br> </br>              
                          <label for="fieldb1"><span>Shipping Address<span class="required"><asp:Label ID="Label1" runat="server" Text="*"/></span>

                                               </span>                                            
                         <asp:TextBox runat="server"  ID="txtshippingAdd" CssClass ="input-field" name="txtshippingAdd" required="required"></asp:TextBox>
                          </label>
                          <label for="fieldb2"><span>Shipping Address 2<span class="required"></span></span>                                            
                            <asp:TextBox runat="server"  ID="txtshippingadd2" CssClass ="input-field"></asp:TextBox>                        
                          </label>
                          <label for="fieldb3"><span>Shipping City <span class="required"> <asp:Label ID="Label2" runat="server" Text="*"/>
                             
                                </span></span>                                            
                            <asp:TextBox runat="server"  ID="txtshippingcity" CssClass ="input-field" name="txtshippingcity" required="required"></asp:TextBox>                      
                          </label>
                          <label for="fieldb4"><span>Shipping State <span class="required"> <asp:Label ID="Label3" runat="server" Text="*"/>
                           </span></span>                                            
                            <asp:TextBox runat="server"  ID="txtshippingState" CssClass ="input-field" name="txtshippingState" required="required"></asp:TextBox>                      
                          </label>
                          <label for="fieldb5"><span>Shipping Zip Code <span class="required"><asp:Label ID="Label4" runat="server" Text="*"/>
                           </span></span>                                            
                            <asp:TextBox runat="server"  ID="txtshippingZip" CssClass ="input-field numeric" name="txtshippingZip" required="required" MaxLength="6"></asp:TextBox>                 
                          </label>
                        <label for="fieldb6"><span>Shipping Country <span class="required"><asp:Label ID="Label13" runat="server" Text="*"/> </span></span>                                                                                                                                 
                         <asp:DropDownList ID="ddlShippingCountry" name="ddlShippingCountry"  CssClass="select-field" AutoPostBack="false" runat="server" required="required">                                                  
                        <asp:ListItem value="">Select a country&hellip;</asp:ListItem>
                         <asp:ListItem value="US">United States (US)</asp:ListItem>
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
                      <%--  <asp:ListItem value="US" >United States (US)</asp:ListItem>--%>
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
                          
                            </br>
  
                          <div class="form-style-3 addwdtres">
                          <div class="form-style-2-heading">Additional Information</div>
                          <%--<form action="" method="post">--%>
                          <label for="fieldb1" class="ques"><span>1) How long have you been in business?<span class="required"><asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red"/></span></span>
                          <asp:TextBox runat="server"  ID="txtField1" CssClass ="textarea-field" TextMode="MultiLine" name="txtField1" required="required"></asp:TextBox>
                              </label>
                          <label for="fieldb2"><span>2) Do you currently have a legal business license AND re-sellers permit? <span class="required"><asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red"/></span></span>
                          <asp:TextBox runat="server"  ID="txtField2" CssClass ="textarea-field" TextMode="MultiLine" name="txtField2" required="required"></asp:TextBox>
                               </label>
                          <label for="fieldb3"><span>3) Do you operate a brick-and-mortar store or a website or both? If neither, please explain. <span class="required"><asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red"/></span></span>
                          <asp:TextBox runat="server"  ID="txtField3" CssClass ="textarea-field" TextMode="MultiLine" name="txtField3" required="required"></asp:TextBox>
                               </label>
                          <label for="fieldb4"><span>4) Will you be keeping your own inventory or relying on drop-ship (drop-shipping is not available for international customers)? <span class="required"><asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red"/></span></span>
                          <asp:TextBox runat="server"  ID="txtField4" CssClass ="textarea-field" TextMode="MultiLine" name="txtField4" required="required"></asp:TextBox>
                               </label>
                          <label for="fieldb5"><span>5) Which CampCo products do you plan on carrying? Please be specific. <span class="required"><asp:Label ID="Label11" runat="server" Text="*" ForeColor="Red"/></span></span>
                          <asp:TextBox runat="server"  ID="txtfield5" CssClass ="textarea-field" TextMode="MultiLine" name="txtfield5" required="required"></asp:TextBox>
                               </label>
                          <label for="fieldb6"><span>6) How did you find out about CampCo? <span class="required"><asp:Label ID="Label12" runat="server" Text="*" ForeColor="Red"/></span></span>
                          <asp:TextBox runat="server"  ID="txtField6" CssClass ="textarea-field" TextMode="MultiLine" name="txtField6" required="required"></asp:TextBox>                      
                              </label>
                          <label for="fieldb7"><span>Please enter Verification Code<span class="required"><asp:Label ID="Label14" runat="server" Text="*" ForeColor="red"/></span></span>
                               <div class="captchcode">                               
                                   <asp:Image ID="imgcaptcha" runat="server" ImageUrl="#"></asp:Image>
                               </div>
                             <asp:TextBox runat="server"  ID="txtcaptch" CssClass ="input-field" name="txtcaptch" required="required"></asp:TextBox>
                           
                            </label>
                                      <label>
                                       <asp:Label ID="lblcaptcha" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>                                 
                                          </label>
                            
                              </div>
                           
                         <div class="vc_col-md-12 upadtebtntop vc_row">
                            <asp:Button runat="server" Text="Register" ID="btnregister" CssClass="wpcf7-form-control wpcf7-submit btnregister" OnClick="btnregister_Click" ></asp:Button>   <!--OnClientClick="captchreload()"-->
                            <asp:Button runat="server" Text="Cancel"  ID="btnCancel" CssClass = "wpcf7-form-control wpcf7-submit" OnClick="btnCancel_Click"></asp:Button>
                         </div>
                                                             
                            

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
            <!-- .entry-content -->

            </article>
      <!-- #post-## -->
        </div>
    </div>

    <!------------------------------------------------Reataier-------------------------------------------------------------->
    <div class="retailer">
        <div id="page-title-qube" class="page-title-qube default-page-title">
            <div class="width-container-qube fade-header-qube">
                <div class="page-tite-left-qube">
                    <h1 class="entry-title-qube-ezio">Registration</h1>
                </div>

                <div class="clearfix-qube-ezio"></div>
            </div>
        </div>
        <div id="content-qube" class="content-sm">
            <div class="width-container-qube">
                <article id="post-85" class="post-85 page type-page status-publish hentry">
         
        <div class="page-content-pro">
            
          <div class="vc_row wpb_row vc_row-fluid vc_custom_1440586548569">
            <div class="wpb_column vc_column_container vc_col-sm-12">
              <div class="vc_column-inner ">
                <div class="wpb_wrapper">
                  <div class="vc_separator vc_separator_align_center vc_sep_width_100 vc_sep_pos_align_center vc_sep_color_grey vc_separator-has-text"><span class="vc_sep_holder vc_sep_holder_l"><span  class="vc_sep_line"></span></span>
                    <h4>Create an account</h4>
                      <asp:Label ID="lblthankyou" runat="server" Text="" Visible="false"></asp:Label>
                    <span class="vc_sep_holder vc_sep_holder_r"><span  class="vc_sep_line"></span></span> </div>
                </div>
              </div>
            </div>
          </div>
          <div data-vc-full-width="true" data-vc-full-width-init="false" class="vc_row wpb_row vc_row-fluid vc_custom_1452037142280 vc_row-has-fill">
            <div class="wpb_column vc_column_container vc_col-sm-12">
              <div class="vc_column-inner ">
                <div class="wpb_wrapper vc_row">
                  <div class="wpb_text_column vc_col-sm-12 ">
                    <div class="wpb_wrapper">                      
                      
                    <%--  <span style="color:#ff0000;">Choose your own Account ID, do not use more than 9 characters.</span>--%>
                        <asp:Label ID="lblraccid" runat="server" Text="" Visible="false" Font-Bold="true" Font-Size="Medium"></asp:Label>
                    </div>
                  </div>
                 
                </div>
              </div>
            </div>
            <div class="wpb_column vc_column_container vc_col-sm-12">
              <div class="vc_column-inner ">
                <div class="wpb_wrapper">
                  <div class="wpb_text_column">
                    <div class="wpb_wrapper">
                      <div role="form" class="wpcf7" id="wpcf7-f101-p85-o1" lang="en-US" dir="ltr">
                        <div class="screen-reader-response"></div>
                        <div class="vc_col-sm-8 ">
                        
                          <div class="form-style-2">
                          <div class="form-style-2-heading">General Information</div>
                          <%--<form action="" method="post">--%>
                          <label for="field1"><span>Login Name <span class="required">*</span></span>
                              <asp:TextBox runat="server" ID="txtRAccId" CssClass="input-field alpha " MaxLength="9" placeholder="Enter Only AlphaNumeric" name="txtRAccId" required="required"></asp:TextBox>
                          </label>
                         <%-- <label for="field2"><span>Company Name <span class="required">*</span></span>
                              <asp:TextBox runat="server" ID="TextBox2" CssClass="input-field" name="ComapnyNameWhol" required="required"></asp:TextBox>
                          </label>--%>
                          <label for="field3"><span>First Name <span class="required">*</span></span>
                              <asp:TextBox runat="server" ID="txtFName" CssClass="input-field" name="txtFName" required="required"></asp:TextBox>
                          </label>
                          <label for="field3"><span>Last Name <span class="required">*</span></span>
                              <asp:TextBox runat="server" CssClass="input-field" ID="txtLName" name="txtLName" required="required"></asp:TextBox>
                           </label>
                          
                          
                          <label for="field6"><span>Email Address <span class="required">*</span></span>
                              <asp:TextBox runat="server" CssClass="input-field" ID="txtEAddress" name="txtEAddress" required="required"></asp:TextBox>
                          </label>

                          <%--<label for="field7"><span>Customer Type </span><select name="field4" class="select-field">
                          <option value="">Select Value</option>
                          <option value="">I am a Consumer for personal use</option>
                          <option value="">I represent a Retail Outlet</option>
                          <option value="">I represent a Website Store</option>
                          <option value="">I represent a Wholesale Distributor</option>
                          <option value="">I represent a Mail Order Catalog</option>
                          </select></label>--%>

                         
                          <label for="field11"><span>Password <span class="required"><asp:Label ID="Label6" runat="server" Text="*"/></span></span>
                                <asp:TextBox runat="server" CssClass="input-field" ID="txtRPassword" TextMode="Password" name="txtRPassword" required="required"></asp:TextBox>
                          </label>
                          <label for="field11"><span>Confirm  Password<span class="required">*</span></span>
                                <asp:TextBox runat="server" CssClass="input-field" ID="txtRConfPass" TextMode="Password"  name="txtRConfPass" required="required"></asp:TextBox>
                          </label>

                              <div class="form-reg-01">      
                                <label for="fieldb8">
                                  <span>please enter verification code
                                    <span class="required"><asp:Label ID="Label5" runat="server" Text="*"/></span>
                                  </span>
                                  <div class="captchcodeRet">                                        
                                    <asp:image id="imgretailerverifi" runat="server"></asp:image>
                                  </div>         
                                  <asp:textbox runat="server"  id="txtreCaptcha" cssclass ="input-field" name="verfcoderet"  Width="482px" required="required"></asp:textbox>
                                   <%-- <asp:button id="btnrefresh" runat="server" text="refresh" onclick="btnrefresh_click" cssclass="wpcf7-form-control wpcf7-submit"  causesvalidation="false" ></asp:button>--%>
                                   <asp:label id="lblretcaptchmdg" runat="server" text="" forecolor="red" visible="false"></asp:label>
                                      </label>                                 
                            </div>
                        
                                  
                          <!-- 
                          <label for="field5"><span>Message <span class="required">*</span></span><textarea name="field5" class="textarea-field"></textarea></label>

                          <label><span>&nbsp;</span><input type="submit" value="Submit" /></label>
                          -->
                          <%--</form>--%>
                          
                           <div class="upadtebtntop vc_row vc_col-md-12">
                            <asp:Button runat="server" Text="Register" ID="Button1" CssClass="wpcf7-form-control wpcf7-submit btnregister"  OnClick="btnregister_Click" ></asp:Button>   <!--OnClientClick="captchreload()"-->
                            <asp:Button runat="server" Text="Cancel"  ID="Button2" CssClass = "wpcf7-form-control wpcf7-submit" OnClick="btnCancel_Click"></asp:Button>
                         </div>
                                                                        
                            
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
            </div>
   </div>        
            <script type="text/javascript">
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


                jQuery.validator.addMethod("alphabet", function (value, element) {
                    //alert("In addtional method.");
                    var emailstr = /^[A-z]+$/;
                    if (!emailstr.test(value)) {
                        return false;
                    } else {
                        return true;
                    }

                }, 'Please enter a alphabats only.');

                jQuery.validator.addMethod("digit", function (value, element) {
                    //alert("In addtional method.");
                    var emailstr = /^[0-9]+$/;
                    if (!emailstr.test(value)) {
                        return false;
                    } else {
                        return true;
                    }

                }, 'Please enter numeric only.');
                jQuery.validator.addMethod("webUrl", function (value, element) {
                    // alert("In addtional method.");
                    var webreg = /^(http(s)?:\/\/)?(www\.)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/
                    if (!webreg.test(value)) {
                        return false;
                    } else {
                        return true;
                    }

                    //return this.optional( element ) || /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@(?:\S{1,63})$/.test( value );
                }, 'Please enter a valid web url.');
            </script>
            <script type="text/javascript">
                jQuery(document).ready(function () {
                    var count = 0;
                    var url = window.location.href;
                    var reg = url.split('?');
                    if (reg.length > 1) {
                        jQuery('.retailer').show();
                        jQuery('.dealer').hide();
                    }
                    else {
                        jQuery('.retailer').hide();
                        jQuery('.dealer').show();
                    }

                    jQuery('.btnregister').click(function () {

                        count++;

                        var x = jQuery("#form1").validate({
                            rules: {
                                ctl00$ContentPlaceHolder1$txtDeFName: {
                                    required: true,
                                    noSpace: true,
                                    maxlength:30
                                },
                                ctl00$ContentPlaceHolder1$txtDeLName: {
                                    required: true,
                                    noSpace: true,
                                    maxlength: 30
                                },
                                ctl00$ContentPlaceHolder1$txtWebAddress: {
                                    //required: true,
                                    //noSpace: true,
                                    maxlength: 40
                                },
                                ctl00$ContentPlaceHolder1$txtTel1: {
                                    required: true,
                                    digit: true,
                                    noSpace: true,
                                    maxlength: 16
                                },
                                ctl00$ContentPlaceHolder1$txtWebAddress: {
                                    //required: true,
                                    //webUrl: true,
                                    //noSpace: true,
                                    maxlength: 40
                                },
                                ContentPlaceHolder1_txtCompName: {
                                    required: true,
                                    noSpace: true,
                                    maxlength: 41
                                },

                                ctl00$ContentPlaceHolder1$txtAccId: {
                                    required: true,
                                    maxlength: 11,
                                    alphanumeric: true,
                                    noSpace: true

                                },
                                ctl00$ContentPlaceHolder1$txtEmailAdd: {
                                    required: true,
                                    ValidEmail: true,
                                    noSpace: true,
                                    maxlength:240,
                                },

                                ctl00$ContentPlaceHolder1$txtPassword: {
                                    required: true,
                                    minlength: 5,
                                    maxlength: 20,
                                    noSpace: true
                                },
                                ctl00$ContentPlaceHolder1$txtFax:
                                    {
                                        number: true,
                                        maxlength: 15
                                        //noSpace: true
                                    },
                                ctl00$ContentPlaceHolder1$txtBillingadd: {
                                    required: true,
                                    noSpace: true,
                                    maxlength: 45,
                                },
                                ctl00$ContentPlaceHolder1$txtBillingcity: {
                                    required: true,
                                    noSpace: true,
                                    maxlength: 35,
                                },
                                ctl00$ContentPlaceHolder1$txtBillingstate: {
                                    required: true,
                                    noSpace: true,
                                    maxlength: 12
                                },
                                ctl00$ContentPlaceHolder1$txtBillingzip: {
                                    required: true,
                                    digit: true,
                                    noSpace: true,
                                    maxlength: 16,
                                },
                                ctl00$ContentPlaceHolder1$txtshippingAdd: {
                                    required: true,
                                    noSpace: true,
                                    maxlength: 45
                                    
                                },
                                ctl00$ContentPlaceHolder1$txtshippingcity: {
                                    required: true,
                                    noSpace: true,
                                    maxlength: 35,
                                },
                                ctl00$ContentPlaceHolder1$txtshippingState: {
                                    required: true,
                                    noSpace: true,
                                    maxlength: 12,
                                },
                                ctl00$ContentPlaceHolder1$txtshippingZip: {
                                    required: true,
                                    digit: true,
                                    noSpace: true,
                                    maxlength: 15,
                                },
                                ctl00$ContentPlaceHolder1$txtField1: {
                                    required: true,
                                    noSpace: true
                                },
                                ctl00$ContentPlaceHolder1$txtField2: {
                                    required: true,
                                    noSpace: true
                                },
                                ctl00$ContentPlaceHolder1$txtField3: {
                                    required: true,
                                    noSpace: true
                                },
                                ctl00$ContentPlaceHolder1$txtField4: {
                                    required: true,
                                    noSpace: true
                                },
                                ctl00$ContentPlaceHolder1$txtfield5: {
                                    required: true,
                                    noSpace: true
                                },
                                ctl00$ContentPlaceHolder1$txtField6: {
                                    required: true,
                                    noSpace: true
                                },
                                //ctl00$ContentPlaceHolder1$txtcaptch: {
                                //    required: true,
                                //    noSpace: true
                                //},
                                ctl00$ContentPlaceHolder1$txtRAccId: {
                                    required: true,
                                    maxlength: 11,
                                    alphanumeric: true,
                                    noSpace: true

                                },
                                ctl00$ContentPlaceHolder1$txtFName: {
                                    required: true,
                                    noSpace: true,
                                    maxlength: 30
                                    
                                    
                                },
                                ctl00$ContentPlaceHolder1$txtLName: {
                                    required: true,
                                    noSpace: true,
                                    maxlength: 30
                                },
                                ctl00$ContentPlaceHolder1$txtEAddress: {
                                    required: true,
                                    ValidEmail: true,
                                    maxlength: 40,
                                    noSpace: true
                                },
                                ctl00$ContentPlaceHolder1$txtRPassword: {
                                    required: true,
                                    minlength: 5,
                                    maxlength: 20,
                                    noSpace: true
                                },
                                ctl00$ContentPlaceHolder1$txtRConfPass: {
                                    required: true,
                                    minlength: 5,
                                    maxlength: 20,                               
                                    equalTo: "#ContentPlaceHolder1_txtRPassword",
                                    noSpace: true
                                },
                                ctl00$ContentPlaceHolder1$ddlShippingCountry: {
                                    required: true,
                                    maxlength: 25,
                                    noSpace: true
                                },
                                ctl00$ContentPlaceHolder1$ddlBillingCountry: {
                                    required: true,
                                    maxlength: 25,
                                    noSpace: true
                                },
                                ctl00$ContentPlaceHolder1$txtCompName: {
                                    required: true,
                                    maxlength: 41,
                                    noSpace: true
                                },
                                //ctl00$ContentPlaceHolder1$txtreCaptcha:
                                //    {
                                //        required: true,
                                //        noSpace: true
                                //    }
                               
                            },
                                messages: {
                                    ctl00$ContentPlaceHolder1$txtAccId: {
                                        required: "Please enter login name",
                                        alphanumeric: "Please enter alphanumeric only"
                                    },
                                    ctl00$ContentPlaceHolder1$txtCompName:
                                      {
                                             required: "Please enter  company name"
                                     },
                                   ctl00$ContentPlaceHolder1$txtDeFName:
                                {
                                    required: "Please enter  first name"
                                },
                                   ctl00$ContentPlaceHolder1$txtDeLName: {
                                        required: "Please enter  last name",
                                    },
                                    ctl00$ContentPlaceHolder1$txtWebAddress: {
                                       // required: "Please enter web address"
                                    },
                                   ctl00$ContentPlaceHolder1$txtEmailAdd: {
                                        required: "Please enter email address"
                                    },
                                   ctl00$ContentPlaceHolder1$txtTel1: {
                                        required: "Please enter Tel1"
                                    },
                                   ctl00$ContentPlaceHolder1$txtPassword: {
                                        required: "Please enter password"
                                    },
                                    ctl00$ContentPlaceHolder1$txtBillingadd: {
                                        required: "Please enter billing address"
                                    },
                                    ctl00$ContentPlaceHolder1$txtBillingcity: {
                                        required: "Please enter billing city"
                                    },
                                    ctl00$ContentPlaceHolder1$txtBillingstate: {
                                        required: "Please enter billing state"
                                    },
                                    ctl00$ContentPlaceHolder1$txtBillingzip: {
                                        required: "Please enter billing zipcode"
                                    },
                                    ctl00$ContentPlaceHolder1$txtshippingAdd: {
                                        required: "Please enter shipping address"
                                    },
                                    ctl00$ContentPlaceHolder1$txtshippingcity: {
                                        required: "Please enter shipping city"
                                    },
                                    ctl00$ContentPlaceHolder1$txtshippingState: {
                                        required: "Please enter shipping state"
                                    },
                                    ctl00$ContentPlaceHolder1$txtshippingZip: {
                                        required: "Please enter shipping zipcode"
                                    },
                                    ctl00$ContentPlaceHolder1$txtField1: {
                                        required: "Please enter Q.1"
                                    },
                                    ctl00$ContentPlaceHolder1$txtField2: {
                                        required: "Please enter Q.2"
                                    },
                                    ctl00$ContentPlaceHolder1$txtField3: {
                                        required: "Please enter Q.3"
                                    },
                                    ctl00$ContentPlaceHolder1$txtField4: {
                                        required: "Please enter Q.4"
                                    },
                                    ctl00$ContentPlaceHolder1$txtfield5: {
                                        required: "Please enter Q.5"
                                    },
                                    ctl00$ContentPlaceHolder1$txtfield6: {
                                        required: "Please enter Q.6"
                                    },
                                    //ctl00$ContentPlaceHolder1$txtcaptch: {
                                    //    required: "Please enter valid code"
                                    //},
                                    ctl00$ContentPlaceHolder1$txtRAccId: {
                                        required: "Please enter login name",
                                        alphanumeric: "Please enter alphanumeric only"
                                    },
                                    ctl00$ContentPlaceHolder1$txtFName: {
                                        required: "Please enter firstname"
                                    },
                                    ctl00$ContentPlaceHolder1$txtLName: {
                                        required: "Please enter lastname"
                                    },
                                    ctl00$ContentPlaceHolder1$txtEAddress: {
                                        required: "Please enter email address"
                                    },
                                    ctl00$ContentPlaceHolder1$txtRPassword: {
                                        required: "Please enter password"
                                    },
                                    ctl00$ContentPlaceHolder1$txtRConfPass: {
                                        required: "Please enter confirm password",
                                        equalTo: "Please enter the same password as above."
                                    },
                                    //ctl00$ContentPlaceHolder1$txtreCaptcha:
                                    // {
                                    //     required: "Please enter valid captcha",
                                    // }
                                }                            
                        }).form();                     
                        if (!x) {                           
                            captchreload();
                        }
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
        <script type="text/javascript">
            jQuery(document).ready(function ()
            {
                if (jQuery('#ContentPlaceHolder1_chkShippingadd').is(":checked")) {
                    jQuery('#ContentPlaceHolder1_txtshippingAdd').val(jQuery('#ContentPlaceHolder1_txtBillingadd').val());
                    jQuery('#ContentPlaceHolder1_txtshippingadd2').val(jQuery('#ContentPlaceHolder1_txtBillingadd2').val());
                    jQuery('#ContentPlaceHolder1_txtshippingcity').val(jQuery('#ContentPlaceHolder1_txtBillingcity').val());
                    jQuery('#ContentPlaceHolder1_txtshippingState').val(jQuery('#ContentPlaceHolder1_txtBillingstate').val());
                    jQuery('#ContentPlaceHolder1_txtshippingZip').val(jQuery('#ContentPlaceHolder1_txtBillingzip').val());
                    jQuery('#ContentPlaceHolder1_ddlShippingCountry').val(jQuery('#ContentPlaceHolder1_ddlBillingCountry').val()).selected();

                    jQuery('#ContentPlaceHolder1_txtshippingAdd').attr('readonly', 'true');
                    jQuery('#ContentPlaceHolder1_txtshippingadd2').attr('readonly', 'true');
                    jQuery('#ContentPlaceHolder1_txtshippingcity').attr('readonly', 'true');
                    jQuery('#ContentPlaceHolder1_txtshippingState').attr('readonly', 'true');
                    jQuery('#ContentPlaceHolder1_txtshippingZip').attr('readonly', 'true');
                    jQuery('#ContentPlaceHolder1_ddlShippingCountry').css({ "pointer-events": "none", "cursor": "default" });

                }
                else {
                    jQuery('#ContentPlaceHolder1_txtshippingAdd').removeAttr('readonly');
                    jQuery('#ContentPlaceHolder1_txtshippingadd2').removeAttr('readonly');
                    jQuery('#ContentPlaceHolder1_txtshippingcity').removeAttr('readonly');
                    jQuery('#ContentPlaceHolder1_txtshippingState').removeAttr('readonly');
                    jQuery('#ContentPlaceHolder1_txtshippingZip').removeAttr('readonly');
                    jQuery('#ContentPlaceHolder1_ddlShippingCountry').css({ "pointer-events": "visible", "cursor": "default" });

                    jQuery('#ContentPlaceHolder1_txtshippingAdd').val("");
                    jQuery('#ContentPlaceHolder1_txtshippingadd2').val("");
                    jQuery('#ContentPlaceHolder1_txtshippingcity').val("");
                    jQuery('#ContentPlaceHolder1_txtshippingState').val("");
                    jQuery('#ContentPlaceHolder1_txtshippingZip').val("");
                    jQuery('#ContentPlaceHolder1_ddlShippingCountry').val("").selected();
                }

                jQuery('.same').click(function () {
                    jQuery('.form-style-2 label.error').remove();
                   // alert(jQuery('#ContentPlaceHolder1_chkShippingadd').is(":checked"))
                    if (jQuery('#ContentPlaceHolder1_chkShippingadd').is(":checked"))
                    {
                        jQuery('#ContentPlaceHolder1_txtshippingAdd').attr('readonly', 'true');
                        jQuery('#ContentPlaceHolder1_txtshippingadd2').attr('readonly', 'true');
                        jQuery('#ContentPlaceHolder1_txtshippingcity').attr('readonly', 'true');
                        jQuery('#ContentPlaceHolder1_txtshippingState').attr('readonly', 'true');
                        jQuery('#ContentPlaceHolder1_txtshippingZip').attr('readonly', 'true');
                        jQuery('#ContentPlaceHolder1_ddlShippingCountry').css({ "pointer-events": "none", "cursor": "default" });

                        jQuery('#ContentPlaceHolder1_txtshippingAdd').val(jQuery('#ContentPlaceHolder1_txtBillingadd').val());
                        jQuery('#ContentPlaceHolder1_txtshippingadd2').val(jQuery('#ContentPlaceHolder1_txtBillingadd2').val());
                        jQuery('#ContentPlaceHolder1_txtshippingcity').val(jQuery('#ContentPlaceHolder1_txtBillingcity').val());
                        jQuery('#ContentPlaceHolder1_txtshippingState').val(jQuery('#ContentPlaceHolder1_txtBillingstate').val());
                        jQuery('#ContentPlaceHolder1_txtshippingZip').val(jQuery('#ContentPlaceHolder1_txtBillingzip').val());
                        jQuery('#ContentPlaceHolder1_ddlShippingCountry').val(jQuery('#ContentPlaceHolder1_ddlBillingCountry').val()).selected();                       

                    }
                    else
                    {

                        jQuery('#ContentPlaceHolder1_txtshippingAdd').val("");
                        jQuery('#ContentPlaceHolder1_txtshippingadd2').val("");
                        jQuery('#ContentPlaceHolder1_txtshippingcity').val("");
                        jQuery('#ContentPlaceHolder1_txtshippingState').val("");
                        jQuery('#ContentPlaceHolder1_txtshippingZip').val("");
                        jQuery('#ContentPlaceHolder1_ddlShippingCountry').css({ "pointer-events": "visible", "cursor": "default" });
                        jQuery('#ContentPlaceHolder1_ddlShippingCountry').val("").selected();
                       
                        jQuery('#ContentPlaceHolder1_txtshippingAdd').removeAttr('readonly');
                        jQuery('#ContentPlaceHolder1_txtshippingadd2').removeAttr('readonly');
                        jQuery('#ContentPlaceHolder1_txtshippingcity').removeAttr('readonly');
                        jQuery('#ContentPlaceHolder1_txtshippingState').removeAttr('readonly');
                        jQuery('#ContentPlaceHolder1_txtshippingZip').removeAttr('readonly');
                        jQuery('#ContentPlaceHolder1_ddlShippingCountry').removeAttr('readonly');

                    }
                });
            });
            </script>
</asp:Content>
