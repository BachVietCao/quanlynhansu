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
    class tinhluongbll
    {
        DataAccess ac = new DataAccess();
        public DataTable hien()
        {
            var dt = ac.GetDataTable_Store("tinhluong_hien");
            return dt;
        }
        public DataTable timkiem(string ma)
        {
            var dt = ac.Load_Theo_ma("tinhluong_timkiem", ma);
            return dt;
        }
        public void them(tinhluongdto doituong)
        {
            string chuoi = "INSTER INTO TinhLuong";
            chuoi += " (idnhanvien, ngaycong, tong, thang, nam)";
            chuoi += " VALUES ( ";
            chuoi += " N'" + doituong.idnhanvien + "',";
            chuoi += " N'" + doituong.ngaycong + "',";
            chuoi += " N'" + doituong.tong + "',";
            chuoi += " N'" + doituong.thang + "',";
            chuoi += " N'" + doituong.nam + "')";
            try
            {
                ac.ExecuteCommandText(chuoi);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        public void sua(tinhluongdto doituong)
        {
            string chuoi = "UPDATE TinhLuong SET ";
            chuoi += "idnhanvien = N'" + doituong.idnhanvien + "', ";
            chuoi += "ngaycong = N'" + doituong.ngaycong + "', ";
            chuoi += "tong = N'" + doituong.tong + "', ";
            chuoi += "thang = N'" + doituong.thang + "', ";
            chuoi += "matrocap = N'" + doituong.nam + ") ";
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

        public void xoa(tinhluongdto doituong)
        {
            string chuoi = "DELETE FORM TinhLuong ";
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
