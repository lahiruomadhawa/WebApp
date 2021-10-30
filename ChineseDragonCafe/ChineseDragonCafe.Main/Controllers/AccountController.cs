using System;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using ChineseDragonCafe.Main.Models;
using ChineseDragonCafe.Main.Providers;
using System.Web.Security;
using System.Net;

namespace ChineseDragonCafe.Main.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        /// <summary>
        /// // GET: /Account/Login
        /// </summary>
        /// <param name="returnUrl"></param>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }


        /// <summary>
        /// // POST: /Account/Login
        /// </summary>
        /// <param name="model"></param>
        /// <param name="returnUrl"></param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        public ActionResult Login(User model)
        {
            using (var db = new ChineseDragonCafeEntities())
            {
                bool Validate = db.Users.Any(user => user.Username == model.Username && user.Password == model.Password);               

                if (Validate)
                {
                    FormsAuthentication.SetAuthCookie(db.Users.FirstOrDefault(user => user.Username == model.Username && user.Password == model.Password).Name, false);
                    return RedirectToAction("Index", "Home");
                }
            }
            return View();

        }

        /// <summary>
        /// // GET: /Account/Register
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        /// <summary>
        /// POST: /Account/Register
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        public ActionResult Register(User model)
        {
            using (var db = new ChineseDragonCafeEntities())
            {
                db.Users.Add(model);
                db.SaveChanges();
            }
            return RedirectToAction("Login");
        }               

        //
        // POST: /Account/LogOff
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "Account");
        }
        
    }
}