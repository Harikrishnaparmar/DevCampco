<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="productDetail.aspx.cs" Inherits="Campco.Common.productDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    
    /*img { border:3px solid #fff;}
        .jzoom {
            position: absolute;
            top: 50px;
            left: 100px;
            width: 350px;
            height: 350px;
        }
        h1 { margin-top:0px; margin-left:100px; color:#fff;}*/

    .imgLoader
    {
        background-image:url('../assets/images/ajax-loader.gif') #000000;
    }
    </style>
    <script type="text/javascript">
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:UpdatePanel runat="server">
       <ContentTemplate>--%>
    <div id="content-qube">
        <div class="width-container-qube">
            <div id="main-container-qube">
                <div class="page-content-pro">
                    <div id="woocommerce-post-page">
                        <div class="shop-post-single-container-pro gallery-of-images-top">
                            <div itemscope itemtype="" id="product-1773" class="post-1773 product type-product status-publish has-post-thumbnail product_cat-shoes product_tag-black product_tag-leather product_tag-shoes product_tag-women shipping-taxable purchasable product-type-simple product-cat-shoes product-tag-black product-tag-leather product-tag-shoes product-tag-women instock">
                            
                                <div class="pp_loaderIcon" style="display: none;"></div>
                                <div class="images gallery-of-images">
                                    
                                    <a href="../Pic/<%=Prod_Detail.EXTRAPIC %>" itemprop="image" class="woocommerce-main-image jzoom" title="" data-rel="prettyPhoto[product-gallery]">
                                        <div class="imgLoader_center"></div>
                                        <img width="600" height="600" src="../Pic/<%=Prod_Detail.EXTRAPIC %>" class="attachment-shop_single size-shop_single wp-post-image" alt="2_2961125" title="2_2961125"  srcset="../Pic/<%=Prod_Detail.LARGEPIC %>" sizes="(max-width: 600px) 100vw, 600px" />
                                    </a>
                                    
                                    <div class="thumbnails columns-3">
                                        <a href="javascript:void(0);" picsrc="../Pic/<%=Prod_Detail.LARGEPIC %>" class="zoom first" title="" data-rel="">
                                            <img width="180" height="180" src="../Pic/<%=Prod_Detail.SMALLPIC %>" class="attachment-shop_thumbnail size-shop_thumbnail" alt="3_2961125" title="2_2961125" srcset="../Pic/<%=Prod_Detail.LARGEPIC %>" />
                                        </a>
                                        <%foreach (var item in Prod_Detail.extraPic)
                                            {%>
                                        <a href="javascript:void(0);" picsrc="../Pic/<%=item.LargePic %>" class="zoom first" title="" data-rel="">
                                            <img width="180" height="180" src="../Pic/<%=item.smallPic %>" class="attachment-shop_thumbnail size-shop_thumbnail" alt="3_2961125" title="2_2961125" srcset="../Pic/<%=item.midPic %>" />
                                        </a>
                                        <%} %>
                                    </div>
                                </div>
                                <div class="summary entry-summary">
                                    <div itemprop="offers" itemscope itemtype="">
                                        <%if ((HttpContext.Current.Session["customerType"] != null ? HttpContext.Current.Session["customerType"].ToString() : "") == "3"){ %>
                                        <p class="price"><span class="amount">&#36; <%= Prod_Detail.FinalPrice!=0? Prod_Detail.FinalPrice:Prod_Detail.WHOLE_PRS %></span></p>
                                        <%}else{ %>
                                        <p class="price"><span class="amount">&#36; <%=Prod_Detail.RETAIL_PRS %></span></p>
                                        <%} %>
                                        <meta itemprop="price" content="730.00" />
                                        <meta itemprop="priceCurrency" content="USD" />
                                        <link itemprop="availability" href="" />
                                    </div>
                                    <h1 itemprop="name" class="product_title entry-title"><%--ACNE STUDIOS Pistol Sh--%><%--<%=Prod_Detail.PROD_CD %>--%><%=Prod_Detail.DESCRIP.Split(',')[0]  %></h1>
                                    <div id="divider-shop-post"></div>
                                    <div itemprop="description">
                                        <p><%--Ut pulvinar finibus consequat. Nulla sit amet dui ut risus fermentum blandit. Suspendisse pretium ornare dapibus. Suspendisse egestas ornare urna, sed tincidunt augue venenatis mattis. Proin nec massa lacus.--%><%=Prod_Detail.DESCRIP  %></p>
                                        <ul>
                                            <%--<li><%=Prod_Detail.DESCRIP1 %> .</li>--%>
                                       
                                            <%--<li><%=Prod_Detail.DESCRIP2 %> .</li>
                                            <li></li>--%>
                                        </ul>
                                        <%--<p>Image Copyright | <a href="" target="_blank">INCU</a></p>--%>
                                    </div>
                                    <%--<form id="cart" class="cart" method="post" accept="productdetail.aspx" enctype='multipart/form-data'>--%>
                                    <div id="cart" class="cart">
                                        <div class="quantity">
                                            <%--<input type="number" step="1" min="1" max="" name="quantity" id="quantity" value="1" title="Qty" class="input-text qty text" size="4" />--%>
                                            <asp:TextBox ID="quantity" runat="server" type="number" step="1" min="1" max="" name="quantity" value="1" title="Qty" class="input-text qty text" size="4"></asp:TextBox>
                                            <input type="hidden" name="add-to-cart" value="0" />

                                            <asp:HiddenField ID="hdnF_prod_cd" runat="server" />
                                            <%--<button type="button" id="addtocart" class="single_add_to_cart_button button alt">Add to cart</button>--%>

                                            <asp:Button ID="btnAddToCart" CssClass="single_add_to_cart_button button wpcf7-form-control wpcf7-submit" runat="server" Text="ADD TO CART" OnClick="AddToCart_Click" />

                                        </div>
                                    </div>
                                    <%--</form>--%>
                                    <div class="clearfix-qube-ezio"></div>
                                    <div class="product_meta">
                                        <%if ((HttpContext.Current.Session["customerType"] != null ? HttpContext.Current.Session["customerType"].ToString() : "") == "3"){ %>
                                        <span class="amount">Retail: &#36;<%=Prod_Detail.RETAIL_PRS %></span>
                                        <span class="posted_in">Dealer: &#36;<%=Prod_Detail.WHOLE_PRS %></span>
                                        <%}%>
                                        <%--<%if (Prod_Detail.FinalPrice != 0) { %>--%>
                                        
                                        <% if (IsSpecial == 1) {if(Prod_Detail.WHOLE_PRS!=Prod_Detail.FinalPrice && Prod_Detail.FinalPrice!=0) %><span class="posted_in">Special: &#36;<%=Prod_Detail.FinalPrice %></span><%}%>
                                        <span class="sku_wrapper">SKU:<span class="sku" itemprop="sku"><%=Prod_Detail.PROD_CD %></span></span>
                                         <%if ((HttpContext.Current.Session["customerType"] != null ? HttpContext.Current.Session["customerType"].ToString() : "") == "3"){ %>
                                        <span class="sku_wrapper"><span class="sku" itemprop="sku"><%=Prod_Detail.MINSTOCK %></span></span> <%}%>
                                        <%--<span class="posted_in">Category: <a href="ProductList.aspx?CatId=<%=Prod_Detail.CATEGORYID %>" rel="tag"><%=Prod_Detail.CATEGORYNAME %></a></span> 
                                        <span class="tagged_as">Tags: <a href="" rel="tag">Black</a>, <a href="" rel="tag">Leather</a>, <a href="" rel="tag">Shoes</a>, <a href="" rel="tag">Women</a></span> </div>
                                    <div class="share-portfolio-buttons-single shop-sharing-qube-single"><a href="#" class="dot-irecommendthis" id="dot-irecommendthis-1773" title="Recommend this"><span class="dot-irecommendthis-count">1</span> <span class="dot-irecommendthis-suffix"></span></a><i class="fa fa-share-alt"></i><a href="" title="Share on Facebook" class="tooltip facebook-share" target="_blank"><i class="fa fa-facebook"></i></a><a href="" title="Share on Twitter" class="tooltip twitter-share" target="_blank"><i class="fa fa-twitter"></i></a><a href="http://pinterest.com/pin/create/button/?url=http://qubeplus.com/demo/ezio-modern-shop/product/acne-studios-pistol-sh/&amp;media=http://qubeplus.com/demo/ezio-modern-shop/wp-content/uploads/sites/49/2015/09/2_2961125.jpg" title="Share on Pinterest" class="tooltip pinterest-share" target="_blank"><i class="fa fa-pinterest-p"></i></a><a href="" title="Share on Google+" class="tooltip google-share" target="_blank"><i class="fa fa-google-plus"></i></a><a href="" title="Share on E-mail" class="tooltip mail-share" target="_blank"><i class="fa fa-envelope"></i></a></div>--%>
                                </div>
                                <!-- .summary -->

                                
                                <meta itemprop="url" content="" />
                            </div>
                            <!-- #product-1773 -->


                            <div class="clearfix-qube-ezio"></div>

                            <div class="">


                                <div class="woocommerce-tabs wc-tabs-wrapper">
                                    <ul class="tabs wc-tabs">
                                        <li class="description_tab"><a href="#tab-description">Description</a> </li>
                                     <%--   <li class="additional_information_tab"><a href="#tab-additional_information">Additional Information</a> </li>--%>
                                    </ul>

                                    <div id="tab-description" class="panel entry-content wc-tab">
                                        <h2>Product Description</h2>
                                      <%--  <p><%=Prod_Detail.DESCRIP +", "+Prod_Detail.DESCRIP1 +" "+Prod_Detail.DESCRIP2 %></p>--%>
                                        <p style="text-align:justify"><%=Prod_Detail.DetailDescription %></p>
                                       <%-- <p>Image Copyright | <a href="http://www.incu.com/" target="_blank">INCU</a></p>--%>
                                    </div>

                                    <%--<div id="tab-additional_information" class="panel entry-content wc-tab">
                                        <h2>Additional Information</h2>
                                        <table class="shop_attributes">
                                            <tr class="">
                                                <th>Weight</th>
                                                <td class="product_weight"><%=Prod_Detail.DetailDescription!=""?Prod_Detail.DetailDescription.Split('-')[1]:"" %></td>
                                            </tr>
                                            <tr class="alt">
                                                <th>Dimensions</th>
                                                <td class="product_dimensions"><%= Prod_Detail.DetailDescription!=""?Prod_Detail.DetailDescription.Split('-')[0]:"" %> </td>
                                            </tr>
                                        </table>
                                    </div>--%>

                                </div>

                                <div class="related products">
                                    
                                            <%if (relatedProd != null)
                                                {%>
                                                    <h2>Related Products</h2>
                                    <div class="woocommerce columns-3">
                                        <%--<ul class="products">--%>
                                                   <% foreach (var items in relatedProd)
                                                    { %>
                                            <li class="first post-1603 product type-product status-publish has-post-thumbnail product_cat-sweaters product_tag-cashmere product_tag-clothing product_tag-sweaters product_tag-white product_tag-women shipping-taxable purchasable product-type-simple product-cat-sweaters product-tag-cashmere product-tag-clothing product-tag-sweaters product-tag-white product-tag-women instock">
                                                <div class="shop-container-pro hover-shop-layout">
                                                    <a href="">
                                                        <div class="overlay-container-shop-pro">

                                                            <a href="productDetail.aspx?prod_cd=<%=items.PROD_CD %>">
                                                                <img width="750" height="750" src="../Pic/<%=items.MEDIUMPIC %>" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="4_ww15202403" srcset="../Pic/<%=items.MEDIUMPIC %>" sizes="(max-width: 750px) 100vw, 750px" />
                                                            </a>
                                                            <div class="add-to-cart-overlay">
                                                                <a href="productDetail.aspx?prod_cd=<%=items.PROD_CD %>" data-rel="" class="shop-perma-icon"><i class="fa fa-eye"></i></a>
                                                                <a href="javascript:void(0);" onclick="AddToCart<%="('"+items.PROD_CD.Trim() +"')"%>;" class="shop-perma-icon right-perma-icon"><i class="icon-cart"></i></a>
                                                            </div>
                                                        </div>
                                                        <!-- close .overlay-container-shop-pro -->

                                                        <a href="productDetail.aspx?prod_cd=<%=items.PROD_CD %>">
                                                            <div class="shop-overlay-content">
                                                                <div class="shop-overlay-centered">
                                                                    <h6 class="shop-title-index"><%=items.PROD_CD %></h6>
                                                                    <ul class="shop-tax-pro">
                                                                        <li>Sweaters<span>&middot;</span></li>
                                                                    </ul>
                                                                    <%if ((HttpContext.Current.Session["customerType"] != null ? HttpContext.Current.Session["customerType"].ToString() : "") == "3"){ %>
                                                                    <p class="price"><span class="amount">Dealer Price: &#36; <%=items.WHOLE_PRS %></span></p>
                                                                    <%}%>
                                                                    <span class="price"><span class="amount">&#36;<%=items.RETAIL_PRS %></span></span>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="add-to-cart-base-index">
                                                    </a><a rel="nofollow" href="/demo/ezio-modern-shop/product/acne-studios-pistol-sh/?add-to-cart=1603" data-quantity="1" data-product_id="1603" data-product_sku="1001" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                                                    <div class="clearfix-qube-ezio"></div>
                                                </div>
                                                <%--</div>--%>
                                                <!-- close .shop-container-pro -->
                                            </li>
                                            <%}
                                                } %>
                                            
                                        </ul>
                                    </div>
                                </div>


                            </div>

                            </div>
                         </div>
                     </div>
                <!-- close  .page-content-pro -->
            </div>
            <!-- close #main-container-qube -->

            
            <div class="clearfix-qube-ezio"></div>
        </div>
        <!-- close .width-container-qube -->
    </div>
        </div>
    <!-- #content-qube -->




    <!--
<script>jQuery(document).ready(function(){jQuery(".view-catalog").click(function(){jQuery(".catalog").toggle(); });});</script>
-->
    <script type="text/javascript">
        var tabLinks = new Array();
        var contentDivs = new Array();
        function init() {

            // Grab the tab links and content divs from the page
            var tabListItems = document.getElementById('tabs').childNodes;
            for (var i = 0; i < tabListItems.length; i++) {
                if (tabListItems[i].nodeName == "LI") {
                    var tabLink = getFirstChildWithTagName(tabListItems[i], 'A');
                    var id = getHash(tabLink.getAttribute('href'));
                    tabLinks[id] = tabLink;
                    contentDivs[id] = document.getElementById(id);
                }
            }

            // Assign onclick events to the tab links, and
            // highlight the first tab
            var i = 0;

            for (var id in tabLinks) {
                tabLinks[id].onclick = showTab;
                tabLinks[id].onfocus = function () { this.blur() };
                if (i == 0) tabLinks[id].className = 'selected';
                i++;
            }

            // Hide all content divs except the first
            var i = 0;

            for (var id in contentDivs) {
                if (i != 0) contentDivs[id].className = 'tabContent hide';
                i++;
            }
        }
    </script>

    <%--<script type="text/javascript">jQuery(document).ready(function($){'use strict';$("#sidebar-fixed-qube").sticky({});$(".add-to-cart-overlay a[data-rel^='prettyPhoto'], .portfolio-column-1-pro a[data-rel^='prettyPhoto'], .featured-blog-pro a[data-rel^='prettyPhoto'], .pro-media-image a[data-rel^='prettyPhoto'], .images a[data-rel^='prettyPhoto'], .portfolio-container-pro a[data-rel^='prettyPhoto']").prettyPhoto({hook:'data-rel',animation_speed:'fast',slideshow:5000,show_title:false,deeplinking:false,overlay_gallery:false,custom_markup:'',default_width:900,default_height:506,social_tools:''});jQuery('nav#site-navigation ul.sf-menu').superfish({popUpSelector:'ul.sub-menu,.sf-mega',delay:400,speed:200,speedOut:200,animation:{opacity:'show'},animationOut:{opacity:'hide'},cssArrows:true,autoArrows:true});jQuery('#header-top-qube ul.sf-menu').superfish({popUpSelector:'ul.sub-menu,.sf-mega',delay:400,speed:200,speedOut:200,animation:{opacity:'show'},animationOut:{opacity:'hide'},cssArrows:true,autoArrows:true});});</script>--%>


    <script type="text/javascript">
        jQuery("#addtocart").click(function () {
            var i = jQuery(jQuery(".shopping-cart-header-count")[0]).text()
            var qty = jQuery("#quantity").val();

            jQuery('.shopping-cart-header-count').text(parseInt(i) + parseInt(qty));

        });

        jQuery(document).ready(function () {
            jQuery('.imgLoader_center').hide();
            var src = jQuery('.first').attr('picsrc');
            src = src.replace("Large/thumbnail.", "XLarge/");
            var x = jQuery('img.wp-post-image').attr('src');
            x = x.replace('XLarge', 'XLarge');
            jQuery('img.wp-post-image').attr('src',x);
            //jQuery('img.size-shop_single').attr("src", src);
            jQuery('img.size-shop_single').attr("srcset", src);
            jQuery('img.zoomImg').attr("src", src);
            jQuery('img.zoomImg').attr("srcset", src);
            jQuery('a.jzoom').attr("href", src);

            jQuery(document).delegate('.zoom', 'click', function (element) {
                jQuery('.imgLoader_center').show();
                var src = jQuery(this).attr("picsrc");
                src = src.replace("Large/thumbnail.", "XLarge/")
                jQuery('img.size-shop_single').attr("src", src);
                jQuery('img.size-shop_single').attr("srcset", src);
                jQuery('img.zoomImg').attr("src", src);
                jQuery('img.zoomImg').attr("srcset", src);
                jQuery('a.jzoom').attr("href", src);
                jQuery('img.zoomImg').css('width', '900px');
                jQuery('img.zoomImg').css('height', '900px');

                jQuery('pp_loaderIcon').fadeIn();

                
                //alert(src);
            });

            jQuery(document).delegate('.zoomImg,.attachment-shop_single', 'load', function (element) {
                jQuery('.imgLoader_center').hide();
                jQuery('pp_loaderIcon').fadeOut();
            });
        });
       
        
        
    </script>
    
</asp:Content>
