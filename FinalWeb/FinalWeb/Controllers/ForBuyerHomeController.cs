using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalWeb.Models;

namespace FinalWeb.Controllers
{
    public class ForBuyerHomeController : Controller
    {
        DecorFinalWebEntities2 db = new DecorFinalWebEntities2();
        ProductSeller ps = new ProductSeller();
        //
        // GET: /ForBuyerHome/
        public ActionResult Index()
        {
            
            ViewBag.LivingProduct = db.Products.Where(x => x.Category.Name.Equals("Living")).ToList();
            ViewBag.LightingProduct = db.Products.Where(x => x.Category.Name.Equals("Lighting")).ToList();
            ViewBag.FurnitureProduct = db.Products.Where(x => x.Category.Name.Equals("Furniture")).ToList();
            ViewBag.NewProduct = db.Products.Where(x => x.Category.Name.Equals("New")).ToList();

            this.GetDefaultData();

            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        public ActionResult Seller()
        {
            var entities = new DecorSellerEntities2();
            return View(entities.ProductSellers.ToList());
            //var aa = entities.ProductName.OrderByDescending(x => x.ProductName).ToList();
            //return View(aa);
        }

        public ActionResult Professional()
        {
            var entities = new DecorProfessionalEntities();
            return View(entities.ProductProfessionals.ToList());
            //var aa = entities.ProductName.OrderByDescending(x => x.ProductName).ToList();
            //return View(aa);
        }
	}
}

