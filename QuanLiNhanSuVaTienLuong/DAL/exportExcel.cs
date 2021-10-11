using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using System.Data;
using System.Data.OleDb;
using Excel = Microsoft.Office.Interop.Excel;
using System.Data.SqlClient;
using System.IO;

namespace QuanLiNhanSuVaTienLuong.DAL
{
    class exportExcel
    {
        
        public string Exports(DataTable dt, string _pathname)
        {
            var _return = "........";
            try
            {
                if (dt != null || dt.Columns.Count > 0)
                {
                    _return = "khong co du lieu";
                    #region khoi tao
                    //load excel vaf create a new workbook
                    var excelApp = new Excel.Application();
                    excelApp.Workbooks.Add();
                    Excel._Worksheet workSheet = excelApp.ActiveSheet;
                    // tieu de cot
                    for (var i = 0; i < dt.Columns.Count; i++)
                    {
                        workSheet.Cells[2, i + 1] = dt.Columns[i].ColumnName;
                    }
                    //dong
                    for (var i = 0; i < dt.Rows.Count; i++)
                    {
                        for (var j = 0; j < dt.Columns.Count; j++)
                        {
                            workSheet.Cells[i + 3, j + 1] = dt.Rows[i][j];
                        }
                    }
                        #endregion
                        #region Lam dep ----------------------------
                        int socot = dt.Columns.Count;
                        int sohang = dt.Rows.Count;
                        // set thuoc tih cho tieu de
                        workSheet.get_Range("Al", Convert.ToChar(socot + 65) + "1").Merge(false);
                        Excel.Range caption = workSheet.get_Range("A1", Convert.ToChar(socot + 65) + "1");
                        caption.Select();
                        caption.FormulaR1C1 = "Du Lieu";
                        caption.Font.FontStyle = "Bold";
                        //can le cho tieu de
                        caption.HorizontalAlignment = Excel.Constants.xlCenter;
                        caption.Font.Bold = true;
                        caption.VerticalAlignment = Excel.Constants.xlCenter;
                        caption.Font.Size = 15;
                        //mau nen cho tieu de
                        //56 mau
                        caption.Interior.ColorIndex = 33;
                        caption.RowHeight = 30;
                        //header
                        Excel.Range header = workSheet.get_Range("A2", Convert.ToChar(socot + 65) + "2");
                        header.HorizontalAlignment = Excel.Constants.xlCenter;
                        header.Font.Bold = true;
                        header.Font.Size = 13;
                        header.HorizontalAlignment = Excel.Constants.xlCenter;
                        //do rong cho cac cot
                        for (int i = 0; i < sohang; i++)
                            ((Excel.Range)workSheet.Cells[1, i + 1]).EntireColumn.AutoFit();
                        //------------------------------------------
                        #endregion
                        #region save file
                        workSheet.SaveAs(_pathname);
                        excelApp.Quit();
                        excelApp.Visible = true;
                        return _return = " Export thanh cong!";
                        #endregion
                }
            }
            catch(Exception Ex)
            {
                _return = "Loi:" + Ex.Message;
            }
            return _return;
        }
        public DataTable Imports (string _pathname)
        {
            string connstr = "Provider-Microsoft.Jet.Oledb.4.0;Data Source='"+_pathname+"';Extended Properties-Excel 8.0";
            OleDbConnection conn = new OleDbConnection(connstr);
            string strSQL = "SELECT * FROM[Sheet1$]";
            OleDbCommand cmd = new OleDbCommand(strSQL, conn);
            DataSet ds = new DataSet();
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            da.Fill(ds);
            return ds.Tables[0];
        }

        private class Application
        {
            public Application()
            {
            }

            public object Workbooks { get; internal set; }
            public _Worksheet ActiveSheet { get; internal set; }
        }
        
        private class _Worksheet
        {
        } 
        /*
        internal object Import(string path)
        {
            throw new NotImplementedException();
        }

        internal string Exports(DataTable dt, string text)
        {
            throw new NotImplementedException();
        }
        internal string Exports(DataTable dt, string text)
        {
            throw new NotImplementedException();
        }*/
    }
}
        