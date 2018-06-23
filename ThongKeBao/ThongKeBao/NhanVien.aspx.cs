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
    public partial class About : Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM NHAN_VIEN", sqlcon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvNhanVien.DataSource = dtbl;
                gvNhanVien.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvNhanVien.DataSource = dtbl;
                gvNhanVien.DataBind();
                gvNhanVien.Rows[0].Cells.Clear();
                gvNhanVien.Rows[0].Cells.Add(new TableCell());
                gvNhanVien.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvNhanVien.Rows[0].Cells[0].Text = "Không có dữ liệu...!";
                gvNhanVien.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
        }


        void PopulateGridview1(string tennv)

        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {

                sqlcon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM NHAN_VIEN WHERE TenNV LIKE N'%" + txtTimKiem.Text + "%'", sqlcon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvNhanVien.DataSource = dtbl;
                gvNhanVien.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvNhanVien.DataSource = dtbl;
                gvNhanVien.DataBind();
                gvNhanVien.Rows[0].Cells.Clear();
                gvNhanVien.Rows[0].Cells.Add(new TableCell());
                gvNhanVien.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvNhanVien.Rows[0].Cells[0].Text = "Không có dữ liệu...!";
                gvNhanVien.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
        }





        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {




                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    sqlcon.Open();
                    SqlCommand sqlCmd = new SqlCommand("INSERT INTO NHAN_VIEN (MaNV,TenNV,GioiTinh,NgaySinh,CMND,SDT) VALUES (N'" + txtMaNV.Text + "',N'" + txtTenNV.Text + "',N'" + txtGioiTinh.Text + "',N'" + txtNgaySinh.Value + "',N'" + txtCMND.Text + "',N'" + txtSDT.Text + "')", sqlcon);
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

        protected void gvNhanVien_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvNhanVien.EditIndex = e.NewEditIndex;
            PopulateGridview1(txtTimKiem.Text);
        }

        protected void gvNhanVien_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvNhanVien.EditIndex = -1;
            PopulateGridview1(txtTimKiem.Text);
        }

        protected void gvNhanVien_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    sqlcon.Open();
                    
                    SqlCommand sqlCmd = new SqlCommand("UPDATE NHAN_VIEN SET TenNV=@TenNV,GioiTinh=@GioiTinh,NgaySinh=@NgaySinh,CMND=@CMND,SDT=@SDT WHERE MaNV = @ID", sqlcon);
                    sqlCmd.Parameters.AddWithValue("@TenNV", (gvNhanVien.Rows[e.RowIndex].FindControl("txtTenNV") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@GioiTinh", (gvNhanVien.Rows[e.RowIndex].FindControl("txtGioiTinh") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@NgaySinh", (gvNhanVien.Rows[e.RowIndex].FindControl("txtNgaySinh") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@CMND", (gvNhanVien.Rows[e.RowIndex].FindControl("txtCMND") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@SDT", (gvNhanVien.Rows[e.RowIndex].FindControl("txtSDT") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ID", Convert.ToString(gvNhanVien.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();                 
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


        protected void gvNhanVien_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    sqlcon.Open();
                
                    SqlCommand sqlCmd = new SqlCommand("DELETE FROM NHAN_VIEN  WHERE MaNV =@ID", sqlcon);

                    sqlCmd.Parameters.AddWithValue("@ID", Convert.ToString(gvNhanVien.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvNhanVien.EditIndex = -1;
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

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            PopulateGridview1(txtTimKiem.Text);
        }
    }
}