using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;

using QuanLiNhanSuVaTienLuong.DAL;
using QuanLiNhanSuVaTienLuong.DTO;


namespace QuanLiNhanSuVaTienLuong.BLL
{
    class taikhoanbll
    {
        DataAccess ac = new DataAccess();
        public DataTable hien()
        {
            var dt = ac.GetDataTable_Store("taikhoan_hien");
            return dt;
        }
        public DataTable timkiem(string ma)
        {
            var dt = ac.Load_Theo_ma("taikhoan_timkiem", ma);
            return dt;
        }
        public void them(taikhoandto doituong)
        {
            string chuoi = "INSTER INTO TaiKhoan";
            chuoi += " (ten, matkhau, maquyen, trangthai)";
            chuoi += " VALUES ( ";
            chuoi += " N'" + doituong.ten + "', ";
            chuoi += " N'" + doituong.matkhau + "', ";
            chuoi += " N'" + doituong.quyen + "', ";
            chuoi += " N'" + doituong.trangthai + "') ";
            try
            {
                ac.ExecuteCommandText(chuoi);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        public void sua(taikhoandto doituong)
        {
            string chuoi = "UPDATE TaiKhoan SET ";
            chuoi += "ten = N'" + doituong.ten + "', ";
            chuoi += "matkhau = N'" + doituong.matkhau + "', ";
            chuoi += "quyen = N'" + doituong.quyen + "', ";
            chuoi += "trangthai = N'" + doituong.trangthai + "' ";
            chuoi += "WHERE id = N'" + doituong.id + "' ";
            try
            {
                ac.ExecuteCommandText(chuoi);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        public void xoa(taikhoandto doituong)
        {
            string chuoi = "DELETE FORM TaiKhoan ";
            chuoi += "WHERE id = N'" + doituong.id + "' ";
            try
            {
                ac.ExecuteCommandText(chuoi);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }
    }
}
