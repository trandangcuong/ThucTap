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
    public partial class CoPhanChiPhoi : System.Web.UI.Page
    {
        string connectionString = @"Data Source=PCTRANDANGCUONG\SQLEXPRESS;Initial Catalog=BaoCaoCoPhan_ThucTap;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();
                LoadDataToDropDownListCongTY();
                LoadDataToDropDownListNhanVien();
                LoadDataToDropDownListChucVu();
            }
           
        }



        void PopulateGridview()

        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {

                sqlcon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM COPHANCHIPHOI", sqlcon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvCoPhanChiPhoi.DataSource = dtbl;
                gvCoPhanChiPhoi.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvCoPhanChiPhoi.DataSource = dtbl;
                gvCoPhanChiPhoi.DataBind();
                gvCoPhanChiPhoi.Rows[0].Cells.Clear();
                gvCoPhanChiPhoi.Rows[0].Cells.Add(new TableCell());
                gvCoPhanChiPhoi.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvCoPhanChiPhoi.Rows[0].Cells[0].Text = "Không có dữ liệu...!";
                gvCoPhanChiPhoi.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
        }


        void PopulateGridview1(string tennv)

        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {

                sqlcon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM COPHANCHIPHOI WHERE IDCongTy LIKE N'%" + txtTimKiem.Text + "%'", sqlcon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvCoPhanChiPhoi.DataSource = dtbl;
                gvCoPhanChiPhoi.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvCoPhanChiPhoi.DataSource = dtbl;
                gvCoPhanChiPhoi.DataBind();
                gvCoPhanChiPhoi.Rows[0].Cells.Clear();
                gvCoPhanChiPhoi.Rows[0].Cells.Add(new TableCell());
                gvCoPhanChiPhoi.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvCoPhanChiPhoi.Rows[0].Cells[0].Text = "Không có dữ liệu...!";
                gvCoPhanChiPhoi.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
        }


        void TimKiemTheoTenNhanVien(string tennv)

        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {

                sqlcon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM COPHANCHIPHOI WHERE IDNhanVien LIKE N'%" + txtTimKiem.Text + "%'", sqlcon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvCoPhanChiPhoi.DataSource = dtbl;
                gvCoPhanChiPhoi.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvCoPhanChiPhoi.DataSource = dtbl;
                gvCoPhanChiPhoi.DataBind();
                gvCoPhanChiPhoi.Rows[0].Cells.Clear();
                gvCoPhanChiPhoi.Rows[0].Cells.Add(new TableCell());
                gvCoPhanChiPhoi.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvCoPhanChiPhoi.Rows[0].Cells[0].Text = "Không có dữ liệu...!";
                gvCoPhanChiPhoi.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
        }

        protected void gvCoPhanChiPhoi_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCoPhanChiPhoi.EditIndex = e.NewEditIndex;
            PopulateGridview1(txtTimKiem.Text);
            TimKiemTheoTenNhanVien(txtTimKiem.Text); 
        }

        protected void gvCoPhanChiPhoi_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCoPhanChiPhoi.EditIndex = -1;
            PopulateGridview1(txtTimKiem.Text);
        }

        protected void gvCoPhanChiPhoi_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //try
            //{
            //    using (SqlConnection sqlcon = new SqlConnection(connectionString))
            //    {
            //        sqlcon.Open();

            //        SqlCommand sqlCmd = new SqlCommand("UPDATE COPHANCHIPHOI SET TenNV=@TenNV,GioiTinh=@GioiTinh,NgaySinh=@NgaySinh,CMND=@CMND,SDT=@SDT WHERE MaNV = @ID", sqlcon);
            //        sqlCmd.Parameters.AddWithValue("@TenNV", (gvCoPhanChiPhoi.Rows[e.RowIndex].FindControl("txtTenNV") as TextBox).Text.Trim());
            //        sqlCmd.Parameters.AddWithValue("@GioiTinh", (gvCoPhanChiPhoi.Rows[e.RowIndex].FindControl("txtGioiTinh") as TextBox).Text.Trim());
            //        sqlCmd.Parameters.AddWithValue("@NgaySinh", (gvCoPhanChiPhoi.Rows[e.RowIndex].FindControl("txtNgaySinh") as TextBox).Text.Trim());
            //        sqlCmd.Parameters.AddWithValue("@CMND", (gvCoPhanChiPhoi.Rows[e.RowIndex].FindControl("txtCMND") as TextBox).Text.Trim());
            //        sqlCmd.Parameters.AddWithValue("@SDT", (gvCoPhanChiPhoi.Rows[e.RowIndex].FindControl("txtSDT") as TextBox).Text.Trim());
            //        sqlCmd.Parameters.AddWithValue("@ID", Convert.ToString(gvCoPhanChiPhoi.DataKeys[e.RowIndex].Value.ToString()));
            //        sqlCmd.ExecuteNonQuery();
            //        PopulateGridview1(txtTimKiem.Text);
            //        lbSuccessMessage.Text = "Cập nhật thành công !";
            //        lbErrorMessage.Text = "";
            //    }
            //}
            //catch (Exception ex)
            //{
            //    lbSuccessMessage.Text = "";
            //    lbErrorMessage.Text = ex.Message;
            //}


        }

        protected void gvCoPhanChiPhoi_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    sqlcon.Open();

                    SqlCommand sqlCmd = new SqlCommand("DELETE FROM COPHANCHIPHOI  WHERE STT =@ID", sqlcon);

                    sqlCmd.Parameters.AddWithValue("@ID", Convert.ToString(gvCoPhanChiPhoi.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvCoPhanChiPhoi.EditIndex = -1;
                    PopulateGridview1(txtTimKiem.Text);
                    TimKiemTheoTenNhanVien(txtTimKiem.Text);
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


        private void LoadDataToDropDownListCongTY()
        {
           

          
                string connectionString = @"Data Source=PCTRANDANGCUONG\SQLEXPRESS;Initial Catalog=BaoCaoCoPhan_ThucTap;Integrated Security=True";
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter("Select  MaCTY,TenCTY From CONG_TY", connectionString);
                adapter.Fill(dataTable);
                drCongTy.DataSource = dataTable;
                drCongTy.DataTextField = "TenCTY"; //Text hiển thị
                drCongTy.DataValueField = "MaCTY"; //Giá trị khi chọn
                drCongTy.DataBind();
           



        }
        private void LoadDataToDropDownListNhanVien()
        {



            string connectionString = @"Data Source=PCTRANDANGCUONG\SQLEXPRESS;Initial Catalog=BaoCaoCoPhan_ThucTap;Integrated Security=True";
            DataTable dataTable = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter("Select  MaNV,TenNV From NHAN_VIEN", connectionString);
            adapter.Fill(dataTable);
            drNhanVien.DataSource = dataTable;
            drNhanVien.DataTextField = "TenNV"; //Text hiển thị
            drNhanVien.DataValueField = "MaNV"; //Giá trị khi chọn
            drNhanVien.DataBind();




        }
        private void LoadDataToDropDownListChucVu()
        {



            string connectionString = @"Data Source=PCTRANDANGCUONG\SQLEXPRESS;Initial Catalog=BaoCaoCoPhan_ThucTap;Integrated Security=True";
            DataTable dataTable = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter("Select  MaCV,TenCV From CHUC_VU", connectionString);
            adapter.Fill(dataTable);
            drChucDanh.DataSource = dataTable;
            drChucDanh.DataTextField = "TenCV"; //Text hiển thị
            drChucDanh.DataValueField = "MaCV"; //Giá trị khi chọn
            drChucDanh.DataBind();




        }

        protected void drCongTy_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {




                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    sqlcon.Open();
                    SqlCommand sqlCmd = new SqlCommand("INSERT INTO COPHANCHIPHOI (IDCongTy,IDNhanVien,IDChucDanh,DonViCongTac,SoCPTTDT_SL,SoCPTTDT_TL,SoCPTTDN_SL,SoCPTTDN_TL,GhiChu) VALUES (N'" +drCongTy.SelectedItem+ "',N'" + drNhanVien.SelectedItem + "',N'" + drChucDanh.SelectedItem + "',N'" + txtDonViCongTac.Text + "',N'" + txtSoCPTTDT_SL.Text + "',N'" + txtSoCPTTDT_TL.Text + "',N'" + txtSoCPTTDN_SL.Text + "',N'" + txtSoCPTTDN_TL.Text + "',N'" + txtGhiChu.Text + "')", sqlcon);
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
            PopulateGridview1(txtTimKiem.Text);
            TimKiemTheoTenNhanVien(txtTimKiem.Text);
        }
    }
}