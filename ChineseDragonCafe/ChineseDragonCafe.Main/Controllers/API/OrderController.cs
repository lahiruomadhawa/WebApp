using ChineseDragonCafe.BussinessLogic;
using ChineseDragonCafe.Main.Models;
using ChineseDragonCafe.Main.Providers;
using ChineseDragonCafe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ChineseDragonCafe.Main.Controllers.API
{
    [Authorize]
    public class OrderController : ApiController
    {

        /// <summary>
        /// Save the Order to the database
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        [HttpPost]
        public Order PlaceOrder(Order order)
        {
            Order order1 = new Order();

            try
            {
                order1 = OrderManager.PlaceOrder(order);
                return order1;
            }
            catch (Exception ex)
            {
                order1.ErrorMessage = ex.Message;
                order1.IsSuccess = false;
                return order1;
            }
        }


        /// <summary>
        /// This return Item from the itemCode
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        [HttpPost]
        public MenuItem GetMenuItem(GetByIDParam param)
        {
            try
            {
                using (var db = new ChineseDragonCafeEntities())
                {
                    var itemtoReturn = db.MenuItems.FirstOrDefault(item => item.ItemCode == param.Code);

                    if (itemtoReturn != null)
                    {
                        return itemtoReturn;
                    }
                    else
                    {
                        return null;
                    }
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }        
    }
}
