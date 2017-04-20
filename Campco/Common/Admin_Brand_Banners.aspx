<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="Admin_Brand_Banners.aspx.cs" Inherits="Campco.Common.Admin_Brand_Banners" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<%--    <asp:UpdatePanel ID="MainUpdatePanel" runat="server">
        <ContentTemplate>--%>
            <div id="page-title-qube" class="page-title-qube default-page-title">
                <div class="width-container-qube fade-header-qube">
                    <div class="page-tite-left-qube">
                        <h1 class="entry-title-qube-ezio">Banner Images Upload</h1>
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
                    <article id="post-85" class="post-85 page type-page status-publish hentry">
        <div class="page-content-pro">
          
          <div class="wpb_column vc_column_container vc_col-sm-12">
              <div class="vc_column-inner ">
                <div class="wpb_wrapper">
                  <div class="wpb_text_column">
                    <div class="wpb_wrapper">
                      <div role="form" class="wpcf7" id="wpcf7-f101-p85-o1" lang="en-US" dir="ltr">
                        <div class="screen-reader-response"></div>
                            <div class="page-content-pro">
                        <div class="login">                       
                          <div class="form-style-2">
                           <p>
                         <label for="field7">Select Category
                             </label>
                               </p>
                              <p>
                             <label>
                             <asp:DropDownList ID="ddlCategory" runat="server"  CssClass="select-field" Width="200px" AutoPostBack="true">
                                  </asp:DropDownList></label>
                                  </p>
                              <p>
                          <label for="field7">
                            <span>Select Banner Image</span>
                          <%-- <asp:FileUpload ID="FileUpload1" runat="server"  ></asp:FileUpload>--%>
                               <asp:FileUpload ID="fileuplaod1" runat="server" AllowMultiple="true" Font-Bold="true" />  
                     
                          </label>
                            </p>
                       <p>
                           <asp:Button ID="btnAdd" runat="server" Text="Add Banner" CssClass="wpcf7-form-control wpcf7-submit" OnClick="btnAdd_Click"></asp:Button>
                       </p>
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
            </div>
                </div>
                <div class="vc_row-full-width vc_clearfix"></div>
            </div>
            <div class="vc_row-full-width vc_clearfix"></div>
       
        <!-- .entry-content -->

         
      <!-- #post-## -->
           
       <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
  <%--  <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="MainUpdatePanel">
        <ProgressTemplate>
            <div class="loader_modal">
                <div class="Loader_center">
                    <img alt="" src="assets/images/Image_Loader1.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>--%>
</asp:Content>
