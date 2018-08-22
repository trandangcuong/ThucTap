<%@ Page Title="Thông Tin Chức Vụ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChucVu.aspx.cs" Inherits="ThongKeBao.ChucVu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="height: 1000px; width: 1000px;">
        <!-- Trigger the modal with a button -->
        <button style="margin-top: 20px; margin-bottom: 20px;" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Thêm</button>
        <asp:TextBox ID="txttim" runat="server" Height="24px"></asp:TextBox>
        <asp:Button ID="btnTimKiem" runat="server" Text="Tìm kiếm" Height="29px"  />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblMessage" runat="server"></asp:Label>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
        <!-- girview -->
        <asp:GridView ID="gvChuVu" runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="MaCV"
            ShowHeaderWhenEmpty="True" OnRowEditing="gvChuVu_RowEditing"
            OnRowCancelingEdit="gvChuVu_RowCancelingEdit" OnRowUpdating="gvChuVu_RowUpdating"
            OnRowDeleting="gvChuVu_RowDeleting"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="6" Height="250px" Width="60%" CssClass="auto-style1">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
            <RowStyle HorizontalAlign="Center" />



            <Columns>

                <asp:TemplateField HeaderText="Mã chức vụ">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("MaCV") %>' runat="server" ID="abc"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMaCV" Text='<%#Eval("MaCV")%>' runat="server" Enabled="false"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtMaCVFooter" runat="server" ReadOnly="true" Enabled="false"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Tên chức vụ">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("TenCV") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTenCV" Text='<%#Eval("TenCV")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtTenCVFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                        <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                        <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="lbSuccessMessage" Text="" runat="server" ForeColor="Green"></asp:Label>
        <br />
        <asp:Label ID="lbErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label><br />


  <%-- <asp:Button ID="xuatexcel" runat="server" Text="Xuat Excel" OnClick="xuatexcel_Click"  />--%>

    </div>

    <style>
        th {
            text-align: center;
        }
    </style>

   

    <div>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-lg" style="left: auto">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Thêm công ty</h4>
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="Label1" runat="server" Text="Mã chức vụ  :" Width="100px"></asp:Label>
                        <asp:TextBox ID="txtMaCV" onfocusout="return checkrange0()" runat="server"></asp:TextBox>
<%--                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMaCV" ErrorMessage=" không được rỗng" ForeColor="Red" ></asp:RequiredFieldValidator>--%>
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Tên chức vụ  :" Width="100px"></asp:Label>
                        <asp:TextBox ID="txtTenCV" onfocusout="return checkrange1()" runat="server"></asp:TextBox>
<%--                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenCV" ErrorMessage=" không được rỗng" ForeColor="Red" ></asp:RequiredFieldValidator>--%>
                        <br />
                        <br />
                    </div>
                    <div class="modal-footer">
                        <div style="float: left; margin-left: 100px;">
                            <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-default" OnClick="btnThem_Click" />
                        </div>
                        <button style="margin-right: 100px;" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
   
</asp:Content>
