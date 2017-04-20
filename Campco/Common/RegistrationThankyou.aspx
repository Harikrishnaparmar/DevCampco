<%-- Created By - Nisha Patel---%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="RegistrationThankyou.aspx.cs" Inherits="Campco.Common.RegistrationThankyou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-title-qube" class="page-title-qube default-page-title">
        <div class="width-container-qube fade-header-qube">
            <div class="page-tite-left-qube">
                <h1 class="entry-title-qube-ezio">My Account</h1>
            </div>
            <%--<div id="sharecrumb-qube-container">
                <a href="#" class="dot-irecommendthis" id="dot-irecommendthis-110" title="Recommend this">
                    <span class="dot-irecommendthis-count">0</span> <span class="dot-irecommendthis-suffix"></span></a>
                <div id="sharecrumb-qube">
                    <div class="share-page-title-icon">
                        <i class="fa fa-share-alt"></i>
                    </div>
                    <div class="share-page-title-container">
                        <span class="extra-spacing-share-title"><a href="" title="Share on Facebook" class="tooltip facebook-share"
                            target="_blank"><i class="fa fa-facebook"></i></a><a href="" title="Share on Twitter"
                                class="tooltip twitter-share" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="" title="Share on Pinterest" class="tooltip pinterest-share" target="_blank">
                                <i class="fa fa-pinterest-p"></i></a><a href="" title="Share on Google+" class="tooltip google-share"
                                    target="_blank"><i class="fa fa-google-plus"></i></a><a href="" title="Share on VK"
                                        class="tooltip vk-share" target="_blank"><i class="fa fa-vk"></i></a>
                            <a href="" title="Share on Reddit" class="tooltip reddit-share" target="_blank"><i
                                class="fa fa-reddit"></i></a><a href="" title="Share on LinkedIn" class="tooltip linkedin-share"
                                    target="_blank"><i class="fa fa-linkedin"></i></a><a href="" title="Share on Tumblr"
                                        class="tooltip tumblr-share" target="_blank"><i class="fa fa-tumblr"></i>
                                    </a><a href="" title="Share on E-mail" class="tooltip mail-share" target="_blank"><i
                                        class="fa fa-envelope"></i></a></span>
                    </div>
                </div>
            </div>--%>
            <div class="clearfix-qube-ezio">
            </div>
        </div>
    </div>
    <div id="content-qube" style="height: 200px">
        <div class="width-container-qube">
            <article id="post-110" class="post-110 page type-page status-publish hentry">  
             
        <div class="page-content-pro">
          <div class="woocommerce">
              
              <%  
                  if (Request.QueryString["RegTh"] == "Deal")
                  {%>
                <p class="Prag">Thank you for registering your dealer account at CampCo! Your account requires approval and activation. An account manager will contact you upon review of your registration should you qualify as an appropriate dealer.</p>              
                 <%}
                     else if (Request.QueryString["RegTh"] == "Cons")
                     {%>
             <p class="Prag">
             Thank you for registering as a loyal CampCo customer. You can now enjoy ease of shopping with all of your information saved on your profile.
             </p>
               <p class="Prag">
                  We look forward to providing you with exceptional customer service, amazing products, and great deals available only to our exclusive customers.
              </p>

               <p class="Prag">
                   If you have any questions, please don't hesitate to contact us at service@campco.com or by phone at 323-766-2555.
                   </p>
               <p class="Prag">
                  Enjoy your shopping!<br>The CampCo Team
              </p>
                 <%}

                 %>
            
                   
               </div>
            </div>
                </article>
        </div>
    </div>
</asp:Content>
