using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Laba2
{
    [Serializable]
    public class Computer
    {
        public Processor processor;
        public string videocard_type;
        public string computer_type;
        public string ram_memory;
        public string hd_memory;
        public string ram_type;
        public string hd_type;
        public DateTime purchase_date;
        public int cost_comp;
    }
}
