using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiNhanSuVaTienLuong.DTO
{
    class nhanviendto
    {
        public int id { get; set; }
        public string ten { get; set; }
        public string cmt { get; set; }
        public string ngaysinh { get; set; }
        public string phone { get; set; }
        //public string gioitinh { get; set; }
        //public string diachi { get; set; }
        public int hosonhanvien { get; set; }
        public int trangthai { get; set; }
        public string hinhanh { get; set; }
        public int maphongban { get; set; }
        public int machucvu { get; set; }
        public int mahesoluong { get; set; }
        public int matrocap { get; set; }
    }
}
