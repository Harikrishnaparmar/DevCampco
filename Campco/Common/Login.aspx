<%-- Created By :- Nisha Patel---%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="Campco.Common.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>My Account</title>
    <script type="text/javascript">
        function EnterEvent(e) {
            if (e.keyCode == 13) {
                __doPostBack('<%=btnLogin.UniqueID%>', "");
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <asp:UpdatePanel ID="MainUpdatePanel" runat="server">
        <ContentTemplate>
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
                             <label for="username">Username or email address <span class="required">*
                     </span></label></span>
                          </p>
                           <p>        
                         <asp:TextBox runat="server" ID="txtUname" class="input-text" placeholder="Enter Username /email address"></asp:TextBox>
                            <asp:Label ID="lblUName" runat="server" Text="Enter UserName " ForeColor="Red" Visible="false"></asp:Label>
                          </p>
                          <p>
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                           <p><span class="wpcf7-form-control-wrap your-email">
                           <label for="password">Password <span class="required">*</span></label> </span>
                               </p> 
                           <p>
                           <asp:TextBox runat="server" ID="txtPassword" class="input-text" TextMode="Password" onkeypress="return EnterEvent(event)" clientidmode="Static" placeholder="Enter Password"></asp:TextBox>
                                <asp:Label ID="lblpassword" runat="server" Text="Enter Password" ForeColor="Red" Visible="false"></asp:Label>
                           
                           </p>
                            
                          <p>
                           <asp:Button runat="server" Text="Login" ID="btnLogin" class="wpcf7-form-control wpcf7-submit" OnClick="btnLogin_Click"></asp:Button>
                          </p>
                            <p class="lost_password"> <a href="#"><asp:LinkButton ID="lnkForgot" runat="server" OnClick="lnkForgot_Click">Lost your password?</asp:LinkButton></a></p>
                          
                             <asp:Panel ID="pnlForgotPassword" runat="server" Visible="false">
                                  <div class="login">
                                        <asp:Label ID="lblpasswordmsg" runat="server" Text="" Visible="false"></asp:Label>                        
                             <p><span class="wpcf7-form-control-wrap your-name">
                             <label for="username">Email-Id/UserName<span class="required">
                             </span></label></span>
                             </p>
                             <p>        
                               <asp:TextBox runat="server" ID="txtforgotEmail" class="input-text" placeholder="Enter Email-Id /UserName"></asp:TextBox>
                             <%--  <asp:Label ID="Label1" runat="server" Text="Enter UserName " ForeColor="Red" Visible="false"></asp:Label>--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter UserName / Email-Id" ControlToValidate="txtforgotEmail" ForeColor="Red" ValidationGroup="forgot"></asp:RequiredFieldValidator>
                          </p>
                                      <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                  <ContentTemplate>
                                  
                          <P>Please enter Verification Code:
                               <div class="captchcode">                               
                                   <asp:Image ID="imgcaptcha" runat="server"></asp:Image>
                                 
                                </div>
                          <asp:TextBox runat="server"  ID="txtcaptch" CssClass ="input-text" width="46%"></asp:TextBox>
                              <%--  <asp:Button ID="btnRefresh" runat="server" Text="refresh" CssClass="wpcf7-form-control wpcf7-submit"  CausesValidation="false" ></asp:Button>--%>
                             <asp:Label ID="lblcaptcha" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                            </label>   
                                </P>                              
                             </ContentTemplate>
                              </asp:UpdatePanel>
                           <p>
                           <asp:Button runat="server" Text="Get Password" ID="btnforgotpass" class="wpcf7-form-control wpcf7-submit" OnClick="btnforgotpass_Click"  ValidationGroup="forgot"></asp:Button>
                          </p>
                          </div>
                             </asp:Panel>   
                                                
                              <p class="lost_password"> Not registered yet?</p>                            
                           <p class="lost_password">Register Now <a href="Registration.aspx?Reg=1">Click here</a></p>
                               <p class="">Or Become a Dealer <a href="Registration.aspx">Click here</a></p>   
                          <div class="wpcf7-response-output wpcf7-display-none"></div>
                   </div>
                      </div>
                      </div>   
                       </ContentTemplate>
                </asp:UpdatePanel>      
                 
         </article>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
     <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="MainUpdatePanel">
        <ProgressTemplate>
            <div class="loader_modal">
                <div class="Loader_center">                    
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
