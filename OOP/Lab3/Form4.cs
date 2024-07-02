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
    public partial class Form4 : Form
    {
        List<Computer> computers;
        List<Computer> search = new List<Computer>();
        public Form4(List<Computer> list)
        {
            InitializeComponent();
            computers = list;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            search.Clear();
            int count = 1;
            Regex regex = new Regex(@"\b\w*(amd|intel)\w*\b", RegexOptions.IgnoreCase);
            try
            {
                if (textBox1.Text.ToLower() == "amd" || textBox1.Text.ToLower() == "intel")
                {
                    richTextBox1.Text = "";
                    search = computers.Where(p => ((p.processor.Producer).ToLower()).Contains(textBox1.Text.ToLower())).ToList();
                    if (search.Count > 0)
                    {
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
                    else
                    {
                        MessageBox.Show("Совпадений не найдено.");
                    }
                }
                else
                {
                    richTextBox1.Text = "";
                    MatchCollection matches = regex.Matches(textBox1.Text);
                    if (matches.Count > 0)
                    {
                        if (matches[0].Value.Contains("amd"))
                        {

                            var query = from p in computers
                                        where p.processor.Producer.ToLower() == "amd"
                                        select p;

                            search = query.ToList();
                        }
                        if (matches[0].Value.Contains("intel"))
                        {
                            var query = from p in computers
                                        where p.processor.Producer.ToLower() == "intel"
                                        select p;

                            search = query.ToList();
                        }
                        if (matches[0].Value.Contains("intel") && matches[0].Value.Contains("amd"))
                        {
                            var query = from p in computers
                                        where p.processor.Producer.ToLower() == "intel" || p.processor.Producer.ToLower() == "amd"
                                        select p;

                            search = query.ToList();
                        }
                        //search = computers.Where(p => ((p.processor.producer).ToLower()).Contains("amd")).ToList();
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
                }
            }
            catch
            {
                MessageBox.Show("Совпадений не найдено.");
            }
        }
    }
}
