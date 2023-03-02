using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Booking.Model
{
    public class Book : Resort
    {
        public int BookId { get; set; }
        public LoginResponsePayload Session { get; set; }
        public DateTime Checkin { get; set; }
        public DateTime Checkout { get; set; }
        public int Adults { get; set; }
        public int Kids { get; set; }
        public int Nights { get; set; }
        public decimal Cost { get; set; }
        public decimal CleaningTax { get; set; }
        public decimal ServiceTax { get; set; }
        public decimal Total { get; set; }

        public decimal GetCost()
        {
            return this.Nights * this.Price + GetExtraMember();
        }

        public decimal GetExtraMember()
        {
            decimal cost = this.Nights * this.Price;

            return this.Kids > 0 ? (cost * GetTaxExtraMember(this.Kids)) : 0;
        }

        public int GetNights()
        {
            this.Nights = (Checkout - Checkin).Days;

            return Nights;
        }

        public decimal GetCleaningTax()
        {
            return 20;
        }

        public decimal GetServiceTax()
        {
            return 10;
        }

        public decimal GetTotal()
        {
            return GetCost() + GetCleaningTax() + GetServiceTax();
        }

        public decimal GetTaxExtraMember(int extraMember)
        {
            return extraMember * (decimal)0.15;
        }
    }
}