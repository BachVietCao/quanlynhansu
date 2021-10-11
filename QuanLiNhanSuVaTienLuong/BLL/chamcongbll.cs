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
    class chamcongbll
    {
        DataAccess ac = new DataAccess();
        public DataTable hien()
        {
            var dt = ac.GetDataTable_Store("chamcong_hien");
            return dt;
        }
        public DataTable timkiem(string ma)
        {
            var dt = ac.Load_Theo_ma("chamcong_timkiem", ma);
            return dt;
        }
        public void them(chamcongdto doituong)
        {
            string chuoi = "INSTER INTO ChamCong";
            chuoi += " (idnhanvien, gio, ngay, thang, nam, trangthai, noidung, ghichu, dieukien)";
            chuoi += " VALUES ( ";
            chuoi += " N'" + doituong.idnhanvien + "', ";
            chuoi += " N'" + doituong.gio + "', ";
            chuoi += " N'" + doituong.ngay + "', ";
            chuoi += " N'" + doituong.thang + "', ";
            chuoi += " N'" + doituong.nam + "', ";
            chuoi += " N'" + doituong.trangthai + "', ";
            chuoi += " N'" + doituong.noidung + "', ";
            chuoi += " N'" + doituong.ghichu + "', ";
            chuoi += " N'" + doituong.dieukien + "') ";
            try
            {
                ac.ExecuteCommandText(chuoi);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        public void sua(chamcongdto doituong)
        {
            string chuoi = "UPDATE ChamCong SET ";
            chuoi += "idnhanvien = N'" + doituong.idnhanvien + "', ";
            chuoi += "gio = N'" + doituong.gio + "', ";
            chuoi += "ngay = N'" + doituong.ngay + "', ";
            chuoi += "thang = N'" + doituong.thang + "', ";
            chuoi += "nam = N'" + doituong.nam + "', ";
            chuoi += "trangthai = N'" + doituong.trangthai + "', ";
            chuoi += "noidung = N'" + doituong.noidung + "', ";
            chuoi += "ghichu = N'" + doituong.ghichu + "', ";
            chuoi += "ghichu = N'" + doituong.dieukien + "' ";
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
