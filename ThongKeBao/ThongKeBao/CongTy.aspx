<%@ Page Title="Thông Tin Nhân Viên" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CongTy.aspx.cs" Inherits="ThongKeBao.CongTy" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="height: 1000px; width: 1000px;">
        <!-- Trigger the modal with a button -->
        <button style="margin-top: 20px; margin-bottom: 20px;" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Thêm</button>
        <asp:TextBox ID="txtTimKiem" runat="server" Height="24px"></asp:TextBox>
        <asp:Button ID="btnTimKiem" runat="server" Text="Tìm kiếm" Height="29px" OnClick="btnTimKiem_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblMessage" runat="server"></asp:Label>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
        <!-- girview -->
        <asp:GridView ID="gvCongTy" runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="MaCTY"
            ShowHeaderWhenEmpty="True" OnRowEditing="gvCongTy_RowEditing"
            OnRowCancelingEdit="gvCongTy_RowCancelingEdit" OnRowUpdating="gvCongTy_RowUpdating"
            OnRowDeleting="gvCongTy_RowDeleting"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="6" Height="200px" Width="900px" CssClass="auto-style1">
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

                <asp:TemplateField HeaderText="Mã công ty">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("MaCTY") %>' runat="server" ID="abc"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMaCTY" Text='<%#Eval("MaCTY")%>' runat="server" Enabled="false"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtMaCTYFooter" runat="server" ReadOnly="true" Enabled="false"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Tên công ty">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("TenCTY") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTenCTY" Text='<%#Eval("TenCTY")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtTenCTYFooter" runat="server"></asp:TextBox>
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

                <asp:TemplateField HeaderText="Hình thức">
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
        <asp:Label ID="lbErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label>

    </div>

    <style>
        th {
            text-align: center;
        }
    </style>

    <script>
        function checkrange0() {
            var temp = $('#MainContent_txtMaCTY').val().length;
            if (temp > 0) {
                $('#MainContent_txtMaCTY').val('');
                alert("Mã công ty không được trống!");
                $('#MainContent_txtMaCTY').focus();
                return false;
            }
            return true;
        }
        
        function checkrange1() {
            var temp = $('#MainContent_txtTenCTY').val().length;
            if (temp > 0 ) {
                $('#MainContent_txtTenCTY').val('');
                alert("Tên Công ty không được trống!");
                $('#MainContent_txtTenCTY').focus();
                return false;
            }
            return true;
        }
        function checkrange2() {
            var temp = $('#MainContent_txtDiaChi').val().length;
            if (temp > 0) {
                $('#MainContent_txtDiaChi').val('');
                alert("Địa chỉ không được trống!");
                $('#MainContent_txtDiaChi').focus();
                return false;
            }
            return true;
        }
        function checkrange3() {
            var temp = $('#MainContent_txtHinhThuc').val().length;
            if (temp > 0) {
                $('#MainContent_txtHinhThuc').val('');
                alert("Hình Thức không được trống!");
                $('#MainContent_txtHinhThuc').focus();
                return false;
            }
            return true;
        }
       
      
        
    </script>

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
                        <asp:Label ID="Label1" runat="server" Text="Mã công ty  :" Width="100px"></asp:Label>
                        <asp:TextBox ID="txtMaCTY" onfocusout="return checkrange0()" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Tên công ty :" Width="100px"></asp:Label>
                        <asp:TextBox ID="txtTenCTY" onfocusout="return checkrange1()" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Địa chỉ     :" Width="100px"></asp:Label>
                        <asp:TextBox ID="txtDiaChi" onfocusout="return checkrange2()" runat="server"></asp:TextBox>
                
                        <br />
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="Hình thức       :" Width="100px"></asp:Label>
                        <asp:TextBox ID="txtHinhThuc" runat="server" onfocusout="return checkrange3()" onkeypress="return functionx(event)"></asp:TextBox>
                        <br />
                        <br />
                        

                    </div>
                    <div class="modal-footer">
                        <div style="float: left; margin-left: 100px;">
                            <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-default" OnClick="btnThem_Click"  />
                        </div>
                        <button style="margin-right: 100px;" type="button" class="btn btn-default" data-dismiss="modal">Close</button>



                    </div>
                </div>
            </div>
        </div>
        
    </div>
</asp:Content>
