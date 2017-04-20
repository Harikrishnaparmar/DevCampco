<%@ Page Title="ProductList" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="Campco.Common.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <%--   <asp:UpdatePanel ID="MainUpdatePanel" runat="server">
        <ContentTemplate>--%>


    <div id="content-qube">
        <div class="width-container-qube vc_custom_to-20">

            <div id="main-container-qube" class="vc_col-md-9 vc_col-xs-12 vc_col-sm-9 productlisting_outer">
                <div class="page-content-pro">
                    <div class="woocommerce columns-3">
                        <%--    <p class="woocommerce-result-count"> Showing 1&ndash;15 of 26 results</p>      --%>
                        <%-- <asp:UpdatePanel ID="updatePanel3" runat="server">
                                <ContentTemplate>--%>
                        <div class="woocommerce-ordering">

                            <asp:DropDownList ID="ddlSearchcriteria" runat="server" CssClass="orederby" OnSelectedIndexChanged="ddlSearchcriteria_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>

                        </div>
                        <%--</ContentTemplate>--%>


                        <%--</asp:UpdatePanel>--%>
                        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" >--%>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlSearchcriteria" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="btnfilter" EventName="click" />
                            </Triggers>
                            <ContentTemplate>


                                <ul class="products">
                                    <%if (productList.Count == 0)
                                        {%>
                                    <asp:Label ID="Label1" runat="server" Text="No Record Found" ForeColor="Red"></asp:Label>
                                    <%}
                                        else
                                        {
                                            foreach (var i in productList)
                                            {%>
                                    <li>

                                        <div>
                                            <div class="shop-container-pro hover-shop-layout" style="width: 200px; height: 200px" align="center">
                                                <a href="productDetail.aspx?prod_cd=<%=i.PROD_CD %>">
                                                    <div class="overlay-container-shop-pro overlay-image-shop-pro">
                                                        <a href="productDetail.aspx?prod_cd=<%=i.PROD_CD %>">
                                                            <img src="<%=i.LARGEPIC %>" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="" srcset="<%=i.LARGEPIC %>" sizes="(max-width: 750px) 100vw, 750px" />
                                                            <img src="<%=i.LARGEPIC %>" class="secondary-image-shop-pro" alt="" />
                                                        </a>
                                                        <div class="add-to-cart-overlay top-products-hover">
                                                            <a href="productDetail.aspx?prod_cd=<%=i.PROD_CD %>" class="shop-perma-icon">
                                                                <i class="fa fa-eye"></i></a>
                                                            <a href="javascript:void(0);" onclick="AddToCart<%="('" + i.PROD_CD.Trim() + "')"%>;" class="shop-perma-icon right-perma-icon"><i class="icon-cart"></i></a>

                                                        </div>
                                                    </div>
                                                    <a href="productDetail.aspx?prod_cd=<%=i.PROD_CD%>">
                                                        <div class="shop-overlay-content">
                                                            <div class="shop-overlay-centered">
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <div class="add-to-cart-base-index">
                                                </a>
                                                <a rel="nofollow" href="index335b.html?add-to-cart=1773" data-quantity="1" data-product_id="1773" data-product_sku="1001" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                                                <div class="clearfix-qube-ezio"></div>
                                            </div>
                                        </div>
                                        <div class="specification_product" style="margin-left: 60px; text-align: justify">

                                            <a href="productDetail.aspx?prod_cd=<%=i.PROD_CD %>">
                                                <div class="shop-overlay-content">
                                                    <div class="shop-overlay-centered">
                                                        <h6 class="shop-title-index"><%=i.PROD_CD %></h6>
                                                        <%--  <h5><%=i.PROD_CD %></h5>     --%>
                                                    </div>
                                                </div>
                                            </a>
                                            <%if (cusType != 1)
                                                { %>
                                            <p style="margin: 0px;"><span class="amount">Retail: &#36;<%= i.RETAIL_PRS %></span></p>

                                            <% }
                                                else
                                                { %>
                                            <p style="margin: 0px;"><span class="amount">&#36;<%= i.RETAIL_PRS %></span></p>
                                            <%}%>
                                            <%if ((HttpContext.Current.Session["customerType"] != null ? HttpContext.Current.Session["customerType"].ToString() : "") == "3")
                                                { %>
                                            <p style="margin: 0px;"><span class="amount">Dealer: &#36;<%= i.WHOLE_PRS %></span></p>
                                            <%if (IsSpecial == 1)
                                                {
                                                    if (i.WHOLE_PRS != i.FinalPrice && i.FinalPrice != 0)
                                                    {%>
                                            <p style="margin: 0px;"><span class="amount">Special: &#36;<%= i.FinalPrice %></span></p>
                                            <%}
                                                    }
                                                } %>
                                            <%--<p style="margin:0px;"><span class="amount"><%= i.MINSTOCK%></span></p>--%>
                                            <%if ((HttpContext.Current.Session["customerType"] != null ? HttpContext.Current.Session["customerType"].ToString() : "") == "3")
                                                { %>
                                            <p style="margin: 0px;"><span class="amount"><%= i.MINSTOCK%></span></p>
                                            <%} %>
                                        </div>
                                    </li>
                                    <%}
                                        } %>
                                </ul>

                                
                                <div id="woo-pagination">
                                    <ul class='page-numbers Page-for'>
                                        <%if (productList.Count > 0)
                                            {
                                                var totalRow = HttpContext.Current.Session["TotalRows"];
                                                var totalPage = HttpContext.Current.Session["TotalRows"] != null ? Math.Ceiling(Convert.ToDouble(HttpContext.Current.Session["TotalRows"]) / Convert.ToDouble(ConfigurationManager.AppSettings["pageSize"])) : 5;
                                                var currentPage1=HttpContext.Current.Session["pagenumber"];
                                                int n = 1;
                                                int startnum = Convert.ToInt32(totalPage) > Convert.ToInt32(ConfigurationManager.AppSettings["displayNumber"]) ? Convert.ToInt32(ConfigurationManager.AppSettings["displayNumber"]) < currentPage ? currentPage : Convert.ToInt32(ConfigurationManager.AppSettings["displayNumber"]) : Convert.ToInt32(totalPage);
                                                if (Convert.ToDouble(HttpContext.Current.Session["pagenumber"]) >= startnum && startnum != 1 && totalPage != startnum)
                                                {
                                                    n = startnum - 1;
                                                }
                                                else
                                                {
                                                    n = startnum - 4;
                                                }

                                                if (n <= 0)
                                                {
                                                    n = 1;
                                                }

                                                startnum = startnum + 3 < totalPage ? startnum + 3 : Convert.ToInt32(totalPage);
                                                if (n == 1 && startnum > 5)
                                                {
                                                    startnum = 5;
                                                }
                                                %>
                                        
                                        <div class="PageDetail" totalRows="<%=totalRow %>" totalPage="<%=totalPage %>" currentPage="<%=currentPage1%>" style="display:none;"></div>
                                        <%
                                                for (var i = n; i <= startnum; i++)
                                                {
                                                    var nameValues = HttpUtility.ParseQueryString(Request.QueryString.ToString());


                                                    nameValues.Set("page", i.ToString());
                                                    string url = Request.Url.AbsolutePath;

                                        %>
                                       
                                        <%if (Convert.ToDouble(HttpContext.Current.Session["pagenumber"]) > 1 && i == n)
                                            {
                                                nameValues.Set("page", (Convert.ToDouble(HttpContext.Current.Session["pagenumber"]) - 1).ToString());%>
                                        <li><a class="paging next page-numbers" page="<%=i %>" href="javascript:void(0);">&lsaquo; Previous </a></li>
                                        <%}
                                            nameValues.Set("page", i.ToString()); %>

                                        <li>
                                            <a class="paging page-numbers <%=(Convert.ToInt32(HttpContext.Current.Session["pageNumber"]) == i) ? "current" : "" %>" page="<%=i %>" href="javascript:void(0);"><%=i %></a>
                                        </li>
                                        <%if (i == (startnum) && totalPage != Convert.ToDouble(HttpContext.Current.Session["pagenumber"]))
                                            {
                                                //nameValues=(Convert.ToDouble(HttpContext.Current.Session["pagenumber"]) + 1).ToString();%>
                                        <li><a class="next page-numbers paging" page="<%=(Convert.ToDouble(HttpContext.Current.Session["pagenumber"]) + 1) %>" href="javascript:void(0);">Next &rsaquo;</a></li>
                                        <%} %>

                                        <%}%>

                                        <%--<li><span class='page-numbers current'>1</span></li>
                <li><a class='page-numbers' href="#">2</a></li>--%>
                                        <%--<li><a class="next page-numbers" href="">Next &rsaquo;</a></li>--%>
                                        <%}%>
                                    </ul>
                                    <div class="base-woocommerce-result-count">
                                        Showing <%=Convert.ToInt32(HttpContext.Current.Session["pagenumber"])==1?1:(Convert.ToDouble(ConfigurationManager.AppSettings["pageSize"])*Convert.ToInt32(HttpContext.Current.Session["pagenumber"])-Convert.ToDouble(ConfigurationManager.AppSettings["pageSize"]) )+ 1 %> &ndash; <%=Convert.ToInt32(HttpContext.Current.Session["TotalRows"])<( Convert.ToDouble(ConfigurationManager.AppSettings["pageSize"])*Convert.ToInt32(HttpContext.Current.Session["pagenumber"]))?Convert.ToInt32(HttpContext.Current.Session["TotalRows"]):Convert.ToDouble(ConfigurationManager.AppSettings["pageSize"])*Convert.ToInt32(HttpContext.Current.Session["pagenumber"]) %>  of  <%= HttpContext.Current.Session["TotalRows"]!=null?HttpContext.Current.Session["TotalRows"]:0%> results

                                    </div>

                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                        <ProgressTemplate>
                                            <div class="loader_modal">
                                                <div class="Loader_center">
                                                </div>
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                        <div class="clearfix-qube-ezio"></div>
                    </div>

                    <script type="text/javascript">
    

                        function ShowProgress()
                        {
                            document.getElementById('<% Response.Write(UpdateProgress1.ClientID); %>').style.display = "inline";
                        }

                        function HideProgress()
                        {
                            document.getElementById('<% Response.Write(UpdateProgress1.ClientID); %>').style.display = "None";
                        }
    

                    </script>
                    <%--<div id="woo-pagination">
              <ul class='page-numbers'>                  
                <li><asp:Button ID="btnfirst" runat="server" Font-Bold="true" Text="<<" Height="31px" 
                    Width="43px" OnClick="btnfirst_Click"  /></li>
                <li> <asp:Button ID="btnprevious" runat="server" Font-Bold="true" Text="<" Height="31px" 
                    Width="43px" OnClick="btnprevious_Click"  /></li>
                <li><asp:Button ID="btnnext" runat="server" Font-Bold="true" Text=">" Height="31px" 
                    Width="43px" OnClick="btnnext_Click"  /></li>
                   <li><asp:Button ID="btnlast" runat="server" Font-Bold="true" Text=">>" Height="31px"
                    Width="43px" OnClick="btnlast_Click"  /></li>                  
              </ul>
              <div class="base-woocommerce-result-count"> Showing 1&ndash;15 of 26 results</div>
              <div class="clearfix-qube-ezio"></div>
            </div>--%>
                </div>
            </div>
        </div>


        <div id="sidebar" class="vc_col-md-3 vc_col-xs-12 vc_col-sm-12">
            <div id="woocommerce_price_filter-3" class="sidebar-item widget woocommerce widget_price_filter">
                <h6 class="widget-title">Filter by price</h6>
                <div class="price_slider_wrapper">
                    <div class="price_slider" style="display: none;"></div>
                    <div class="price_slider_amount">
                        <input type="text" id="min_price" name="min_price" value="" data-min="0" placeholder="Min price" />
                        <input type="text" id="max_price" name="max_price" value="" data-max="500" placeholder="Max price" />
                        <div class="price_label" style="display: none;">
                            Price: <span class="from" name="lowprice"></span>&mdash; <span class="to" name="highprice"></span>
                        </div>
                        <%-- <asp:UpdatePanel ID="updatePanel2" runat="server">
                            <ContentTemplate>--%>
                        <asp:Button ID="btnfilter" runat="server" Text="Filter" OnClick="btnfilter_click" CssClass="wpcf7-form-control wpcf7-submit btnfilter" />
                        <%--<input type="button" name="btnFilter" value="Filter" class="Filter button btn btn-save-add" /> --%>
                        <%--</ContentTemplate>--%>
                        <%--<Triggers>
                                <asp:PostBackTrigger ControlID="btnfilter" />
                            </Triggers>--%>
                        <%--</asp:UpdatePanel>--%>
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

            <div class="sidebar-divider-qube"></div>
            <div id="woocommerce_product_categories-5" class="sidebar-item widget woocommerce widget_product_categories">
                <h6 class="widget-title">Product Categories</h6>
                <ul class="product-categories">
                    <%
                        foreach (var cat in categoryList)
                        {%>
                      <% if (cat.CATEGORYID != 59)
                          {%> 
                     <li class="cat-item cat-item-84">
                        <a href="ProductList.aspx?catid=<%=cat.CATEGORYID %>"><%=cat.CATEGORYNAME%>                 
                        </a>
                    </li>                    
                    <%}
                       %>
                 <% else
                     {%>
                    <li class="cat-item cat-item-84">
                        <a href="brands.aspx?catid=<%=cat.CATEGORYID %>"><%=cat.CATEGORYNAME%>                 
                        </a>
                    </li>    
                    
                     <%}
                     %>

                   
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

    <%-- </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="MainUpdatePanel">
        <ProgressTemplate>
            <div class="loader_modal">
                <div class="Loader_center">
                    <img alt="" src="assets/images/Image_Loader1.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>--%>
    <%--<script type="text/javascript">
        jQuery(document).ready(function(){        
            jQuery('.btnfilter').click(function () {              
              //var p1=  jQuery('#min_price').val();
              //var p2 = jQuery('#max_price').val();             
              //jQuery('#min_price').val(p1);
              //jQuery('#max_price').val(p2);            
        });  
    });
        </script>--%>
    <%--<script type="text/javascript">
        jQuery('.Filter').click(function () {
           
           // alert("hi");
            var p1=  jQuery('#min_price').val();
            var p2 = jQuery('#max_price').val();             
            jQuery('#min_price').val(p1);
            jQuery('#max_price').val(p2);
            var URL = window.location.origin + window.location.pathname + '/buttonfilter';
            jQuery.ajax({
                type: "POST",
                url: URL,//+"/Addtocart",
                contentType: "application/json; charset=utf-8",
               // data: dataString,//"{value:'"+pr_code+"'}",
                dataType: "json",
                success: function (response) {
                    //jQuery("span#count").text(response.d);
                    //var x = jQuery.parseJSON(response.d);
                    alert(response.d)
                    location.reload();
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        });
        </script>--%>

    <script type="text/javascript">
        jQuery(document).delegate('.paging', 'click', function (ele) {

            //jQuery('.se-pre-con').show();
            ShowProgress();

            param = getParameterByName('param');
            if (getParameterByName('catid') == null)
            {
                catId = getParameterByName('CatId');
            }
            else
            {
                catId = getParameterByName('catid');
            }
            //catId = getParameterByName('catid');
            Search = getParameterByName('Search');
            //alert(jQuery(this).attr('page'));
            var p1 = jQuery('#min_price').val();
            var p2 = jQuery('#max_price').val();
            var page=jQuery(this).attr('page');
            jQuery('#min_price').val(p1);
            jQuery('#max_price').val(p2);
            var URL = window.location.origin + window.location.pathname + '/Paging';
            jQuery.ajax({
                type: "POST",
                url: URL,//+"/Addtocart",
                contentType: "application/json; charset=utf-8",
                data: "{value:'" + jQuery(this).attr('page') + "',param:'" + param + "',CatId:'" + catId + "',search:'" + Search + "'}",
                dataType: "json",
                success: function (response) {
                    //jQuery("span#count").text(response.d);
                    //var x = jQuery.parseJSON(response.d);
                   // alert(response.d.length);
                    products(response.d);
                    // location.reload();
                    CreatePaging(response.d[response.d.length-1].ACTIVE);
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        });


        function getParameterByName(name, url) {
            if (!url) {
                url = window.location.href;
            }
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }
        //-------------------------------------------------------------------------------------------------
        function products(product)
        {

            var cusType=jQuery('.user-account').attr('custype');
            var IsSpecial = jQuery('.user-account').attr('IsSpecial');
           // alert("CUSTYPE:"+cusType + "IS Special :" +IsSpecial);
            var str = '';
            if (product.length == 0)
            {
                jQuery('#Label1').Text("No Record Foud");
            }
            else
            {
                for (var i=0;i<product.length-1;i++){
                    str+='<li>';
                    str+='<div>'
                    str+='<div class="shop-container-pro hover-shop-layout" style="width: 200px; height: 200px" align="center">'
                    str+='<a href="productDetail.aspx?prod_cd='+product[i].PROD_CD+'">'
                    str+='<div class="overlay-container-shop-pro overlay-image-shop-pro">'
                    str+='<a href="productDetail.aspx?prod_cd='+product[i].PROD_CD+'">'
                    str+='<img src="'+product[i].LARGEPIC+'" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="" srcset="'+product[i].LARGEPIC+'" sizes="(max-width: 750px) 100vw, 750px" />'
                    str+='<img src="'+product[i].LARGEPIC+'" class="secondary-image-shop-pro" alt="" />'
                    str+='</a>'
                    str+='<div class="add-to-cart-overlay top-products-hover">'
                    str+='<a href="productDetail.aspx?prod_cd='+product[i].PROD_CD+'" class="shop-perma-icon">'
                    str+='<i class="fa fa-eye"></i></a>'
                    str+='<a href="javascript:void(0);" onclick="AddToCart("' + product[i].PROD_CD + '");" class="shop-perma-icon right-perma-icon"><i class="icon-cart"></i></a>'
                    str+='</div>'
                    str+='</div>'
                    str+='<a href="productDetail.aspx?prod_cd='+product[i].PROD_CD+'">'
                    str+='<div class="shop-overlay-content">'
                    str+='<div class="shop-overlay-centered">'
                    str+='</div>'
                    str+='</div>'
                    str+='</a>'
                    str+='<div class="add-to-cart-base-index">'
                    str+='</a>'
                    str+='<a rel="nofollow" href="index335b.html?add-to-cart=1773" data-quantity="1" data-product_id="1773" data-product_sku="1001" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>'
                    str+='<div class="clearfix-qube-ezio"></div>'
                    str+='</div>'
                    str+='</div>'
                    str+='<div class="specification_product" style="margin-left: 60px; text-align: justify">'
                    str+='<a href="productDetail.aspx?prod_cd='+product[i].PROD_CD+'">'
                    str+='<div class="shop-overlay-content">'
                    str+='<div class="shop-overlay-centered">'
                    str+='<h6 class="shop-title-index">'+product[i].PROD_CD+'</h6>'
                    str+='<%--  <h5><%=i.PROD_CD %></h5>     --%>'
                        str+='</div>'
                        str+='</div>'
                        str+='</a>'
                        if (cusType != "1")
                        { 
                            str+='<p style="margin: 0px;"><span class="amount">Retail: &#36; '+product[i].RETAIL_PRS+'</span></p>';
                        }
                        else
                        { 
                            str+='<p style="margin: 0px;"><span class="amount">&#36;'+product[i].RETAIL_PRS+'</span></p>';
                        }
                        if (cusType == "3")
                        { 
                            str+='<p style="margin: 0px;"><span class="amount">Dealer: &#36;'+ product[i].WHOLE_PRS +'</span></p>';
                            if (IsSpecial == "1")
                            {
                                if (product[i].WHOLE_PRS != product[i].FinalPrice && product[i].FinalPrice != 0)
                                {
                                    str+='<p style="margin: 0px;"><span class="amount">Special: &#36;'+ product[i].FinalPrice +'</span></p>';
                                }
                            }
                        } 
                    <%--<p style="margin:0px;"><span class="amount"><%= i.MINSTOCK%></span></p>--%>
                        if (cusType == "3")
                        { 
                            str+=' <p style="margin: 0px;"><span class="amount">'+ product[i].MINSTOCK+'</span></p>'
                        } 
                        str+=' </div>'
                        str+='  </li>'
                           
                    } 
                }
                jQuery('ul.products').empty();
                jQuery('ul.products').append(str);
                CreatePaging();
            }
        function CreatePaging(page)
            {
                
                var TotalRow=jQuery('div.PageDetail').attr('totalRows');
                var PageSize=12;
                var PageNumber = parseInt(page);//jQuery('div.PageDetail').attr('currentPage');
//var currentPage=
                var totalPage = jQuery('div.PageDetail').attr('totalPage');
            var n = 1;
            var str='';
            var startnum = totalPage > 5 ? 5 < PageNumber ? PageNumber : 5 : totalPage;
            if (PageNumber >= startnum && startnum != 1 && totalPage != startnum)
            {
                n = startnum - 1;
            }
            else
            {
                n = startnum - 4;
            }

            if (n <= 0)
            {
                n = 1;
            }

            startnum = startnum + 3 < totalPage ? startnum + 3 : totalPage;
            if (n == 1 && startnum > 5)
            {
                startnum = 5;
            }
            for (var i = n; i <= startnum; i++)
            {
                //var nameValues = HttpUtility.ParseQueryString(Request.QueryString.ToString());


                nameValues=i;

                if (PageNumber > 1 && i == n)
                {
                    nameValues=PageNumber - 1;
                    str += '<li><a class="paging next page-numbers" page="' + nameValues + '" href="javascript:void(0);">&lsaquo; Previous </a></li>'
                }
                nameValues= i;
                if(PageNumber==i)
                {
                    str+='<li><a class="paging page-numbers current" page="'+i+'" href="javascript:void(0);">'+i+'</a></li>'
                }
                else
                {
                    str+='<li><a class="paging page-numbers " page="'+i+'" href="javascript:void(0);">'+i+'</a></li>'
                }
                                            
                if (i == (startnum) && totalPage != PageNumber)
                {
                    nameValues=PageNumber + 1;
                    str+='<li><a class="next page-numbers paging" page="'+nameValues+'" href="javascript:void(0)">Next &rsaquo;</a></li>'
                } 

            }
            jQuery('ul.Page-for li').remove();
            jQuery('ul.Page-for div.PageDetail').after(str);

            
            str = 'Showing '+(((PageNumber*PageSize)-PageSize)+ 1) +' &ndash; '
            if (TotalRow < (PageSize * PageNumber)) {
                str += TotalRow + ' of ' + TotalRow + ' results';
            } else {
                str += (PageSize * PageNumber) + ' of ' + TotalRow + ' results';
            }

            jQuery('div.base-woocommerce-result-count').empty().append(str);
            //jQuery('.se-pre-con').hide();
            HideProgress();
        }
    </script>




</asp:Content>
