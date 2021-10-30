using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChineseDragonCafe.Model
{
    public class Order :ModelBase
    {
        public int ID { get; set; }
        public string OrderReference { get; set; }
        public DateTime OrderDate { get; set; }
        public int OrderThrough { get; set; }
        public int OrderType { get; set; }
        public int UserID { get; set; }
        public List<Item> OrderItems { get; set; }
    }
}
