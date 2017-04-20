/*  Table of Contents 

01. BULLET NAVIGATION JS
02. MOBILE MENU
03. SCROLL TO TOP BUTTON
04. GALLERY JS
05. Show/Hide Elements (Search, sharing, etc.)
06. STICK FOOTER
07. jQuery Tooltips
08. Timeline Class Additions
09. STICKY HEADER
10. CHECKOUT HOVER
11. FADED HEADER JS
12. PARALLAX JS
13. IMAGE ZOOM WOOCOMMERCE
14. SELET BOX UI
15. FLUID VIDEOS

*/

jQuery(document).ready(function($) {
	 'use strict';
	
	 
/*
=============================================== 01. BULLET NAVIGATION JS  ===============================================
*/
	 $('ul.bullet-navigation-pro').css({
	         'position' : 'fixed',
	         'top' : '50%',
	         'margin-top' : -$('ul.bullet-navigation-pro').outerHeight()/2
	 });
	 $("ul.bullet-navigation-pro>li a").wrapInner("<span></span>");
	 
 	$('ul.bullet-navigation-pro').singlePageNav({
 		offset: $('header.fixed-pro').outerHeight(),
 		currentClass: 'current-one-page-nav',
 		speed:'400'
 	});

	 
/*
=============================================== 02. MOBILE MENU  ===============================================
*/
  	$('ul.mobile-menu-pro').slimmenu({
  	    resizeWidth: '1280',
  	    collapserTitle: 'Menu',
  	    easingEffect:'easeInOutQuint',
  	    animSpeed:'medium',
  	    indentChildren: false,
  		childrenIndenter: '- '
  	});


/*
=============================================== 03. SCROLL TO TOP BUTTON  ===============================================
*/
  	// browser window scroll (in pixels) after which the "back to top" link is shown
  	var offset = 150,
  	
	//browser window scroll (in pixels) after which the "back to top" link opacity is reduced
  	offset_opacity = 1200,
  	
	//duration of the top scrolling animation (in ms)
  	scroll_top_duration = 700,
  	
	//grab the "back to top" link
  	$back_to_top = $('#pro-scroll-top, .home-scroll-top');

	//hide or show the "back to top" link
	$(window).scroll(function(){
  		( $(this).scrollTop() > offset ) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
  		if( $(this).scrollTop() > offset_opacity ) { 
  			$back_to_top.addClass('cd-fade-out');
  		}
  	});

	//smooth scroll to top
	$back_to_top.on('click', function(event){
		event.preventDefault();
		$('body,html').animate({
			scrollTop: 0 ,
		}, scroll_top_duration
	);
	});


/*
=============================================== 04. GALLERY JS  ===============================================
*/	
    $('.gallery-qube-ezio').flexslider({
		animation: "fade",      
		slideDirection: "horizontal", 
		slideshow: false,         
		slideshowSpeed: 7000,  
		animationDuration: 200,        
		directionNav: true,             
		controlNav: true,
		prevText: "",    
		nextText: "", 
    });
	
/*
=============================================== 05. Show/Hide Elements (Search, sharing, etc.) ===============================================
*/	
	var clickOrTouch = (('ontouchend' in window)) ? 'touchend' : 'click';
	
	$(".mobile-menu-icon-pro").on(clickOrTouch, function(e) {
	   $(".site-header").toggleClass("active-menu-icon-pro");
	});
	
	$(".search-icon-pro").on(clickOrTouch, function(e) {
		$(".site-header").toggleClass("active-pro");
	});
	
	
	
	$("#sidebar-hidden-pro").on(clickOrTouch, function(e) {
		$("#sidebar-hidden-pro").css("pointer-events", "none");
		$("body").toggleClass("show-sidebar-pro");
		$(window).trigger('resize');
		$('#qube-masonry, #portfolio-qube-masonry-1, #portfolio-qube-masonry-2, #portfolio-qube-masonry-3, #portfolio-qube-masonry-4, #portfolio-qube-masonry-5, #portfolio-qube-masonry-6, #qube-masonry-1, #qube-masonry-2, #qube-masonry-3, #qube-masonry-4, #qube-masonry-, #qube-masonry-5, #qube-masonry-6').isotope( 'reloadItems' ).isotope();
		
		setTimeout(function() { $("#sidebar-hidden-pro").css("pointer-events", "auto"); }, 350);
	});
	
	
	$(window).resize(function() {
	  if ($(this).width() > 959) { $('.active-menu-icon-pro #main-nav-mobile').hide(); } 
	});
	

	$('.slick-carousel-item-pro .toggle-button-here, .portfolio-toggle-button-here, .qube-masonry-item .toggle-button-here, .share-page-title-icon, .timeline-pro-heading-fix .toggle-button-here').showhide({ default_open: false });

	$(".nav-below-header .checkout-basket-pro").css('bottom', $(".nav-below-header .checkout-basket-pro").outerHeight() * -1 + 1 + "px");

	
/*
=============================================== 06. STICK FOOTER ===============================================
*/
	$("#footer-header-qube header#masthead-qube.centered-header.default-non-fixed, #footer-header-qube header#masthead-qube.default-header-layout.default-non-fixed, #footer-header-qube header#masthead-qube.full-width-header.default-non-fixed").sticky({});
	
	
	
	
/*
=============================================== 07. jQuery Tooltips ===============================================
*/	
	 $('.tooltip').tooltipster({
	    animation: 'fade',
	    delay: 100,
	    theme: 'tooltipster-light',
	    touchDevices: false,
	    trigger: 'hover'
	 });
	 
	 
/*
=============================================== 08. Timeline Class Additions  ===============================================
*/
	 $(function(){
	    var $this, count = 0, className;
	    $('ul.timeline-layout-pro li').each(function(i){
			$this = $(this);
		   
	        if($this.is(".timeline-year-pro")){
	 		   count = 1;
	        }
	 	   else{
			 
			if(count == 1)  $this.addClass("right-timeline-pro"); 
			
			if (count > 1) { count = 0;  }
			}
			count ++;
			 
	    });
	 });
	 

/*
=============================================== 09. STICKY HEADER  ===============================================
*/
	
		var  $menu = $('header#masthead-qube'),
	    $clone = $menu.clone(true),
	    $window = $(window),
	    top = $menu.offset().top,
	    topDown = top + $menu.height() + 65,
	    currentScroll = 0;
      
	    $clone.addClass('fixed-pro');
		$clone.removeClass('default-non-fixed');
	    $menu.before($clone);

	    $window.scroll(function() {
	      currentScroll = $window.scrollTop();
      
	      if(currentScroll > topDown) {
	        $menu.addClass('invisible-pro');
	        $clone.addClass('visible-pro');
	      } 
      
	      if(currentScroll < topDown) {
	        $menu.removeClass('invisible-pro');
	        $clone.removeClass('visible-pro');
	      }
	    });
	 


/*
=============================================== 10. CHECKOUT HOVER  ===============================================
*/
		
	    var hide = false;
		
		if ($(this).width() > 959) { 
			
	    $(".cart-hover-pro").hover(function(){
	        if (hide) clearTimeout(hide);
	        $(".checkout-basket-pro").fadeIn();
	    }, function() {
	        hide = setTimeout(function() {$(".checkout-basket-pro").fadeOut("slow");}, 250);
	    });
		
	    $(".checkout-basket-pro").hover(function(){
	        if (hide) clearTimeout(hide);
	    }, function() {
	        hide = setTimeout(function() {$(".checkout-basket-pro").fadeOut("slow");}, 250);
	    });
	}


/*
=============================================== 11. FADED HEADER JS  ===============================================
*/
		$(window).scroll(function() {
		    $(".fade-header-qube").css({
		    'opacity' : 1-(($(this).scrollTop())/250)
		    });          
		});
	
/*
=============================================== 12. PARALLAX JS  ===============================================
*/	
	$('.parallax-window').parallax({
	    overScrollFix: true,
		speed: 0.2
	 });

/*
=============================================== 13. IMAGE ZOOM WOOCOMMERCE  ===============================================
*/
	$('.woocommerce-main-image').zoom();
	
/*
=============================================== 14. SELET BOX UI  ===============================================
*/
	$('.widget_categories select, .widget_archive select, #woocommerce-post-page table.variations select, .woocommerce-ordering select').selectric();

/*
=============================================== 15. FLUID VIDEOS  ===============================================
*/

	fluidvids.init({
	  selector: ['iframe', 'object'], // runs querySelectorAll()
	  players: ['www.youtube.com', 'player.vimeo.com'] // players to support
	});

	
	
});



/*
=============================================== 16. Add row in cart  =========================================
*/


  var count = "0";
  function addRow(in_tbl_name)
  {

    var tbody = document.getElementById(in_tbl_name).getElementsByTagName("TBODY")[0];
    var tbody = document.getElementById('crow');
    
    // create row
    var row = document.createElement("TR");
    	row.className = 'cart_item';	
    // create table cell 1
    var td1 = document.createElement("TD")
    	td1.className = 'product-remove';
    var strHtml1 = '<a class="remove" title="Remove this item" data-product_id="1621" data-product_sku="1001" onClick="delRow()" href="javascript:void(0);">&times;</a>';
    td1.innerHTML = strHtml1.replace(/!count!/g,count);
    // create table cell 2
    var td2 = document.createElement("TD")
    	td2.className = 'product-thumbnail';
    var strHtml2 = '<a href=""><img width="180" height="180" src="http://cdn.invictuscreative1.netdna-cdn.com/demo/ezio-modern-shop//wp-content/uploads/sites/49/2015/08/4_wm15201502-180x180.jpg"/></a>';
    td2.innerHTML = strHtml2.replace(/!count!/g,count);
    // create table cell 3
    var td3 = document.createElement("TD")
    	td3.className = 'product-name';
    	var strHtml3 = '<input type=textbox name="NewProduct" />';//'<a href="">SKU</a>';
    td3.innerHTML = strHtml3.replace(/!count!/g,count);
    // create table cell 4
    var td4 = document.createElement("TD")
    	td4.className = 'product-name';
    var strHtml4 = '<span class="amount">&#36;249.00</span>';
    td4.innerHTML = strHtml4.replace(/!count!/g,count);
    // create table cell 5
    var td5 = document.createElement("TD")
    	td5.className = 'product-quantity';
    	var strHtml5 = '<div class="quantity"><input type="number" id="txtqty" step="1" min="0" max="" 462bf0ddbe0d0da40e1e828ebebeb11][qty]" value="1" title="Qty" class="input-text qty text" size="4" /></div>';
    td5.innerHTML = strHtml5.replace(/!count!/g,count);
    // create table cell 6
    var td6 = document.createElement("TD")
    	td6.className = 'product-subtotal';
    var strHtml6 = '<span class="amount">&#36;249.00</span>';
    td6.innerHTML = strHtml6.replace(/!count!/g,count);
    // append data to row
    row.appendChild(td1);
    row.appendChild(td2);
    row.appendChild(td3);
    row.appendChild(td4);
    row.appendChild(td5);
    row.appendChild(td6);
    // add to count variable
    count = parseInt(count) + 1;
    // append row to table
    tbody.appendChild(row);
        
  }
  function delRow(event)
  {
      //var current = event.target || event.srcElement;
      //alert(current.parentElement.tagName());
    //here we will delete the line
      while ((event = event.parentElement) && event.tagName != "TR");
      event.parentElement.removeChild(event);
  }

function AddBefore(rowId){
	var target = document.getElementById(rowId);
    var newElement = document.createElement('tr');
	// create row
    var row = document.createElement("TR");
    	row.className = 'cart_item';	
    // create table cell 1
    var td1 = document.createElement("TD")
    	td1.className = 'product-remove';
    	var strHtml1 = '<a class="remove" title="Remove this item" data-product_id="1621" data-product_sku="1001" onclick="delRow(this)" href="javascript:void(0);">&times;</a>';
    td1.innerHTML = strHtml1.replace(/!count!/g,count);
    // create table cell 2
    var td2 = document.createElement("TD")
    	td2.className = 'product-thumbnail';
    var strHtml2 = '<a href=""><img width="180" height="180" src="#http://cdn.invictuscreative1.netdna-cdn.com/demo/ezio-modern-shop//wp-content/uploads/sites/49/2015/08/4_wm15201502-180x180.jpg" style="display:none;"/></a>';
    td2.innerHTML = strHtml2.replace(/!count!/g,count);
    // create table cell 3
    var td3 = document.createElement("TD")
    	td3.className = 'product-name pr_cd';
    	var strHtml3 = '<input type="text" name="NewProduct" id="txtprcod" value="" placeholder="Enter product code.." />';//'<a href="">SKU</a>';
    td3.innerHTML = strHtml3.replace(/!count!/g,count);
    // create table cell 4
    var td4 = document.createElement("TD")
    	td4.className = 'product-price';
    var strHtml4 = '<span class="amount">&#36;0.00</span>';
    td4.innerHTML = strHtml4.replace(/!count!/g,count);
    // create table cell 5
    var td5 = document.createElement("TD")
    	td5.className = 'product-quantity';
    	var strHtml5 = '<div class="quantity"><input id="txtqty" type="number" style="width:20%;" step="1" min="1" max="999999" value="1" maxlength="5" title="Qty" class="input-text qty text" size="4" /></div>';
    td5.innerHTML = strHtml5.replace(/!count!/g,count);
    // create table cell 6
    var td6 = document.createElement("TD")
    	td6.className = 'product-subtotal';
    var strHtml6 = '<span class="amount">&#36;0.00</span>';
    td6.innerHTML = strHtml6.replace(/!count!/g,count);
	    
	// append data to row
    row.appendChild(td1);
    row.appendChild(td2);
    row.appendChild(td3);
    row.appendChild(td4);
    row.appendChild(td5);
    row.appendChild(td6);
	
    target.parentNode.insertBefore(row, target);
    jQuery('#txtprcod').focus();
    return row;
}



function AddToCart(pr_code)
{
    //alert(pr_code);
    fbq('track', 'AddToCart', {
        content_ids: [pr_code],
        content_type: 'product',
        value: "",
        currency: 'USD'
    });

    var dataString = "{value:'" + pr_code + "'}";
    var URL = window.location.origin + window.location.pathname + '/Addtocart';
    jQuery.ajax({
        type: "POST",
        url: URL,//+"/Addtocart",
        contentType: "application/json; charset=utf-8",
        data: dataString,//"{value:'"+pr_code+"'}",
        dataType: "json",
        success: function (response) {
            //jQuery("span#count").text(response.d);
            var arr = response.d;
            var str = '';
            jQuery(".ajax-cart-header").empty();
            str += '<table class="shop_table woocommerce-checkout-review-order-table"><thead><tr><th class="product-remove">&nbsp;</th><th class="product-name">Product</th><th class="product-total">Total</th></tr></thead><tbody>';
            var qty = 0;
            var total = 0;
            var ShippingCharge = 0;
            var cusType = jQuery('.user-account').attr('custype');
            var inter = jQuery('.user-account').attr('international');
            var drop = jQuery('.user-account').attr('drop');
            for(var i=0;i<response.d.length;i++)
            {
                str += ' <tr class="cart_item">';
                str += '<td class="product-remove"><a href="javascript:void(0)" class="remove" onclick="Remove(' + "'" + response.d[i].PROD_CD + "'" + ')" title="Remove this item" data-product_id="1621" data-product_sku="' + response.d[i].PROD_CD + '">&times;</a></td>';
                str += '<td class="product-name">' + response.d[i].PROD_CD + '&nbsp;<strong class="product-quantity">&times; ' + response.d[i].QTYinCart + '</strong></td>';
                str += ' <td class="product-total">';
                str += '<span class="amount">&#36;' + (response.d[i].RETAIL_PRS * response.d[i].QTYinCart).toFixed(2) + '</span></td>';
                str += '</tr>';
                str += '';
                total += response.d[i].RETAIL_PRS * response.d[i].QTYinCart;
                qty += response.d[i].QTYinCart;
            }
            if (cusType == 1) {
                if (inter > 0) {
                    if (total < 300) {
                        ShippingCharge = 15 + (2 * (qty - 1));
                    }
                    else {
                        ShippingCharge = 0;
                    }
                }
                else if (inter == -1) {
                    ShippingCharge = 0;
                }
                else {
                    if (total < 100) {
                        ShippingCharge = 5 + (1 * (qty - 1));
                    }
                    else
                    {
                        ShippingCharge = 0;
                    }
                }
            }
            
            str += '</tbody><tfoot>';
            str += '<tr class="cart-subtotal"><td></td><th>Subtotal</th><td><span class="amount">&#36;<span class="subtotal">' + total.toFixed(2) + '</span></span></td></tr>';
            
            
            //if()
            if (cusType == "1") {
                if(inter!="-1")
                    str += '<tr class="cart-subtotal"><td></td><th>Shipping Charge</th><td><span class="amount">&#36;<span class="shipcharge">' + ShippingCharge.toFixed(2) + '</span></td></tr>';
            }
            else
            {
                if (drop == "3")
                {
                    ShippingCharge = 3;
                    str += '<tr class="cart-subtotal"><td></td><th>Dropship Fee </th><td><span class="amount">&#36;<span class="shipcharge">' + ShippingCharge.toFixed(2) + '</span></td></tr>';
                }
            }
            total += ShippingCharge;
            str += '<tr class="order-total"><td></td><th>Total</th><td><strong><span class="amount">&#36;<span class="grandtotal">' + total.toFixed(2) + '</span></span></strong></td></tr>';
            str += '</tfoot></table>';
            jQuery("span#count").text(qty)
            jQuery(".ajax-cart-header").append(str);
            if (response.d.length == 0) {
                jQuery('a.checkout-button-header-cart').css("display", "none");
            }
            else {
                jQuery('a.checkout-button-header-cart').css("display", "inherit");
            }
            
        },
        failure: function (response) {
             (response.d);
        }
    });

}

function Remove(pr_code) {
    var dataString = "{value:'" + pr_code + "'}";
    var URL = window.location.origin + window.location.pathname + '/Remove';//'CampcoCommon.Master.cs/Remove';
    jQuery.ajax({
        type: "POST",
        url: URL,//+"/Addtocart",
        contentType: "application/json; charset=utf-8",
        data: dataString,//"{value:'"+pr_code+"'}",
        dataType: "json",
        success: function (response) {
            //jQuery("span#count").text(response.d);
            var arr = response.d;
            var str = '';
           // alert(arr);
            jQuery(".ajax-cart-header").empty();
            if (arr == null)
            {
                str += '<ul id="cart-mini-pro"><li class="empty">No products in the cart.</li></ul>';
                jQuery("span#count").text(0)
                jQuery(".ajax-cart-header").append(str);
                
                    jQuery('a.checkout-button-header-cart').css("display", "none");
                
                return;
            }
            
            str += '<table class="shop_table woocommerce-checkout-review-order-table"><thead><tr><th class="product-remove">&nbsp;</th><th class="product-name">Product</th><th class="product-total">Total</th></tr></thead><tbody>';
            var qty = 0;
            var total = 0;
            var ShippingCharge = 0;
            var cusType = jQuery('.user-account').attr('custype');
            var inter = jQuery('.user-account').attr('international');
            var drop = jQuery('.user-account').attr('drop');
            for (var i = 0; i < response.d.length; i++) {
                str += ' <tr class="cart_item">';
                str += '<td class="product-remove"><a href="javascript:void(0);" class="remove" onclick="Remove(' + "'" + response.d[i].PROD_CD + "'" + ')" title="Remove this item" data-product_id="1621" data-product_sku="' + response.d[i].PROD_CD + '">&times;</a></td>';
                str += '<td class="product-name">' + response.d[i].PROD_CD + '&nbsp;<strong class="product-quantity">&times; ' + response.d[i].QTYinCart + '</strong></td>';
                str += ' <td class="product-total">';
                str += '<span class="amount">&#36;' + (response.d[i].RETAIL_PRS * response.d[i].QTYinCart).toFixed(2) + '</span></td>';
                str += '</tr>';
                str += '';
                total += response.d[i].RETAIL_PRS * response.d[i].QTYinCart;
                qty += response.d[i].QTYinCart;
            }
            if (cusType == 1) {
                if (inter > 0) {
                    if (total < 300) {
                        ShippingCharge = 15 + (2 * (qty - 1));
                    }
                    else {
                        ShippingCharge = 0;
                    }
                }
                else if (inter == -1) {
                    ShippingCharge = 0;
                }
                else {
                    if (total < 100) {
                        ShippingCharge = 5 + (1 * (qty - 1));
                    }
                    else {
                        ShippingCharge = 0;
                    }
                }
            }

            str += '</tbody><tfoot>';
            str += '<tr class="cart-subtotal"><td></td><th>Subtotal</th><td><span class="amount">&#36;<span class="subtotal">' + total.toFixed(2) + '</span></span></td></tr>';


            //if()
            if (cusType == "1") {
                if (inter != "-1")
                    str += '<tr class="cart-subtotal"><td></td><th>Shipping Charge</th><td><span class="amount">&#36;<span class="shipcharge">' + ShippingCharge.toFixed(2) + '</span></td></tr>';
            }
            else {
                if (drop == "3") {
                    ShippingCharge = 3;
                    str += '<tr class="cart-subtotal"><td></td><th>Dropship Fee </th><td><span class="amount">&#36;<span class="shipcharge">' + ShippingCharge.toFixed(2) + '</span></td></tr>';
                }
            }
            total += ShippingCharge;
            str += '<tr class="order-total"><td></td><th>Total</th><td><strong><span class="amount">&#36;<span class="grandtotal">' + total.toFixed(2) + '</span></span></strong></td></tr>';
            str += '</tfoot></table>';
            jQuery("span#count").text(qty)
            jQuery(".ajax-cart-header").append(str);
            if (response.d.length == 0) {
                jQuery('a.checkout-button-header-cart').css("display", "none");
            }
            else {
                jQuery('a.checkout-button-header-cart').css("display", "inherit");
            }

        },
        failure: function (response) {
            (response.d);
        }
    });

}

function update(e) {
    var pr_code = jQuery('input[name=NewProduct]').val();
    var pr_qty = jQuery('#txtqty').val();
    if (pr_code == '')
        return;
   // alert(pr_code);
    var dataString = "{value:'" + pr_code + "',qty:'" + pr_qty + "'}";
    var URL = window.location.origin + window.location.pathname + '/Addtocart';
    jQuery('.pr_cd').empty();
    jQuery('.pr_cd').text(pr_code);
    jQuery("#txtqty").attr("id", pr_code);
    jQuery('.pr_cd').removeClass("pr_cd");
    jQuery('input[name=update_cart]').attr({
        'disabled': 'disabled'
    });
    //jQuery('.remove').attr('href', 'cart.aspx?prod_cd=' + pr_code);

    //jQuery('.Loader_center').show();
    jQuery.ajax({
        type: "POST",       
        url: URL,//+"/Addtocart",
        contentType: "application/json; charset=utf-8",
        data: dataString,//"{value:'"+pr_code+"'}",
        dataType: "json",
        success: function (response) {
            //jQuery("span#count").text(response.d);
            //var x = jQuery.parseJSON(response.d);
           // alert(response.d)
            //window.location.reload();
            Items(response);
            cartIcon(response);

        },
        failure: function (response) {
            alert(response.d);
        }

        
    });
    //location.reload();
}

/*
=============================================== 17. Tabing in product description page  =========================================
*/


function cartIcon(response) {
    //jQuery("span#count").text(response.d);
    if (response.d.length <= 0) {
        //alert("Invalid Product SKU.");
        //jQuery("table.cart>tbody tr:last").prev().find("td").remove();
        jQuery('input[name=update_cart]').removeAttr('disabled');
        return;
    }
    var arr = response.d;
    var str = '';
    jQuery(".ajax-cart-header").empty();
    str += '<table class="shop_table woocommerce-checkout-review-order-table"><thead><tr><th class="product-remove">&nbsp;</th><th class="product-name">Product</th><th class="product-total">Total</th></tr></thead><tbody>';
    var qty = 0;
    var total = 0;
    var ShippingCharge = 0;
    var cusType = jQuery('.user-account').attr('custype');
    var inter = jQuery('.user-account').attr('international');
    var drop = jQuery('.user-account').attr('drop');
    for(var i=0;i<response.d.length;i++)
    {
        str += ' <tr class="cart_item">';
        str += '<td class="product-remove"><a href="javascript:void(0)" class="remove" onclick="Remove(' + "'" + response.d[i].PROD_CD + "'" + ')" title="Remove this item" data-product_id="1621" data-product_sku="' + response.d[i].PROD_CD + '">&times;</a></td>';
        str += '<td class="product-name">' + response.d[i].PROD_CD + '&nbsp;<strong class="product-quantity">&times; ' + response.d[i].QTYinCart + '</strong></td>';
        str += ' <td class="product-total">';
        str += '<span class="amount">&#36;' + (response.d[i].RETAIL_PRS * response.d[i].QTYinCart).toFixed(2) + '</span></td>';
        str += '</tr>';
        str += '';
        total += response.d[i].RETAIL_PRS * response.d[i].QTYinCart;
        qty += response.d[i].QTYinCart;
    }
    if (cusType == 1) {
        if (inter > 0) {
            if (total < 300) {
                ShippingCharge = 15 + (2 * (qty - 1));
            }
            else {
                ShippingCharge = 0;
            }
        }
        else if (inter == -1) {
            ShippingCharge = 0;
        }
        else {
            if (total < 100) {
                ShippingCharge = 5 + (1 * (qty - 1));
            }
            else
            {
                ShippingCharge = 0;
            }
        }
    }
            
    str += '</tbody><tfoot>';
    str += '<tr class="cart-subtotal"><td></td><th>Subtotal</th><td><span class="amount">&#36;<span class="subtotal">' + total.toFixed(2) + '</span></span></td></tr>';
            
            
    //if()
    if (cusType == "1") {
        if(inter!="-1")
            str += '<tr class="cart-subtotal"><td></td><th>Shipping Charge</th><td><span class="amount">&#36;<span class="shipcharge">' + ShippingCharge.toFixed(2) + '</span></td></tr>';
    }
    else
    {
        if (drop == "3")
        {
            ShippingCharge = 3;
            str += '<tr class="cart-subtotal shipcharge"><th>Dropship Fee </th><td><span class="amount">&#36;<span class="shipcharge">' + ShippingCharge.toFixed(2) + '</span></td></tr>';
        }
    }
    total += ShippingCharge;
    str += '<tr class="order-total"><th>Total</th><td><strong><span class="amount">&#36;<span class="grandtotal">' + total.toFixed(2) + '</span></span></strong></td></tr>';
    str += '</tfoot></table>';
    jQuery("span#count").text(qty)
    jQuery(".ajax-cart-header").append(str);
    if (response.d.length == 0) {
        jQuery('a.checkout-button-header-cart').css("display", "none");
    }
    else {
        jQuery('a.checkout-button-header-cart').css("display", "inherit");
    }
    jQuery('.Loader_center').hide();
    jQuery('input[name=update_cart]').removeAttr('disabled');
}

function Items(response) {
    //jQuery("span#count").text(response.d);
    var arr = response.d;
    
   // alert("hi");
    var str = '';
    //jQuery(".ajax-cart-header").empty();
    //str += '<table class="shop_table woocommerce-checkout-review-order-table"><thead><tr><th class="product-name">Product</th><th class="product-total">Total</th></tr></thead><tbody>';
    var qty = 0;
    var total = 0;
    var ShippingCharge = 0;
    var cusType = jQuery('.user-account').attr('custype');
    var inter = jQuery('.user-account').attr('international');
    var drop = jQuery('.user-account').attr('drop');
    if (response.d.length <= 0) {
        alert("Invalid Product SKU.");
        jQuery("table.cart>tbody tr:last").prev().find("td").remove();
        return;
    }
    jQuery("table.cart>tbody").find("tr:not(:last)").remove();
    jQuery('.checkout-button').show();
    for(var i=0;i<response.d.length;i++)
    {
        
        total += response.d[i].RETAIL_PRS * response.d[i].QTYinCart;
        qty += response.d[i].QTYinCart;

      str+='<tr class="cart_item">'
      str+='<td class="product-remove">'
      str += '    <a href="cart.aspx?prod_cd=' + response.d[i].PROD_CD + '" class="remove"  title="Remove this item" data-product_id="1621" data-product_sku="1001">&times;</a>'
      str+='</td>'
      str += '<td class="product-thumbnail"><a href="productDetail.aspx?prod_cd=' + response.d[i].PROD_CD + '"><img width="180" height="180" src=' + response.d[i].SMALLPIC + ' class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="4_wm15201502" sizes="(max-width: 180px) 100vw, 180px" /></a></td>'
      str += '<td class="product-name" data-title="Product"><a href="productDetail.aspx?prod_cd=' + response.d[i].PROD_CD + '">' + response.d[i].PROD_CD + '</a></td>'
      str += '<td class="product-price" data-title="Price"><span class="amount">&#36;' + (response.d[i].RETAIL_PRS).toFixed(2) + '</span></td>'
      str+='<td class="product-quantity" data-title="Quantity"><div class="quantity">'
      str += '    <input id="' + response.d[i].PROD_CD + '" type="number" step="1" min="1" name="qty" value="' + response.d[i].QTYinCart + '" title="Qty" class="input-text qty text" size="4" />'
      str+='  </div></td>'
      str += '<td class="product-subtotal" data-title="Total"><span class="amount">&#36;' + parseFloat(response.d[i].RETAIL_PRS * response.d[i].QTYinCart).toFixed(2) + '</span></td>'
      str+='</tr>'
    }
    jQuery('.subtotal').text(total.toFixed(2));
    //alert(drop)
    if (drop > 0)
    {

        jQuery('.grandtotal').text((parseFloat(total) + parseFloat(3)).toFixed(2));
    }
    else
    {
        jQuery('.grandtotal').text((parseFloat(total)).toFixed(2));
    }
   
    jQuery('#cccrrr').before(str);
    //if (cusType == 1) {
    //    if (inter > 0) {
    //        if (total < 300) {
    //            ShippingCharge = 15 + (2 * (qty - 1));
    //        }
    //        else {
    //            ShippingCharge = 0;
    //        }
    //    }
    //    else if (inter == -1) {
    //        ShippingCharge = 0;
    //    }
    //    else {
    //        if (total < 100) {
    //            ShippingCharge = 5 + (1 * (qty - 1));
    //        }
    //        else
    //        {
    //            ShippingCharge = 0;
    //        }
    //    }
    //}
            
    //str += '</tbody><tfoot>';
    //str += '<tr class="cart-subtotal"><th>Subtotal</th><td><span class="amount">&#36;<span class="subtotal">' + total.toFixed(2) + '</span></span></td></tr>';
            
            
    //if()
    //if (cusType == "1") {
    //    if(inter!="-1")
    //        str += '<tr class="cart-subtotal"><th>Shipping Charge</th><td><span class="amount">&#36;<span class="shipcharge">' + ShippingCharge.toFixed(2) + '</span></td></tr>';
    //}
    //else
    //{
    //    if (drop == "3")
    //    {
    //        ShippingCharge = 3;
    //        str += '<tr class="cart-subtotal"><th>Dropship Fee </th><td><span class="amount">&#36;<span class="shipcharge">' + ShippingCharge.toFixed(2) + '</span></td></tr>';
    //    }
    //}
    //total += ShippingCharge;
    //str += '<tr class="order-total"><th>Total</th><td><strong><span class="amount">&#36;<span class="grandtotal">' + total.toFixed(2) + '</span></span></strong></td></tr>';
    //str += '</tfoot></table>';
    //jQuery("span#count").text(qty)
    //jQuery(".ajax-cart-header").append(str);
    //if (response.d.length == 0) {
    //    jQuery('a.checkout-button-header-cart').css("display", "none");
    //}
    //else {
    //    jQuery('a.checkout-button-header-cart').css("display", "inherit");
    //}

    //To remove Item

   
            
}

function usersubscribe(Subscribername, SubscriberEmailid)
{
    jQuery.ajax({               
                type: "POST",
                 url: "../Services/NewSubsciberWebService.asmx/Addbtnsubscriber1",   
                //url: '../Common/CampcoCommon.Master/Addbtnsubscriber1',            
                data: "{Sname:'" + Subscribername + "',SEmailid:'" + SubscriberEmailid + "'}", //JSON.stringify({ Sname: Subscribername, SEmailid: SubscriberEmailid }),
                contentType: "application/json; charset=utf-8",
                datatype: "json",
                success: function (response)
                {
                    alert("Thank you for subscribing to the Campco newsletter!");
                },
                error: function (error)
                {
                    alert("Sorry you can't subscribing to the Campco newsletter!");
                }
            });
           
        }
       
 

