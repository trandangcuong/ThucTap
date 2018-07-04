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
    public partial class NguoiDaiDienVon : System.Web.UI.Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM NguoiDaiDienVon", sqlcon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvNguoiDaiDienVon.DataSource = dtbl;
                gvNguoiDaiDienVon.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvNguoiDaiDienVon.DataSource = dtbl;
                gvNguoiDaiDienVon.DataBind();
                gvNguoiDaiDienVon.Rows[0].Cells.Clear();
                gvNguoiDaiDienVon.Rows[0].Cells.Add(new TableCell());
                gvNguoiDaiDienVon.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvNguoiDaiDienVon.Rows[0].Cells[0].Text = "Không có dữ liệu...!";
                gvNguoiDaiDienVon.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


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
            drChucDanh.DataTextField = "CV_DNDCLDD"; //Text hiển thị
            drChucDanh.DataValueField = "MaCV"; //Giá trị khi chọn
            drChucDanh.DataBind();




        }


        void PopulateGridview1(string tennv)

        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {

                sqlcon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM NguoiDaiDienVon WHERE IDNhanVien LIKE N'%" + txtTimKiem.Text + "%'", sqlcon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvNguoiDaiDienVon.DataSource = dtbl;
                gvNguoiDaiDienVon.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvNguoiDaiDienVon.DataSource = dtbl;
                gvNguoiDaiDienVon.DataBind();
                gvNguoiDaiDienVon.Rows[0].Cells.Clear();
                gvNguoiDaiDienVon.Rows[0].Cells.Add(new TableCell());
                gvNguoiDaiDienVon.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvNguoiDaiDienVon.Rows[0].Cells[0].Text = "Không có dữ liệu...!";
                gvNguoiDaiDienVon.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
        }


        void TimKiemTheoTenNhanVien(string tennv)

        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {

                sqlcon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM NguoiDaiDienVon WHERE IDNhanVien LIKE N'%" + txtTimKiem.Text + "%'", sqlcon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvNguoiDaiDienVon.DataSource = dtbl;
                gvNguoiDaiDienVon.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvNguoiDaiDienVon.DataSource = dtbl;
                gvNguoiDaiDienVon.DataBind();
                gvNguoiDaiDienVon.Rows[0].Cells.Clear();
                gvNguoiDaiDienVon.Rows[0].Cells.Add(new TableCell());
                gvNguoiDaiDienVon.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvNguoiDaiDienVon.Rows[0].Cells[0].Text = "Không có dữ liệu...!";
                gvNguoiDaiDienVon.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
        }


        protected void gvNguoiDaiDienVon_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvNguoiDaiDienVon_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void gvNguoiDaiDienVon_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void gvNguoiDaiDienVon_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            //try
            //{




            //    using (SqlConnection sqlcon = new SqlConnection(connectionString))
            //    {
            //        sqlcon.Open();
            //        SqlCommand sqlCmd = new SqlCommand("INSERT INTO NguoiDaiDienVon (IDNhanVien,NgaySinh,IDChucDanh,ChuyenTrach,IDCongTy,TyLe,SoTien,ThoiGian,IDChuVu,VanBan_UBND,VanBan_DN) VALUES (N'" + drNhanVien.SelectedItem + "',N'" + txtNgaySinh.Value + "',N'" + drChucDanh.SelectedItem + "',N'" +  + "',N'" + txtSoCPTTDT_SL.Text + "',N'" + txtSoCPTTDT_TL.Text + "',N'" + txtSoCPTTDN_SL.Text + "',N'" + txtSoCPTTDN_TL.Text + "',N'" + txtGhiChu.Text + "')", sqlcon);
            //        sqlCmd.ExecuteNonQuery();
            //        PopulateGridview();
            //        lbSuccessMessage.Text = "Thêm thành công";
            //        lbErrorMessage.Text = "";

            //    }

            //}
            //catch (Exception ex)
            //{
            //    lbSuccessMessage.Text = "";
            //    lbErrorMessage.Text = ex.Message;
            //}
        }
    }
}