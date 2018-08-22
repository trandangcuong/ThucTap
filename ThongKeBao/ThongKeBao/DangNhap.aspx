<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="ThongKeBao.DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Đăng nhập</title>
    <link rel="stylesheet" type="text/css" href="Content/style.css"/>
</head>

     <body>
    <div class="login-box">
    <img src="Images/avatar.png" class="avatar"/>
        <h1>Login Here</h1>
            <form runat="server">
            <p>Username</p>
                <asp:TextBox ID="txttendangnhap" placeholder="Enter Username" runat="server"></asp:TextBox>
            <p>Password</p>
                <asp:TextBox ID="txtmatkhau" runat="server"  placeholder="Enter Password" ></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
        
            
                
                <asp:Label ID="lblMsgError" runat="server" Text="Label"></asp:Label>
        
            
                
            </form>
        
        </div>
    
    </body>

</html>
