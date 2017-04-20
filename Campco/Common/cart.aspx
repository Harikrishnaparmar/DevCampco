<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Campco.Common.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%-- <script type="text/javascript">
        window.onload = window.history.forward(1);
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    &nbsp;<div class="page page-id-85 page-template-default dark-lightbox-pro wpb-js-composer js-comp-ver-4.11.1 vc_responsive">
        <div id="boxed-layout-qube">
            <div id="header-top-qube" class="header-top-container-pro">
                <div class="width-container-qube">


                    <div class="clearfix-qube-ezio"></div>
                </div>
            </div>
            <div class="clearfix-qube-ezio"></div>


            <div id="page-title-qube" class="page-title-qube default-page-title">
                <div class="width-container-qube fade-header-qube">
                    <div class="page-tite-left-qube">
                        <h1 class="entry-title-qube-ezio">Cart</h1>
                    </div>
                    <%--<div id="sharecrumb-qube-container">
                        <a href="#" class="dot-irecommendthis" id="dot-irecommendthis-108" title="Recommend this"><span class="dot-irecommendthis-count">0</span> <span class="dot-irecommendthis-suffix"></span></a>
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
                    <%--<div class="wc-proceed-to-checkout"> <a href="CheckOut.aspx" class="checkout-button button alt wc-forward"> Proceed to Checkout</a> </div>
                    <div class="clearfix-qube-ezio"></div>--%>
                </div>
                
            </div>
            <!-- #page-title-qube -->
            <div class="width-container-qube">
                <div class="wc-proceed-to-checkout" style="padding-top: 12px;right: 0;float: right;position: relative;"> 
                    <a href="CheckOut.aspx" class="checkout-button button alt wc-forward"> Proceed to Checkout</a> 
                </div>
            </div>
                    <div class="clearfix-qube-ezio"></div>
            <div id="content-qube">
                <div class="width-container-qube">
                    <article id="post-108" class="post-108 page type-page status-publish hentry">
                        
      <div class="page-content-pro">
        <div class="woocommerce">

          <div class="shop_table_outer">
          <form action="" method="post">
            <table class="shop_table shop_table_responsive cart" id="tblPets" cellspacing="0" rules="all">
                <div class="Loader_center"></div>
              <thead>
                <tr>
                  <th class="product-remove">&nbsp;</th>
                  <th class="product-thumbnail">&nbsp;</th>
                  <th class="product-name">Product</th>
                  <th class="product-price">Price</th>
                  <th class="product-quantity">Quantity</th>
                  <th class="product-subtotal">Total</th>
                </tr>
              </thead>
              <tbody>
                  <%if (Cart_Products != null)
                      {%>
                  <%foreach (var item in Cart_Products)
                      {%>
                <tr class="cart_item">
                  <td class="product-remove">
                      <a href="cart.aspx?prod_cd=<%=item.PROD_CD %>" class="remove"  title="Remove this item" data-product_id="1621" data-product_sku="1001">&times;</a>
                      
                  </td>
                  <td class="product-thumbnail"><a href="productDetail.aspx?prod_cd=<%=item.PROD_CD %>"><img width="180" height="180" src="<%=item.SMALLPIC%>" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="4_wm15201502" sizes="(max-width: 180px) 100vw, 180px" /></a></td>
                  <td class="product-name" data-title="Product"><a href="productDetail.aspx?prod_cd=<%=item.PROD_CD %>"><%=item.PROD_CD %></a></td>
                  <td class="product-price" data-title="Price"><span class="amount">&#36;<%= Convert.ToDouble(item.RETAIL_PRS).ToString("0.00") %></span></td>
                  <td class="product-quantity" data-title="Quantity"><div class="quantity">
                      <input id="<%=item.PROD_CD %>" type="number" step="1" min="1" name="qty" value="<%=item.QTYinCart %>" title="Qty" class="input-text qty text" size="4" />
                     
                    </div></td>
                  <td class="product-subtotal" data-title="Total"><span class="amount">&#36;<%=Convert.ToDouble(item.RETAIL_PRS * item.QTYinCart).ToString("0.00") %></span></td>
                    <%--<td class="" ><input type="submit" class="button" name="update_cart" value="Update Cart" /></td>--%>
                </tr> 
                  
                  <%}
                      }
                      else
                      {%>
                  <tr >
                      <td colspan="7">No Item(s) in Cart.</td>

                  </tr>
                  <%} %>
                  
                <tr id="cccrrr">
                  <td colspan="7" class="actions">
                      <%if (Convert.ToInt32(HttpContext.Current.Session["customerType"]) == 1 )
                          {%>
                      
                      <%--<div class="coupon">
                      <label for="coupon_code">Coupon:</label>
                      <input type="text" name="coupon_code" class="input-text" id="coupon_code" value="" placeholder="Coupon code" />
                      <input type="submit" class="button" name="apply_coupon" value="Apply Coupon" />
                    </div>--%>
                      <%--<div class="shippingCharge">
                     <fieldset>                   
                      <input id="ham" type="checkbox" name="shippingCharge" value="ham"/><label for="ham">International Order</label>
                    </fieldset>
                    </div>--%>
                      <%}
                          else if(Convert.ToInt32(HttpContext.Current.Session["customerType"])==3)
                          { 
                      %>
                      <div class="dropshipcheck">
                    <fieldset>                   
                      <input id="ham" type="checkbox" name="drop" value="ham"/><label for="ham">Dropship Order</label>
                    </fieldset>
                    </div>
                      <%  } %>
                    <%--<input type="submit" class="button" name="update_cart" value="Update Cart" />--%>
                      <%if (Convert.ToInt32(HttpContext.Current.Session["customerType"]) == 3)
                          { %>
                      <input type="Button" onClick="AddBefore('cccrrr');" class="button" name="update_cart" value="Add Product by SKU" /> 
                      <%} %>
                      <asp:Button ID="Button1" class="button" runat="server" Text="update cart" OnClick="Button1_Click"></asp:Button>
                    <%--<input type="Button" onClick="AddBefore('cccrrr');" class="button" name="update_cart" value="SKU" />  --%>
                      <asp:button ID="btn_contiSopping" class="button" runat="server" Text="Continue Shopping" OnClick="btn_contiSopping_Click"> </asp:button>     

                    <input type="hidden" id="_wpnonce" name="_wpnonce" value="7eb70fe788" />
                    <input type="hidden" name="_wp_http_referer" value="/demo/ezio-modern-shop/cart/" />
                    
                    <%--<div class="dropshipcheck">
                    <fieldset>                   
                      <input id="ham" type="checkbox" name="drop" value="ham"/><label for="ham">3$ Cost</label>
                    </fieldset>
                    </div>--%>

                    </td>
                </tr>

              </tbody>
            </table>

          </form>
          </div>

          <div class="cart-collaterals">
            <div class="cart_totals ">
              <h2>Cart Totals</h2>
              <table cellspacing="0" class="shop_table shop_table_responsive">
                <tr class="cart-subtotal">
                  <th>Subtotal</th>
                  <td data-title="Subtotal"><span class="amount">&#36;<span class="subtotal"><%=Convert.ToDouble(totalAmount).ToString("00.00") %></span></span></td>
                </tr>
                  
                  <tr class="cart-subtotal dropship">
                  <th>Dropship Fee</th>
                  <td data-title="Subtotal"><span class="amount">&#36;3.00</span></td>
                </tr>
                  <%--<%if (Convert.ToInt32(HttpContext.Current.Session["CustomerType"]) == 1)
                      {%>
                  <tr class="cart-subtotal ShippingCharge">
                  <th>Shipping Charge</th>
                  <td data-title="Subtotal"><span class="amount">&#36;<span class="shipamnt"><%=shipCharge%></span></span></td>
                </tr>
                  <%} %>--%>
                <tr class="order-total">
                  <th>Total</th>
                  <td data-title="Total"><strong><span class="amount">&#36;<span class="grandtotal"><%=Convert.ToDouble(totalAmount+Convert.ToDouble(HttpContext.Current.Session["drop"])).ToString("00.00")%></span></span></strong></td>
                </tr>
              </table>
              <div class="checkoutButton"> <a href="CheckOut.aspx" class="checkout-button button alt wc-forward"> Proceed to Checkout</a> </div>
            </div>
          </div>
        </div>
      </div>
      <!-- .entry-content --> 
      
    </article>
                    <!-- #post-## -->

                </div>
                <!-- close .width-container-qube -->
                
            </div>
            <!-- #content-qube -->


            <script type="text/javascript">
                jQuery(document).ready(function ($) {
                    jQuery('.Loader_center').hide();
                    'use strict';
                    window.onload = window.history.forward(0);
                    var cartCount=jQuery('span#count').text();
                    if(cartCount==0)
                    {
                        jQuery('a.checkout-button').hide();
                    }
                    else
                    {
                        jQuery('a.checkout-button').show();
                    }
                    $('tr.dropship').hide();
                    
                   // $('tr.shippingCharge').hide();
                    var x = $('input[name=drop]:checked')
                    if(<%=HttpContext.Current.Session["drop"].ToString()%>>0)
                    {
                        $('input[name=drop]').attr('checked','checked');
                    }
                    if ($('input[name=drop]').is(':checked')) {
                        $('tr.dropship').show(1000);
                    }
                    else {
                        $('tr.dropship').hide(1000);
                    }

                   <%--var y = $('input[name=shippingCharge]:checked')
                    if(<%=Convert.ToInt32(HttpContext.Current.Session["InterNationalShipping_Charge"])%>>0)
                    {
                        $('input[name=shippingCharge]').attr('checked','checked');
                    }--%>

                    <%--$('input[name=shippingCharge]').click(function () {
                        if ($(this).is(':checked')) {
                            //$('tr.dropship').fadeIn(1000);
                            //var x =<%=totalAmount+=3%>
                            //$('tr.order-total td[data-title] span.amount').text('$' + x)
                            InternationalShipping(1);
                            //drop(3);
                        }
                        else {
                            $('tr.dropship').fadeOut(1000);
                           // var x =<%=totalAmount-=3%>
                           /// $('tr.order-total td[data-title] span.amount').text('$' + x)
                            //drop(0);
                            InternationalShipping(0);
                        }
                    });--%>

                    //$('').delegate(':checked',)
                    $('input[name=drop]').click(function () {
                        if ($(this).is(':checked')) {
                            $('tr.dropship').fadeIn(1000);
                            var subtotal=parseFloat($('span.subtotal').text());
                            //alert(subtotal.toFixed(2));
                            var x =subtotal+=3;
                            $('tr.order-total td[data-title] span.grandtotal').text( x.toFixed(2))
                            $('span.grandtotal').text(x.toFixed(2));
                            drop(3);
                            jQuery('.user-account').attr('drop',3);
                        }
                        else {
                            $('tr.dropship').fadeOut(1000);
                            var subtotal=parseFloat($('span.subtotal').text());
                            //alert(subtotal.toFixed(2));
                            var x =<%=totalAmount-=3%>
                            $('tr.order-total td[data-title] span.grandtotal').text( subtotal.toFixed(2))
                            $('span.grandtotal').text(subtotal.toFixed(2));
                            drop(0);
                            jQuery('.user-account').attr('drop',0);
                            jQuery('tr.shipcharge').hide();
                        }
                    });

                    $("#sidebar-fixed-qube").sticky({});
                    $(".add-to-cart-overlay a[data-rel^='prettyPhoto'], .portfolio-column-1-pro a[data-rel^='prettyPhoto'], .featured-blog-pro a[data-rel^='prettyPhoto'], .pro-media-image a[data-rel^='prettyPhoto'], .images a[data-rel^='prettyPhoto'], .portfolio-container-pro a[data-rel^='prettyPhoto']").prettyPhoto({
                        hook: 'data-rel',
                        animation_speed: 'fast', /* fast/slow/normal */
                        slideshow: 5000, /* false OR interval time in ms */
                        show_title: false, /* true/false */
                        deeplinking: false, /* Allow prettyPhoto to update the url to enable deeplinking. */
                        overlay_gallery: false, /* If set to true, a gallery will overlay the fullscreen image on mouse over */
                        custom_markup: '',
                        default_width: 900,
                        default_height: 506,
                        social_tools: '' /* html or false to disable */
                    });



                    jQuery('nav#site-navigation ul.sf-menu').superfish({
                        popUpSelector: 'ul.sub-menu,.sf-mega',  // within menu context
                        delay: 400,                  // one second delay on mouseout
                        speed: 200,                  // faster animation speed
                        speedOut: 200,                // speed of the closing animation
                        animation: { opacity: 'show' },    // animation out
                        animationOut: { opacity: 'hide' },    // adnimation in
                        cssArrows: true,                 // set to false
                        autoArrows: true                    // disable generation of arrow mark-up
                    });

                    jQuery('#header-top-qube ul.sf-menu').superfish({
                        popUpSelector: 'ul.sub-menu,.sf-mega',  // within menu context
                        delay: 400,                  // one second delay on mouseout
                        speed: 200,                  // faster animation speed
                        speedOut: 200,                // speed of the closing animation
                        animation: { opacity: 'show' },    // animation out
                        animationOut: { opacity: 'hide' },    // adnimation in
                        cssArrows: true,                 // set to false
                        autoArrows: true                    // disable generation of arrow mark-up
                    });

                });

                

                jQuery('a.remove').click(function (e) {
                   // alert("hi");
                    jQuery("#HiddenField1").val(this.id);
                    jQuery.ajax({
                     type: "POST",
                     url: "CS.aspx/delete",
                     //data: '{name: "' + $("#<txtUserName.ClientID%>")[0].value + '" }',
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function(response){},
                     failure: function(response) {
                         alert(response.d);
                     }
                 });
                });

              //  jQuery(document).delegate('input[type=text]', 'blur', function (e) { update(e); });
                function drop(drop)
                {
                    
                        var dataString = "{value:'" + drop + "'}";
                        var URL = window.location.origin + window.location.pathname + '/drop';
                        jQuery.ajax({
                            type: "POST",
                            url: URL,//+"/Addtocart",
                            contentType: "application/json; charset=utf-8",
                            data: dataString,//"{value:'"+pr_code+"'}",
                            dataType: "json",
                            success: function (response) {
                               // jQuery("span#count").text(response.d);
                            },
                            failure: function (response) {
                                alert(response.d);
                            }
                        });

                   
                }

                //function InternationalShipping(drop)
                //{
                    
                //    var dataString = "{value:'" + drop + "'}";
                //    var URL = window.location.origin + window.location.pathname + '/Shipping_charge';
                //    jQuery.ajax({
                //        type: "POST",
                //        url: URL,//+"/Addtocart",
                //        contentType: "application/json; charset=utf-8",
                //        data: dataString,//"{value:'"+pr_code+"'}",
                //        dataType: "json",
                //        success: function (response) {
                //            jQuery("span.shipamnt").text(response.d);
                //            var subtotal=parseInt(jQuery("span.subtotal").text());
                //            var total=subtotal+parseInt(response.d);
                //            jQuery("span.grandtotal").text(total);
                //        },
                //        failure: function (response) {
                //            alert(response.d);
                //        }
                //    });

                   
                //}

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
                
                jQuery(document).delegate('input[type=number]','blur',function(){
                   var x= jQuery(this).val();
                    var y=jQuery(this).val(this.defaultValue);
                    //alert(y[0].defaultValue);
                    if(x==0)
                    {
                        alert("Quantity should not be zero.")
                        jQuery(this).val(y[0].defaultValue); 
                    }else{
                        jQuery(this).val(x);
                    }
                });

                jQuery(document).delegate('#txtprcod','keypress',function(event){
                   // var x= jQuery(this).val();
                   // var y=jQuery(this).val(this.defaultValue);
                    //alert(y[0].defaultValue);
                    if (event.keyCode == 13) {
                        update(event);
                        //location.reload();
                    }
                });
                jQuery(document).delegate('#txtqty','blur',function(event){
                    // var x= jQuery(this).val();
                    // var y=jQuery(this).val(this.defaultValue);
                    //alert(y[0].defaultValue);
                   // if (event.keyCode == 13) {
                        update(event);
                        //location.reload();
                   // }
                });

                jQuery(document).delegate('#txtqty','keydown',function(event){
                    // var x= jQuery(this).val();
                    // var y=jQuery(this).val(this.defaultValue);
                    //alert(y[0].defaultValue);
                    //event.preventDefault();
                    if (event.keyCode == 13) {
                        update(event);
                        //location.reload();
                    }
                    if (jQuery.inArray(event.keyCode, [46, 8, 9, 27, 110, 190]) !== -1 ||
                        // Allow: Ctrl+A, Command+A
                        (event.keyCode === 65 && (event.ctrlKey === true || event.metaKey === true)) || 
                        // Allow: home, end, left, right, down, up
                        (event.keyCode >= 35 && event.keyCode <= 40)) {
                        // let it happen, don't do anything
                        return;
                    }
                    // Ensure that it is a number and stop the keypress
                    if ((event.shiftKey || (event.keyCode < 48 || event.keyCode > 57)) && (event.keyCode < 96 || event.keyCode > 105)) {
                        event.preventDefault();
                    }
                    
                });
            </script>

        </div>
</asp:Content>
