using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalWeb.Models;

namespace FinalWeb.Controllers
{
    public class ForSellerThankYouController : Controller
    {
        DecorSellerEntities2 db = new DecorSellerEntities2();
        //
        // GET: /ForBuyerThankYou/
        public ActionResult Voucher()
        {
            //var entities = new DecorFinalWebEntities2();

            //return View(entities.Orders.ToList());
            //DecorFinalWebEntities2 entities = new DecorFinalWebEntities2();
            var maxID = db.SellerOrders.Max(x => x.OrderID);
            //var result = db.Orders.ToList().OrderByDescending(x=>x.OrderID).First();
            var result = db.SellerOrders.Where(x => x.OrderID == maxID).ToList();
            //return View(from order in entities.Orders.OrderByDescending(x => x.OrderID).First() select order);
            //return View(from a in Order orderby U.OrderID descending select Order).Take(1);
            return View(result);


        }
        public ActionResult Index()
        {

            ViewBag.cartBox = null;
            ViewBag.Total = null;
            ViewBag.NoOfItem = null;
            SellerShippingData.items = null;
            return View("Thankyou");
        }
	}
}