<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CampcoCommon.Master" AutoEventWireup="true" CodeBehind="Thankyou.aspx.cs" Inherits="Campco.Common.Thankyou" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<img src="../Pic/increase-sales.jpg" />--%>

    <div id="page-title-qube" class="page-title-qube default-page-title">
    <div class="width-container-qube fade-header-qube">
      <div class="page-tite-left-qube">
        <h1 class="entry-title-qube-ezio">Thank You</h1>
      </div>        
      <%--<div id="sharecrumb-qube-container"> <a href="#" class="dot-irecommendthis" id="dot-irecommendthis-85" title="Recommend this"><span class="dot-irecommendthis-count">0</span> <span class="dot-irecommendthis-suffix"></span></a>
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
            <a href="" title="Share on E-mail" class="tooltip mail-share" target="_blank"><i class="fa fa-envelope"></i></a> </span>
          </div>
        </div>
      </div>--%>
      <div class="clearfix-qube-ezio"></div>
    </div>
  </div>
    
    
    
    <div id="content-qube">
       <div class="width-container-qube">
          <div class="page-content-pro">
              <div class="thankyou-wrap">
                  <div class="vc_col-md-12"><h2 class="yourorder">Your Order Confirmation</h2></div>
                  <div class="vc_col-md-8" id="thanku-1">
                      <p>Dear <%=CustomerName %></p>     
                      <p>Thank you for ordering from campco.com! We're sending this email to confirm your Order. We'll start working on getting it out to you as soon as possible!</p>
                  </div>
                  <div class="vc_col-md-4" id="thanku-1">
                       <span class="redtext">Order Number #:<%=orderNumber %></span>
                       <span><strong>Order Date:</strong> <%=Time %></span>
                  </div>
                  
                  <%--<div class="vc_col-md-6">
                    <strong>Shipped To:</strong>
                     <p>Attn: Receiving <br> David Nathan <br> Campco <br> 4625 W Jefferson Bivd <br> Las Angeles <br> US 90018 <br> United States</p>
                  </div>
                  
                  <div class="vc_col-md-6">
                    <strong>Billed To:</strong>
                     <p>David Nathan <br> Campco <br> 4625 W Jefferson Bivd <br> Las Angeles <br> US 90018 <br> United States</p>
                  </div>--%>
                  
                  
                  <div class="vc_col-md-12" id="thanku-2">
            
                      <table border="0" id="invoiceitems">
                        <thead>
                            <tr>            
                                <td><h5>Description</h5>
                                </td>
                                <td><h5>Qty</h5>
                                </td>
                                <td><h5>Price</h5>
                                </td>
                                <td><h5>Item Total</h5>
                                </td>          
                            </tr>
                        </thead>   
                           
                        <tbody>
                             <%if (Products != null){foreach (var item in Products){%> 
                            <tr>
                                <td>
                                    <img src="<%=item.SMALLPIC%>">
                                    <div class="content-check">
                                        <a href="productDetail.aspx?prod_cd=<%=item.PROD_CD %>"><%=item.PROD_CD %></a>
                                        <p><%=item.DESCRIP %></p>
                                    </div>
                                </td>
                                <td>
                                    <p><%=item.QTYinCart %></p>
                                </td>
                                <td>
                                    <p>$<%=Convert.ToDouble(item.RETAIL_PRS).ToString("0.00") %></p>
                                </td>
                                <td>
                                    <p>$<%=Convert.ToDouble(item.RETAIL_PRS * item.QTYinCart).ToString("0.00") %></p>
                                </td>
                            </tr>
                            <%}} %>
                            
                            <tr>
                                <td class="thick-line"></td>
                                <td class="thick-line"></td>
                                <td class="thick-line text-center"><strong>Sub Total:</strong></td>
                                <td class="thick-line text-right">$<%=subtotal.ToString("0.00") %></td>
                            </tr>
                            <%if (custype == 3)
                                {
                                    if (drop > 0)
                                    {%>
                            <tr>
                                <td class="no-line"></td>
                                <td class="no-line"></td>
                                <td class="no-line text-center"><strong>Drop Ship Fee:</strong></td>
                                <td class="no-line text-right">$3.00</td>
                            </tr>

                            <%}
    }
    else
    {
        if (shippingCharge > 0)
        {%>
                            <tr>
                                <td class="no-line"></td>
                                <td class="no-line"></td>
                                <td class="no-line text-center"><strong>Shipping Charge :</strong></td>
                                <td class="no-line text-right">$<%=shippingCharge.ToString("0.00") %></td>
                            </tr>
                            <%}
    } %>
                            <tr>
                                <td class="no-line"></td>
                                <td class="no-line"></td>
                                <td class="no-line text-center total-border"><strong>Grand Total:</strong></td>
                                <td class="no-line text-right total-border">$<%=total.ToString("0.00")%></td>
                            </tr>
                            
                        </tbody>
                                                    
                    </table>
                      
                  </div> 
                  
                  
                  <div class="vc_col-md-12" >
                    
                      <div class="vc_col-md-6" id="thanku-3">
                        <h5>Ship To:</h5>
                          <p><%=Address.firstName +" "+ Address.lastName %></p>
                          <p><%=Address.address%></p>
                          <p><%=Address.city+","+Address.state+"-"+Address.zip %></p>
                          <p><%=Address.country %></p>
                          <p><%=Address.email %></p>
                          <p><%=Address.phoneNumber %></p>
                      </div>
                      
                      <%--<div class="vc_col-md-6" id="thanku-3">
                        <h5>Do you have any more informarion about my products?</h5>
                          <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>
                      </div>--%>
                  
                  </div>
                  
                  <div class="vc_col-md-12" >
                                          
                      <div id="thanku-4">
                            <p class="margin-btm">Sincerely,</p>
                            <p>Campco</p>
                            <p><!--campco@gmail.com-->service@campco.com</p>
                            <a href="www.campco.com">www.campco.com</a>

                            <div class="custinfo">
                                <div class="orderdetails">
                                    <p><strong>Phone:</strong> 323-766-2555 </p>
                                    <p>Customer Service Hours</p>
                                    <p><!--<strong>Int.Cals:</strong>--> 8AM - 4PM PST Mon-Thurs, 7AM - 12PM PST Fri.</p>
                                    <p><strong>Fax:</strong> 323-766-2424</p>
                                    <!--<p>7PM CST Man-Fri</p>-->
                                </div>
                            </div>


                            <div class="privacy-expert">
                                <a href="#">Privacy Policy</a>
                                <a href="#">Expert Policy</a>
                            </div>

                        </div>
                    
                  
                  </div>  
                  
              </div>                        
          </div>
        </div>          
    </div>       
     
    <div class="vc_row-full-width vc_clearfix"></div>
                    

  </div>
</asp:Content>
