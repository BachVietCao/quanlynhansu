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

using QuanLiNhanSuVaTienLuong.DAL;
using QuanLiNhanSuVaTienLuong.DTO;
using QuanLiNhanSuVaTienLuong.BLL;

namespace QuanLiNhanSuVaTienLuong
{
    public partial class fmchamcong : Form
    {
        public fmchamcong()
        {
            InitializeComponent();
        }

        nhanvienbll xuly_nhanvien = new nhanvienbll();

        public void load_data()
        {
            var dt = xuly_nhanvien.hien();
            dataGridView1.DataSource = dt;
        }

        private void splitContainer1_SplitterMoved(object sender, SplitterEventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        { 

        } 

        chamcongdto doituong = new chamcongdto();
        chamcongbll xuly = new chamcongbll();

        public void load_doituong()
        {
            doituong.idnhanvien = int.Parse(txtmanhanvien.Text);
            doituong.gio = DateTime.Now.ToLongTimeString();
            doituong.ngay = DateTime.Now.Day.ToString();
            doituong.thang = DateTime.Now.Month.ToString();
            doituong.nam = DateTime.Now.Year.ToString();
            doituong.noidung = txtnoidung.Text;
            doituong.ghichu = txtghichu.Text;
            doituong.dieukien = txtdieukien.Text;
            var tthai = 1;
            if(cb_check.Checked)
            {
                tthai = 1;
            }
            else
            {
                tthai = 0; 
            }
            doituong.trangthai = tthai;
        }
        public void them()
        {
            try
            {
                load_doituong();
                xuly.them(doituong);
                load_bangchamcong();
                lblEx.Text = "Thêm dữ liệu thành công ";
            }
            catch (Exception Ex)
            {
                lblEx.Text = "Lỗi dữ liệu" + Ex.Message.ToString();
                //txtten.Focus();
            }
        }
        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void splitContainer5_Panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void splitContainer3_Panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void fmchamcong_Load(object sender, EventArgs e)
        {
            load_data();
            load_bangchamcong();
        }

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView1.Rows[e.RowIndex];
                txtmanhanvien.Text = row.Cells[0].Value.ToString();
                txtmanhanvien1.Text = row.Cells[0].Value.ToString();
                txttennhanvien.Text = row.Cells[1].Value.ToString();
                txtchungminhthu.Text = row.Cells[2].Value.ToString();
                txtngaysinh.Text = row.Cells[3].Value.ToString();
                txtdienthoai.Text = row.Cells[4].Value.ToString();
                txtphongban.Text = row.Cells[15].Value.ToString();
                txtchucvu.Text = row.Cells[16].Value.ToString();
            }
        }
        public void load_bangchamcong()
        {
            var dt = xuly.hien();
            dataGridView2.DataSource = dt;

        }
        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnchamcong_Click(object sender, EventArgs e)
        {
            if(int.Parse(txtmanhanvien.Text)<= 0)
            {
                MessageBox.Show("Vui lòng chọn nhân viên trước!");
            }    
            else
            {
                them();
            }    
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            txtngay.Text = DateTime.Now.ToString("HH:mm dd/MM/yyyy");
        }
    }
}
