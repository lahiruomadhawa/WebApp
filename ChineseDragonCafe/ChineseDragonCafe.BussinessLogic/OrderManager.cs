using ChineseDragonCafe.DBAccess;
using ChineseDragonCafe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChineseDragonCafe.BussinessLogic
{
    public static class OrderManager
    {
        /// <summary>
        /// Save method for the order
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        public static Order PlaceOrder(Order order)
        {
            try
            {
                OrderDBAccess orderDBAccess = new OrderDBAccess();
                return orderDBAccess.PlaceOrder(order);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
