using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;
using QuanLiNhanSuVaTienLuong.DAL;
using QuanLiNhanSuVaTienLuong.DTO;

namespace QuanLiNhanSuVaTienLuong.BLL
{
    class trocapbll
    {
        DataAccess ac = new DataAccess();
        public DataTable hien()
        {
            var dt = ac.GetDataTable_Store("trocap_hien");
            return dt;
        }
        public DataTable timkiem(string ma)
        {
            var dt = ac.Load_Theo_ma("trocap_timkiem", ma);
            return dt;
        }
        public void them(trocapdto doituong)
        {
            string chuoi = "INSERT INTO TroCap";
            chuoi += "(ten, giatri)";
            chuoi += "Values (";
            chuoi += "N'" + doituong.ten + "', ";
            chuoi += "N'" + doituong.giatri + "', ";
            try
            {
                ac.ExecuteCommandText(chuoi);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }
        public void sua(trocapdto doituong)
        {
            string chuoi = "UPDATE TroCap SET";
            chuoi += "ten=N'" + doituong.ten + "', ";
            chuoi += "giatri =N'" + doituong.giatri + "', ";
            chuoi += "Where id =N'" + doituong.id + "', ";
            try
            {
                ac.ExecuteCommandText(chuoi);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }
        public void xoa(trocapdto doituong)
        {
            string chuoi = "DELETE PROM TroCap ";
            chuoi += "Where id =N'" + doituong.id + "', ";
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
