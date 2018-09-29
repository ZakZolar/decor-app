using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalWeb.Models;

namespace FinalWeb.Controllers
{
    public class ForBuyerCartController : Controller
    {
        DecorFinalWebEntities2 db=new DecorFinalWebEntities2();
        //
        // GET: /ForBuyerCart/
        public ActionResult Index()
        {
           var data=this.GetDefaultData();

            return View(data);
            
        }

        public ActionResult Remove(int id)
        {
            ShippingData.items.RemoveAll(x=>x.ProductID==id);
            return RedirectToAction("Index");

        }
        [HttpPost]
        public ActionResult ProcedToCheckout(FormCollection formcoll)
        {
            
            var a = ShippingData.items.ToList();
            for (int i = 0; i < formcoll.Count/2; i++)
            {

                int pID = Convert.ToInt32(formcoll["shcartID-" + i + ""]);
                var ODetails = ShippingData.items.FirstOrDefault(x => x.ProductID == pID);
               

                int qty = Convert.ToInt32(formcoll["Qty-" + i + ""]);
                ODetails.Quantity = qty;
                ODetails.UnitPrice = ODetails.UnitPrice;
                ODetails.TotalAmount = qty * ODetails.UnitPrice;
                
                ShippingData.items.RemoveAll(x => x.ProductID == pID);

                if (ShippingData.items==null)
                {
                    ShippingData.items = new List<OrderDetail>();                   
                }
                ShippingData.items.Add(ODetails);
                
            }

            return RedirectToAction("Index", "ForBuyerCheckOut");
        }
        
        
    }
}
