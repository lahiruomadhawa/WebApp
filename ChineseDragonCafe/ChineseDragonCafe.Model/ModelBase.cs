using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChineseDragonCafe.Model
{
    public class ModelBase
    {
        public string ErrorMessage { get; set; }
        public string ErrorCode { get; set; }
        public bool IsSuccess { get; set; }
    }
}
