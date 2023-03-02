using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using m = Booking.Model;

namespace Booking.Controller
{
    public class Book
    {
        public void SaveBook(m.Book book)
        {
            DatabaseHelper.Database db = new DatabaseHelper.Database();

            db.SaveBooking(book);
        }
    }
}