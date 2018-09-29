using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalWeb.Models;
using System.Data;
using System.Data.Entity;

namespace FinalWeb.Controllers
{
    public class ForBuyerAccountController : Controller
    {
           DecorFinalWebEntities2 db=new DecorFinalWebEntities2();
        //
        // GET: /ForBuyerAccount/
        public ActionResult Index()
        {
            this.GetDefaultData();

            var usr = db.Customers.Find(ShippingData.UserID);
            return View(usr);
        }
	    
        //REGISTER CUSTOMER
        [HttpPost]
        public ActionResult Register(Customer cust)
        {
            if (ModelState.IsValid)
            {
                db.Customers.Add(cust);
                db.SaveChanges();

                Session["username"] = cust.UserName;
                ShippingData.UserID = GetUser(cust.UserName).CustomerID;          
                return RedirectToAction("Index","ForBuyerHome");
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
                var cust = (from m in db.Customers
                            where (m.UserName == usrName && m.Password == Pass)
                            select m).SingleOrDefault();

                if (cust !=null )
                {
                    ShippingData.UserID = cust.CustomerID;
                    Session["username"] = cust.UserName;
                    return RedirectToAction("Index", "ForBuyerHome");
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

       

        public Customer GetUser(string _usrName)
        {
            var cust = (from c in db.Customers
                        where c.UserName == _usrName
                        select c).FirstOrDefault();
            return cust;
        }

        //UPDATE CUSTOMER DATA
        [HttpPost]
        public ActionResult Update(Customer cust)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cust).State = EntityState.Modified;
                db.SaveChanges();
                Session["username"] = cust.UserName;
                return RedirectToAction("Index", "ForBuyerHome");
            }
            return View();
        }
    }
}

