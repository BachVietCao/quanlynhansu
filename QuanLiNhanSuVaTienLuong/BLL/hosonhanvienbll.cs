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
    class hosonhanvienbll
    {
        DataAccess ac = new DataAccess();
        public DataTable hien()
        {
            var dt = ac.GetDataTable_Store("hosonhanvien_hien");
            return dt;
        }
        public DataTable timkiem(string ma)
        {
            var dt = ac.Load_Theo_ma("hosonhanvien_timkiem", ma);
            return dt;
        }
        public void them(hosonhanviendto doituong)
        {
            string chuoi = "INSTER INTO HoSoNhanVien";
            chuoi += " (kihieu, noidung, ngaytao, ngaycapnhat)";
            chuoi += " VALUES ( ";
            chuoi += " N'" + doituong.kihieu + "', ";
            chuoi += " N'" + doituong.noidung + "', ";
            chuoi += " N'" + doituong.ngaytao + "', ";
            chuoi += " N'" + doituong.ngaycapnhat + "') ";
            try
            {
                ac.ExecuteCommandText(chuoi);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        public void sua(hosonhanviendto doituong)
        {
            string chuoi = "UPDATE HoSoNhanVien SET ";
            chuoi += "kihieu = N'" + doituong.kihieu + "', ";
            chuoi += "noidung = N'" + doituong.noidung + "', ";
            chuoi += "ngaytao = N'" + doituong.ngaytao + "', ";
            chuoi += "ngaycapnhat = N'" + doituong.ngaycapnhat + "' ";
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

        public void xoa(hosonhanviendto doituong)
        {
            string chuoi = "DELETE FORM HoSoNhanVien ";
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
