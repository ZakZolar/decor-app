using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalWeb.Models;
using System.Data.Entity;

namespace FinalWeb.Controllers
{
    public class ForProfessionalAccountController : Controller
    {
        DecorFinalWebEntities2 db = new DecorFinalWebEntities2();
        //
        // GET: /ForProfessionalAccount/
        public ActionResult Index()
        {
            this.GetDefaultData();

            var usr = db.Professionals.Find(ShippingData.UserID);
            return View(usr);
        }

        //REGISTER CUSTOMER
        [HttpPost]
        public ActionResult Register(Professional pro)
        {
            if (ModelState.IsValid)
            {
                db.Professionals.Add(pro);
                db.SaveChanges();

                Session["username"] = pro.UserName;
                ShippingData.UserID = GetUser(pro.UserName).ProfessionalID;
                return RedirectToAction("AddProduct", "ForProfessionalHome");
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
                var cust = (from m in db.Professionals
                            where (m.UserName == usrName && m.Password == Pass)
                            select m).SingleOrDefault();

                if (cust != null)
                {
                    ShippingData.UserID = cust.ProfessionalID;
                    Session["username"] = cust.UserName;
                    return RedirectToAction("AddProduct", "ForProfessionalHome");
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



        public Professional GetUser(string _usrName)
        {
            var pro = (from s in db.Professionals
                          where s.UserName == _usrName
                          select s).FirstOrDefault();
            return pro;
        }

        //UPDATE CUSTOMER DATA
        [HttpPost]
        public ActionResult Update(Professional pro)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pro).State = EntityState.Modified;
                db.SaveChanges();
                Session["username"] = pro.UserName;
                return RedirectToAction("Index", "ForProfessionalAccount");
            }
            return View();
        }
    }
}

