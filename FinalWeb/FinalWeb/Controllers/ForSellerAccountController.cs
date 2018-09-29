using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalWeb.Models;
using System.Data.Entity;

namespace FinalWeb.Controllers
{
    public class ForSellerAccountController : Controller
    {
        DecorFinalWebEntities2 db = new DecorFinalWebEntities2();
        //
        // GET: /ForSellerAccount/
        public ActionResult Index()
        {
            this.GetDefaultData();

            var usr = db.Sellers.Find(ShippingData.UserID);
            return View(usr);
        }

        //REGISTER CUSTOMER
        [HttpPost]
        public ActionResult Register(Seller seller)
        {
            if (ModelState.IsValid)
            {
                db.Sellers.Add(seller);
                db.SaveChanges();

                Session["username"] = seller.UserName;
                ShippingData.UserID = GetUser(seller.UserName).SellerID;
                return RedirectToAction("AddProduct", "ForSellerHome");
            }
            return View();
        }



        //LOG IN
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection formColl)
        {
            string usrName = formColl["UserName"];
            string Pass = formColl["Password"];

            if (ModelState.IsValid)
            {
                var cust = (from m in db.Sellers
                            where (m.UserName == usrName && m.Password == Pass)
                            select m).SingleOrDefault();

                if (cust != null)
                {
                    ShippingData.UserID = cust.SellerID;
                    Session["username"] = cust.UserName;
                    return RedirectToAction("AddProduct", "ForSellerHome");
                }

            }
            return View();
        }

        //LOG OUT
        public ActionResult Logout()
        {
            Session["username"] = null;
            ShippingData.UserID = 0;
            ShippingData.items = null;
            return RedirectToAction("Index", "UserType");
        }



        public Seller GetUser(string _usrName)
        {
            var seller = (from s in db.Sellers
                        where s.UserName == _usrName
                        select s).FirstOrDefault();
            return seller;
        }

        //UPDATE CUSTOMER DATA
        [HttpPost]
        public ActionResult Update(Seller seller)
        {
            if (ModelState.IsValid)
            {
                db.Entry(seller).State = EntityState.Modified;
                db.SaveChanges();
                Session["username"] = seller.UserName;
                return RedirectToAction("Index", "ForSellerAccount");
            }
            return View();
        }
    }
}

