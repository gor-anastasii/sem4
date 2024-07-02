using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Laba2
{
    public partial class Form5 : Form
    {
        List<Computer> computers;
        List<Computer> search = new List<Computer>();
        public Form5(List<Computer> list)
        {
            InitializeComponent();
            computers = list;
        }
        int count = 1;
        private void button1_Click(object sender, EventArgs e)
        {
            search.Clear();
            richTextBox1.Text = "";
            count = 1;

            try
            {
                Regex regex = new Regex(@"^\d{4}[a-zA-Z]{3}$");
                foreach (Computer computer in computers)
                {
                    if (computer.processor.Model == textBox1.Text)
                    {
                        search.Add(computer);
                    }
                    else
                    {
                        MatchCollection matchess = regex.Matches(textBox1.Text);
                        if (matchess.Count > 0)
                        {
                            if (computer.processor.Model.ToLower().Contains(matchess[0].Value.ToLower()))
                            {
                                search.Add(computer);
                            }
                        }
                    }
                }
                foreach (var i in search)
                {
                    richTextBox1.Text +=
                        "\t\t" + count +
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
                    count++;
                }
            }
            catch
            {
                MessageBox.Show("Соответствий не найдено.");
            }
        }
    }
}
