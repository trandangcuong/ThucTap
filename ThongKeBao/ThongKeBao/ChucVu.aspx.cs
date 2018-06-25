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
    public partial class ChucVu : System.Web.UI.Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM CHUC_VU", sqlcon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvChuVu.DataSource = dtbl;
                gvChuVu.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvChuVu.DataSource = dtbl;
                gvChuVu.DataBind();
                gvChuVu.Rows[0].Cells.Clear();
                gvChuVu.Rows[0].Cells.Add(new TableCell());
                gvChuVu.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvChuVu.Rows[0].Cells[0].Text = "Không có dữ liệu...!";
                gvChuVu.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
        }


        void PopulateGridview1(string tennv)

        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {

                sqlcon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM CHUC_VU WHERE TenCV LIKE N'%" + txttim.Text + "%'", sqlcon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvChuVu.DataSource = dtbl;
                gvChuVu.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvChuVu.DataSource = dtbl;
                gvChuVu.DataBind();
                gvChuVu.Rows[0].Cells.Clear();
                gvChuVu.Rows[0].Cells.Add(new TableCell());
                gvChuVu.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvChuVu.Rows[0].Cells[0].Text = "Không có dữ liệu...!";
                gvChuVu.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
        }


        protected void gvChuVu_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvChuVu.EditIndex = e.NewEditIndex;
            PopulateGridview1(txttim.Text);
        }

        protected void gvChuVu_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvChuVu.EditIndex = -1;
            PopulateGridview1(txttim.Text);
        }

        protected void gvChuVu_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            try
            {
                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    sqlcon.Open();

                    SqlCommand sqlCmd = new SqlCommand("UPDATE CHUC_VU SET TenCV=@TenCV WHERE MaCV = @ID", sqlcon);
                    sqlCmd.Parameters.AddWithValue("@TenCV", (gvChuVu.Rows[e.RowIndex].FindControl("txtTenCV") as TextBox).Text.Trim());    
                    sqlCmd.Parameters.AddWithValue("@ID", Convert.ToString(gvChuVu.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvChuVu.EditIndex = -1;
                    PopulateGridview1(txttim.Text);
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

        protected void gvChuVu_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            try
            {
                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    sqlcon.Open();

                    SqlCommand sqlCmd = new SqlCommand("DELETE FROM CHUC_VU  WHERE MaCV =@ID", sqlcon);

                    sqlCmd.Parameters.AddWithValue("@ID", Convert.ToString(gvChuVu.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvChuVu.EditIndex = -1;
                    PopulateGridview1(txttim.Text);
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

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {




                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    sqlcon.Open();
                    SqlCommand sqlCmd = new SqlCommand("INSERT INTO CHUC_VU (MaCV,TenCV) VALUES (N'" + txtMaCV.Text + "',N'" + txtTenCV.Text + "')", sqlcon);
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

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            PopulateGridview1(txttim.Text);
        }
    }
}