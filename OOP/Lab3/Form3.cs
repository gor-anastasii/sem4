using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Laba2
{
    public partial class Form3 : Form
    {
        public Form3(List<Computer> list)
        {
            int counter = 0;
            InitializeComponent();
            foreach (var i in list)
            {
                richTextBox1.Text +=
                    "\t\t" + ++counter +
                    "\r\n============================" +
                    "\nТип компьютера: " + i.computer_type +
                    "\nРазмер ОЗУ: " + i.ram_memory +
                    "\nТип ОЗУ: " + i.ram_type +
                    "\nРазмер ЖД: " + i.hd_memory +
                    "\nТип ЖД: " + i.hd_type +
                    "\n[Процессор]" +
                    "\nПроизводитель: " + i.processor.Producer +
                    "\nСерия: " + i.processor.Series +
                    "\nМодель: " + i.processor.Model +
                    "\nЧастота:" + i.processor.Frequency +
                    "\nМакс. частота: " + i.processor.Max_frequency +
                    "\nКол-во ядер: " + i.processor.Cores_amount +
                    "\nРазрядность процессора: " + i.processor.Cpu_architecture +
                    "\nТип видеокарты" + i.videocard_type +
                    "\nДата приобретения: " + i.purchase_date +
                    "\nСтоимость: " + i.cost_comp + "$\n" +
                    "============================\r\n";
            }
        }

    }
}
