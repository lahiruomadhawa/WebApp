using ChineseDragonCafe.Main.Providers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChineseDragonCafe.Main.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            ChineseDragonCafeEntities db = new ChineseDragonCafeEntities();
            ViewBag.Items = db.MenuItems.ToList();
            return View();
        }

        public ActionResult Order()
        {            
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}