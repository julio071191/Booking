using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Web;
using m = Booking.Model;

namespace Booking.Controller
{
    public class Resort
    {
        public List<m.Resort> GetResorts()
        {
            DatabaseHelper.Database db = new DatabaseHelper.Database();

            DataTable ds = db.GetResorts();

            return ConvertDSToList(ds);
        }

        public List<m.Resort> GetResort(int id)
        {
            DatabaseHelper.Database db = new DatabaseHelper.Database();

            DataTable ds = db.GetResort(id);

            return ConvertDSToList(ds);
        }

        public List<m.Resort> ConvertDSToList(DataTable ds)
        {
            List<m.Resort> resortsList = new List<m.Resort>();

            foreach (DataRow row in ds.Rows)
            {
                resortsList.Add(new m.Resort
                {
                    Id = Convert.ToInt16(row["id"]),
                    Name = row["name"].ToString(),
                    Description = row["description"].ToString(),
                    Photo = row["photo"].ToString(),
                    Price = Convert.ToDecimal(row["price"])
                });
            }

            return resortsList;
        }
    }
}