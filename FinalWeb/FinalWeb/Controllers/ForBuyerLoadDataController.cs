using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalWeb.Models;

namespace FinalWeb.Controllers
{
    public static class ForBuyerLoadDataController 
    {
       static DecorFinalWebEntities2 db=new DecorFinalWebEntities2();
        //
        // GET: /ForBuyerLoadData/
        public static List<OrderDetail> GetDefaultData(this ControllerBase controller)
        {
            if (ShippingData.items == null)
            {
                ShippingData.items = new List<OrderDetail>();
            }
            var data = ShippingData.items.ToList();

            controller.ViewBag.cartBox = data.Count == 0 ? null : data;
            controller.ViewBag.NoOfItem = data.Count();
            int? SubTotal = Convert.ToInt32(data.Sum(x => x.TotalAmount));
            controller.ViewBag.Total = SubTotal;

            int Discount = 0;
            controller.ViewBag.SubTotal = SubTotal;
            controller.ViewBag.Discount = Discount;
            controller.ViewBag.TotalAmount = SubTotal - Discount;

            controller.ViewBag.WlItemsNo = db.Wishlists.Where(x => x.CustomerID == ShippingData.UserID).ToList().Count();
            return data;
        }
	}
}

