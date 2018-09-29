using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalWeb.Models;

namespace FinalWeb.Controllers
{
    public class ForSellerCheckOutController : Controller
    {
        DecorSellerEntities2 ds = new DecorSellerEntities2();
        public ActionResult Index()
        {
            ViewBag.PayMethod = new SelectList(ds.SellerPaymentTypes, "PayTypeID", "TypeName");


            var data = this.GetDefaultData();

            return View(data);
        }


        //PLACE ORDER--LAST STEP
        public ActionResult PlaceOrder(FormCollection getCheckoutDetails)
        {

            int shpID = 1;
            if (ds.SellerShippingDetails.Count() > 0)
            {
                shpID = ds.SellerShippingDetails.Max(x => x.ShippingID) + 1;
            }
            int payID = 1;
            if (ds.SellerPayments.Count() > 0)
            {
                payID = ds.SellerPayments.Max(x => x.PaymentID) + 1;
            }
            int orderID = 1;
            if (ds.SellerOrders.Count() > 0)
            {
                orderID = ds.SellerOrders.Max(x => x.OrderID) + 1;
            }



            SellerShippingDetail shpDetails = new SellerShippingDetail();
            shpDetails.ShippingID = shpID;
            shpDetails.FirstName = getCheckoutDetails["FirstName"];
            shpDetails.LastName = getCheckoutDetails["LastName"];
            shpDetails.Email = getCheckoutDetails["Email"];
            shpDetails.Mobile = getCheckoutDetails["Mobile"];
            shpDetails.Address = getCheckoutDetails["Address"];
            shpDetails.Province = getCheckoutDetails["Province"];
            shpDetails.City = getCheckoutDetails["City"];
            shpDetails.PostCode = getCheckoutDetails["PostCode"];
            ds.SellerShippingDetails.Add(shpDetails);
            ds.SaveChanges();

            SellerPayment pay = new SellerPayment();
            pay.PaymentID = payID;
            pay.Type = Convert.ToInt32(getCheckoutDetails["PayMethod"]);
            ds.SellerPayments.Add(pay);
            ds.SaveChanges();

            SellerOrder o = new SellerOrder();
            o.OrderID = orderID;
            o.CustomerID = SellerShippingData.UserID;
            o.PaymentID = payID;
            o.ShippingID = shpID;
            o.Discount = Convert.ToInt32(getCheckoutDetails["discount"]);
            o.TotalAmount = Convert.ToInt32(getCheckoutDetails["totalAmount"]);
            o.isCompleted = true;
            o.OrderDate = DateTime.Now;
            ds.SellerOrders.Add(o);
            ds.SaveChanges();

            foreach (var OD in SellerShippingData.items)
            {
                OD.OrderID = orderID;
                OD.SellerOrder = ds.SellerOrders.Find(orderID);
                OD.ProductSeller = ds.ProductSellers.Find(OD.ProductID);
                ds.SellerOrderDetails.Add(OD);
                ds.SaveChanges();
            }


            return RedirectToAction("Voucher", "ForSellerThankYou");

        }

	}
}