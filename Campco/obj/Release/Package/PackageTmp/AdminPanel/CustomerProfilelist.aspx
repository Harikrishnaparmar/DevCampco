<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/CampcoAdmin.Master" AutoEventWireup="true" CodeBehind="CustomerProfilelist.aspx.cs" Inherits="Campco.AdminPanel.CustomerProfilelist" MaintainScrollPositionOnPostBack="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            background-color: black;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-title-qube" class="page-title-qube default-page-title">
                <div class="width-container-qube fade-header-qube">
                    <div class="page-tite-left-qube">
                        <h1 class="entry-title-qube-ezio">Customer profile List</h1>
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
                           <label for="txtLname" class="">Enter customerid or username.</label>
    <asp:TextBox ID="txtseach" runat="server" Text=""  placeholder="Enter customerid or username" required="required" Width="350px">
    </asp:TextBox> </br></br>
    <asp:Button ID="btnSearch" runat="server" Text="Search"  class="campco-btn button wpcf7-form-control wpcf7-submit " OnClick="btnSearch_Click" />
                          </div> 
              </br>
                                          
                            <div class="shop_table_outer">
            <asp:Label ID="lblcus" runat="server" Text="No record found" Visible="false" ForeColor="red"></asp:Label>
        <asp:GridView ID="GVCustomer" runat="server" AutoGenerateColumns="False" CellPadding="15" ForeColor="#333333" GridLines="None" AllowPaging="true"  OnPageIndexChanging="OnPageIndexChanging" PageSize="8"  PagerStyle-BackColor="white" PagerStyle-ForeColor="black" PagerStyle-Height="10px"  HeaderStyle-BackColor="Black" EmptyDataText="Record not found"  EmptyDataRowStyle-ForeColor="Red">          
            <AlternatingRowStyle BackColor="#03b4ba" ForeColor="white" />               
            <Columns>
            <asp:BoundField DataField="CUS_ID" HeaderText="Customer Id" />
            <asp:BoundField DataField="USER_NAME" HeaderText="User Name" />
            <asp:BoundField DataField="Cus_Type" HeaderText="Customer Type" />
            <asp:BoundField DataField="Cus_Name" HeaderText="Customer Name" />
            <asp:BoundField DataField="EMail" HeaderText="Email-Id" />       
            <asp:BoundField DataField="Password" HeaderText="Password" />    
            <asp:BoundField DataField="Valid" HeaderText="Status" />    
            </Columns>
            <EditRowStyle BackColor="white" ForeColor="black"  />
             <RowStyle BackColor="White" ForeColor="black" />
          
        </asp:GridView>  </div>                        
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
                </div>

<%--<div id="content-qube">
    <div id="page-title-qube" class="page-title-qube default-page-title">
                <div class="width-container-qube fade-header-qube">
                    <div class="page-tite-left-qube">
                        <h1 class="entry-title-qube-ezio">Customer profile List</h1>
                    </div>
                    
                    <div class="clearfix-qube-ezio">
                    </div>
                </div>
            </div>
     </br></br>
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
       <label for="txtLname" class="">Enter customerid or username.</label>
    <asp:TextBox ID="txtseach" runat="server" Text=""  placeholder="Enter customerid or username" required="required" Width="350px">
    </asp:TextBox> </br></br>
    <asp:Button ID="btnSearch" runat="server" Text="Search"  class="campco-btn button wpcf7-form-control wpcf7-submit " OnClick="btnSearch_Click" />
   </div>

                     </div>


                            </div>
                            </br></br>
<div>
         <asp:Label ID="lblcus" runat="server" Text="No record found" Visible="true" ForeColor="red"></asp:Label>
        <asp:GridView ID="GVCustomer" runat="server"   AutoGenerateColumns="False" CellPadding="15" ForeColor="#333333" GridLines="None" AllowPaging="true"  OnPageIndexChanging="OnPageIndexChanging" PageSize="8"  PagerStyle-BackColor="black" PagerStyle-ForeColor="White" PagerStyle-Height="10px"  HeaderStyle-BackColor="Black">
          
            <AlternatingRowStyle BackColor="White" ForeColor="black" /> 
            <HeaderStyle   BackColor="black" ForeColor="black" />    
            <Columns>
            <asp:BoundField DataField="CUS_ID" HeaderText="Customer Id" />
            <asp:BoundField DataField="USER_NAME" HeaderText="User Name" />
            <asp:BoundField DataField="Cus_Type" HeaderText="Customer Type" />
            <asp:BoundField DataField="Cus_Name" HeaderText="Customer Name" />
            <asp:BoundField DataField="EMail" HeaderText="Email-Id" />       
            <asp:BoundField DataField="Password" HeaderText="Password" />    
            <asp:BoundField DataField="Valid" HeaderText="Status" />    
            </Columns>
            <EditRowStyle BackColor="black" ForeColor="White"  />
             <RowStyle BackColor="black" ForeColor="White" />
          
        </asp:GridView>
    </div>
                      </div></div></div></div></div></div>       
  
    

                        
</div>--%>
</asp:Content>
