using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalWeb.Models
{
    public class SellerShippingData
    {
        public static int UserID { get; set; }
        public static List<SellerOrderDetail> items { get; set; }
    }
}
