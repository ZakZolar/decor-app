using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalWeb.Models;

namespace FinalWeb.Controllers
{
    public class ForSellerCartController : Controller
    {
        DecorSellerEntities2 db = new DecorSellerEntities2();
        //
        // GET: /ForBuyerCart/
        public ActionResult Index()
        {
            var data = this.GetDefaultData();

            return View(data);

        }

        public ActionResult Remove(int id)
        {
            SellerShippingData.items.RemoveAll(x => x.ProductID == id);
            return RedirectToAction("Index");

        }
        [HttpPost]
        public ActionResult ProcedToCheckout(FormCollection formcoll)
        {

            var a = SellerShippingData.items.ToList();
            for (int i = 0; i < formcoll.Count / 2; i++)
            {

                int pID = Convert.ToInt32(formcoll["shcartID-" + i + ""]);
                var ODetails = SellerShippingData.items.FirstOrDefault(x => x.ProductID == pID);


                int qty = Convert.ToInt32(formcoll["Qty-" + i + ""]);
                ODetails.Quantity = qty;
                ODetails.UnitPrice = ODetails.UnitPrice;
                ODetails.TotalAmount = qty * ODetails.UnitPrice;

                SellerShippingData.items.RemoveAll(x => x.ProductID == pID);

                if (SellerShippingData.items == null)
                {
                    SellerShippingData.items = new List<SellerOrderDetail>();
                }
                SellerShippingData.items.Add(ODetails);

            }

            return RedirectToAction("Index", "ForSellerCheckOut");
        }
        
	}
}