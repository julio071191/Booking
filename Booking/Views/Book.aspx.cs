using Booking.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using c = Booking.Controller;
using m = Booking.Model;

namespace Booking.Views
{
    public partial class Book : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["loginInfo"] == null)
                {
                    Response.Redirect("Booking.aspx?session=false");
                }

                int id = Convert.ToInt16(Request.QueryString["id"]);

                c.Resort resortController = new c.Resort();
                List<m.Resort> resort = resortController.GetResort(id);
                Session["resort"] = resort;                

                calCheckin.SelectedDate = DateTime.Now.AddMonths(1);
                calCheckOut.SelectedDate = DateTime.Now.AddMonths(1).AddDays(4);

                CalculateBookCost();

                repResort.DataSource = resort;
                repResort.DataBind();
            }
        }

        private void CalculateBookCost()
        {
            List<m.Resort> resort = (List<m.Resort>)Session["resort"];

            m.Book book = new m.Book()
            {
                Id = resort[0].Id,
                Session = (m.LoginResponsePayload)Session["loginInfo"],
                Price = resort[0].Price,
                Checkin = calCheckin.SelectedDate,
                Checkout = calCheckOut.SelectedDate,
                Kids = Convert.ToInt16(dropDownKids.SelectedValue),
                Adults = Convert.ToInt16(dropDownAdult.SelectedValue)                
            };

            book.Nights = book.GetNights();
            book.Cost = book.GetCost();
            book.Total = book.GetTotal();

            lblNights.InnerText = book.Nights.ToString();
            lblPrice.InnerText = book.Price.ToString();
            lblCost.InnerText = book.Cost.ToString();
            lblTotal.InnerText = book.Total.ToString();

            if (book.Kids > 0)
            {
                divExtraMember.Attributes.Remove("hidden");
                lblExtraMemberCost.InnerText = book.GetExtraMember().ToString();
            }

            Session["Book"] = book;
        }

        protected void btnSave_ServerClick(object sender, EventArgs e)
        {
            m.Book book = (m.Book)Session["Book"];

            c.Book controllerBook = new c.Book();

            controllerBook.SaveBook(book);
        }

        protected void dropDownKids_SelectedIndexChanged(object sender, EventArgs e)
        {
            CalculateBookCost();
        }

        protected void calCheckOut_SelectionChanged(object sender, EventArgs e)
        {
            CalculateBookCost();
        }

        protected void dropDownAdult_SelectedIndexChanged(object sender, EventArgs e)
        {
            CalculateBookCost();
        }
    }
}