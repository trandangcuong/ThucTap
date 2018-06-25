using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThongKeBao
{
	public partial class CongTy : System.Web.UI.Page
	{
        string connectionString = @"Data Source=PCTRANDANGCUONG\SQLEXPRESS;Initial Catalog=BaoCaoCoPhan_ThucTap;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                PopulateGridview();

            }
        }


        void PopulateGridview()

        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {

                sqlcon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM CONG_TY", sqlcon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvCongTy.DataSource = dtbl;
                gvCongTy.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvCongTy.DataSource = dtbl;
                gvCongTy.DataBind();
                gvCongTy.Rows[0].Cells.Clear();
                gvCongTy.Rows[0].Cells.Add(new TableCell());
                gvCongTy.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvCongTy.Rows[0].Cells[0].Text = "Không có dữ liệu...!";
                gvCongTy.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
        }


        void PopulateGridview1(string tennv)

        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {

                sqlcon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM CONG_TY WHERE TenNV LIKE N'%" + txtTimKiem.Text + "%'", sqlcon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvCongTy.DataSource = dtbl;
                gvCongTy.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvCongTy.DataSource = dtbl;
                gvCongTy.DataBind();
                gvCongTy.Rows[0].Cells.Clear();
                gvCongTy.Rows[0].Cells.Add(new TableCell());
                gvCongTy.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvCongTy.Rows[0].Cells[0].Text = "Không có dữ liệu...!";
                gvCongTy.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {




                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    sqlcon.Open();
                    SqlCommand sqlCmd = new SqlCommand("INSERT INTO CONG_TY (MaCTY,TenCTY,DiaChi,HinhThuc) VALUES (N'" + txtMaCTY.Text + "',N'" + txtTenCTY.Text + "',N'" + txtDiaChi.Text + "',N'" + txtHinhThuc.Text + "')", sqlcon);
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                    lbSuccessMessage.Text = "Thêm thành công";
                    lbErrorMessage.Text = "";

                }

            }
            catch (Exception ex)
            {
                lbSuccessMessage.Text = "";
                lbErrorMessage.Text = ex.Message;
            }

        }

        protected void gvCongTy_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCongTy.EditIndex = e.NewEditIndex;
            PopulateGridview1(txtTimKiem.Text);
        }

        protected void gvCongTy_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCongTy.EditIndex = -1;
            PopulateGridview1(txtTimKiem.Text);
        }

        protected void gvCongTy_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    sqlcon.Open();

                    SqlCommand sqlCmd = new SqlCommand("UPDATE CONG_TY SET TenCTY=@TenCTY,DiaChi=@DiaChi,HinhThuc=@HinhThuc WHERE MaCTY = @ID", sqlcon);
                    sqlCmd.Parameters.AddWithValue("@TenCTY", (gvCongTy.Rows[e.RowIndex].FindControl("txtTenCTY") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@DiaChi", (gvCongTy.Rows[e.RowIndex].FindControl("txtDiaChi") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@HinhThuc", (gvCongTy.Rows[e.RowIndex].FindControl("txtHinhThuc") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ID", Convert.ToString(gvCongTy.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvCongTy.EditIndex = -1;
                    PopulateGridview1(txtTimKiem.Text);
                    lbSuccessMessage.Text = "Cập nhật thành công !";
                    lbErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lbSuccessMessage.Text = "";
                lbErrorMessage.Text = ex.Message;
            }

        }

        protected void gvCongTy_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    sqlcon.Open();

                    SqlCommand sqlCmd = new SqlCommand("DELETE FROM CONG_TY  WHERE MaCTY =@ID", sqlcon);

                    sqlCmd.Parameters.AddWithValue("@ID", Convert.ToString(gvCongTy.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvCongTy.EditIndex = -1;
                    PopulateGridview1(txtTimKiem.Text);
                    lbSuccessMessage.Text = "Xóa thành Công";
                    lbErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lbSuccessMessage.Text = "";
                lbErrorMessage.Text = ex.Message;
            }
        }
    }
}