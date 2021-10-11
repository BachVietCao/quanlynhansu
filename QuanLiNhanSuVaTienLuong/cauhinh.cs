using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.OleDb;
using Excel = Microsoft.Office.Interop.Excel;
using System.Data.SqlClient;
using System.IO;

using QuanLiNhanSuVaTienLuong.DAL;
using QuanLiNhanSuVaTienLuong.DTO;
using QuanLiNhanSuVaTienLuong.BLL;


namespace QuanLiNhanSuVaTienLuong
{
    public partial class frmcauhinh : Form
    {
        public frmcauhinh()
        {
            InitializeComponent();
        }
        public string _stus = "0";

        DataAccess ac = new DataAccess();

        public void load_data()
        {
            var dt = xuly.hien();
            dataGridView1.DataSource = dt;
        }
        public void timkiem()
        {
            var dt = xuly.timkiem(txtSearch.Text);
            dataGridView1.DataSource = dt;
        }
        public void xoa_text()
        {
            txtten.Text = "";
            txtten.Focus();
        }
        public void them()
        {
            try
            {
                load_doituong();
                xuly.them(doituong);
                load_data();
                xoa_text();
                lblEx.Text = "Thêm dữ liệu thành công ";
            }
            catch (Exception Ex)
            {
                lblEx.Text = "Lỗi dữ liệu" + Ex.Message.ToString();
                txtten.Focus();
            }
        }
        public void sua()
        {
            try
            {
                if(int.Parse(txtma.Text) <=0)
                {
                    MessageBox.Show("Vui lòng chọn dữ liệu", "Thông báo", MessageBoxButtons.OK);
                    lblEx.Text = ("Chưa chọn dữ liệu");
                } 
                else
                {
                    load_doituong();
                    xuly.sua(doituong);
                    load_data();
                    xoa_text();
                    lblEx.Text = "Cập nhật dữ liệu thành công ";
                }    
            }
            catch (Exception Ex)
            {
                lblEx.Text = "Lỗi dữ liệu" + Ex.Message.ToString();
                txtten.Focus();
            }
        }
        public void xoa()
        {
            try
            {
                if (int.Parse(txtma.Text) <= 0)
                {
                    MessageBox.Show("Vui lòng chọn dữ liệu", "Thông báo", MessageBoxButtons.OK);
                    lblEx.Text = ("Chưa chọn dữ liệu");
                }
                else
                {
                    load_doituong();
                    xuly.xoa(doituong);
                    load_data();
                    xoa_text();
                    lblEx.Text = "Xoá dữ liệu thành công ";
                }
            }
            catch (Exception Ex)
            {
                lblEx.Text = "Lỗi dữ liệu" + Ex.Message.ToString();
                txtten.Focus();
            }
        }
        public void luu()
        {
            if(_stus == "1")
            {
                them();
            }   
            else
            {
                sua();
            }
            load_data();
            trangthai_btn(true);
            trangthai_txt(true);
        }
        public void trangthai_txt(bool _trangthai )
        {
            txtten.ReadOnly = _trangthai;
            txttacgia.ReadOnly = _trangthai;
            txtma.ReadOnly = _trangthai;
            txtgioithieu.ReadOnly = _trangthai;
            txthuongdan.ReadOnly = _trangthai;
        }
        public void trangthai_btn(bool _trangthai)
        {
            btnADD.Enabled = _trangthai;
            btnEdit.Enabled = _trangthai;
            btnDelete.Enabled = _trangthai;
            btnSave.Enabled = !_trangthai;
            btnCancel.Enabled = !_trangthai;
        }
        private void frmcauhinh_Load(object sender, EventArgs e)
        {
            load_data();
            trangthai_btn(true);
            trangthai_txt(true);
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Bạn có chắc chắc chắn muốn xoá dữ liệu? Dữ liệu sẽ bị mất và không thể hồi phục lại");
            if(dialogResult == DialogResult.Yes)
            {
                xoa();
            }
            else if (dialogResult == DialogResult.No)
            {
                txtten.Focus();
            }    
        }

        private void btnADD_Click(object sender, EventArgs e)
        {
            trangthai_btn(false);
            trangthai_txt(false);
            _stus = "1";
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            trangthai_btn(false);
            trangthai_txt(false);
            _stus = "0";
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            trangthai_btn(true);
            trangthai_txt(true);
            _stus = "0";
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            luu();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            timkiem();
        }

        private void btnLoad_Click(object sender, EventArgs e)
        {
            load_data();
        }

        private void btnExcelX_Click(object sender, EventArgs e)
        {
            export_excel();
        }
        exportExcel exce = new exportExcel();
        public void export_excel()
        {
            var dt = xuly.hien();
            SaveFileDialog f = new SaveFileDialog();
            f.Filter = "Excel File(.xls)|*.xls";
            if (f.ShowDialog() == DialogResult.OK)
            {
                var chuoi = f.FileName;
                //chuoi = chuoi.ToString().Replace("\\", "\\\\");
                lblEx.Text = chuoi;
                lblEx.Text = exce.Exports(dt, lblEx.Text);
            }   
            else
            {
                lblEx.Text = "không thực hiện được";
            }    
        }
        cauhinhdto doituong = new cauhinhdto();
        cauhinhbll xuly = new cauhinhbll();
        public void load_doituong()
        {
            doituong.id = int.Parse(txtma.Text);
            doituong.ten = txtten.Text;
            doituong.tacgia = txttacgia.Text;
            doituong.gioithieu = txtgioithieu.Text;
            doituong.huongdan = txthuongdan.Text;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView1.Rows[e.RowIndex];
                txtten.Text = row.Cells[0].Value.ToString();
                txtma.Text = row.Cells[1].Value.ToString();
                txttacgia.Text = row.Cells[2].Value.ToString();
                txtgioithieu.Text = row.Cells[3].Value.ToString();
                txthuongdan.Text = row.Cells[4].Value.ToString();
            }
            else
            {
                txtma.Text = "0" ;
                txtten.Text = "";
                txtgioithieu.Text = "";
            }
        }
    }
}
