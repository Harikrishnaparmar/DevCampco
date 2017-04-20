<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Campco.Common.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="clearfix-qube-ezio"></div>
    <div id="content-qube">
        <div style="text-align: center">
            <h3>Update Tracking information for Orders</h3>
        </div>
        <div class="width-container-qube">
            <div class="order-wrap">
                <div>
                    <p>
                        <label></label>
                        <%--<input type="text" id="txtcusID" />--%>
                    </p>
                    <p class="form-row form-row" >
                      <label for="txtLname" class="">Please enter customer id or Order number to filter.</label>
                        <input type="text"  class="input-text " id="txtcusID" placeholder="Please enter customer id or order number" />
                    </p>
                    <p class="form-row form-row" >
                      <%--<input type="text" class="input-text " name="LastName" id="billing_last_name" placeholder=""  value=""  />--%>
                        <input type="button" value="Search" id="btnFilter" />
                    </p>
                    <%--<p>
                        <input type="button" class="'button" value="Search" id="btnFilter" />
                    </p>--%>
                </div>
                <div class="invoice-dealer">
                    <%--<h2>My Orders - <%=cus_type == 1 ? "Consumer" : "Dealer"%></h2> --%>
                    <%--<table id="invoicedelar">
                        <thead>
                            <tr>
                                <%--<th>No#</th>--%
                                <th>Customer ID#</th>
                                <th>Order#</th>
                                <th>Date</th>
                                <%--<th>PO#</th>--%
                                <th>Total</th>
                                <th>Invoice#</th>
                                <th>Tracking#</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>--%>
                </div>


                <div id="iteanid" class="simplePopup">
                    <div class="invoicedetails">
                        <table>
                            <thead>
                                <tr>
                                    <th class="service">ITEM#</th>
                                    <th class="desc">DESCRIPTION</th>
                                    <th>QTY</th>
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

    <!-- #content-qube -->
    <script type='text/javascript' src="assets/js/paging.js"></script>
    <script type="text/javascript">

        jQuery(document).ready(function () {
            jQuery(document).delegate('.Save', 'click', function () {
                var index = jQuery(this).attr("index");
                var ele = jQuery(this);
                var cus_id = jQuery(jQuery(this).parents('tr')).find('.CUS_ID').text();
                var invs_num = jQuery(jQuery(this).parents('tr')).find('.invs_num>a[index=' + index + ']').text().trim();//jQuery(jQuery(this).parents('tr')).find('input[name=addInvoice]').val();//Order
                var ord_num = jQuery(jQuery(this).parents('tr')).find('.Order').text();
                var tracking_id = jQuery(jQuery(this).parents('tr')).find('input[name=addTracking]').val();
                if (tracking_id == "") {
                    alert("Enter tracking id");
                    return;
                }
                //var dataString = "{number:'" + number + "',param:'" + param + "'}";


                // alert(dataString);
                // updateTracking(cus_id, invs_num, ord_num, tracking_id);


                var URL = window.location.origin + window.location.pathname + '/UpdateINVOICEDetails';
                var dataString = "{cus_ID:'" + cus_id + "',invs_num:'" + invs_num + "',ord_num:'" + ord_num + "',trackID:'" + tracking_id + "',param:'" + 1 + "'}";//string cus_ID, int invs_num, int ord_num, string trackID, int param
                //jQuery('.se-pre-con').show();
                jQuery.ajax({
                    type: "POST",
                    url: URL,//+"/Addtocart",
                    contentType: "application/json; charset=utf-8",
                    data: dataString,//"{value:'"+pr_code+"'}",
                    dataType: "json",
                    success: function (response) {
                        //alert(response.d)
                        if (response.d == "1") {
                            // alert(ele)
                            jQuery(ele).hide();
                            //jQuery(jQuery(ele).parents('tr')).find('.Edit').show();
                            //jQuery(jQuery(ele).parents('tr')).find('.invs_num').text(jQuery(jQuery(ele).parents('tr')).find('input[name=addInvoice]').val());
                            jQuery(jQuery(ele).parents('tr')).find('.tracking >span.' + ele.attr('index')).text(jQuery(jQuery(ele).parents('tr')).find('input[name=addTracking]').val());
                            jQuery('.se-pre-con').hide();
                        }
                        else if (response.d == "2") {
                            alert("Email is not available for this customer.");
                            jQuery('.se-pre-con').hide();
                        }
                        else if (response.d == "2") {
                            alert("Email is not found in Order for this customer.");
                            jQuery('.se-pre-con').hide();
                        }
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });

            });
            jQuery(document).delegate('.clickitem', 'click', function () {
                var num = jQuery(this).text();
                InvoiceDetail(num, 3);
                //jQuery('#iteanid').simplePopup();
            });
            //jQuery('.clickitem').click(function () {

            //    });

            jQuery(document).delegate('.Order','click',function () {
                var num = jQuery(this).text();
                Detail(num, 2);
                // jQuery('#iteanid').simplePopup();
            });

        });

    </script>


    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery('#invoicedelar').paging({ limit: 30 });
            jQuery('.Save').hide();


            jQuery("#txtcusID").keyup(function (event) {
                if (event.keyCode == 13) {
                    TrackingInfo(jQuery('#txtcusID').val());
                }
            });


        });

        jQuery(document).delegate('.Edit','click',function (element) {
            var x = jQuery(this).parents('tr');
            //if (jQuery(this).text() == "Edit") {
            var index = jQuery(this).attr("index");
            //alert(index);
            var invs = jQuery(jQuery(this).parents('tr')).find('.invs_num>a[index=' + index + ']').text().trim();
            var track = jQuery(jQuery(this).parents('tr')).find('.tracking>span.' + index).text().trim();
            ///alert(invs+','+track);
            //jQuery(jQuery(this).parents('tr')).find('.invs_num>a[index=' + index + ']').text('').append('<input name="addInvoice" index="'+index+'"  class="addInvoice"/>');
            jQuery(jQuery(this).parents('tr')).find('.tracking>span.' + index).text('').append('<input name="addTracking" index="' + index + '" class="addTracking"/>');
            jQuery(this).hide();
            jQuery(jQuery(this).parents('tr')).find('.Save[index=' + index + ']').show();
            //jQuery(jQuery(this).parents('tr')).find('td.invs_num input[index=' + index + ']').val(invs);
            jQuery(jQuery(this).parents('tr')).find('td.tracking input[index=' + index + ']').val("");
            // }
            //  else
            //   {
            //      return;
            //   }
        });

        //Save
        //jQuery('.save').delegate
        //end save

        function Detail(number, param) {
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
                    str += '<h4>Details of Order# ' + number + '</h4>'
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
                    <% if (cus_type == 3)
        { %>
                    str += '<tr><td colspan="4">Dropship Fee &amp; HANDLING</td><td class="total">$' + response.d[0].HANDL_FEE + '</td></tr>';
                    <%}
        else
        {%>
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
    //
    function updateTracking(cus_id, invs_num, ord_num, tracking_id) {
        var URL = window.location.origin + window.location.pathname + '/UpdateINVOICEDetails';
        var dataString = "{cus_ID:'" + cus_id + "',invs_num:'" + invs_num + "',ord_num:'" + ord_num + "',trackID:'" + tracking_id + "',param:'" + 1 + "'}";//string cus_ID, int invs_num, int ord_num, string trackID, int param

        jQuery.ajax({
            type: "POST",
            url: URL,//+"/Addtocart",
            contentType: "application/json; charset=utf-8",
            data: dataString,//"{value:'"+pr_code+"'}",
            dataType: "json",
            success: function (response) {
                alert(response.d)
                if (response.d == "1") {
                    jQuery(this).hide();
                    jQuery(jQuery(this).parents('tr')).find('.Edit').show();
                    jQuery(jQuery(this).parents('tr')).find('.invs_num').text(jQuery(jQuery(this).parents('tr')).find('input[name=addInvoice]').val());
                    jQuery(jQuery(this).parents('tr')).find('.tracking').text(jQuery(jQuery(this).parents('tr')).find('input[name=addTracking]').val());
                }
                else if (response.d == "2") {
                    alert("Email is not available for this customer.");
                }
                else if (response.d == "2") {
                    alert("Email is not found in Order for this customer.");
                }
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    }
    //

    function InvoiceDetail(number, param) {
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
                    <% if (cus_type == 3)
        { %>

                    str += '<tr><td colspan="4">Dropship Fee &amp; HANDLING</td><td class="total">$' + response.d[0].HANDL_FEE + '</td></tr>';

                    <%}
        else
        {%>
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


        jQuery('#btnFilter').click(function () {
            if (jQuery('#txtcusID').val() == "") {
            return;
        }
            TrackingInfo(jQuery('#txtcusID').val());
    });




    function TrackingInfo(value) {
      //  alert('hi  ' + value);
        var dataString = "{value:'" + value + "'}";
        var URL = window.location.origin + window.location.pathname + '/filter';
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
                jQuery(".invoice-dealer").empty();
                str += '<table id="invoicedelar">'
                str += '<thead><tr>';
                str += '<th>Customer ID#</th>';
                str += '<th>Order#</th>';
                str += '<th>Date</th>';
                str += '<th>Total</th>';
                str += '<th>Invoice#</th>';
                str += '<th>Tracking#</th>';
                str += '<th>Action</th>';
                str += '</thead>';
                if (response.d.length > 0) {
                    str+='<tbody>';
                    for (var i = 0; i < response.d.length; i++) {
                        str += '<tr>';
                        str += '<td class="CUS_ID">' + response.d[i].Cus_Id + '</td>';
                        str += '<td class="ord_num"><a href="javascript:void(0);" class="Order">' + response.d[i].ORD_NUM + '</a></td>';
                        str += '<td class="Ord_DT">' + response.d[i].ORD_DT + '</td>';
                        str += '<td class="Amount">$' + response.d[i].ORD_AMT + '</td>';
                        str += '<td class="invs_num">';
                        //Invoice <td>
                        if (response.d[i].INVS_NUM != null) {
                            var a = 0;
                            jQuery.each(response.d[i].INVS_NUM, function (i, value) {
                                a++;
                                if (value != 0) {
                                    str += '<a href="javascript:void(0);" index="' + a + '" class="clickitem" id="' + value + '">' + value + '</a>';
                                }
                            });

                        }
                        //Invoice </td>
                        str += '</td>';
                        str += '<td class="tracking">';
                        //tracking <td>
                        if (response.d[i].INVS_NUM != null) {
                            var a = 0;
                            jQuery.each(response.d[i].Traking, function (i, value) {
                                a++;
                                if (i != '') {
                                    str += '<span class="'+a +'">'+value+'</span>';
                                } else {
                                    str += '<span class="'+a+'">Add Tracking Id</span>';
                                }

                            });

                        }
                        //tracking <td>
                        str += '</td>';
                        str += '<td  class="actions">';
                        //action <td>

                        if (response.d[i].INVS_NUM != null) {
                            var a = 0;
                            jQuery.each(response.d[i].Traking, function (i, value) {
                                a++;
                                if (value == '') {
                                    str += '<a href="javascript:void(0);" class="Edit" index="'+a+'" name="'+value +'">Edit</a>';
                                    str += '<a href="javascript:void(0);" class="Save" index="' + a + '" name="' + value + '">Save</a>';

                                } 

                            });

                        }

                        //action </td>
                        str += '</td>';
                        str += '</tr>';
                        
                    }
                }
                else {
                    str += 'No record found.';
                }
                
                
                str += '';
                str += '</tbody></table>';
                // jQuery("span#count").text(qty)
                jQuery(".invoice-dealer").append(str);
                //jQuery('#iteanid').simplePopup();
                jQuery('#invoicedelar').paging({ limit: 30 });
                jQuery('.Save').hide();

            },
            failure: function (response) {
                alert(response.d);
            }
        });
    }



    </script>
</asp:Content>
