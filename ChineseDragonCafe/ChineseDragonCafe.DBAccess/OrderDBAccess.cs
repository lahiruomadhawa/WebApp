using ChineseDragonCafe.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChineseDragonCafe.DBAccess
{
    public class OrderDBAccess
    {

        private string sqlConnectionString = "";

        public OrderDBAccess()
        {
            sqlConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
        }

        /// <summary>
        /// Save Function for the Order
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        public Order PlaceOrder(Order order)
        {
            Order order1 = new Order();
            order1.IsSuccess = false;
            int OrderID = -1;

            try
            {

                string insertOrderQry = @"INSERT INTO [Order]
                               ([OrderReference] ,[OrderDate] ,[OrderThrough] ,[OrderType] ,[UserID]) VALUES
                               (@OrderReference, @OrderDate, @OrderThrough, @OrderType, @UserID); SELECT SCOPE_IDENTITY()";

                string OrderItemsQry = @"INSERT INTO [OrderItems] ([OrderID] ,[ItemID] ,[Quantity]) VALUES
                                           (@OrderID, @ItemID, @Quantity);";

                using (SqlConnection connection = new SqlConnection(sqlConnectionString))
                {
                    connection.Open();

                    using (SqlCommand cmnd = new SqlCommand(insertOrderQry, connection))
                    {
                        cmnd.Parameters.AddWithValue("@OrderReference", order.OrderReference);
                        cmnd.Parameters.AddWithValue("@OrderDate", DateTime.Now);
                        cmnd.Parameters.AddWithValue("@OrderThrough", order.OrderThrough);
                        cmnd.Parameters.AddWithValue("@OrderType", order.OrderType);
                        cmnd.Parameters.AddWithValue("@UserID", order.UserID);

                        OrderID = (int)cmnd.ExecuteScalar();
                    }

                    foreach (Item item in order.OrderItems)
                    {
                        using (SqlCommand cmnd = new SqlCommand(OrderItemsQry, connection))
                        {
                            cmnd.Parameters.AddWithValue("@OrderID", OrderID);
                            cmnd.Parameters.AddWithValue("@ItemID", item.ID);
                            cmnd.Parameters.AddWithValue("@Quantity", item.Quantity);

                            cmnd.ExecuteNonQuery();
                        }
                    }                    
                }

                if (OrderID > -1)
                {
                    order1.IsSuccess = true;
                    order1.ID = OrderID;
                }

                return order1;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
