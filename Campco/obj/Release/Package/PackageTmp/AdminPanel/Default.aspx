<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/CampcoAdmin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Campco.AdminPanel.Default" %>
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
            <div id="content-qube">
                <div class="width-container-qube">
                    <article id="post-110" class="post-110 page type-page status-publish hentry">  
        <div class="page-content-pro" id="fieldres">
          <div class="woocommerce">
            <h2>Login</h2>          
      <div class="login">
                          <p><span class="wpcf7-form-control-wrap your-name">
                             <label for="username">Enter Admin Name <span class="required">*
                     </span></label></span>
                          </p>
                           <p>        
                         <asp:TextBox runat="server" ID="txtAname" class="input-text" placeholder="Enter Admin Name"></asp:TextBox>
                            <asp:Label ID="lblUName" runat="server" Text="Enter UserName " ForeColor="Red" Visible="false"></asp:Label>
                          </p>                 
                           <p><span class="wpcf7-form-control-wrap your-email">
                           <label for="password">Password <span class="required">*</span></label> </span>
                               </p> 
                           <p>
                           <asp:TextBox runat="server" ID="txtPassword" class="input-text" TextMode="Password"></asp:TextBox>
                                <asp:Label ID="lblpassword" runat="server" Text="Enter Password" ForeColor="Red" Visible="false"></asp:Label>
                           </p>                          
                          <p>
                           <asp:Button runat="server" Text="Login" ID="btnLogin" class="wpcf7-form-control wpcf7-submit" OnClick="btnLogin_Click"></asp:Button>
                          </p>                                              
                       <div class="wpcf7-response-output wpcf7-display-none"></div>
                   </div>
                      </div>
                      </div>                   
         </article>
                </div>
            </div>
</asp:Content>
