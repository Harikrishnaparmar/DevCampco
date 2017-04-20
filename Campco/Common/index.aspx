<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Campco.Common.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery('body').addClass('light-nav-force');
            jQuery('#masthead-qube').addClass('transparent-qube');
        });
        //jQuery(".search-icon-pro").click(function () {
        //  alert('hiiiii');
        // jQuery(".site-header").toggleClass("active-pro");
        //});

        jQuery(document).on("click", ".newsletterpopup", function () {
            var a = jQuery("#yourname").val();
            var b = jQuery("#email").val();

            window.location.href = "index.aspx?param=news&name=" + a + "&email=" + b;
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- START REVOLUTION SLIDER 5.2.5 fullscreen mode -->
    <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updatepanel1" runat="server">
        <ContentTemplate>--%>
    <%--<div class="topfixslide"></div>--%>
    <div class="flexslidetop">
        <div class="flexslider" id="home-slider">
            <ul class="slides">
                <%if (BrandHeaderBanner!=null)
                    {
                        foreach (var data in BrandHeaderBanner)
                        {
                            if (data.CategoryId != "0")
                            {%>
                <li>
                    <a href="ProductList.aspx?CatId=11">
                        <img src="../AdminPanel/Images/<%=data.Banner_Path %>" /></a>
                </li>
                <%}
                    else
                    {%>
                <li>
                    <a href="index.aspx?Catid=1">
                        <img src="assets/images/banner/Campco1.jpg" /></a>
                </li>
                <li>
                    <a href="index.aspx?Catid=20">
                        <img src="assets/images/banner/Campco2.jpg" /></a>
                </li>
                <li>
                    <a href="index.aspx?Catid=37">
                        <img src="assets/images/banner/Campco3.jpg" /></a>
                </li>
                <li>
                    <a href="index.aspx?Catid=50">
                        <img src="assets/images/banner/Campco4.jpg" /></a>
                </li>
                <li>
                    <a href="index.aspx?Catid=51">
                        <img src="assets/images/banner/Campco5.jpg" /></a>
                </li>
                <%}
                    }
                }

                %>
                <%if (catid == 1)
                    { %>
                <li>
                    <a href="ProductList.aspx?CatId=11">
                        <img src="assets/images/banner/humvee/1.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=18">
                        <img src="assets/images/banner/humvee/2.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=11&param=1">
                        <img src="assets/images/banner/humvee/3.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=11&param=0">
                        <img src="assets/images/banner/humvee/4.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=52">
                        <img src="assets/images/banner/humvee/5.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=63">
                        <img src="assets/images/banner/humvee/6.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=9">
                        <img src="assets/images/banner/humvee/7.jpg" /></a>
                </li>
                <%
                    }
                    else if (catid == 20)
                    {%>
                <li>
                    <a href="ProductList.aspx?CatId=26">
                        <img src="assets/images/banner/uzi/1.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=31">
                        <img src="assets/images/banner/uzi/2.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=25">
                        <img src="assets/images/banner/uzi/3.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=61">
                        <img src="assets/images/banner/uzi/4.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=27">
                        <img src="assets/images/banner/uzi/5.jpg" /></a>
                </li>
                <%--<li>
                                           <a href="ProductList.aspx?CatId=34"><img src="assets/images/banner/uzi/6.jpg" /></a>
                                        </li>--%>

                <% 
                    }
                    else if (catid == 37)
                    {%>
                <li>
                    <a href="ProductList.aspx?CatId=38">
                        <img src="assets/images/banner/smith/1.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=42">
                        <img src="assets/images/banner/smith/2.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=42">
                        <img src="assets/images/banner/smith/3.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=37&param=1">
                        <img src="assets/images/banner/smith/4.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=41">
                        <img src="assets/images/banner/smith/5.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=41">
                        <img src="assets/images/banner/smith/6.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=42">
                        <img src="assets/images/banner/smith/7.jpg" /></a>
                </li>
                <% 
                    }
                    else if (catid == 50)
                    {%>
                <li>
                    <a href="ProductList.aspx?CatId=50">
                        <img src="assets/images/banner/swiss/1.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=50">
                        <img src="assets/images/banner/swiss/2.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=50">
                        <img src="assets/images/banner/swiss/3.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=50">
                        <img src="assets/images/banner/swiss/4.jpg" /></a>
                </li>
                <% 
                    }
                    else if (catid == 51)
                    {%>
                <li>
                    <a href="ProductList.aspx?CatId=51">
                        <img src="assets/images/banner/caliber/1.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=51">
                        <img src="assets/images/banner/caliber/2.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=51">
                        <img src="assets/images/banner/caliber/3.jpg" /></a>
                </li>
                <li>
                    <a href="ProductList.aspx?CatId=51">
                        <img src="assets/images/banner/caliber/4.jpg" /></a>
                </li>
                <% }
                    else
                    { %>

                <%-- <%}%>--%>
                <li>
                    <a href="index.aspx?Catid=1">
                        <img src="assets/images/banner/Campco1.jpg" /></a>
                </li>
                <li>
                    <a href="index.aspx?Catid=20">
                        <img src="assets/images/banner/Campco2.jpg" /></a>
                </li>
                <li>
                    <a href="index.aspx?Catid=37">
                        <img src="assets/images/banner/Campco3.jpg" /></a>
                </li>
                <li>
                    <a href="index.aspx?Catid=50">
                        <img src="assets/images/banner/Campco4.jpg" /></a>
                </li>
                <li>
                    <a href="index.aspx?Catid=51">
                        <img src="assets/images/banner/Campco5.jpg" /></a>
                </li>

                <%}%>
            </ul>
        </div>

    </div>


    <div class="vc_row-full-width vc_clearfix"></div>

    <div class="campco-welcome">


        <div data-vc-full-width="true" data-vc-full-width-init="false" class="vc_row wpb_row vc_row-fluid vc_custom_top-90">
            <div class="wpb_column vc_column_container vc_col-sm-12">
                <div class="vc_column-inner ">
                    <div class="wpb_wrapper">
                        <a href="productList.aspx?param=0<%=Request.QueryString["CatId"] != null ? "&CatId=" + Request.QueryString["CatId"].ToString() : "" %>">
                            <h2 style="font-size: 12px; color: #03b4ba; text-align: center; font-family: Montserrat; font-weight: 400; font-style: normal; text-transform: uppercase;" class="vc_custom_heading ezio-minimal-subtitle-01">START SHOPPING</h2>
                        </a>

                        <h2 style="font-size: 35px; color: #000000; text-align: center; font-family: Playfair Display; font-weight: 400; font-style: normal; text-transform: uppercase;" class="vc_custom_heading">Welcome to <%=(categoryInfo != null) ? categoryInfo.CATEGORYNAME : "Campco" %></h2>

                        <div class="vc_separator wpb_content_element vc_separator_align_center vc_sep_width_10 vc_sep_border_width_2 vc_sep_pos_align_center vc_separator_no_text vc_sep_color_grey vc_custom_1452290601924  vc_custom_1452290601924"><span class="vc_sep_holder vc_sep_holder_l"><span class="vc_sep_line"></span></span><span class="vc_sep_holder vc_sep_holder_r"><span class="vc_sep_line"></span></span></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="vc_row-full-width vc_clearfix"></div>


        <div class="wpb_wrapper">
            <div class="slick-carousel-container-pro">
                <div class="woocommerce" style="margin-left: -0px; margin-right: -0px;">
                    <div id="shop-slick-carousel-pro-1" class="slick-carousel-pro shop-carousel1">
                        <%--<div>--%>
                        <%foreach (var item in ProductFirstList)
                            { %>

                        <div class="slick-carousel-item-pro" style="padding-left: 0px; padding-right: 0px;">
                            <div class="first post-1768 product type-product status-publish has-post-thumbnail product_cat-shirts product_tag-clothing product_tag-men product_tag-shirts shipping-taxable purchasable product-type-simple product-cat-shirts product-tag-clothing product-tag-men product-tag-shirts instock">
                                <div class="shop-container-pro hover-shop-layout">
                                    <a href="">

                                        <div class="overlay-container-shop-pro overlay-image-shop-pro">
                                            <a href="">
                                                <img src="<%=item.LARGEPIC %>" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="" srcset="" />
                                                <img src="<%=item.LARGEPIC %>" class="secondary-image-shop-pro">
                                            </a>
                                            <div class="add-to-cart-overlay"><a href="productDetail.aspx?prod_cd=<%=item.PROD_CD %>" data-rel="" class="shop-perma-icon"><i class="fa fa-eye"></i></a><a href="javascript:void(0);" onclick="AddToCart<%="('" + item.PROD_CD.Trim() + "')"%>;" name="addtocart" class="shop-perma-icon right-perma-icon v"><i class="icon-cart"></i></a></div>
                                        </div>
                                        <a href="productdetail.aspx?prod_cd=<%=item.PROD_CD %>">
                                            <div class="shop-overlay-content">
                                                <div class="shop-overlay-centered">
                                                    <h6 class="shop-title-index"><%=item.PROD_CD %></h6>
                                                    <ul class="shop-tax-pro">
                                                        <%--  <li>Accessories<span>&middot;</span></li>--%>
                                                    </ul>
                                                    <div class="star-rating" title="Rated 5 out of 5"><span style="width: 100%"><strong class="rating">5</strong> out of 5</span></div>
                                                    <%--<span class="price"><span class="amount">&#36;<%=item.RETAIL_PRS %></span></span>--%>
                                                    <%if ((HttpContext.Current.Session["customerType"] != null ? HttpContext.Current.Session["customerType"].ToString() : "") == "3")
                                                        { %>
                                                    <span class="price"><span class="amount">Retail: &#36;<%=item.RETAIL_PRS %></span></span>
                                                    <span class="price"><span class="amount">Dealer: &#36;<%=item.WHOLE_PRS %></span></span>
                                                    <%if (IsSpecial == 1)
                                                        { %>
                                                    <%if (item.WHOLE_PRS != item.FinalPrice && item.FinalPrice != 0)
                                                        { %>
                                                    <span class="price"><span class="amount">Special : &#36;<%=item.FinalPrice %></span></span>
                                                    <%} %>
                                                    <%}
                                                        }
                                                        else
                                                        {%><span class="price"><span class="amount">&#36;<%=item.RETAIL_PRS %></span></span><% }%>
                                                </div>
                                            </div>
                                        </a>
                                        <div class="add-to-cart-base-index">
                                    </a>
                                    <a rel="nofollow" href="" data-quantity="1" data-product_id="1768" data-product_sku="1001" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                                    <div class="rating-fix-pro">
                                        <a href="">
                                            <div class="star-rating" title="Rated 5 out of 5"><span style="width: 100%"><strong class="rating">5</strong> out of 5</span></div>
                                        </a>
                                    </div>
                                    <div class="clearfix-qube-ezio"></div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <%} %>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript">jQuery(document).ready(function ($) { 'use strict'; $('#shop-slick-carousel-pro-1').slick({ lazyLoad: 'ondemand', dots: false, arrows: false, infinite: true, slidesToShow: 5, slidesToScroll: 1, responsive: [{ breakpoint: 1050, settings: { slidesToShow: 3, slidesToScroll: 3 } }, { breakpoint: 767, settings: { slidesToShow: 1, slidesToScroll: 1 } }], autoplay: false, autoplaySpeed: 1500, speed: 750, useCSS: false }); });</script>

    <div data-vc-full-width="true" data-vc-full-width-init="false" data-vc-stretch-content="true" class="vc_row wpb_row vc_row-fluid vc_custom_1452434014396 vc_row-no-padding">
        <div class="wpb_column vc_column_container vc_col-sm-12">
            <div class="vc_column-inner ">
                <div class="wpb_wrapper">

                    <div class="slick-carousel-container-pro">
                        <div class="woocommerce" style="margin-left: -0px; margin-right: -0px;">
                            <div id="shop-slick-carousel-pro-2" class="slick-carousel-pro shop-carousel2">
                                <%-- <div>--%>
                                <% if (ProductFirstList.Count > 5)
                                    {
                                        for (int i = 5; i < ProductFirstList.Count; i++)
                                        {
                                            var item = ProductFirstList[i];%>
                                <div class="slick-carousel-item-pro" style="padding-left: 0px; padding-right: 0px;">
                                    <div class="first post-4494 product type-product status-publish has-post-thumbnail product_cat-accessories product_tag-accessories product_tag-jewelry product_tag-women shipping-taxable purchasable product-type-simple product-cat-accessories product-tag-accessories product-tag-jewelry product-tag-women instock">
                                        <div class="shop-container-pro hover-shop-layout">
                                            <a href="index.aspx?prod_cd=<%=item.PROD_CD %>">
                                                <div class="overlay-container-shop-pro">
                                                    <a href="">
                                                        <img src="<%=item.LARGEPIC %>" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="ezio_shop_product_06" srcset="<%=item.LARGEPIC %>" />
                                                    </a>
                                                    <div class="add-to-cart-overlay"><a href="productDetail.aspx?prod_cd=<%=item.PROD_CD %>" data-rel="" class="shop-perma-icon"><i class="fa fa-eye"></i></a><a href="javascript:void(0);" onclick="AddToCart<%="('" + item.PROD_CD.Trim() + "')"%>;" name="addtocart" class="shop-perma-icon right-perma-icon v"><i class="icon-cart"></i></a></div>
                                                </div>
                                                <a class="" href="productdetail.aspx?prod_cd=<%=item.PROD_CD %>">
                                                    <div class="shop-overlay-content">
                                                        <div class="shop-overlay-centered">
                                                            <h6 class="shop-title-index"><%=item.PROD_CD %></h6>
                                                            <ul class="shop-tax-pro">
                                                                <%--<li>(code UZI-TACPEN1-BK)<span>&middot;</span></li>--%>
                                                            </ul>
                                                            <%--<span class="price"><span class="amount">&#36;<%=item.RETAIL_PRS %></span></span>--%>
                                                            <%if ((HttpContext.Current.Session["customerType"] != null ? HttpContext.Current.Session["customerType"].ToString() : "") == "3")
                                                                { %>
                                                            <span class="price"><span class="amount">Retail: &#36;<%=item.RETAIL_PRS %></span></span>
                                                            <span class="price"><span class="amount">Dealer: &#36;<%=item.WHOLE_PRS %></span></span>
                                                            <%if (item.WHOLE_PRS != item.FinalPrice && item.FinalPrice != 0)
                                                                { %>
                                                            <span class="price"><span class="amount">Special: &#36;<%=item.FinalPrice %></span></span>
                                                            <%} %>
                                                            <%}
                                                                else
                                                                {%><span class="price"><span class="amount">&#36;<%=item.RETAIL_PRS %></span></span><% } %>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="add-to-cart-base-index">
                                            </a><a rel="nofollow" href="" data-quantity="1" data-product_id="4494" data-product_sku="1001" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                                            <div class="clearfix-qube-ezio"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <%}
                                }%>
                        </div>

                        <%--<div class="seemore"><a href="productList.aspx?param=1<%=Request.QueryString["CatId"]!=null?"&CatId="+Request.QueryString["CatId"].ToString():"" %>" class="seemorebtn">See More</a></div>--%>
                        <%-- ---------------------------- --%>
                        <div data-vc-full-width="true" data-vc-full-width-init="false" class="vc_row wpb_row vc_row-fluid ">
                            <div class="wpb_column vc_column_container vc_col-sm-12">
                                <div class="vc_column-inner ">
                                    <div class="wpb_wrapper">
                                        <div class="seemore"><a href="productList.aspx?param=0<%=Request.QueryString["CatId"] != null ? "&CatId=" + Request.QueryString["CatId"].ToString() : "" %>" class="seemorebtn">See More</a></div>
                                        <div class="vc_separator wpb_content_element vc_separator_align_center vc_sep_width_10 vc_sep_border_width_2 vc_sep_pos_align_center vc_separator_no_text vc_sep_color_grey vc_custom_1452290601924  vc_custom_1452290601924"><span class="vc_sep_holder vc_sep_holder_l"><span class="vc_sep_line"></span></span><span class="vc_sep_holder vc_sep_holder_r"><span class="vc_sep_line"></span></span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- ---------------------------------------------------- --%>
                        <div class="clearfix-qube-ezio"></div>
                    </div>
                    <script type="text/javascript">jQuery(document).ready(function ($) { 'use strict'; $('#shop-slick-carousel-pro-2').slick({ lazyLoad: 'ondemand', dots: false, arrows: false, infinite: true, slidesToShow: 5, slidesToScroll: 1, responsive: [{ breakpoint: 1050, settings: { slidesToShow: 3, slidesToScroll: 3 } }, { breakpoint: 767, settings: { slidesToShow: 1, slidesToScroll: 1 } }], autoplay: false, autoplaySpeed: 1500, speed: 750, useCSS: false }); });</script>
                    <div class="clearfix-qube-ezio"></div>
                </div>
            </div>
        </div>
    </div>


    <div class="vc_row-full-width vc_clearfix"></div>



    </div>


                    <div class="vc_row-full-width vc_clearfix"></div>

    <div data-vc-full-width="true" data-vc-full-width-init="false" class="wpb_row vc_row-fluid vc_custom_1452290165218 vc_row-has-fill">

        <div data-vc-full-width="true" data-vc-full-width-init="false" class="vc_row wpb_row vc_row-fluid ">
            <div class="wpb_column vc_column_container vc_col-sm-12">
                <div class="vc_column-inner ">
                    <div class="wpb_wrapper">
                        <h2 style="font-size: 12px; color: #03b4ba; text-align: center; font-family: Montserrat; font-weight: 400; font-style: normal; text-transform: uppercase;" class="vc_custom_heading ezio-minimal-subtitle-01">As seen on</h2>
                        <div class="vc_separator wpb_content_element vc_separator_align_center vc_sep_width_10 vc_sep_border_width_2 vc_sep_pos_align_center vc_separator_no_text vc_sep_color_grey vc_custom_1452290601924  vc_custom_1452290601924"><span class="vc_sep_holder vc_sep_holder_l"><span class="vc_sep_line"></span></span><span class="vc_sep_holder vc_sep_holder_r"><span class="vc_sep_line"></span></span></div>
                    </div>
                </div>
            </div>
        </div>



        <%--<div class="vc_container-fluid">
                <div class="client-logo-2">
                    <ul>
                        <li>
                            <img src="assets/images/client/brand2.png" class="vc_single_image-img attachment-full" alt="">
                        </li>
                         <li>
                            <img src="assets/images/client/brand3.png" class="vc_single_image-img attachment-full" alt="">
                        </li>
                         <li>
                            <img src="assets/images/client/brand4.png" class="vc_single_image-img attachment-full" alt="">
                        </li>
                         <li>
                            <img src="assets/images/client/brand5.png" class="vc_single_image-img attachment-full" alt="">
                        </li>
                         <li>
                            <img src="assets/images/client/brand6.png" class="vc_single_image-img attachment-full" alt="">
                        </li>
                         <li>
                            <img src="assets/images/client/brand1.png" class="vc_single_image-img attachment-full" alt="">
                        </li>
                         <li>
                            <img src="assets/images/client/brand8.png" class="vc_single_image-img attachment-full" alt="">
                        </li>
                         <li>
                            <img src="assets/images/client/brand11.png" class="vc_single_image-img attachment-full" alt="">
                        </li
                        <li>
                            <img src="assets/images/client/brand7.png" class="vc_single_image-img attachment-full" alt="">
                        </li>                        

                    </ul>
                </div>
            </div>--%>

        <%--<div class="wpb_column vc_column_container vc_col-sm-12">
                <div class="vc_column-inner ">
                    <div class="wpb_wrapper">
                        <div id="ult-carousel-53812586757020f61d5c66" class="ult-carousel-wrapper   ult_horizontal" data-gutter="30" data-rtl="false">
                            <div class="ult-carousel-36534275657020f61d5be5 ">

                                <% foreach (var data in brandList)
                                    {%>
                                <div class="ult-item-wrap" data-animation="animated no-animation">
                                    <div class="wpb_single_image wpb_content_element vc_align_left   ezio-logo-carousel">
                                        <figure class="wpb_wrapper vc_figure">
                            <div class="vc_single_image-wrapper   vc_box_border_grey">
                            <img src="../Pic/<%=data.SMALLPIC %>" class="vc_single_image-img attachment-full" alt="<%=data.CATEGORYNAME %>" /></div>
                          </figure>

                                    </div>
                                </div>
                                <%} %>
                            </div>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">/*<![CDATA[*/jQuery(document).ready(function ($) { $('.ult-carousel-36534275657020f61d5be5').slick({ dots: false, autoplaySpeed: 5000, speed: 750, infinite: false, arrows: false, slidesToScroll: 6, slidesToShow: 6, swipe: true, draggable: true, touchMove: true, responsive: [{ breakpoint: 1025, settings: { slidesToShow: 6, slidesToScroll: 6, } }, { breakpoint: 769, settings: { slidesToShow: 3, slidesToScroll: 3 } }, { breakpoint: 481, settings: { slidesToShow: 2, slidesToScroll: 2 } }], pauseOnHover: true, pauseOnDotsHover: true, customPaging: function (slider, i) { return '<i type="button" style="color:#333333;" class="ultsl-record" data-role="none"></i>'; }, }); });/*]]>*/</script>

            </div>--%>

        <div class="wpb_column vc_column_container vc_col-sm-12" id="client-logo99">
            <div class="vc_column-inner ">
                <div class="wpb_wrapper">
                    <div id="ult-carousel-53812586757020f61d5c66" class="ult-carousel-wrapper ult_horizontal clients-logo-wrap" data-gutter="30" data-rtl="false">
                        <div class="ult-carousel-36534275657020f61d5be5">
                            <div class="ult-item-wrap" data-animation="animated no-animation">
                                <div class="wpb_single_image wpb_content_element vc_align_left   ezio-logo-carousel">
                                    <figure class="wpb_wrapper vc_figure">
                                        <div class="vc_single_image-wrapper   vc_box_border_grey">
                                            <img src="assets/images/client/brand2.png" class="vc_single_image-img attachment-full" alt="ezio_carousel_logo_w08" />
                                        </div>
                                    </figure>
                                </div>
                            </div>
                            <div class="ult-item-wrap" data-animation="animated no-animation">
                                <div class="wpb_single_image wpb_content_element vc_align_left   ezio-logo-carousel">
                                    <figure class="wpb_wrapper vc_figure">
                                        <div class="vc_single_image-wrapper   vc_box_border_grey">
                                            <img src="assets/images/client/brand8.png" class="vc_single_image-img attachment-full" alt="ezio_carousel_logo_w09" />
                                        </div>
                                    </figure>
                                </div>
                            </div>
                            <div class="ult-item-wrap" data-animation="animated no-animation">
                                <div class="wpb_single_image wpb_content_element vc_align_left   ezio-logo-carousel">
                                    <figure class="wpb_wrapper vc_figure">
                                        <div class="vc_single_image-wrapper   vc_box_border_grey">
                                            <img src="assets/images/client/brand3.png" class="vc_single_image-img attachment-full" alt="ezio_carousel_logo_w07" />
                                        </div>
                                    </figure>
                                </div>
                            </div>
                            <div class="ult-item-wrap" data-animation="animated no-animation">
                                <div class="wpb_single_image wpb_content_element vc_align_left   ezio-logo-carousel">
                                    <figure class="wpb_wrapper vc_figure">
                                        <div class="vc_single_image-wrapper   vc_box_border_grey">
                                            <img src="assets/images/client/brand1.png" class="vc_single_image-img attachment-full" alt="ezio_carousel_logo_w06" />
                                        </div>
                                    </figure>
                                </div>
                            </div>
                            <div class="ult-item-wrap" data-animation="animated no-animation">
                                <div class="wpb_single_image wpb_content_element vc_align_left   ezio-logo-carousel">
                                    <figure class="wpb_wrapper vc_figure">
                                        <div class="vc_single_image-wrapper   vc_box_border_grey">
                                            <img src="assets/images/client/brand5.png" class="vc_single_image-img attachment-full" alt="ezio_carousel_logo_w05" />
                                        </div>
                                    </figure>
                                </div>
                            </div>
                            <div class="ult-item-wrap" data-animation="animated no-animation">
                                <div class="wpb_single_image wpb_content_element vc_align_left   ezio-logo-carousel">
                                    <figure class="wpb_wrapper vc_figure">
                                        <div class="vc_single_image-wrapper   vc_box_border_grey">
                                            <img src="assets/images/client/brand6.png" class="vc_single_image-img attachment-full" alt="ezio_carousel_logo_w04" />
                                        </div>
                                    </figure>
                                </div>
                            </div>
                            <div class="ult-item-wrap" data-animation="animated no-animation">
                                <div class="wpb_single_image wpb_content_element vc_align_left   ezio-logo-carousel">
                                    <figure class="wpb_wrapper vc_figure">
                                        <div class="vc_single_image-wrapper   vc_box_border_grey">
                                            <img src="assets/images/client/brand7.png" class="vc_single_image-img attachment-full" alt="ezio_carousel_logo_w03" />
                                        </div>
                                    </figure>
                                </div>
                            </div>
                            <div class="ult-item-wrap" data-animation="animated no-animation">
                                <div class="wpb_single_image wpb_content_element vc_align_left   ezio-logo-carousel">
                                    <figure class="wpb_wrapper vc_figure">
                                        <div class="vc_single_image-wrapper   vc_box_border_grey">
                                            <img src="assets/images/client/brand11.png" class="vc_single_image-img attachment-full" alt="ezio_carousel_logo_w03" />
                                        </div>
                                    </figure>
                                </div>
                            </div>
                            <div class="ult-item-wrap" data-animation="animated no-animation">
                                <div class="wpb_single_image wpb_content_element vc_align_left   ezio-logo-carousel">
                                    <figure class="wpb_wrapper vc_figure">
                                        <div class="vc_single_image-wrapper   vc_box_border_grey">
                                            <img src="assets/images/client/brand4.png" class="vc_single_image-img attachment-full" alt="ezio_carousel_logo_w02" />
                                        </div>
                                    </figure>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">/*<![CDATA[*/jQuery(document).ready(function ($) { $('.ult-carousel-36534275657020f61d5be5').slick({ dots: false, autoplaySpeed: 5000, speed: 750, infinite: false, arrows: false, slidesToScroll: 6, slidesToShow: 6, swipe: true, draggable: true, touchMove: true, responsive: [{ breakpoint: 1025, settings: { slidesToShow: 6, slidesToScroll: 6, } }, { breakpoint: 769, settings: { slidesToShow: 3, slidesToScroll: 3 } }, { breakpoint: 481, settings: { slidesToShow: 2, slidesToScroll: 2 } }], pauseOnHover: true, pauseOnDotsHover: true, customPaging: function (slider, i) { return '<i type="button" style="color:#333333;" class="ultsl-record" data-role="none"></i>'; }, }); });/*]]>*/</script>

        </div>




    </div>

    <div class="vc_row-full-width vc_clearfix"></div>

    <div id="content-qube">
        <div class="width-container-qube">
            <div data-vc-full-width="true" data-vc-full-width-init="false" class="vc_row wpb_row vc_row-fluid vc_custom_1452256528061 vc_row-has-fill">
                <div class="wpb_column vc_column_container vc_col-sm-4 vc_col-has-fill">
                    <div class="vc_column-inner vc_custom_1452210159653">
                        <div class="wpb_wrapper">
                            <div class="ult-animation  ult-animate-viewport  ult-no-mobile " data-animate="fadeIn" data-animation-delay="0" data-animation-duration="2" data-animation-iteration="1" style="opacity: 0;" data-opacity_start_effect="">
                                <div class="vc_icon_element vc_icon_element-outer vc_icon_element-align-center">
                                    <div class="vc_icon_element-inner vc_icon_element-color-custom vc_icon_element-size-lg vc_icon_element-style- vc_icon_element-background-color-grey"><span class="vc_icon_element-icon fa fa-thumbs-o-up" style="color: #03b4ba !important"></span></div>
                                </div>
                                <h2 style="font-size: 21px; text-align: center" class="vc_custom_heading vc_custom_1452208896661">Fast Shipping</h2>
                                <p style="font-size: 15px; color: #6a7275; text-align: center" class="vc_custom_heading vc_custom_1452255573084">Order before 2:00PM PST M-F, we'll ship the same day.</p>
                            </div>
                            <div class="vc_separator wpb_content_element vc_separator_align_center vc_sep_width_100 vc_sep_dotted vc_sep_pos_align_center vc_separator_no_text vc_custom_1452209088407  vc_custom_1452209088407"><span class="vc_sep_holder vc_sep_holder_l"><span style="border-color: #e3e3e3;" class="vc_sep_line"></span></span><span class="vc_sep_holder vc_sep_holder_r"><span style="border-color: #e3e3e3;" class="vc_sep_line"></span></span></div>
                            <div class="ult-animation  ult-animate-viewport  ult-no-mobile " data-animate="fadeIn" data-animation-delay="0.9" data-animation-duration="2" data-animation-iteration="1" style="opacity: 0;" data-opacity_start_effect="">
                                <div class="vc_icon_element vc_icon_element-outer vc_icon_element-align-center">
                                    <div class="vc_icon_element-inner vc_icon_element-color-custom vc_icon_element-size-lg vc_icon_element-style- vc_icon_element-background-color-grey"><span class="vc_icon_element-icon fa fa-bookmark-o" style="color: #03b4ba !important"></span></div>
                                </div>
                                <h2 style="font-size: 21px; text-align: center" class="vc_custom_heading vc_custom_1452210257883">Brands You Trust</h2>
                                <p style="font-size: 15px; color: #6a7275; text-align: center" class="vc_custom_heading vc_custom_1452255573084">Legendary brand names like UZI, Humvee and Smith & Wesson.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="wpb_column vc_column_container vc_col-sm-4 vc_col-has-fill">
                    <div class="vc_column-inner vc_custom_1452208948452">
                        <div class="wpb_wrapper">
                            <div class="ult-animation  ult-animate-viewport  ult-no-mobile " data-animate="fadeIn" data-animation-delay="0.3" data-animation-duration="2" data-animation-iteration="1" style="opacity: 0;" data-opacity_start_effect="">
                                <div class="vc_icon_element vc_icon_element-outer vc_icon_element-align-center">
                                    <div class="vc_icon_element-inner vc_icon_element-color-custom vc_icon_element-size-lg vc_icon_element-style- vc_icon_element-background-color-grey"><span class="vc_icon_element-icon fa fa-bullhorn" style="color: #03b4ba !important"></span></div>
                                </div>
                                <h2 style="font-size: 21px; text-align: center" class="vc_custom_heading vc_custom_1452210235315">1-Year Warranty</h2>
                                <p style="font-size: 15px; color: #6a7275; text-align: center" class="vc_custom_heading vc_custom_1452255573084">Most of our products come with a full year comprehensive warranty.</p>
                            </div>
                            <div class="vc_separator wpb_content_element vc_separator_align_center vc_sep_width_100 vc_sep_dotted vc_sep_pos_align_center vc_separator_no_text vc_custom_1452209088407  vc_custom_1452209088407"><span class="vc_sep_holder vc_sep_holder_l"><span style="border-color: #e3e3e3;" class="vc_sep_line"></span></span><span class="vc_sep_holder vc_sep_holder_r"><span style="border-color: #e3e3e3;" class="vc_sep_line"></span></span></div>
                            <div class="ult-animation  ult-animate-viewport  ult-no-mobile " data-animate="fadeIn" data-animation-delay="1.2" data-animation-duration="2" data-animation-iteration="1" style="opacity: 0;" data-opacity_start_effect="">
                                <div class="vc_icon_element vc_icon_element-outer vc_icon_element-align-center">
                                    <div class="vc_icon_element-inner vc_icon_element-color-custom vc_icon_element-size-lg vc_icon_element-style- vc_icon_element-background-color-grey"><span class="vc_icon_element-icon fa fa-smile-o" style="color: #03b4ba !important"></span></div>
                                </div>
                                <h2 style="font-size: 21px; text-align: center" class="vc_custom_heading vc_custom_1452210317940">Customer Service</h2>
                                <p style="font-size: 15px; color: #6a7275; text-align: center" class="vc_custom_heading vc_custom_1452255573084">We are eager to help you, call or email us anytime.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="wpb_column vc_column_container vc_col-sm-4">
                    <div class="vc_column-inner vc_custom_1452208635476">
                        <div class="wpb_wrapper">
                            <div class="ult-animation  ult-animate-viewport  ult-no-mobile " data-animate="fadeIn" data-animation-delay="0.6" data-animation-duration="2" data-animation-iteration="1" style="opacity: 0;" data-opacity_start_effect="">
                                <div class="vc_icon_element vc_icon_element-outer vc_icon_element-align-center">
                                    <div class="vc_icon_element-inner vc_icon_element-color-custom vc_icon_element-size-lg vc_icon_element-style- vc_icon_element-background-color-grey"><span class="vc_icon_element-icon fa fa-cubes" style="color: #03b4ba !important"></span></div>
                                </div>
                                <h2 style="font-size: 21px; text-align: center" class="vc_custom_heading vc_custom_1452210004102">No Middleman</h2>
                                <p style="font-size: 15px; color: #6a7275; text-align: center" class="vc_custom_heading vc_custom_1452255573084">We manufacture all our own products, so you're buying direct.</p>
                            </div>
                            <div class="vc_separator wpb_content_element vc_separator_align_center vc_sep_width_100 vc_sep_dotted vc_sep_pos_align_center vc_separator_no_text vc_custom_1452209088407  vc_custom_1452209088407"><span class="vc_sep_holder vc_sep_holder_l"><span style="border-color: #e3e3e3;" class="vc_sep_line"></span></span><span class="vc_sep_holder vc_sep_holder_r"><span style="border-color: #e3e3e3;" class="vc_sep_line"></span></span></div>
                            <div class="ult-animation  ult-animate-viewport  ult-no-mobile " data-animate="fadeIn" data-animation-delay="1.5" data-animation-duration="2" data-animation-iteration="1" style="opacity: 0;" data-opacity_start_effect="">
                                <div class="vc_icon_element vc_icon_element-outer vc_icon_element-align-center">
                                    <div class="vc_icon_element-inner vc_icon_element-color-custom vc_icon_element-size-lg vc_icon_element-style- vc_icon_element-background-color-grey"><span class="vc_icon_element-icon fa fa-paper-plane-o" style="color: #03b4ba !important"></span></div>
                                </div>
                                <h2 style="font-size: 21px; text-align: center" class="vc_custom_heading vc_custom_1452210441299">Safe and Secure</h2>
                                <p style="font-size: 15px; color: #6a7275; text-align: center" class="vc_custom_heading vc_custom_1452255573084">We make sure your information is safe so you don't have to worry.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="vc_row-full-width vc_clearfix"></div>

    <div id="content-qube">
        <div class="width-container-qube">
            <div data-vc-full-width="true" data-vc-full-width-init="false" class="vc_row wpb_row vc_row-fluid ">
                <div class="wpb_column vc_column_container vc_col-sm-12">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">
                            <a href="ProductList.aspx?param=1<%=Request.QueryString["CatId"] != null ? "&CatId=" + Request.QueryString["CatId"].ToString() : ""%>">
                                <h2 style="font-size: 12px; color: #03b4ba; text-align: center; font-family: Montserrat; font-weight: 400; font-style: norma; text-transform: uppercase;" class="vc_custom_heading ezio-minimal-subtitle-01">NEW PRODUCTS</h2>
                            </a>
                            <h2 style="font-size: 30px; color: #000000; text-align: center; font-family: Playfair Display; font-weight: 400; font-style: normal; text-transform: uppercase;" class="vc_custom_heading">Be a Trendsetter</h2>
                            <div class="vc_separator wpb_content_element vc_separator_align_center vc_sep_width_10 vc_sep_border_width_2 vc_sep_pos_align_center vc_separator_no_text vc_sep_color_grey vc_custom_1452000770812  vc_custom_1452000770812"><span class="vc_sep_holder vc_sep_holder_l"><span class="vc_sep_line"></span></span><span class="vc_sep_holder vc_sep_holder_r"><span class="vc_sep_line"></span></span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="vc_row-full-width vc_clearfix"></div>

    <div id="">
        <div class="">
            <div data-vc-full-width="true" data-vc-full-width-init="false" data-vc-stretch-content="true" class="vc_row wpb_row vc_row-fluid vc_row-no-padding">
                <div class="wpb_column vc_column_container vc_col-sm-12">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">
                            <div class="">
                                <div class="woocommerce" style="margin-left: -0px; margin-right: -0px;">
                                    <div id="shop-slick-carousel-pro-6" class="slick-carousel-pro shop-carousel6">
                                        <%--<div>--%>
                                        <%--<%foreach (var item in ProductSecList)
                                                            { %>
                                                        <div class="slick-carousel-item-pro" style="padding-left: 0px; padding-right: 0px;">
                                                            <div class="first post-4494 product type-product status-publish has-post-thumbnail product_cat-accessories product_tag-accessories product_tag-jewelry product_tag-women shipping-taxable purchasable product-type-simple product-cat-accessories product-tag-accessories product-tag-jewelry product-tag-women instock">
                                                                <div class="shop-container-pro hover-shop-layout">
                                                                    <a href="productdetail.aspx?prod_cd=<%=item.PROD_CD %>">
                                                                        <div class="overlay-container-shop-pro">
                                                                            <a href="productdetail.aspx?prod_cd=<%=item.PROD_CD %>">
                                                                                <img src="../Pic/<%=item.LARGEPIC %>" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="ezio_shop_product_06" srcset="../Pic/<%=item.MEDIUMPIC %>" />
                                                                            </a>
                                                                            <div class="add-to-cart-overlay"><a href="productDetail.aspx?prod_cd=<%=item.PROD_CD %>" data-rel="" class="shop-perma-icon"><i class="fa fa-eye"></i></a><a href="javascript:void(0);" onclick="AddToCart<%="('"+item.PROD_CD.Trim() +"')"%>;" name="addtocart" class="shop-perma-icon right-perma-icon v"><i class="icon-cart"></i></a></div>
                                                                        </div>
                                                                        <a href="productdetail.aspx?prod_cd=<%=item.PROD_CD %>">
                                                                            <div class="shop-overlay-content">
                                                                                <div class="shop-overlay-centered">
                                                                                    <h6 class="shop-title-index"><%=item.PROD_CD%></h6>
                                                                                    <ul class="shop-tax-pro">
                                                                                        <%--        <li>Accessories<span>&middot;</span></li>-%>
                                                                                    </ul>
                                                                                    <span class="price"><span class="amount">&#36;<%=item.RETAIL_PRS %></span></span>
                                                                                    <%if ((HttpContext.Current.Session["customerType"] != null ? HttpContext.Current.Session["customerType"].ToString() : "") == "3")
                                                                                        { %>
                                                                                    <span class="price"><span class="amount">Dealer Price :&#36;<%=item.WHOLE_PRS %></span></span>
                                                                                    <%if (item.WHOLE_PRS != item.FinalPrice)
                                                                                        { %>
                                                                                    <span class="price"><span class="amount">Special Price :&#36;<%=item.FinalPrice %></span></span>
                                                                                    <%} %>
                                                                                    <%} %>
                                                                                </div>
                                                                            </div>
                                                                        </a>
                                                                        <div class="add-to-cart-base-index">
                                                                    </a><a rel="nofollow" href="index236e.html?add-to-cart=4494" data-quantity="1" data-product_id="4494" data-product_sku="1001" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                                                                    <div class="clearfix-qube-ezio"></div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <%} %>--%>
                                        <% if (ProductSecList.Count <= 5)
                                            {
                                                for (int i = 0; i < ProductSecList.Count; i++)
                                                {
                                                    var item = ProductSecList[i];%>
                                        <div class="slick-carousel-item-pro" style="padding-left: 0px; padding-right: 0px;">
                                            <div class="first post-4494 product type-product status-publish has-post-thumbnail product_cat-accessories product_tag-accessories product_tag-jewelry product_tag-women shipping-taxable purchasable product-type-simple product-cat-accessories product-tag-accessories product-tag-jewelry product-tag-women instock">
                                                <div class="shop-container-pro hover-shop-layout">
                                                    <a href="index.aspx?prod_cd=<%=item.PROD_CD %>">
                                                        <div class="overlay-container-shop-pro">
                                                            <a href="">
                                                                <img src="<%=item.LARGEPIC %>" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="ezio_shop_product_06" srcset="<%=item.LARGEPIC %>" />
                                                            </a>
                                                            <div class="add-to-cart-overlay"><a href="productDetail.aspx?prod_cd=<%=item.PROD_CD %>" data-rel="" class="shop-perma-icon"><i class="fa fa-eye"></i></a><a href="javascript:void(0);" onclick="AddToCart<%="('" + item.PROD_CD.Trim() + "')"%>;" name="addtocart" class="shop-perma-icon right-perma-icon v"><i class="icon-cart"></i></a></div>
                                                        </div>
                                                        <a class="" href="productdetail.aspx?prod_cd=<%=item.PROD_CD %>">
                                                            <div class="shop-overlay-content">
                                                                <div class="shop-overlay-centered">
                                                                    <h6 class="shop-title-index"><%=item.PROD_CD %></h6>
                                                                    <ul class="shop-tax-pro">
                                                                        <%--<li>(code UZI-TACPEN1-BK)<span>&middot;</span></li>--%>
                                                                    </ul>
                                                                    <%--<span class="price"><span class="amount">&#36;<%=item.RETAIL_PRS %></span></span>--%>
                                                                    <%if ((HttpContext.Current.Session["customerType"] != null ? HttpContext.Current.Session["customerType"].ToString() : "") == "3")
                                                                        { %>
                                                                    <span class="price"><span class="amount">Retail: &#36;<%=item.RETAIL_PRS %></span></span>
                                                                    <span class="price"><span class="amount">Dealer: &#36;<%=item.WHOLE_PRS %></span></span>
                                                                    <%if (item.WHOLE_PRS != item.FinalPrice && item.FinalPrice != 0)
                                                                        { %>
                                                                    <span class="price"><span class="amount">Special: &#36;<%=item.FinalPrice %></span></span>
                                                                    <%} %>
                                                                    <%}
                                                                           else
                                                                           {%><span class="price"><span class="amount">&#36;<%=item.RETAIL_PRS %></span></span><% } %>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="add-to-cart-base-index">
                                                    </a><a rel="nofollow" href="" data-quantity="1" data-product_id="4494" data-product_sku="1001" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                                                    <div class="clearfix-qube-ezio"></div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <%}
                                        }%>
                                </div>
                            </div>
                            <div class="clearfix-qube-ezio"></div>
                        </div>

                        <script type="text/javascript">jQuery(document).ready(function ($) { 'use strict'; $('#shop-slick-carousel-pro-6').slick({ lazyLoad: 'ondemand', dots: true, arrows: false, infinite: true, slidesToShow: 5, slidesToScroll: 5, responsive: [{ breakpoint: 1050, settings: { slidesToShow: 3, slidesToScroll: 3 } }, { breakpoint: 767, settings: { slidesToShow: 1, slidesToScroll: 1 } }], autoplay: true, autoplaySpeed: 10000, speed: 750, useCSS: false }); });</script>

                        <div class="seemore"><a href="ProductList.aspx?param=1<%=Request.QueryString["CatId"] != null ? "&CatId=" + Request.QueryString["CatId"].ToString() : ""%>" class="seemorebtn">See More</a></div>
                        <div class="clearfix-qube-ezio"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

                <div class="vc_row-full-width vc_clearfix"></div>


    <div class="upb_color" data-bg-override="0" data-bg-color="#ffffff" data-fadeout="" data-fadeout-percentage="30" data-parallax-content="" data-parallax-content-sense="30" data-row-effect-mobile-disable="true" data-img-parallax-mobile-disable="true" data-rtl="false" data-custom-vc-row="" data-vc="4.11.1" data-is_old_vc="" data-theme-support="" data-overlay="false" data-overlay-color="" data-overlay-pattern="" data-overlay-pattern-opacity="" data-overlay-pattern-size="" data-hide-row=" uvc_hidden-md  uvc_hidden-sm  uvc_hidden-xs  uvc_hidden-xsl "></div>


    <div class="vc_row-full-width vc_clearfix"></div>

    </div>
            </div>
           
            <div class="vc_row-full-width vc_clearfix"></div>

    <div class="client-logo-wrap">
        <div data-vc-full-width="true" data-vc-full-width-init="false" class="wpb_row vc_row-fluid  vc_row-has-fill">
            <div class="wpb_column vc_column_container vc_col-sm-12">
                <div class="vc_column-inner ">
                    <div class="wpb_wrapper">
                        <div id="Div23" class="ult_horizontal clients-logo2 client-logo3" data-gutter="30" data-rtl="false">
                            <div class="ult-carousel-36534275657020f61d5be5 ">
                                <% foreach (var data in brandList)
                                    {
                                        if (data.CATEGORYID != 59)
                                        {%>
                                <div class="ult-item-wrap" data-animation="animated no-animation">
                                    <div class="wpb_single_image wpb_content_element vc_align_center   ezio-logo-carousel">

                                        <figure class="wpb_wrapper vc_figure">
                                            <div class="vc_single_image-wrapper   vc_box_border_grey">
                                                <a href="index.aspx?CatId=<%=data != null ? data.CATEGORYID : 1 %>">
                                                    <%-- <img src="assets/images/client/b1.png" class="vc_single_image-img attachment-full" alt="ezio_carousel_logo_w08" /> --%>
                                                    <img src="../Pic/<%=data.MEDIUMPIC %>" class="vc_single_image-img attachment-full" alt="<%=data.CATEGORYNAME %>" />
                                                </a>
                                            </div>
                                        </figure>
                                    </div>
                                </div>

                                <%}
    }

                                %>
                            </div>
                        </div>
                        <script type="text/javascript">/*<![CDATA[*/jQuery(document).ready(function ($) { $('.ult-carousel-36534275657020f61d5be5').slick({ dots: false, autoplaySpeed: 5000, speed: 750, infinite: false, arrows: false, slidesToScroll: 6, slidesToShow: 6, swipe: true, draggable: true, touchMove: true, responsive: [{ breakpoint: 1025, settings: { slidesToShow: 6, slidesToScroll: 6, } }, { breakpoint: 769, settings: { slidesToShow: 3, slidesToScroll: 3 } }, { breakpoint: 481, settings: { slidesToShow: 2, slidesToScroll: 2 } }], pauseOnHover: true, pauseOnDotsHover: true, customPaging: function (slider, i) { return '<i type="button" style="color:#333333;" class="ultsl-record" data-role="none"></i>'; }, }); });/*]]>*/</script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="vc_row-full-width vc_clearfix"></div>

    <div id="bottom-slider" class="flexslider">

        <ul class="slides">
            <%if (BrandFooterBanner != null)
    {
        foreach (var data in BrandFooterBanner)
        {
            if (data.CategoryId != "0")
            {%>
            <li>
                <a href="ProductList.aspx?CatId=11">
                    <img src="../AdminPanel/Images/<%=data.Banner_Path %>" /></a>
            </li>
            <%}
    else
    { %>

            <li>
                <img src="assets/images/banner/L1.jpg" />
            </li>
            <li>
                <img src="assets/images/banner/L2.jpg" />
            </li>
            <li>
                <img src="assets/images/banner/L3.jpg" />
            </li>
            <li>
                <img src="assets/images/banner/L4.jpg" />
            </li>
            <li>
                <img src="assets/images/banner/L5.jpg" />
            </li>
            <%}
                    }
                }
                else {
                }%>

            <%if (catid == 1) {%>
                    <%for (int i = 1; i <= 5; i++)
                        { %>
                    <li>
                        <img src="assets/images/banner/humvee/L_0<%=i %>.jpg" />
                    </li>
                    <%} %>
                    <% } else if (catid == 20) { %>
                   <%for (int i = 1; i <= 3; i++)
                        { %>
                    <li>
                        <img src="assets/images/banner/uzi/L_0<%=i %>.jpg" />
                    </li>
                    <%} %>
                    <%} else if (catid == 37) {%>
                    <%for (int i = 1; i <= 3; i++)
                        { %>
                    <li>
                        <img src="assets/images/banner/smith/L_0<%=i %>.jpg" />
                    </li>
                    <%} %>
                    <% } else if (catid == 50) { %>
                    <%for (int i = 1; i <= 3; i++)
                        { %>
                    <li>
                        <img src="assets/images/banner/swiss/L_0<%=i %>.jpg" />
                    </li>
                    <%} %>
                    <%} else if (catid == 51) {%>
                    <%for (int i = 1; i <= 4; i++)
                        { %>
                    <li>
                        <img src="assets/images/banner/caliber/L_0<%=i %>.jpg" />
                    </li>
                    <%} %>
                    <% }else { %>
                    
                    <li>
                        <img src="assets/images/banner/L1.jpg" />
                    </li>
                     <li>
                        <img src="assets/images/banner/L2.jpg" />
                    </li>
                    <li>
                        <img src="assets/images/banner/L3.jpg" />
                    </li>
                    <li>
                        <img src="assets/images/banner/L4.jpg" />
                    </li>
                     <li>
                        <img src="assets/images/banner/L5.jpg" />
                    </li>
                    <%}%>
        </ul>


        <%--<ul class="slides">
                    <%if (catid == 1) {%>
                    <%for (int i = 1; i <= 5; i++)
                        { %>
                    <li>
                        <img src="assets/images/banner/humvee/L_0<%=i %>.jpg" />
                    </li>
                    <%} %>
                    <% } else if (catid == 20) { %>
                   <%for (int i = 1; i <= 3; i++)
                        { %>
                    <li>
                        <img src="assets/images/banner/uzi/L_0<%=i %>.jpg" />
                    </li>
                    <%} %>
                    <%} else if (catid == 37) {%>
                    <%for (int i = 1; i <= 3; i++)
                        { %>
                    <li>
                        <img src="assets/images/banner/smith/L_0<%=i %>.jpg" />
                    </li>
                    <%} %>
                    <% } else if (catid == 50) { %>
                    <%for (int i = 1; i <= 3; i++)
                        { %>
                    <li>
                        <img src="assets/images/banner/swiss/L_0<%=i %>.jpg" />
                    </li>
                    <%} %>
                    <%} else if (catid == 51) {%>
                    <%for (int i = 1; i <= 4; i++)
                        { %>
                    <li>
                        <img src="assets/images/banner/caliber/L_0<%=i %>.jpg" />
                    </li>
                    <%} %>
                    <% }else { %>
                    
                    <li>
                        <img src="assets/images/banner/L1.jpg" />
                    </li>
                     <li>
                        <img src="assets/images/banner/L2.jpg" />
                    </li>
                    <li>
                        <img src="assets/images/banner/L3.jpg" />
                    </li>
                    <li>
                        <img src="assets/images/banner/L4.jpg" />
                    </li>
                     <li>
                        <img src="assets/images/banner/L5.jpg" />
                    </li>
                    <%}%>
                </ul>--%>
    </div>

    </div>
</div>


    <!--
<script>jQuery(document).ready(function(){jQuery(".view-catalog").click(function(){jQuery(".catalog").toggle(); });});</script>
-->
    <div id="joinnewsletter" style="display: none;">
        <div id="fancybox-wrap">
            <div id="fancybox-outer">
                <div id="fancybox-content">
                    <div>
                        <div class="container_n">
                            <form id="newsletter_signup" name="newsletter_signup">
                                <div id="newsletter_signup">
                                    <input name="action" id="action" value="newsletter_signup" type="hidden">
                                    <div class="header">
                                        <div class="AjaxLoader">
                                            <img src="">Please wait...
                                        </div>
                                        <div id="myerror_msg" class="myerror_msg"></div>
                                        <div id="mysuccess_msg" class="mysuccess_msg"></div>
                                        <h5>Sign up with your name and email to get latest updates.</h5>
                                    </div>
                                    <div class="sep"></div>

                                    <div>

                                        <input class="textfield" id="yourname" onblur="restoreInput(this,'Name')" onfocus="return clearInput(this,'Name');" placeholder="Name" name="name" type="text">


                                        <div style="clear: both"></div>
                                        <div class="errorinput"></div>
                                        <input class="textfield" onblur="restoreInput(this,'Email')" onfocus="return clearInput(this,'Email');" placeholder="Email" name="youremail" id="email" type="email">

                                        <div style="clear: both"></div>
                                        <div class="errorinput"></div>

                                        <div class="seemore">
                                            <a id="submit_newsletter" href="#" name="submit_newsletter" class="newsletterpopup" style="background-color: #03b4ba; color: white; width: auto !important; font-weight: 600; text-transform: uppercase; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; letter-spacing: 0.5px; padding: 10px 40px; display: inline-block; font-size: 13px; border: none; -webkit-border-radius: 2px; -moz-border-radius: 2px; border-radius: 2px; margin: 0px; cursor: pointer;">Subscribe</a>
                                        </div>


                                        </script>
                                    </div>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">jQuery(document).ready(function ($) { 'use strict'; $("#sidebar-fixed-qube").sticky({}); $(".add-to-cart-overlay a[data-rel^='prettyPhoto'], .portfolio-column-1-pro a[data-rel^='prettyPhoto'], .featured-blog-pro a[data-rel^='prettyPhoto'], .pro-media-image a[data-rel^='prettyPhoto'], .images a[data-rel^='prettyPhoto'], .portfolio-container-pro a[data-rel^='prettyPhoto']").prettyPhoto({ hook: 'data-rel', animation_speed: 'fast', slideshow: 5000, show_title: false, deeplinking: false, overlay_gallery: false, custom_markup: '', default_width: 900, default_height: 506, social_tools: '' }); jQuery('nav#site-navigation ul.sf-menu').superfish({ popUpSelector: 'ul.sub-menu,.sf-mega', delay: 400, speed: 200, speedOut: 200, animation: { opacity: 'show' }, animationOut: { opacity: 'hide' }, cssArrows: true, autoArrows: true }); jQuery('#header-top-qube ul.sf-menu').superfish({ popUpSelector: 'ul.sub-menu,.sf-mega', delay: 400, speed: 200, speedOut: 200, animation: { opacity: 'show' }, animationOut: { opacity: 'hide' }, cssArrows: true, autoArrows: true }); });</script>


    <script type="text/javascript">
        jQuery(window).load(function () {
            jQuery('#home-slider').flexslider({
                animation: "fade",
                slideshowSpeed: 10000,
                slideshow: true
            });
            jQuery('#bottom-slider').flexslider({
                animation: "fade",
                slideshow: true
            });

        });

    </script>

    <!-- Revolution slider -->
    <%--  <script type="text/javascript">

                jQuery(document).ready(function () {

                    jQuery('.tp-banner').show().revolution(
                    {
                        dottedOverlay: "none",
                        delay: 10000,
                        startwidth: 960,
                        startheight: 700,
                        hideThumbs: 200,

                        thumbWidth: 100,
                        thumbHeight: 50,
                        thumbAmount: 3,

                        navigationType: "bullet",
                        soloArrowLeftHOffset: 50,
                        soloArrowRightHOffset: 50,

                        touchenabled: "on",
                        onHoverStop: "off",

                        swipe_velocity: 0.7,
                        swipe_min_touches: 1,
                        swipe_max_touches: 1,
                        drag_block_vertical: false,

                        parallax: "mouse",
                        parallaxBgFreeze: "on",
                        parallaxLevels: [7, 4, 3, 2, 5, 4, 3, 2, 1, 0],

                        keyboardNavigation: "off",

                        navigationHAlign: "center",
                        navigationVAlign: "bottom",
                        navigationHOffset: 0,
                        navigationVOffset: 120,

                        shadow: 0,
                        fullWidth: "off",
                        fullScreen: "on",

                        spinner: "spinner4",

                        stopLoop: "off",
                        stopAfterLoops: -1,
                        stopAtSlide: -1,

                        shuffle: "off",

                        autoHeight: "off",
                        forceFullWidth: "off",



                        hideThumbsOnMobile: "off",
                        hideNavDelayOnMobile: 1500,
                        hideBulletsOnMobile: "off",
                        hideArrowsOnMobile: "off",
                        hideThumbsUnderResolution: 0,

                        hideSliderAtLimit: 0,
                        hideCaptionAtLimit: 0,
                        hideAllCaptionAtLilmit: 0,
                        startWithSlide: 0,
                        fullScreenOffsetContainer: ".header"
                    });

                }); 

            </script>--%>

    <%--<script type='text/javascript' src='assets/js/jquery.form.min.js'></script>
            <script type='text/javascript' src='assets/js/scripts.js'></script>
            <script type='text/javascript' src='assets/js/dot_irecommendthis.js'></script>
            <script type='text/javascript' src='assets/js/jquery.blockUI.min.js'></script>
            <script type='text/javascript' src='assets/js/woocommerce.min.js'></script>
            <script type='text/javascript' src='assets/js/woocommerce.min.js'></script>
            <script type='text/javascript' src='assets/js/jquery.cookie.min.js'></script>
            <script type='text/javascript' src='assets/js/cart-fragments.min.js'></script>
            <script type='text/javascript' src='assets/js/script.js'></script>
            <script type='text/javascript' src='assets/js/plugin.js'></script>

            <script type='text/javascript' src='assets/js/wp-embed.min.js'></script>
            <script type='text/javascript' src='assets/js/js_composer_front.min.js'></script>
            <script type='text/javascript' src='assets/js/widgets.js'></script>

            <script type='text/javascript' src='assets/js/jquery.fancybox.pack.js'></script>
            <script type='text/javascript' src='assets/js/subscription-popup.js'></script>--%>

    <%--<script type='text/javascript' src='assets/js/jquery.fancybox.pack.js'></script>
            <script type="text/javascript">
                jQuery(document).ready(function () {
               <% 
               // var x = HttpContext.Current.Session["news"];
               // if (HttpContext.Current.Session["news"] == null)
              //  {
               //     HttpContext.Current.Session["news"] = true;%>
                 //   jQuery.fancybox("#joinnewsletter");
                    <%//}%>
                });



            </script>--%>

    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

