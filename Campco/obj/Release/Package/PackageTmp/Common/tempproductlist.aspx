<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="tempproductlist.aspx.cs" Inherits="Campco.Common.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div id="content-qube">
    <div class="width-container-qube">
      <div id="main-container-qube" class="productlisting_outer">
        <div class="page-content-pro">
          <div class="woocommerce columns-3">
        <%--    <p class="woocommerce-result-count"> Showing 1&ndash;15 of 26 results</p>      --%>
              <div class="woocommerce-ordering">
                <asp:DropDownList ID="ddlSearchcriteria" runat="server" CssClass="orederby" OnSelectedIndexChanged="ddlSearchcriteria_SelectedIndexChanged" AutoPostBack="true">
                <%--  <asp:ListItem>Best Sellers</asp:ListItem>
                  <asp:ListItem>Newness</asp:ListItem>
                   <asp:ListItem>Part Number</asp:ListItem>
                  <asp:ListItem>Sort by price: low to high</asp:ListItem>                    
                    <asp:ListItem>Sort by price: high to low</asp:ListItem>      
                --%>  <%--  <asp:ListItem>Inventory (Dealers only)</asp:ListItem>   --%>        
              </asp:DropDownList>

                  </div>
          
              <asp:DataList ID="rptProductlist" runat="server"   RepeatColumns="3"   RepeatDirection="Vertical"   CellSpacing="3" EditItemStyle-BorderWidth="0" ItemStyle-BorderWidth="0"  >
                  <ItemTemplate>                  
                 <ul class="products"   >   
              <li>
                            
               <div>   
                   <div class="shop-container-pro hover-shop-layout" style="width:250px; height:250px">
                        <a href="productDetail.aspx?prod_cd=<%#Eval("PROD_CD") %>">
                  <div class="overlay-container-shop-pro overlay-image-shop-pro">
                      <a href="productDetail.aspx?prod_cd=<%#Eval("PROD_CD") %>">
                           <img width="750" height="750" src="../Pic/<%#Eval("SMALLPIC") %>" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="2_2961125" srcset="../Pic/<%#Eval("SMALLPIC") %>"  sizes="(max-width: 750px) 100vw, 750px"/>
                            <img src="../Pic/<%#Eval("SMALLPIC") %>"  class="secondary-image-shop-pro"/>
                    </a>  
                    <div class="add-to-cart-overlay top-products-hover">
                                <a href="productDetail.aspx?prod_cd=<%#Eval("PROD_CD") %>" class="shop-perma-icon">
                             <i class="fa fa-eye"></i></a>
                         <a href="cart.aspx" class="shop-perma-icon right-perma-icon"><i class="icon-cart"></i></a>

                    </div>
                  </div>
                  <a href="productDetail.aspx?prod_cd=<%#Eval("PROD_CD") %>">
                  <div class="shop-overlay-content">
                    <div class="shop-overlay-centered">
                    </div>
                  </div>
                  </a>
                  <div class="add-to-cart-base-index"> </a>
                    <a rel="nofollow" href="index335b.html?add-to-cart=1773" data-quantity="1" data-product_id="1773" data-product_sku="1001" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                    <div class="clearfix-qube-ezio"></div>
                  </div>
                </div>
                <div class="specification_product" style="margin-left:0px; width:200px">
             
                <a href="productDetail.aspx?prod_cd=<%#Eval("PROD_CD") %>">
                  <div class="shop-overlay-content">
                    <div class="shop-overlay-centered">
                      <h6 class="shop-title-index"><%#Eval("PROD_CD") %></h6>
                    <%--  <h5><%=i.PROD_CD %></h5>     --%>                                       
                    </div>
                        </div>
                </a>   
                    <span class="amount">&#36;<%#Eval("RETAIL_PRS") %></span></div>                     
                 </li>
                          
                </ul>

                      </ItemTemplate>
              </asp:DataList>

             <%--   </ItemTemplate>
              </asp:Repeater>--%>
              
            
            <div id="woo-pagination">
              <ul class='page-numbers'>
                   
                <li><asp:Button ID="btnfirst" runat="server" Font-Bold="true" Text="<<" Height="31px" 
                    Width="43px" OnClick="btnfirst_Click" /></li>
                <li> <asp:Button ID="btnprevious" runat="server" Font-Bold="true" Text="<" Height="31px" 
                    Width="43px" OnClick="btnprevious_Click"   /></li>
                <li>  <asp:Button ID="btnnext" runat="server" Font-Bold="true" Text=">" Height="31px" 
                    Width="43px" OnClick="btnnext_Click"   /></li>
                   <li><asp:Button ID="btnlast" runat="server" Font-Bold="true" Text=">>" Height="31px"
                    Width="43px" OnClick="btnlast_Click" /></li>                  
              </ul>
<%--              <div class="base-woocommerce-result-count"> Showing 1&ndash;15 of 26 results</div>--%>
              <div class="clearfix-qube-ezio"></div>
            </div>
          </div>
        </div>
      </div>
     
    <div id="sidebar">
        <div id="woocommerce_price_filter-3" class="sidebar-item widget woocommerce widget_price_filter">
          <h6 class="widget-title">Filter by price</h6>
          <%-- <form method="get" action="">--%>
            <div class="price_slider_wrapper">
              <div class="price_slider" style="display:none;"></div>
              <div class="price_slider_amount">
                <input type="text" id="min_price" name="min_price" value="" data-min="1" placeholder="Min price" />
                <input type="text" id="max_price" name="max_price" value="" data-max="1000" placeholder="Max price" />
                 
               <%-- <button type="submit" class="button">Filter</button>--%>
                  
                <div class="price_label" style="display:none;"> Price: <span class="from" name="lowprice">
                    </span> &mdash; <span class="to" name="highprice"></span></div>
                   <asp:Button ID="btnfilter" runat="server" Text="Filter" OnClick="btnfilter_click" CssClass="wpcf7-form-control wpcf7-submit" />
                <div class="clear"></div>
              </div>
            </div>
        <%--  </form>--%>
        
        </div>
        <div class="sidebar-divider-qube"></div>
        <div id="woocommerce_products-6" class="sidebar-item widget woocommerce widget_products">
          <%--<h6 class="widget-title">Products</h6>--%>
          <%--<%--<ul class="product_list_widget">
          
                <% foreach (var j in productList)
                     {%>    
            <li> 
                <a href="#" title="Emerald Bracelet">
                     <img width="180" height="180" src="../Pic/Item/<%=j.SMALLPIC%>" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="ezio_shop_product_06" srcset="../Pic/Item/<%=j.SMALLPIC%>" sizes="(max-width: 180px) 100vw, 180px" />
                     <span class="product-title"><%=j.PROD_CD%></span> </a> <span class="amount">&#36;<%=j.RETAIL_PRS %></span>
            </li>
                 <%}
                  %> 

           <%-- <li> <a href="" title="Tibetan Bracelet"> <img width="180" height="180" src="assets/images/product/2.jpg" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="ezio_shop_product_04" srcset="" sizes="(max-width: 180px) 100vw, 180px" /> <span class="product-title">Tibetan Bracelet</span> </a> <span class="amount">&#36;29.00</span></li>
            <li> <a href="" title="Bohemian Necklace"> <img width="180" height="180" src="assets/images/product/7.jpg" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="ezio_shop_product_02" srcset="assets/images/product/3.jpg" sizes="(max-width: 180px) 100vw, 180px" /> <span class="product-title">Bohemian Necklace</span> </a> <span class="amount">&#36;49.00</span></li>
      

          </ul>--%>
        </div>
    <%--    <div class="sidebar-divider-qube"></div>--%>
        <%--<div id="woocommerce_top_rated_products-4" class="sidebar-item widget woocommerce widget_top_rated_products">
          <h6 class="widget-title">Top Rated Products</h6>
          <ul class="product_list_widget">
            <li> <a href="" title="Weathered Smith Shirt"> <img width="180" height="180" src="assets/images/product/4.jpg" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="1_wm15200504" srcset="assets/images/product/4.jpg" sizes="(max-width: 180px) 100vw, 180px" /> <span class="product-title">Weathered Smith Shirt</span> </a>
              <div class="star-rating" title="Rated 5 out of 5"><span style="width:100%"><strong class="rating">5</strong> out of 5</span></div>
              <span class="amount">&#36;120.00</span></li>
            <li> <a href="" title="Vanishing Elephant SS Shirt"> <img width="180" height="180" src="assets/images/product/5.jpg" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="1_ve15m100603" srcset="assets/images/product/5.jpg" sizes="(max-width: 180px) 100vw, 180px" /> <span class="product-title">Vanishing Elephant SS Shirt</span> </a>
              <div class="star-rating" title="Rated 5 out of 5"><span style="width:100%"><strong class="rating">5</strong> out of 5</span></div>
              <del><span class="amount">&#36;130.00</span></del> <ins><span class="amount">&#36;65.00</span></ins></li>
            <li> <a href="" title="Anorak Khaki"> <img width="180" height="180" src="assets/images/product/6.jpg" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="2_ve15w201101" srcset="assets/images/product/6.jpg" sizes="(max-width: 180px) 100vw, 180px" /> <span class="product-title">Anorak Khaki</span> </a>
              <div class="star-rating" title="Rated 5 out of 5"><span style="width:100%"><strong class="rating">5</strong> out of 5</span></div>
              <del><span class="amount">&#36;300.00</span></del> <ins><span class="amount">&#36;190.00</span></ins></li>
          </ul>
        </div>--%>
        <div class="sidebar-divider-qube"></div>
        <div id="woocommerce_product_categories-5" class="sidebar-item widget woocommerce widget_product_categories">
          <h6 class="widget-title">Product Categories</h6>
              <ul class="product-categories">
          <%
                  foreach(var cat in categoryList)
                  {%>

                <li class="cat-item cat-item-84">
                <a href="tempproductlist.aspx?catid=<%=cat.CATEGORYID %>"><%=cat.CATEGORYNAME%>
                 
                </a>
                </li>
                 <%}
                  
                   %>         
          </ul>
        </div>
        <div class="sidebar-divider-qube"></div>
        <%--<div id="woocommerce_recent_reviews-6" class="sidebar-item widget woocommerce widget_recent_reviews">
          <h6 class="widget-title">Recent Reviews</h6>
          <ul class="product_list_widget">
            <li><a href=""><img width="180" height="180" src="assets/images/product/3.jpg" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="1_ve15m100603" srcset="assets/images/product/3.jpg" sizes="(max-width: 180px) 100vw, 180px" />Vanishing Elephant SS Shirt</a>
              <div class="star-rating" title="Rated 5 out of 5"><span style="width:100%"><strong class="rating">5</strong> out of 5</span></div>
              <span class="reviewer">by QUBE+</span></li>
            <li><a href=""><img width="180" height="180" src="assets/images/product/4.jpg" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="1_wm15200504" srcset="assets/images/product/6.jpg" sizes="(max-width: 180px) 100vw, 180px" />Weathered Smith Shirt</a>
              <div class="star-rating" title="Rated 5 out of 5"><span style="width:100%"><strong class="rating">5</strong> out of 5</span></div>
              <span class="reviewer">by QUBE+</span></li>
            <li><a href=""><img width="180" height="180" src="assets/images/product/4.jpg" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="2_509019" srcset="assets/images/product/5.jpg" sizes="(max-width: 180px) 100vw, 180px" />CLARKS Desert Boot</a>
              <div class="star-rating" title="Rated 5 out of 5"><span style="width:100%"><strong class="rating">5</strong> out of 5</span></div>
              <span class="reviewer">by QUBE+</span></li>
          </ul>
        </div>--%>
        <div class="sidebar-divider-qube"></div>
      </div>
      <div class="clearfix-qube-ezio"></div>
    </div>
  </div>

</asp:Content>
