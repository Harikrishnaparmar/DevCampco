<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/CampcoAdmin.Master" AutoEventWireup="true"  CodeBehind="BrandBanner.aspx.cs" Inherits="Campco.AdminPanel.WebForm2" MaintainScrollPositionOnPostBack="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%-- <script src="../Common/assets/js/jquery-ui.js"></script>
    <script src="../Common/assets/js/validation/additional-methods.min.js"></script>--%>
 
    <style type="text/css">
       
        table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
        }
        table th
        {
            background-color: black;
            color: white;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 6px,12px,6px,12px;
            border: 1px solid #ccc;
            
        }
        .selected
        {
            background-color: #03b4ba;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="page-title-qube" class="page-title-qube default-page-title">
                <div class="width-container-qube fade-header-qube">
                    <div class="page-tite-left-qube">
                        <h1 class="entry-title-qube-ezio">Banner Images Upload</h1>
                    </div>
                    
                    <div class="clearfix-qube-ezio">
                    </div>
                </div>
            </div>      
            <div id="content-qube">
                <div class="width-container-qube">
                    <article id="post-85" class="post-85 page type-page status-publish hentry">
        <div class="page-content-pro">
          
          <div class="wpb_column vc_column_container vc_col-sm-12">
              <div class="vc_column-inner ">
                <div class="wpb_wrapper">
                  <div class="wpb_text_column">
                    <div class="wpb_wrapper">
                      <div role="form" class="wpcf7" id="wpcf7-f101-p85-o1" lang="en-US" dir="ltr">
                        <div class="screen-reader-response"></div>
                            <div class="page-content-pro">
                        <div class="login">                       
                          <div class="form-style-2">
                           <p>

                         <label for="field7"><span>Select Banner Category</span>
                             </label>
                                 <asp:DropDownList ID="ddlCategory" runat="server"  CssClass="select-field" Width="400px" AutoPostBack="true" OnSelectedIndexChanged="ddlimgupl_SelectedIndexChanged" required="required">
                                  </asp:DropDownList>
                               </p>
                              <p>
                         <label for="field7" ><span>Select Banner Position</span>
                             </label>
                                 
                                 <asp:DropDownList ID="ddlbannerposition" runat="server"  CssClass="select-field" Width="400px" AutoPostBack="true" required="required" >                              
                                      <asp:ListItem value="">-----select-----</asp:ListItem>  
                                      <asp:ListItem Value="Header">Header</asp:ListItem>
                                        <asp:ListItem Value="Footer">Footer</asp:ListItem>                                                                
                                      </asp:DropDownList>                            
                               </p>  
                                            
                              <p>
                          <label for="field7" class="label1">
                            <span>Select Banner Images</span></label>
                         <%--  <asp:FileUpload ID="fileuplaod1" runat="server"  ></asp:FileUpload>--%>
                               <asp:FileUpload ID="fupbannerimg" runat="server" CssClass="fupbannerimg" AllowMultiple="true" Font-Bold="true" ToolTip="Ctrl+image.jpg for multiple image selection." Width="385px" />                    
                           <asp:RequiredFieldValidator ErrorMessage="This field is required" ControlToValidate="fupbannerimg"
    runat="server" Display="Dynamic" ForeColor="Red" />
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$"
    ControlToValidate="fupbannerimg" runat="server" ForeColor="Red" ErrorMessage="Only .jpg, .jpeg,.png File"
    Display="Dynamic" />
                                   </p>                        
                       <p>                          
                           <asp:Button ID="btnAdd" runat="server" Text="Add Banner" CssClass="campco-btn button wpcf7-form-control wpcf7-submit btnAdd" OnClick="btnAdd_Click" ></asp:Button>                     
                       </p>
                          </div> 
                            
                            <div class="shop_table_outer">
    <p>
        
        <asp:Label ID="lblmsg" runat="server" Text="* Drag & drop Row with click for Reordering" ForeColor="Red" Visible="false"></asp:Label></p>    
<asp:GridView ID="gvBanner" CssClass="gvBanner" runat="server" AutoGenerateColumns="False"  EmptyDataText="No Record Found." EmptyDataRowStyle-ForeColor="Red"  > 
  
     <Columns>
                    <asp:TemplateField HeaderText="Sr no" ItemStyle-Width="50">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                            <input type="hidden" name="BannerId" value='<%# Eval(" Brand_Banner_Id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" ItemStyle-Width="100" />
                   <%-- <asp:BoundField DataField="Banner_Path" HeaderText="Banner Images" ItemStyle-Width="160" />--%>
                    <asp:TemplateField HeaderText="Banner Images" ItemStyle-Width="100">
                        <ItemTemplate>
                            <img src='../AdminPanel/Images/<%#Eval("Banner_Path") %>' alt="Image Not Avalable" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Banner_Position" HeaderText="Header/Footer Banner" ItemStyle-Width="160" />
                   <%--  <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" ItemStyle-Width="160" />--%>
                     <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="100" />
                   <asp:TemplateField>
                                    <HeaderTemplate>
                                        Active/InActive
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnstatus" runat="server" CausesValidation="false" Font-Underline="true"   ToolTip='<%#Eval("Status").ToString() == "InActive"?"Click Here For Active Banner":"Click Here For InActive Banner" %>'
                                            CommandArgument='<%#Eval("Brand_Banner_Id") +"|" + Eval("Status") %>' onclick="lnkbtnstatus_Click" 
                                          ><%#Eval("Status").ToString() == "InActive"?"InActive":"Active" %></asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp;
                                          </ItemTemplate>
                                </asp:TemplateField>
                </Columns>
            </asp:GridView>
           <br/>
      <asp:Button ID="btnupdate" runat="server" Text="Update Banner" OnClick="btnupdate_Click" CssClass="campco-btn button wpcf7-form-control wpcf7-submit" Visible="false" CausesValidation="false" />
  </div>                        
                          </div>  
                           </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
                </div>            
            <div class="vc_row-full-width vc_clearfix"></div>
  
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>


    <script type="text/javascript">
        jQuery(function () {
            jQuery('.gvBanner').sortable({
                items: 'tr:not(tr:first-child)',
                cursor: 'pointer',
                axis: 'y',
                dropOnEmpty: false,
                start: function (e, ui) {
                    ui.item.addClass("selected");
                },
                stop: function (e, ui) {
                    ui.item.removeClass("selected");
                },
                receive: function (e, ui) {
                    $(this).find("tbody").append(ui.item);
                }
            });
        });
    </script>

                                
   <script type="text/javascript" src="../Common/assets/js/validation/jquery.validate.js"></script>
<script type="text/javascript" src="../Common/assets/js/validation/additional-methods.min.js"></script>
                     
<script type="text/javascript">
  <%--  jQuery(function () {
        jQuery('#<%=fupbannerimg.ClientID %>').change(
            function () {
                var fileExtension = ['jpeg', 'jpg'];
                if (jQuery.inArray(jQuery(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                     alert("Only '.jpeg','.jpg' formats are allowed.");
                
                }
                else {
                   
                } 
            })  
    })--%>

    //jQuery.validator.addMethod("extension", function (value, element) {
    //    if (jQuery.inArray(jQuery(this).value().split('.').pop().toLowerCase(), fileExtension) == -1) {
    //        // alert("Only '.jpeg','.jpg' formats are allowed.");
    //        return false;

    //    }
    //    else
    //    {
    //        return true;
    //    }
    //}, "Only '.jpeg','.jpg' formats are allowed.");

 </script>
    <script type="text/javascript">
     
      jQuery(document).ready(function (){        
          jQuery('.btnAdd').click(function () {
            //  alert("hi");
              var x = jQuery("#form1").validate({                     
                  rules:
                      {
                          ctl00$contentplaceholder1$fupbannerimg:
                         {
                                 required: true,
                                 //extension: 'jpe?g,png',
                                 
                             },
                             ctl00$contentplaceholder1$ddlbannerposition:
                             {
                                 required: true,
                             },
                             ctl00$contentplaceholder1$ddlcategory:
                                 {
                                     required: true,
                                 }
                         }
                
                      }).form();
      });
      });   
</script>        
</asp:Content>
