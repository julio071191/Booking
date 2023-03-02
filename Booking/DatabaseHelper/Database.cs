using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using m = Booking.Model;

namespace Booking.DatabaseHelper
{
    public class Database
    {
        const string database = "Booking";
        const string server = "localhost";
        string cnn = $"Data Source={server};Initial Catalog={database};Integrated Security=True";

        public DataTable GetResorts()
        {
            return ExecuteQuery("[dbo].[spGetResorts]", null);
        }

        public DataTable GetResort(int id)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@id", id),
            };

            return ExecuteQuery("[dbo].[spGetResort]", param);
        }

        public void SaveBooking(m.Book book)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                 new SqlParameter("@BookId", book.BookId),
                 new SqlParameter("@Email", book.Session.email),
                 new SqlParameter("@Checkin", book.Checkin),
                 new SqlParameter("@Checkout", book.Checkout),
                 new SqlParameter("@Adults", book.Adults),
                 new SqlParameter("@Kids", book.Kids),
                 new SqlParameter("@Nights", book.Nights),
                 new SqlParameter("@Cost", book.Cost),
                 new SqlParameter("@Total", book.Total),
            };

            ExecuteQuery("[dbo].[spSaveBooking]", param);
        }

        public DataTable ExecuteQuery(string storedProcedure, List<SqlParameter> param)
        {
            try
            {
                DataTable ds = new DataTable();

                using (SqlConnection connection = new SqlConnection(cnn))
                {
                    connection.Open();
                    SqlCommand cmd = connection.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = storedProcedure;

                    if (param != null)
                    {
                        foreach(SqlParameter p in param)
                        {
                            cmd.Parameters.Add(p);
                        }
                    }

                    cmd.ExecuteNonQuery();

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(ds);
                }

                return ds;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}