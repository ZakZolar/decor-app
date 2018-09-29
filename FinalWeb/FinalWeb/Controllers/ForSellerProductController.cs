using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalWeb.Models;

namespace FinalWeb.Controllers
{
    public class ForSellerProductController : Controller
    {
        //
        DecorSellerEntities2 ds = new DecorSellerEntities2();
        public ActionResult SellerViewDetails(int id)
        {
            var prod = ds.ProductSellers.Find(id);
            var reviews = ds.Reviews.Where(x => x.ProductID == id).ToList();
            ViewBag.Reviews = reviews;
            ViewBag.TotalReviews = reviews.Count();


            var ratedProd = ds.Reviews.Where(x => x.ProductID == id).ToList();
            int count = ratedProd.Count();
            int TotalRate = ratedProd.Sum(x => x.Rate).GetValueOrDefault();
            ViewBag.AvgRate = TotalRate > 0 ? TotalRate / count : 0;

            this.GetDefaultData();
            return View(prod);
        }

        public ActionResult SellerAddToCart(int id)
        {
            SellerOrderDetail OD = new SellerOrderDetail();
            OD.ProductID = id;
            int Qty = 1;
            decimal price = ds.ProductSellers.Find(id).Price;
            OD.Quantity = Qty;
            OD.UnitPrice = price;
            OD.TotalAmount = Qty * price;
            OD.ProductSeller = ds.ProductSellers.Find(id);

            if (SellerShippingData.items == null)
            {
                SellerShippingData.items = new List<SellerOrderDetail>();
            }
            SellerShippingData.items.Add(OD);

            //AddRecentViewProduct(id);
            return Redirect(TempData["returnURL"].ToString());
            //return RedirectToAction("Index", "ForSellerCart");

        }
	}
}