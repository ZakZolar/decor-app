using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalWeb.Models;
using System.IO;

namespace FinalWeb.Controllers
{
    public class ForSellerHomeController : Controller
    {
        DecorSellerEntities2 db = new DecorSellerEntities2();
        //
        // GET: /ForSellerHome/
        public ActionResult AddProduct()
        {
            return View(db.ProductSellers.ToList());  
        }

        public ActionResult SaveData(ProductSeller item)
        {
            if (item.ProductName != null && item.Price != null && item.ImageUpload != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(item.ImageUpload.FileName);
                string extension = Path.GetExtension(item.ImageUpload.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssff") + extension;
                item.PicUrl = fileName;
                item.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/Images"), fileName));
                db.ProductSellers.Add(item);
                db.SaveChanges();

            }
            var result = "Successfully Added";
            return Json(result, JsonRequestBehavior.AllowGet);
            
        }
    }
}