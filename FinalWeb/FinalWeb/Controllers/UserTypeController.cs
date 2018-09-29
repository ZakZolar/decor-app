using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalWeb.Models;

namespace FinalWeb.Controllers
{
    public class UserTypeController : Controller
    {
        //
        // GET: /UserType/
        [RequireHttps]
        public ActionResult Index()
        {
            return View();

        }

        [HttpPost]
        public ActionResult Index(usertype user)
        {
            if (user.Usertype == "Admin")
            {
                return RedirectToAction("Index", "admin_Login");
            }
            else if (user.Usertype == "Buyer")
            {
                return RedirectToAction("Index", "ForBuyerHome");
            }
            else if (user.Usertype == "Seller")
            {
                return RedirectToAction("Login", "ForSellerAccount");
            }
            else if (user.Usertype == "Professional")
            {
                return RedirectToAction("Login", "ForProfessionalAccount");
            }
            return View(user);
        }
	}
}