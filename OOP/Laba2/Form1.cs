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
        public int cost = 0;
        Random rand = new Random();
        public List<Computer> GetSetBufferComputers = new List<Computer>();

        public Form1()
        {
            InitializeComponent();
            comp = new Computer();
            RAM_Memory.Enabled = false;
            RAM_Memory.DropDownStyle = ComboBoxStyle.DropDownList;
            HD_Memory.Enabled = false;
            HD_Memory.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void Form1_Load(object sender, EventArgs e)
        {

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

            MessageBox.Show("Компьютер добавлен!");
        }

        private void Lab_Items_Click(object sender, EventArgs e)
        {
            try
            {
                List<Computer> GetSetBufferComputers2;
                XmlSerializer xmlSerializer = new XmlSerializer(typeof(List<Computer>));
                using (FileStream fs = new FileStream("IT-Laboratory.xml", FileMode.Open))
                {
                    GetSetBufferComputers2 = (List<Computer>)xmlSerializer.Deserialize(fs);
                    {
                        foreach (var i in GetSetBufferComputers2)
                        {
                            MessageBox.Show(
                                "------------------------------------------------------------------------------------\n" +
                                "Тип компьютера: " + i.computer_type +
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
                                 "------------------------------------------------------------------------------------\n\n"
                            );
                        }
                    }
                }
            } catch
            {
                MessageBox.Show("В лаборатории нет компьютеров.");
            }
               
     
        }

        private void getCost_Click(object sender, EventArgs e)
        {
            foreach (var i in GetSetBufferComputers)
            {
                cost += i.cost_comp;
            }
            MessageBox.Show("Стоимость: " + cost + "$");
        }
    }
}
