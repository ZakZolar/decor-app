using FinalWeb.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalWeb.Controllers
{
    public class AccountController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        
        
        //public ActionResult Signup()
        //{
        //    regdb user = new regdb();
        //    user.Usertype = PopulateUsers();
        //    return View(user);

        //}

       
        //private static List<SelectListItem> PopulateUsers()
        //{
        //    List<SelectListItem> items = new List<SelectListItem>();
        //    string constr = ConfigurationManager.ConnectionStrings["FinalWebEntities"].ConnectionString;
            
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        string query = " SELECT Usertype, UserID FROM dbo.regdb";
        //        using (SqlCommand cmd = new SqlCommand(query))
        //        {
        //            cmd.Connection = con;
        //            con.Open();
        //            using (SqlDataReader sdr = cmd.ExecuteReader())
        //            {
        //                while (sdr.Read())
        //                {
        //                    items.Add(new SelectListItem
        //                    {
        //                        Text = sdr["Usertype"].ToString(),
        //                        Value = sdr["UserID"].ToString()
        //                    });
        //                }
        //            }
                   
        //            con.Close();
        //        }
        //    }

        //    return items;
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Signup(regdb user)
        //{

        //    user.Usertype = PopulateUsers();
        //    var selectedItem = user.Usertype.Find(p => p.Value == user.UserID.ToString());

        //    if (ModelState.IsValid)
        //    {
        //        using (FinalWebEntities dc = new FinalWebEntities())
        //        {
        //            //you should check duplicate registration here 
                    

        //            dc.regdbs.Add(user);
        //            dc.SaveChanges();
        //            ModelState.Clear();
        //            user = null;
        //            ViewBag.Message = "Successfully Done";
                    
        //        }

        //    }
        //    return RedirectToAction("Index");
        //}

        public ActionResult SignUp()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SignUp(regdb reg)
        {
            string constr = ConfigurationManager.ConnectionStrings["FinalWebEntities"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            string query = "INSERT INTO regdb(Fullname, Email, Username, Password, Usertype) VALUES(@Fullname, @Email, @Username, @Password, @Usertype)";
            query += " SELECT SCOPE_IDENTITY()";
            using (SqlCommand cmd = new SqlCommand(query))
            {
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@Fullname", reg.Fullname);
                cmd.Parameters.AddWithValue("@Email", reg.Email);
                cmd.Parameters.AddWithValue("@Username", reg.Username);
                cmd.Parameters.AddWithValue("@Password", reg.Password);
                cmd.Parameters.AddWithValue("@Usertype", reg.Usertype);
                reg.UserID = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
            }
        }
            if(reg.Usertype=="Admin")
            {
                return RedirectToAction("Admin", "Home");
            }
        else if (reg.Usertype == "Buyer")
        {
            return RedirectToAction("Categories", "Home");
        }
        else if (reg.Usertype == "Seller")
        {
            return RedirectToAction("Categories", "Home");
        }
        else if (reg.Usertype == "Professional")
        {
            return RedirectToAction("BlankPage", "Home");
        }
        return View(reg);
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ViewResult Login(regdb login)
        {
            if (ModelState.IsValid) // Check the model state for any validation errors
            {
                if (login.checkUser(login.Username, login.Password)) // Calls the Login class checkUser() for existence of the user in the database.
                {
                    return View("AfterLogin",login); // Return the "Show.cshtml" view if user is valid
                }
                else
                {
                    ViewBag.Message = "Invalid Username or Password";
                    return View(); //return the same view with message "Invalid Username or Password"
                }
            }
            else
            {
                return View(); // Return the same view with validation errors.
            }
        }
        //public ActionResult Login(regdb reg)
        //{
        //    // this action is for handle post (login)
        //    if (ModelState.IsValid) // this is check validity
        //    {
        //        using (FinalWebEntities dc = new FinalWebEntities())
        //        {
        //            var v = dc.regdbs.Where(a => a.Username.Equals(reg.Username) && a.Password.Equals(reg.Password)).FirstOrDefault();
        //            if (v != null)
        //            {
        //                Session["UserID"] = v.UserID.ToString();
        //                Session["Username"] = v.Username.ToString();
        //                return RedirectToAction("AfterLogin");
        //            }
        //        }
        //    }
        //    return View(reg);
        //}

        public ActionResult AfterLogin()
        {
            if (Session["UserID"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }
        }
        public ActionResult CreateAccountAvatar()
        {
            return View();
        }

        public ActionResult CreateAccountInfo()
        {
            return View();
        }

        public ActionResult CreateAccountWallet()
        {
            return View();
        }

        public ActionResult MyOrders()
        {
            return View();
        }

        public ActionResult MyWishlist()
        {
            return View();
        }

        public ActionResult UpdateAccountAvatar()
        {
            return View();
        }

        public ActionResult UpdateAccountInfo()
        {
            return View();
        }

        public ActionResult UpdateAccountWallet()
        {
            return View();
        }
    }
}
