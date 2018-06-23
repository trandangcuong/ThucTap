<%@ Page Title="Thông Tin Công Ty" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CongTy.aspx.cs" Inherits="ThongKeBao.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container" style="height: 1000px; width:1000px;">
  <!-- Trigger the modal with a button -->
        <style>
            
        </style>
        <Button style="margin-top:20px; margin-bottom:20px" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Thêm</Button>
        <asp:TextBox ID="txtSearch" runat="server" Height="24px" ></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" Height="29px"  />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblMessage" runat="server"></asp:Label>
  
        
     
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
       
     
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg" style="left:auto">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Thêm Nhân Viên</h4>
        </div>
        <div class="modal-body">
            <asp:Label ID="Label1" runat="server" Text="Mã Công Ty  :" Width="100px"></asp:Label>
            <asp:TextBox ID="txtMaCTY" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtMaCTY" ErrorMessage="Mã Công Ty không được rỗng" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br/><br/>
            <asp:Label ID="Label2" runat="server" Text="Tên Công Ty :" Width="100px"></asp:Label>
            <asp:TextBox ID="txtTenCTY" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenCTY" ErrorMessage="Tên Công Ty không được rỗng" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br/><br/>
            <asp:Label ID="Label3" runat="server" Text="Địa Chỉ :" Width="100px"></asp:Label>
            <asp:TextBox ID="txtDiaChi" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDiaChi" ErrorMessage="Địa chỉ không được rỗng" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br/ ><br/>
             <asp:Label ID="Label4" runat="server" Text="Hình Thức :" Width="100px"></asp:Label>
            <asp:TextBox ID="txtHinhThuc" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtHinhThuc" ErrorMessage="Hình Thức không được rỗng" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            
        </div>
        <div class="modal-footer">
          <div style="float:left; margin-left:100px;"><asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-default" OnClick="btnThem_Click"/></div>
          <button style="margin-right:100px;" type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
          
          
          
        </div> 
      </div>
    </div>
  </div>
<!-- girview -->
        <asp:GridView ID="gvCONGTY" runat="server" AutoGenerateColumns="False" ShowFooter="false" DataKeyNames="MaCTY"
            ShowHeaderWhenEmpty="True" OnRowEditing="gvCONGTY_RowEditing"
             OnRowCancelingEdit="gvCONGTY_RowCancelingEdit" OnRowUpdating="gvCONGTY_RowUpdating"
            OnRowDeleting="gvCONGTY_RowDeleting"
             BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="6" Height="200px" Width="900px" CssClass="auto-style1">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"  HorizontalAlign="Center" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
            <RowStyle HorizontalAlign="Center"/>
         


            <Columns>
               
                <asp:TemplateField HeaderText="Mã công ty" >
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("MaCTY") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMaCTY" Text='<%#Eval("MaCTY")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="txtMaCTYFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
               
  
                 <asp:TemplateField HeaderText="Tên công ty" >
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("TenCTY") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTenCTY" Text='<%#Eval("TenCTY")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="txtTenCTYooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
  
                  <asp:TemplateField HeaderText="Địa chỉ">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("DiaChi") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDiaChi" Text='<%#Eval("DiaChi") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="txtDiaChiFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
          
                
            
                  <asp:TemplateField HeaderText="Hình Thức">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("HinhThuc") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtHinhThuc" Text='<%#Eval("HinhThuc") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="txtHinhThucFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
              
               
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px"  Height="20px" />
                         <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px"  Height="20px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Save" ToolTip="Save" Width="20px"  Height="20px" />
                         <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px"  Height="20px" />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="lbSuccessMessage" Text="" runat="server" ForeColor="Green"></asp:Label>
        <br />
        <asp:Label ID="lbErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label><br/>
         
        
</div>
    
   

<%--    <script>
    $(document).ready(function(){
        $('.datepicker-field').datepicker();
        
    });
</script>--%>
    <script>
function myFunction() {
    var x = document.getElementById("txtNgaySinh").value;
    
}
</script>
   
</asp:Content>
