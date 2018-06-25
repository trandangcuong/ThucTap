<%@ Page Title="Cổ Phần Chi Phối" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CoPhanChiPhoi.aspx.cs" Inherits="ThongKeBao.CoPhanChiPhoi" %>

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
        <asp:GridView ID="gvCoPhanChiPhoi" runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="STT"
            ShowHeaderWhenEmpty="True" OnRowEditing="gvCoPhanChiPhoi_RowEditing"
            OnRowCancelingEdit="gvCoPhanChiPhoi_RowCancelingEdit" OnRowUpdating="gvCoPhanChiPhoi_RowUpdating"
            OnRowDeleting="gvCoPhanChiPhoi_RowDeleting"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="6" Height="150px" Width="100%" CssClass="auto-style1">
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

                <asp:TemplateField HeaderText="Tên CtY">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("IDCongTy") %>' runat="server" ID="abc"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtIDCongTy" Text='<%#Eval("IDCongTy")%>' runat="server" Enabled="false"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtIDCongTyFooter" runat="server" ReadOnly="true" Enabled="false"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Tên nhân viên">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("IDNhanVien") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtIDNhanVien" Text='<%#Eval("IDNhanVien")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtIDNhanVienFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Chức Vụ">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("IDChucDanh") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtIDChucDanh" Text='<%#Eval("IDChucDanh") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtIDChucDanhFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Đơn vị Công tác">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("DonViCongTac") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDonViCongTac" Text='<%#Eval("DonViCongTac") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDonViCongTacFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="SoCPTTDT_SL">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("SoCPTTDT_SL") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSoCPTTDT_SL" Text='<%#Eval("SoCPTTDT_SL") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtSoCPTTDT_SLFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="SoCPTTDT_TL">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("SoCPTTDT_TL") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSoCPTTDT_TL" Text='<%#Eval("SoCPTTDT_TL") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtSoCPTTDT_TLFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SoCPTTDN_SL">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("SoCPTTDN_SL") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSoCPTTDN_SL" Text='<%#Eval("SoCPTTDN_SL") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtSoCPTTDN_SLFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SoCPTTDN_TL">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("SoCPTTDN_TL") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSoCPTTDN_TL" Text='<%#Eval("SoCPTTDN_TL") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtSoCPTTDN_TLFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Ghi Chú">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("GhiChu") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGhiChu" Text='<%#Eval("GhiChu") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtGhiChuFooter" runat="server"></asp:TextBox>
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
                        <asp:Label ID="Label1" runat="server" Text="Tên Công Ty :" Width="120px"></asp:Label>
                        <asp:DropDownList ID="drCongTy" runat="server" Width="167px" Height="27px" OnSelectedIndexChanged="drCongTy_SelectedIndexChanged"></asp:DropDownList>

                        <%--                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSDT" ErrorMessage="Điện thoại không được rỗng" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Tên nhân viên :" Width="120px"></asp:Label>
                        <asp:DropDownList ID="drNhanVien" runat="server" Width="167px"  Height="27px"></asp:DropDownList>
                        <%--                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenNV" ErrorMessage="Tên nhân viên không được rỗng" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Chức Danh     :" Width="120px"></asp:Label>
                        <asp:DropDownList ID="drChucDanh" runat="server" Width="167px"  Height="27px"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="Label6" runat="server" Text="Đơn vị công tác:" Width="120px"></asp:Label>
                        <asp:TextBox ID="txtDonViCongTac" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="SoCPTTDT_SL :" Width="120px"></asp:Label>
                        <asp:TextBox ID="txtSoCPTTDT_SL" runat="server"></asp:TextBox>
                        <%--                        <asp:RequiredFieldValidator ID="rfvCMND" runat="server" ControlToValidate="txtCMND" ErrorMessage="CMND không được rỗng" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                        <br />
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="SoCPTTDT_TL :" Width="120px"></asp:Label>
                        <asp:TextBox ID="txtSoCPTTDT_TL" runat="server"></asp:TextBox>
                        <%--                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSDT" ErrorMessage="Điện thoại không được rỗng" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                        <br />
                        <br />
                        <asp:Label ID="Label7" runat="server" Text="SoCPTTDN_SL :" Width="120px"></asp:Label>
                        <asp:TextBox ID="txtSoCPTTDN_SL" runat="server"></asp:TextBox>
                        <%--                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSDT" ErrorMessage="Điện thoại không được rỗng" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                        <br />
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="SoCPTTDN_TL :" Width="120px"></asp:Label>
                        <asp:TextBox ID="txtSoCPTTDN_TL" runat="server"></asp:TextBox>
                        <%--                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSDT" ErrorMessage="Điện thoại không được rỗng" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                        <br />
                        <br />
                        <asp:Label ID="Label9" runat="server" Text="Ghi chú :" Width="120px"></asp:Label>
                        <asp:TextBox ID="txtGhiChu" runat="server"></asp:TextBox>
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
