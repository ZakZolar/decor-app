using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalWeb.Models;
//using System.Data.SqlClient;

namespace FinalWeb.Controllers
{
    public class ForBuyerThankYouController : Controller
    {
        DecorFinalWebEntities2 db = new DecorFinalWebEntities2();
        //
        // GET: /ForBuyerThankYou/
        public ActionResult Voucher()
        {
            //var entities = new DecorFinalWebEntities2();

            //return View(entities.Orders.ToList());
            //DecorFinalWebEntities2 entities = new DecorFinalWebEntities2();
            var maxID = db.Orders.Max(x => x.OrderID);
            //var result = db.Orders.ToList().OrderByDescending(x=>x.OrderID).First();
            var result = db.Orders.Where(x => x.OrderID == maxID).ToList();
            //return View(from order in entities.Orders.OrderByDescending(x => x.OrderID).First() select order);
            //return View(from a in Order orderby U.OrderID descending select Order).Take(1);
            return View(result);

           
        }
        public ActionResult Index()
        {

            ViewBag.cartBox = null;
            ViewBag.Total = null;
            ViewBag.NoOfItem = null;
            ShippingData.items = null;
            return View("Thankyou");
        }
        }
	}


