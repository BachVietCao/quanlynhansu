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
    class hesoluongbll
    {
        DataAccess ac = new DataAccess();
        public DataTable hien()
        {
            var dt = ac.GetDataTable_Store("hesoluong_hien");
            return dt;
        }
        public DataTable timkiem(string ma)
        {
            var dt = ac.Load_Theo_ma("hesoluong_timkiem", ma);
            return dt;
        }
        public void them(hesoluongdto doituong)
        {
            string chuoi = "INSTER INTO HeSoLuong";
            chuoi += " (ten, giatri)";
            chuoi += " VALUES ( ";
            chuoi += " N'" + doituong.ten + "'";
            chuoi += " ,N'" + doituong.giatri + "')";
            try
            {
                ac.ExecuteCommandText(chuoi);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        public void sua(hesoluongdto doituong)
        {
            string chuoi = "UPDATE HeSoLuong SET ";
            chuoi += "ten = N'" + doituong.ten + "', ";
            chuoi += "giatri = N'" + doituong.giatri + "' ";
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

        public void xoa(hesoluongdto doituong)
        {
            string chuoi = "DELETE FORM HeSoLuong ";
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
