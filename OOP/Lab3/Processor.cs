using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Laba2
{
    [Serializable]
    public class Processor
    {
        public string Producer;
        public int Series;
        [ProcessorValidation]
        public string Model;
        public int Frequency;
        public int Max_frequency;
        public int Cores_amount;
        public string Cpu_architecture;
        public Processor(string producer, int series, string model, int frequency, int max_frequency, int cores_amount, string cpu_architecture)
        {
            Producer = producer;
            Series = series;
            Model = model;
            Frequency = frequency;
            Max_frequency = max_frequency;
            Cores_amount = cores_amount;
            Cpu_architecture = cpu_architecture;
        }
        public Processor() {
            Producer = "";
            Series = 0;
            Model = "";
            Frequency = 0;
            Max_frequency = 0;
            Cores_amount = 0;
            Cpu_architecture = "";
        }  
    }
}
