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
    public partial class Contact : Page
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
                gvCONGTY.DataSource = dtbl;
                gvCONGTY.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvCONGTY.DataSource = dtbl;
                gvCONGTY.DataBind();
                gvCONGTY.Rows[0].Cells.Clear();
                gvCONGTY.Rows[0].Cells.Add(new TableCell());
                gvCONGTY.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvCONGTY.Rows[0].Cells[0].Text = "Không có dữ liệu...!";
                gvCONGTY.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


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

        protected void gvCONGTY_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCONGTY.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        protected void gvCONGTY_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCONGTY.EditIndex = -1;
            PopulateGridview();

        }

        protected void gvCONGTY_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void gvCONGTY_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    sqlcon.Open();

                    SqlCommand sqlCmd = new SqlCommand("DELETE FROM CONG_TY  WHERE MaCTY =@ID", sqlcon);

                    sqlCmd.Parameters.AddWithValue("@ID", Convert.ToString(gvCONGTY.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvCONGTY.EditIndex = -1;
                    PopulateGridview();
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
