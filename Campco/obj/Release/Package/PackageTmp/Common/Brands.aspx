<%-- Created By :- Nisha Patel---%>
<%@ Page Title="Brand" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="Brands.aspx.cs" Inherits="Campco.Common.Brands" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>brands</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="page-title-qube" class="page-title-qube default-page-title">
    <div class="width-container-qube  fade-header-qube">
      <div class="page-tite-left-qube">
        <h1 class="entry-title-qube-ezio">Brands</h1>
      </div>
      <%--<div id="sharecrumb-qube-container"> <a href="#" class="dot-irecommendthis" id="dot-irecommendthis-4528" title="Recommend this"><span class="dot-irecommendthis-count">0</span> <span class="dot-irecommendthis-suffix"></span></a>
        <div id="sharecrumb-qube">
          <div class="share-page-title-icon"><i class="fa fa-share-alt"></i></div>
          <div class="share-page-title-container"> <span class="extra-spacing-share-title"> 
          <a href="" class="tooltip facebook-share" target="_blank"><i class="fa fa-facebook"></i></a>
          <a href="" title="Share on Twitter" class="tooltip twitter-share" target="_blank"><i class="fa fa-twitter"></i></a>
          <a href="" title="Share on Pinterest" class="tooltip pinterest-share" target="_blank"><i class="fa fa-pinterest-p"></i></a> 
          <a href="" title="Share on Google+" class="tooltip google-share" target="_blank"><i class="fa fa-google-plus"></i></a>
          <a href="" title="Share on VK" class="tooltip vk-share" target="_blank"><i class="fa fa-vk"></i></a> 
          <a href="" title="Share on Reddit" class="tooltip reddit-share" target="_blank"><i class="fa fa-reddit"></i></a>
          <a href="" title="Share on LinkedIn" class="tooltip linkedin-share" target="_blank"><i class="fa fa-linkedin"></i></a>
          <a href="" title="Share on Tumblr" class="tooltip tumblr-share" target="_blank"><i class="fa fa-tumblr"></i></a>
          <a href="mailto:?subject=FAQ&amp;body=http://qubeplus.com/demo/ezio-modern-shop/faq/" title="Share on E-mail" class="tooltip mail-share" target="_blank"><i class="fa fa-envelope"></i></a> </span></div>
        </div>
      </div>--%>
      <div class="clearfix-qube-ezio"></div>
    </div>
  </div>
  <div class="clearfix-qube-ezio"></div>

 <div id="content-qube">
    <div class="width-container-qube">
     <article id="post-85" class="post-85 page type-page status-publish hentry">
        <div class="page-content-pro">
          <div class="vc_row wpb_row vc_row-fluid vc_custom_1440586548569">            
            </div>
          </div>
          <div data-vc-full-width="true" data-vc-full-width-init="false" class="vc_row wpb_row vc_row-fluid vc_custom_1452037142280 vc_row-has-fill">


            <div class="wpb_column vc_column_container vc_col-sm-12">
              <div class="vc_column-inner ">
                <div class="wpb_wrapper">
                  <div class="wpb_text_column  ">
                    <div class="wpb_wrapper">                     

                      <div class="our_clients_oute">                                         
                          <div class="client_row1">   
                              
                              <% if (OtherBrandList != null)
                                  {
                                      foreach (var item in OtherBrandList)
                                      {%> 
                             <a href="OtherProductList.aspx?CatId=<%=item.CATEGORYID %>">
                              <span class="row1">
                              <img src="../Pic/<%=item.MEDIUMPIC %>" style="width:215px;">
                             <%-- <div class="brands-text">
                                <a href="#">Lorem Ipsum</a>
                                <p>The point of using Lorem</p>
                              </div>                                                          
                           --%> </span>
                                 </a>
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
          <div class="vc_row-full-width vc_clearfix"></div>        
        </div>
        <!-- .entry-content --> 
        
      </article>
      <!-- #post-## --> 
    </div>
     <div>
       <h6 style="color:#ff0000;">Some brands restricted for export for certain countries.</h6>
    </div>
</asp:Content>
