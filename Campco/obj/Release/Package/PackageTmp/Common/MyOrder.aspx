<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="MyOrder.aspx.cs" Inherits="Campco.Common.MyOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style> 
  .navigation_MyProfile ul 
    { margin: 1px,0px,2px,0px; padding: 0px; list-style-type: none; text-align: left; 

} 
    .navigation_MyProfile ul li { display:inline-table; } 
    .navigation_MyProfile ul li a {     text-decoration: none;
    padding: .1em 1em;
    color: black;
    background-color: #dfdfdf;
    border: 1px solid black;
    padding: 15px 40px;
    border-radius: 7px 7px 0 0px; } 
    .navigation_MyProfile ul li a:hover { background-color: #436dc1; color: #fff; } </style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-title-qube" class="page-title-qube default-page-title">
    <div class="width-container-qube  fade-header-qube">
         <div  class="navigation_MyProfile">
          <%--      <ul class="tabs wc-tabs">--%>
            <ul>
                  <li> <a href="UpdateMyProfile.aspx">Profile</a> </li>
                   <li>  <a href="MyOrder.aspx">Orders</a></li>
                   <li>  <a href="MyCard.aspx">Payment Information</a> </li>
                  <li>  <a href="MyShippingAddress.aspx">Addresses</a> </li>
                 <%-- <li class="additional_information_tab"> <a href="#tab-additional_information">Additional Information</a> </li>--%>
                </ul>
           <%--   </div>--%>
              </div>
      <div class="page-tite-left-qube">
   <%--     <h1 class="entry-title-qube-ezio">My Profile</h1>--%>
    <%--  <div id="woocommerce-post-page">--%>
          <%--    <div class="woocommerce-tabs wc-tabs-wrapper">--%>
       
      <div class="clearfix-qube-ezio"></div>

          
    </div>  
         </div>
    </div>
  <!-- #page-title-qube -->
    
    
    
    
  
  <div id="content-qube">
    <div class="width-container-qube">
        <div class="order-wrap">

          <div class="invoice-dealer">              
          <h2>My Orders - <%=cus_type == 1 ? "Consumer" : "Dealer"%></h2>  
          <table id="invoicedelar">
            <thead>
              <tr>
                <%--<th>No#</th>--%>
                <th>Order#</th>
                <th>Date</th>
                <th>PO#</th>
                <th>Total</th>
                <th>Invoice#</th>
                <th>Tracking#</th>
              </tr>
            </thead>
            <tbody>
                <%if (OrderDetailList.Count > 0)
                    {
                        int x = 0;
                        foreach (var item in OrderDetailList)
                        { x+= 1;%>
              <tr>
               <%--<td><%=x %></td>--%>
                <td><a href="javascript:void(0);" class="Order"><%=item.ORD_NUM %></a></td>
                <td><%=item.ORD_DT %></td>
                <td><%=item.PO_NUM %></td>
                <td>$<%=Convert.ToDouble(item.ORD_AMT).ToString("00.00")%></td>
                <td>
                    <%if (item.INVS_NUM != null)
    {
        foreach (var i in item.INVS_NUM)
        {
            if (Convert.ToInt32(i) != 0)
            { %>
                  <a href="javascript:void(0);" class="clickitem" id="<%=i %>"><%=i %></a>
                  
                    <%}
        }
    }%>
                </td>

                <td>
                    
                    <%if (item.INVS_NUM != null)
    {
        foreach (var i in item.Traking)
        {  if (i != "")
            {%>
                  <span><%=i %></span>                                
                  
                    <%}
        }
    } %>                   
                </td>                
              </tr>
                <%}
    } %>
             <%-- <tr>
                <td><a href="">124</a></td>
                <td>11/29/2016</td>
                <td>P123</td>
                <td>50,000</td>
                <td>
                  <a href="javascript:void(0);" class="clickitem">INV1</a>                  
                </td>
                <td>
                    <span>T123</span>                    
                </td>                
              </tr>

              <tr>
                <td><a href="">126</a></td>
                <td>11/29/2016</td>
                <td>P123</td>
                <td>50,000</td>
                <td>
                  <a href="javascript:void(0);" class="clickitem">INV1</a>                  
                </td>
                <td>
                    <span>T123</span>
                </td>                
              </tr>  

              <tr>
                <td><a href="">255</a></td>
                <td>11/29/2016</td>
                <td>P123</td>
                <td>50,000</td>
                <td>
                  <a href="javascript:void(0);" class="clickitem">INV1</a>                  
                </td>
                <td>
                    <span>T123</span>
                </td>                
              </tr>  

              <tr>
                <td><a href="">128</a></td>
                <td>11/29/2016</td>
                <td>P123</td>
                <td>50,000</td>
                <td>
                  <a href="javascript:void(0);" class="clickitem">INV1</a>                  
                </td>
                <td>
                    <span>T123</span>
                </td>                
              </tr>  

              <tr>
                <td><a href="">155</a></td>
                <td>11/29/2016</td>
                <td>P123</td>
                <td>50,000</td>
                <td>
                  <a href="javascript:void(0);" class="clickitem">INV1</a>                  
                </td>
                <td>
                    <span>T123</span>
                </td>                
              </tr> --%>                                                       



            </tbody>
          </table>
          </div>







      <div id="iteanid" class="simplePopup">
        <div class="invoicedetails">
            <table>
            <thead>
              <tr>
                <th class="service">ITEM#</th>
                <th class="desc">DESCRIPTION</th>                
                <th>SHIPPED QTY</th>
                <th>PRICE</th>
                <th>EXT.AMOUNT</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="service">UZI-K</td>
                <td class="desc">Knife</td>
                <td class="unit">5</td>
                <td class="qty">12.5</td>
                <td class="total">60-00</td>
              </tr>
              <tr>
                <td class="service">HMV</td>
                <td class="desc">Watch</td>
                <td class="unit">1</td>
                <td class="qty">200</td>
                <td class="total">200-00</td>
              </tr>
                         
              <tr>
                <td colspan="4">SALE AMOUNT</td>
                <td class="total">260.00</td>
              </tr>
              <tr>
                <td colspan="4">TAX (%)</td>
                <td class="total">8.0</td>
              </tr>
               <tr>
                <td colspan="4">SHIPPING &amp; HANDLING</td>
                <td class="total">50.0</td>
              </tr>
              <tr>
                <td colspan="4" class="grand total">TOTAL AMOUNT</td>
                <td class="grand total">318.00</td>
              </tr>
            </tbody>
            </table>
            <div>NO Detail Available.</div>
          </div>  
        </div>    

    </div>
  </div>
</div>  
<!-- close .width-container-qube -->
</div>
<!-- #content-qube -->
    <script type='text/javascript' src="assets/js/paging.js"></script>
    <script type="text/javascript">

        jQuery(document).ready(function () {

            jQuery(document).delegate('.clickitem', 'click', function () {
                var num = jQuery(this).text();
                InvoiceDetail(num, 3);
                //jQuery('#iteanid').simplePopup();
            });
    //jQuery('.clickitem').click(function () {
        
    //    });

        jQuery('.Order').click(function () {
            var num = jQuery(this).text();
            Detail(num,2);
           // jQuery('#iteanid').simplePopup();
        });
        
});

</script>


    <script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#invoicedelar').paging({limit:30});
    });

    function Detail(number,param)
    {
        var dataString = "{number:'" + number + "',param:'" + param + "'}";
        var URL = window.location.origin + window.location.pathname + '/GetDetails';
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
                jQuery(".invoicedetails").empty();
                str += '<h4>Details of Order# '+number+'</h4>'
                str += '<table><thead><tr><th class="service">ITEM#</th><th class="desc">DESCRIPTION</th><th>ORDERED QTY</th><th>PRICE</th><th>EXT.AMOUNT</th></tr></thead><tbody>';
                var qty = 0;
                var total = 0;
                var ShippingCharge = 0;
                var cusType = jQuery('.user-account').attr('custype');
                var inter = jQuery('.user-account').attr('international');

                for (var i = 0; i < response.d.length; i++) {
                    str += ' <tr>';
                    str += '<td class="service">' + response.d[i].PROD_CD + '</td>';
                    str += ' <td class="desc">' + response.d[i].DESC + '</td>';
                    str += '<td class="unit">' + response.d[i].ORDER_QTY + '</td>';
                    str += '<td class="qty">&#36;' + response.d[i].UNIT_PRS + '</td>';
                    str += '<td class="total">&#36; ' + (response.d[i].UNIT_PRS * response.d[i].ORDER_QTY).toFixed(2) + '</td>';
                    str += '</tr>';
                    str += '';
                    total += response.d[i].UNIT_PRS * response.d[i].ORDER_QTY;
                    qty += response.d[i].QTYinCart;
                }
                if (cusType == 1) {
                    if (inter > 0) {
                        if (total < 200) {
                            ShippingCharge = 15 + (2 * (response.d.length - 1));
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
                            ShippingCharge = 5 + (1 * (response.d.length - 1));
                        }
                        else {
                            ShippingCharge = 0;
                        }
                    }
                }

                //str += '</tbody><tfoot>';
                str += '<tr>';
                str += '<td colspan="4">SALE AMOUNT</td>';
                str += '<td class="total">$' + total.toFixed(2) + '</td>';
                str += '</tr>';

                total += parseFloat(response.d[0].HANDL_FEE);
                //str += '<tr><td colspan="4">TAX (%)</td><td class="total">' + 0.00 + '</td></tr>';
                if (parseInt(response.d[0].HANDL_FEE) > 0) {
                    <% if (cus_type == 3) { %>
                    str += '<tr><td colspan="4">Dropship Fee &amp; HANDLING</td><td class="total">$' + response.d[0].HANDL_FEE + '</td></tr>';
                    <%}else {%>
                    str += '<tr><td colspan="4">SHIPPING &amp; HANDLING</td><td class="total">$' + response.d[0].HANDL_FEE + '</td></tr>';
                    <%}%>
                }
                str += '<tr><td colspan="4" class="grand total">TOTAL AMOUNT</td><td class="grand total">$' + total.toFixed(2) + '</td></tr>';
                str += '</tbody></table>';
               // jQuery("span#count").text(qty)
                jQuery(".invoicedetails").append(str);
                jQuery('#iteanid').simplePopup();
                //if (response.d.length == 0) {
                //    jQuery('a.checkout-button-header-cart').css("display", "none");
                //}
                //else {
                //    jQuery('a.checkout-button-header-cart').css("display", "inherit");
                //}

            },
            failure: function (response) {
                alert(response.d);
            }
        });
    }

        function InvoiceDetail(number,param)
    {
        var dataString = "{number:'" + number + "'}";
        var URL = window.location.origin + window.location.pathname + '/GetINVOICEDetails';
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
                jQuery(".invoicedetails").empty();
                str += '<h4>Details of Invoice# ' + number + '</h4>'
                str += '<table><thead><tr><th class="service">ITEM#</th><th class="desc">DESCRIPTION</th><th>SHIPPED QTY</th><th>PRICE</th><th>EXT.AMOUNT</th></tr></thead><tbody>';
                var qty = 0;
                var total = 0;
                var ShippingCharge = 0;
                var cusType = jQuery('.user-account').attr('custype');
                var inter = jQuery('.user-account').attr('international');

                for (var i = 0; i < response.d.length; i++) {
                    str += ' <tr>';
                    str += '<td class="service">' + response.d[i].PROD_CD + '</td>';
                    str += ' <td class="desc">' + response.d[i].DESC + '</td>';
                    str += '<td class="unit">' + response.d[i].ORDER_QTY + '</td>';
                    str += '<td class="qty">&#36;' + response.d[i].UNIT_PRS + '</td>';
                    str += '<td class="total">&#36; ' + (response.d[i].UNIT_PRS * response.d[i].ORDER_QTY).toFixed(2) + '</td>';
                    str += '</tr>';
                    str += '';
                    total += response.d[i].UNIT_PRS * response.d[i].ORDER_QTY;
                    qty += response.d[i].QTYinCart;
                }
                if (cusType == 1) {
                    if (inter > 0) {
                        if (total < 200) {
                            ShippingCharge = 15 + (2 * (response.d.length - 1));
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
                            ShippingCharge = 5 + (1 * (response.d.length - 1));
                        }
                        else {
                            ShippingCharge = 0;
                        }
                    }
                }

                //str += '</tbody><tfoot>';
                str += '<tr>';
                str += '<td colspan="4">SALE AMOUNT</td>';
                str += '<td class="total">$' + total.toFixed(2) + '</td>';
                str += '</tr>';

                total += parseFloat(response.d[0].HANDL_FEE);
               // str += '<tr><td colspan="4">TAX (%)</td><td class="total">'+0.00+'</td></tr>';
                if (parseInt(response.d[0].HANDL_FEE) > 0) {
                    <% if (cus_type == 3) { %>

                    str += '<tr><td colspan="4">Dropship Fee &amp; HANDLING</td><td class="total">$' + response.d[0].HANDL_FEE + '</td></tr>';

                    <%}else {%>
                    str += '<tr><td colspan="4">SHIPPING &amp; HANDLING</td><td class="total">$' + response.d[0].HANDL_FEE + '</td></tr>';
                    <%}%>
                }
                str += '<tr><td colspan="4" class="grand total">TOTAL AMOUNT</td><td class="grand total">$' + total.toFixed(2) + '</td></tr>';
                str += '</tbody></table>';
               // jQuery("span#count").text(qty)
                jQuery(".invoicedetails").append(str);
                jQuery('#iteanid').simplePopup();

                //if (response.d.length == 0) {
                //    jQuery('a.checkout-button-header-cart').css("display", "none");
                //}
                //else {
                //    jQuery('a.checkout-button-header-cart').css("display", "inherit");
                //}

            },
            failure: function (response) {
                alert(response.d);
            }
        });
    }
</script>
</asp:Content>
