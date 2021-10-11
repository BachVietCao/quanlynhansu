using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;
using System.Data.OleDb;
using Excel = Microsoft.Office.Interop.Excel;

using QuanLiNhanSuVaTienLuong.DAL;
using QuanLiNhanSuVaTienLuong.DTO;
using QuanLiNhanSuVaTienLuong.BLL;

namespace QuanLiNhanSuVaTienLuong
{
    public partial class nhanvien : Form
    {
        public nhanvien()
        {
            InitializeComponent();
        }
        public string _stus = "0";

        DataAccess ac = new DataAccess();

        nhanviendto doituong = new nhanviendto();
        nhanvienbll xuly = new nhanvienbll();

        public void load_doituong()
        {
            doituong.id = int.Parse(txtma.Text);
            doituong.ten = txtten.Text;
            doituong.cmt = txtcmt.Text;
            doituong.ngaysinh = txtngaysinh.Text;
            doituong.phone = txtdienthoai.Text;
            doituong.hinhanh = txthinhanh.Text;
            doituong.hosonhanvien = int.Parse(cbhoso.SelectedValue.ToString());
            doituong.maphongban = int.Parse(cbphongban.SelectedValue.ToString());
            doituong.machucvu = int.Parse(cbchucvu.SelectedValue.ToString());
            doituong.matrocap = int.Parse(cbtrocap.SelectedValue.ToString());
            doituong.mahesoluong = int.Parse(cbhesoluong.SelectedValue.ToString());
            var tthai = 1;
            if (check_trangthai.Checked)
            {
                tthai = 1;
            }
            else
            {
                tthai = 0;
            }
            doituong.trangthai = tthai;
        }
        public void timkiem()
        {
            var dt = xuly.timkiem(txtSearch.Text);
            dataGridView1.DataSource = dt;
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
        public void xoa_text()
        {
            txtten.Text = "";
            txtten.Focus();
        }
        public void sua()
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
            if (_stus == "1")
            {
                if(check_data(txtten.Text))
                {
                    txtten.Focus();
                    lblEx.Text = "đã tồn tại dữ liệu này, vui lòng kiểm tra lại";
                    lblEx.ForeColor = Color.Red;
                }
                else
                {
                    them();
                }
            }    
            else
            {
                sua();
            }
            load_data();
            trangthai_btn(true);
            trangthai_txt(true);
        }
        private void btnLoad_Click(object sender, EventArgs e)
        {
            load_data();
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

        private void btnDelete_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Bạn có chắc chắc chắn muốn xoá dữ liệu? Dữ liệu sẽ bị mất và không thể hồi phục lại");
            if (dialogResult == DialogResult.Yes)
            {
                xoa();
            }
            else if (dialogResult == DialogResult.No)
            {
                txtten.Focus();
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            luu();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            timkiem();
        }

        private void btnExcelX_Click(object sender, EventArgs e)
        {
            export_excel();
        }

        private void nhanvien_Load(object sender, EventArgs e)
        {
            load_frm();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView1.Rows[e.RowIndex];
                txtma.Text = row.Cells[0].Value.ToString();
                txtten.Text = row.Cells[1].Value.ToString();
                txtcmt.Text = row.Cells[2].Value.ToString();
                txtdienthoai.Text = row.Cells[3].Value.ToString();
                txtngaysinh.Text = row.Cells[4].Value.ToString();
                txthinhanh.Text = row.Cells[5].Value.ToString();
                cbhoso.Text = row.Cells[6].Value.ToString();
                cbphongban.Text = row.Cells[7].Value.ToString();
                cbchucvu.Text = row.Cells[8].Value.ToString();
                cbhesoluong.Text = row.Cells[9].Value.ToString();
                check_trangthai.Text = row.Cells[10].Value.ToString();
                cbtrocap.Text = row.Cells[11].Value.ToString();
            }
        }
        public bool check_data(string _value)
        {
            return ac.check_tontai("Nhân viên", "cmt", _value);
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
        public void load_frm()
        {
            load_data();
            trangthai_btn(true);
            trangthai_txt(true);
        }
        public void trangthai_txt(bool _trangthai)
        {
            txtten.ReadOnly = _trangthai;
            txtma.ReadOnly = _trangthai;
            txtngaysinh.ReadOnly = _trangthai;
            txthinhanh.ReadOnly = _trangthai;
            txtcmt.ReadOnly = _trangthai;
        }
        public void trangthai_btn(bool _trangthai)
        {
            btnADD.Enabled = _trangthai;
            btnEdit.Enabled = _trangthai;
            btnDelete.Enabled = _trangthai;
            btnSave.Enabled = !_trangthai;
            btnCancel.Enabled = !_trangthai;
        }
        public void load_data()
        {
            var dt = xuly.hien();
            dataGridView1.DataSource = dt;
            load_combox();
        }
        public void load_combox()
        {
            load_hosonhanvien();
            load_chucvu();
            load_hesoluong();
            load_trocap();
            load_phongban();
        }
        hosonhanvienbll xuly_hosonhanvien = new hosonhanvienbll();
        public void load_hosonhanvien()
        {
            var dt = xuly_hosonhanvien.hien();
            cbhoso.DataSource = dt;
            cbhoso.DisplayMember = "kihieu";
            cbhoso.ValueMember = "id";
            cbhoso.SelectedIndex = 1;
        }

        phongbanbll xuly_phongban = new phongbanbll();
        public void load_phongban()
        {
            var dt = xuly_phongban.hien();
            cbphongban.DataSource = dt;
            cbphongban.DisplayMember = "ten";
            cbphongban.ValueMember = "id";
            cbphongban.SelectedIndex = 1;
        }
        chucvubll xuly_chucvu = new chucvubll();
        public void load_chucvu()
        {
            var dt = xuly_chucvu.hien();
            cbchucvu.DataSource = dt;
            cbchucvu.DisplayMember = "ten";
            cbchucvu.ValueMember = "id";
            cbchucvu.SelectedIndex = 1;
        }
        hesoluongbll xuly_hesoluong = new hesoluongbll();
        public void load_hesoluong()
        {
            var dt = xuly_hesoluong.hien();
            cbhesoluong.DataSource = dt;
            cbhesoluong.DisplayMember = "ten";
            cbhesoluong.ValueMember = "id";
            cbhesoluong.SelectedIndex = 1;
        }
        trocapbll xuly_trocap = new trocapbll();
        public void load_trocap()
        {
            var dt = xuly_trocap.hien();
            cbtrocap.DataSource = dt;
            cbtrocap.DisplayMember = "ten";
            cbtrocap.ValueMember = "id";
            cbtrocap.SelectedIndex = 1;
        }

        private void splitContainer1_Panel1_Paint(object sender, PaintEventArgs e)
        {

        }
        DataAccess xulychung = new DataAccess();
        
        public void load_hosotheoma()
        {
            int code = int.Parse(cbhoso.SelectedValue.ToString());
            var dt = xulychung.Load_theo_ma("hosonhanvien_by_id", code);
            if (dt != null && dt.Rows.Count > 0)
            {
                var dr = dt.Rows[0];
                txtnoidunghoso.Text = dr["noidung"].ToString();
            }
            else
            {
                txtnoidunghoso.Text = "Chưa có dữ liệu!";
            }
        }
        private void cbhoso_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void txtnoidunghoso_TextChanged(object sender, EventArgs e)
        {
            load_hosotheoma();
        }
    }
}
