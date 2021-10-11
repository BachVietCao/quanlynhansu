﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;

using QuanLiNhanSuVaTienLuong.DAL;
using QuanLiNhanSuVaTienLuong.DTO;


namespace QuanLiNhanSuVaTienLuong.BLL
{
    class quyenbll
    {
        DataAccess ac = new DataAccess();
        public DataTable hien()
        {
            var dt = ac.GetDataTable_Store("Quyen_hien");
            return dt;
        }
        public DataTable timkiem(string ma)
        {
            var dt = ac.Load_Theo_ma("Quyen_timkiem", ma);
            return dt;
        }
        public void them(quyendto doituong)
        {
            string chuoi = "INSERT INTO Quyen";
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
        public void sua(quyendto doituong)
        {
            string chuoi = "UPDATE Quyen SET";
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
        public void xoa(quyendto doituong)
        {
            string chuoi = "DELETE PROM Quyen ";
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
