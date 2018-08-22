using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace ThongKeBao
{
    
    public partial class DangNhap : System.Web.UI.Page
    {
        string connectionString = @"Data Source=PCTRANDANGCUONG\SQLEXPRESS;Initial Catalog=BaoCaoCoPhan_ThucTap;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //if (string.IsNullOrEmpty(txtmatkhau.Text.Trim()) || string.IsNullOrEmpty(txttendangnhap.Text.Trim()))
            //{
            //    lblMsgError.Text = "Vui lòng kiểm tra tên đăng nhập và mật khẩu.";
            //    return;
            //}
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "SELECT COUNT(*) FROM dbo.Account WHERE UserName='"+txttendangnhap.Text+ "' and Password='"+txtmatkhau.Text+"'";
            SqlCommand cmd = new SqlCommand(query, con);
            string output = cmd.ExecuteScalar().ToString();
            if(output == "1")
            {
                Session["user"] = txttendangnhap.Text;
                Response.Redirect("~/CongTy.aspx");

            }
            else
            {
                lblMsgError.Text = "Login Faild";
               

            }
        }
    }
}