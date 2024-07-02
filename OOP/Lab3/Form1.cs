using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Serialization;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Rebar;

namespace Laba2
{
    public partial class Form1 : Form
    {
        public Computer comp;
        public Processor proc;
        Form2 form2;
        Form3 form3;
        Form4 form4;
        Form5 form5;
        public int cost = 0;
        Random rand = new Random();
        public List<Computer> GetSetBufferComputers = new List<Computer>();
        List<Computer> OrderedComputers = new List<Computer>();
        int counter_of_comp = 0;

        public Form1()
        {
            System.Windows.Forms.Timer timer = new System.Windows.Forms.Timer();
            timer.Interval = 1000;
            timer.Start();
            timer.Tick += new EventHandler(timer1_Tick);

            InitializeComponent();
            comp = new Computer();
            RAM_Memory.Enabled = false;
            RAM_Memory.DropDownStyle = ComboBoxStyle.DropDownList;
            HD_Memory.Enabled = false;
            HD_Memory.DropDownStyle = ComboBoxStyle.DropDownList;

            XmlSerializer xmlSerializer = new XmlSerializer(typeof(List<Computer>));
            using (FileStream fs = new FileStream("IT-Laboratory.xml", FileMode.Open))
            {
                GetSetBufferComputers = (List<Computer>)xmlSerializer.Deserialize(fs);
            }
            toolStripStatusLabel2.Text = Convert.ToString(GetSetBufferComputers.Count());
            toolStripStatusLabel4.Text = "Запуск формы";

            сохранитьToolStripMenuItem.Enabled = false;

            if (counter_of_comp == 0)
            {
                toolStripButton3.Enabled = false;
            }

        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            form2 = new Form2();
            form2.Show();
        }

        private void MB_RAM_CheckedChanged(object sender, EventArgs e)
        {
            RAM_Memory.Enabled = true;
            RAM_Memory.Text = "";
            RAM_Memory.Items.Clear();
            RAM_Memory.Items.AddRange(new object[] {
            "256",
            "512"
            });
        }

        private void GB_RAM_CheckedChanged(object sender, EventArgs e)
        {
            RAM_Memory.Enabled = true;
            RAM_Memory.Text = "";
            RAM_Memory.Items.Clear();
            RAM_Memory.Items.AddRange(new object[] {
            "2",
            "4",
            "8",
            "16"
            });
        }

        private void MB_HD_CheckedChanged(object sender, EventArgs e)
        {
            HD_Memory.Enabled = true;
            HD_Memory.Text = "";
            HD_Memory.Items.Clear();
            HD_Memory.Items.AddRange(new object[] {
            "512"
            });
        }

        private void GB_HD_CheckedChanged(object sender, EventArgs e)
        {
            HD_Memory.Enabled = true;
            HD_Memory.Text = "";
            HD_Memory.Items.Clear();
            HD_Memory.Items.AddRange(new object[] {
            "32",
            "64",
            "128",
            "256",
            "512",
            "1024"
            });
        }

        
        private void AddTo_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = "Добавить в лабораторию";
            try
            {
                comp.processor = form2.GetProcessor();
            }
            catch
            {
                MessageBox.Show("Заполните данные о процессоре!");
                return;
            }

            try
            {
                if (computer_type.Text == "" || RAM_Memory.Text == "" || HD_Memory.Text == "" || videocard_type.Text == "")
                {
                    throw new Exception();
                }
                else
                {
                    comp.computer_type = computer_type.Text;

                    if (MB_RAM.Checked)
                    {
                        comp.ram_memory = RAM_Memory.Text + " MB";
                    }
                    else if (GB_RAM.Checked)
                    {
                        comp.ram_memory = RAM_Memory.Text + " GB";
                    }
                    else
                    {
                        throw new Exception();
                    }
                    if (MB_HD.Checked)
                    {
                        comp.hd_memory = HD_Memory.Text + " MB";
                    }
                    else if (GB_HD.Checked)
                    {
                        comp.hd_memory = HD_Memory.Text + " GB";
                    }
                    else
                    {
                        throw new Exception();
                    }
                    
                    comp.videocard_type = videocard_type.Text;
                    comp.ram_type = domainUpDown1.Text;
                    comp.hd_type = domainUpDown2.Text;
                    comp.purchase_date = dateTimePicker1.Value;
                    comp.cost_comp = rand.Next(800, 2000);
                }
            }
            catch
            {
                MessageBox.Show("Заполните все поля!");
                return;
            }

            try
            {
                GetSetBufferComputers.Add(comp);
            }
            catch
            {
                MessageBox.Show("Не удается добавить компьютер!");
                return;
            }

            XmlSerializer xmlSerializer = new XmlSerializer(typeof(List<Computer>));
            using (FileStream fs = new FileStream("IT-Laboratory.xml", FileMode.OpenOrCreate))
            {
                xmlSerializer.Serialize(fs, GetSetBufferComputers);
            }

            comp.computer_type = null;
            comp.ram_memory = null;
            comp.hd_memory = null;
            comp.ram_type = null;
            comp.hd_type = null;

            computer_type.SelectedIndex = -1;
            RAM_Memory.Text = "";
            MB_RAM.Checked = false;
            GB_RAM.Checked = false;
            HD_Memory.Text = "";
            MB_HD.Checked = false;
            GB_HD.Checked = false;
            domainUpDown1.SelectedIndex = -1;
            domainUpDown2.SelectedIndex = -1;
            videocard_type.Text = "";
            processor = null;

            if (GetSetBufferComputers.Count() > 0)
            {
                toolStripButton4.Enabled = true;
            }
            toolStripStatusLabel2.Text = Convert.ToString(GetSetBufferComputers.Count());

            MessageBox.Show("Компьютер добавлен!");
        }

        private void Lab_Items_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = "Состав лаборатории";
            XmlSerializer xmlSerializer = new XmlSerializer(typeof(List<Computer>));
            using (FileStream fs = new FileStream("IT-Laboratory.xml", FileMode.Open))
            {
                GetSetBufferComputers = (List<Computer>)xmlSerializer.Deserialize(fs);
            }
            toolStripStatusLabel2.Text = Convert.ToString(GetSetBufferComputers.Count());
            form3 = new Form3(GetSetBufferComputers);
            form3.Show();

        }

        private void getCost_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = "Рассчет стоимости лаборатории";
            foreach (var i in GetSetBufferComputers)
            {
                cost += i.cost_comp;
            }
            MessageBox.Show("Стоимость: " + cost + "$");
        }

        private void toolStripButton5_Click(object sender, EventArgs e)
        {
            toolStrip1.Visible = !toolStrip1.Visible;
            панельИнструментовToolStripMenuItem.Visible = !toolStrip1.Visible;

            toolStripStatusLabel4.Text = "Сокрытие ПИ";
        }

        private void панельИнструментовToolStripMenuItem_Click(object sender, EventArgs e)
        {
            toolStrip1.Visible = !toolStrip1.Visible;
            панельИнструментовToolStripMenuItem.Visible = !toolStrip1.Visible;
            toolStripStatusLabel4.Text = "Показать ПИ";
        }

        private void оПрограммеToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Городилина Анастасия Сергеевна\nv 2.0.1");
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            toolStripStatusLabel6.Text = DateTime.Now.ToString();
        }

        private void сохранитьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            XmlSerializer xmlSerializer = new XmlSerializer(typeof(List<Computer>));
            using (FileStream fs = new FileStream("Order.xml", FileMode.OpenOrCreate))
            {
                xmlSerializer.Serialize(fs, OrderedComputers);
            }
            
            toolStripStatusLabel4.Text = сохранитьToolStripMenuItem.Text;
            MessageBox.Show("Сохранено.");
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            comp.computer_type = null;
            comp.ram_memory = null;
            comp.hd_memory = null;
            comp.ram_type = null;
            comp.hd_type = null;

            computer_type.SelectedIndex = -1;
            RAM_Memory.Text = "";
            MB_RAM.Checked = false;
            GB_RAM.Checked = false;
            HD_Memory.Text = "";
            MB_HD.Checked = false;
            GB_HD.Checked = false;
            domainUpDown1.SelectedIndex = -1;
            domainUpDown2.SelectedIndex = -1;
            videocard_type.Text = "";
            processor = null;

            toolStripStatusLabel4.Text = toolStripButton1.Text;
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = toolStripButton2.Text;
            GetSetBufferComputers.RemoveAt(GetSetBufferComputers.Count() - 1);
            XmlSerializer xmlSerializer = new XmlSerializer(typeof(List<Computer>));
            using (FileStream fs = new FileStream("IT-Laboratory.xml", FileMode.Open))
            {
                fs.SetLength(0);
            }
            using (FileStream fs = new FileStream("IT-Laboratory.xml", FileMode.OpenOrCreate))
            {
                xmlSerializer.Serialize(fs, GetSetBufferComputers);
            }
            toolStripStatusLabel2.Text = GetSetBufferComputers.Count().ToString();
            if (GetSetBufferComputers.Count() == 1)
            {
                toolStripButton3.Enabled = false;
                toolStripButton4.Enabled = false;
            }
        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = toolStripButton4.Text;
            if (counter_of_comp < GetSetBufferComputers.Count() - 1)
            {
                counter_of_comp++;
            }
            MessageBox.Show(
                "\t\t" + (counter_of_comp + 1) +
                    "\r\n============================" +
                    "\r\nТип компьютера: " + GetSetBufferComputers.ElementAt(counter_of_comp).computer_type +
                    "\r\nРазмер озу: " + GetSetBufferComputers.ElementAt(counter_of_comp).ram_memory +
                    "\r\nТип озу: " + GetSetBufferComputers.ElementAt(counter_of_comp).ram_type +
                    "\r\nРазмер жд: " + GetSetBufferComputers.ElementAt(counter_of_comp).hd_memory +
                    "\r\nТип жд: " + GetSetBufferComputers.ElementAt(counter_of_comp).hd_type +
                    "\r\n[Процессор]" +
                    "\r\nПроизводитель: " + GetSetBufferComputers.ElementAt(counter_of_comp).processor.Producer +
                    "\r\nСерия: " + GetSetBufferComputers.ElementAt(counter_of_comp).processor.Series +
                    "\r\nМодель: " + GetSetBufferComputers.ElementAt(counter_of_comp).processor.Model +
                    "\r\nЧастота: " + GetSetBufferComputers.ElementAt(counter_of_comp).processor.Frequency +
                    "\r\nМакс. частота: " + GetSetBufferComputers.ElementAt(counter_of_comp).processor.Max_frequency +
                    "\r\nКол-во ядер: " + GetSetBufferComputers.ElementAt(counter_of_comp).processor.Cores_amount +
                    "\r\nРазрядность процессора: " + GetSetBufferComputers.ElementAt(counter_of_comp).processor.Cpu_architecture +
                    "\nТип видеокарты" + GetSetBufferComputers.ElementAt(counter_of_comp).videocard_type +
                    "\r\nДата приобретения: " + GetSetBufferComputers.ElementAt(counter_of_comp).purchase_date +
                    "\r\nСтоимость: " + GetSetBufferComputers.ElementAt(counter_of_comp).cost_comp + "$\r\n" +
                    "============================\r\n"
                );
            if (counter_of_comp == GetSetBufferComputers.Count() - 1)
            {
                toolStripButton4.Enabled = false;
            }
            if (counter_of_comp > 0)
            {
                toolStripButton3.Enabled = true;
            }
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = toolStripButton3.Text;
            if (counter_of_comp != 0)
            {
                counter_of_comp--;
            }
            MessageBox.Show(
                "\t\t" + (counter_of_comp + 1) +
                   "\r\n============================" +
                    "\r\nТип компьютера: " + GetSetBufferComputers.ElementAt(counter_of_comp).computer_type +
                    "\r\nРазмер озу: " + GetSetBufferComputers.ElementAt(counter_of_comp).ram_memory +
                    "\r\nТип озу: " + GetSetBufferComputers.ElementAt(counter_of_comp).ram_type +
                    "\r\nРазмер жд: " + GetSetBufferComputers.ElementAt(counter_of_comp).hd_memory +
                    "\r\nТип жд: " + GetSetBufferComputers.ElementAt(counter_of_comp).hd_type +
                    "\r\n[Процессор]" +
                    "\r\nПроизводитель: " + GetSetBufferComputers.ElementAt(counter_of_comp).processor.Producer +
                    "\r\nСерия: " + GetSetBufferComputers.ElementAt(counter_of_comp).processor.Series +
                    "\r\nМодель: " + GetSetBufferComputers.ElementAt(counter_of_comp).processor.Model +
                    "\r\nЧастота: " + GetSetBufferComputers.ElementAt(counter_of_comp).processor.Frequency +
                    "\r\nМакс. частота: " + GetSetBufferComputers.ElementAt(counter_of_comp).processor.Max_frequency +
                    "\r\nКол-во ядер: " + GetSetBufferComputers.ElementAt(counter_of_comp).processor.Cores_amount +
                    "\r\nРазрядность процессора: " + GetSetBufferComputers.ElementAt(counter_of_comp).processor.Cpu_architecture +
                    "\nТип видеокарты" + GetSetBufferComputers.ElementAt(counter_of_comp).videocard_type +
                    "\r\nДата приобретения: " + GetSetBufferComputers.ElementAt(counter_of_comp).purchase_date +
                    "\r\nСтоимость: " + GetSetBufferComputers.ElementAt(counter_of_comp).cost_comp + "$\r\n" +
                    "============================\r\n"
                );
            if (counter_of_comp != GetSetBufferComputers.Count())
            {
                toolStripButton4.Enabled = true;
            }
            if (counter_of_comp == 0)
            {
                toolStripButton3.Enabled = false;
            }
        }

        private void поЧастотеToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = сортировкаToolStripMenuItem.Text + " " + поЧастотеToolStripMenuItem.Text;
            OrderedComputers = GetSetBufferComputers.OrderBy(p => p.processor.Frequency).ToList();
            сохранитьToolStripMenuItem.Enabled = true;
        }

        private void поРазмеруОЗУToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = сортировкаToolStripMenuItem.Text + " " + поРазмеруОЗУToolStripMenuItem.Text;
            OrderedComputers = GetSetBufferComputers.OrderBy(p => Convert.ToInt32(p.ram_memory.Substring(0, 2).Trim())).ToList();
            сохранитьToolStripMenuItem.Enabled = true;
        }

        private void поЧастотеToolStripMenuItem_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = сортировкаToolStripMenuItem.Text + " " + поЧастотеToolStripMenuItem.Text;
            OrderedComputers = GetSetBufferComputers.OrderBy(p => p.processor.Frequency).ToList();
            сохранитьToolStripMenuItem.Enabled = true;
        }

        private void поРазмеруОЗУToolStripMenuItem_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = сортировкаToolStripMenuItem.Text + " " + поРазмеруОЗУToolStripMenuItem.Text;
            OrderedComputers = GetSetBufferComputers.OrderBy(p => Convert.ToInt32(p.ram_memory.Substring(0, 2).Trim())).ToList();
            сохранитьToolStripMenuItem.Enabled = true;
        }

        private void поПроизводителюToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = поискToolStripMenuItem.Text + " " + поПроизводителюToolStripMenuItem.Text;
            form4 = new Form4(GetSetBufferComputers);
            form4.Show();
        }

        private void поПроизводителюToolStripMenuItem_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = поискToolStripMenuItem.Text + " " + поПроизводителюToolStripMenuItem.Text;
            form4 = new Form4(GetSetBufferComputers);
            form4.Show();
        }

        private void поМоделиToolStripMenuItem_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = поискToolStripMenuItem.Text + " " + поМоделиПроцессораToolStripMenuItem.Text;
            form5 = new Form5(GetSetBufferComputers);
            form5.Show();
        }

        private void поМоделиПроцессораToolStripMenuItem_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = поискToolStripMenuItem.Text + " " + поМоделиПроцессораToolStripMenuItem.Text;
            form5 = new Form5(GetSetBufferComputers);
            form5.Show();
        }
    }
}
