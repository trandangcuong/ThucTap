<%@ Page Title="Thông Tin Nhân Viên" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NhanVien.aspx.cs" Inherits="ThongKeBao.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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
        <asp:GridView ID="gvNhanVien" runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="MaNV"
            ShowHeaderWhenEmpty="True" OnRowEditing="gvNhanVien_RowEditing"
            OnRowCancelingEdit="gvNhanVien_RowCancelingEdit" OnRowUpdating="gvNhanVien_RowUpdating"
            OnRowDeleting="gvNhanVien_RowDeleting"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="6" Height="250px" Width="100%" CssClass="auto-style1">
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

                <asp:TemplateField HeaderText="Mã nhân viên">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("MaNV") %>' runat="server" ID="abc"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMaNV" Text='<%#Eval("MaNV")%>' runat="server" Enabled="false"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtMaNVFooter" runat="server" ReadOnly="true" Enabled="false"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Tên nhân viên">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("TenNV") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTenNV" Text='<%#Eval("TenNV")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtTenNVFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Giới Tính">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("GioiTinh") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGioiTinh" Text='<%#Eval("GioiTinh") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtGioiTinhFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Ngày Sinh">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("NgaySinh","{0:dd/MM/yyyy}") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNgaySinh" Text='<%#Eval("NgaySinh") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNgaySinhFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Số CMND">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("CMND") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCMND" Text='<%#Eval("CMND") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtCMNDFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Điện thoại">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("SDT") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSDT" Text='<%#Eval("SDT") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtSDTFooter" runat="server"></asp:TextBox>
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
        function checkrange() {
            var temp = $('#MainContent_txtCMND').val().length;
            if (temp> 0 && (temp < 9 || temp > 9)) {
                $('#MainContent_txtCMND').val('');
                alert("số chứng minh phải có 9 chữ số ");
                $('#MainContent_txtCMND').focus();
                return false;
            }
            return true;
        }
        function checkrange1() {
            var temp = $('#MainContent_txtSDT').val().length;
            if (temp > 0 && (temp < 11 || temp > 11)) {
                $('#MainContent_txtSDT').val('');
                alert("số điện thoại phải có 10 hoặc 11 chữ số ");
                $('#MainContent_txtSDT').focus();
                return false;
            }
            return true;
        }
        function myFunction() {
            var x = document.getElementById("txtNgaySinh").value;

        }
        function functionx(evt) {
            if (evt.charCode > 31 && (evt.charCode < 48 || evt.charCode > 57)) {
                alert("Chỉ được nhập số !");
                return false;
            }
        }
    </script>

    <div>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-lg" style="left: auto">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Thêm Nhân Viên</h4>
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="Label1" runat="server" Text="Mã nhân viên  :" Width="100px"></asp:Label>
                        <asp:TextBox ID="txtMaNV" runat="server"></asp:TextBox>
                        <%--                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSDT" ErrorMessage="Điện thoại không được rỗng" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Tên nhân viên :" Width="100px"></asp:Label>
                        <asp:TextBox ID="txtTenNV" runat="server"></asp:TextBox>
<%--                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenNV" ErrorMessage="Tên nhân viên không được rỗng" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Giới tính     :" Width="100px"></asp:Label>
                        <asp:DropDownList ID="txtGioiTinh" runat="server" Height="27px" Width="80px">
                            <asp:ListItem Text="Nam" />

                            <asp:ListItem Text="Nữ" />
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="Label6" runat="server" Text="Ngày sinh    :" Width="100px"></asp:Label>
                        <input style="width: 168px;" type="date" id="txtNgaySinh" runat="server" value="dd-MM-yyyy" />


                      
                        <br />
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="Số CMND       :" Width="100px"></asp:Label>
                        <asp:TextBox ID="txtCMND" runat="server" onfocusout="return checkrange()" onkeypress="return functionx(event)"></asp:TextBox>
<%--                        <asp:RequiredFieldValidator ID="rfvCMND" runat="server" ControlToValidate="txtCMND" ErrorMessage="CMND không được rỗng" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                        <br />
                        <br />
                        <asp:Label ID="Label5" runat="server"  Text="Số điện thoại :" Width="100px"></asp:Label>
                        <asp:TextBox ID="txtSDT" runat="server" onfocusout="return checkrange1()" onkeypress="return functionx(event)"></asp:TextBox>
<%--                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSDT" ErrorMessage="Điện thoại không được rỗng" ForeColor="Red"></asp:RequiredFieldValidator>--%>

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

