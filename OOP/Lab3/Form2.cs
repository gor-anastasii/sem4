using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Laba2
{
    public partial class Form2 : Form
    {
        public Processor proc;
        public Form2()
        {
            InitializeComponent();
        }

        private void CPU_btn_Click(object sender, EventArgs e)
        {
            if (CPU_Producer.Text == "" || CPU_Series.Text == "" || CPU_Model.Text == "" || CPU_Frequency.Text == "" || CPU_Max_Frequency.Text == "" || CPU_Frequency.Text == "" || CPU_core.Text == "")
            {
                MessageBox.Show("Заполните все поля!");
            }
            else
            {
                try
                {
                    proc = new Processor(
                        CPU_Producer.Text,
                        Convert.ToInt32(CPU_Series.Text),
                        CPU_Model.Text,
                        Convert.ToInt32(CPU_Frequency.Text),
                        Convert.ToInt32(CPU_Max_Frequency.Text),
                        Convert.ToInt32(CPU_core.Text),
                        CPU_Architecture.Text
                    );

                    var results = new List<ValidationResult>();
                    if (!Validator.TryValidateObject(proc, new ValidationContext(proc), results, true))
                    {
                        foreach (var error in results)
                        {
                            MessageBox.Show(error.ErrorMessage);
                        }
                    }

                    Hide();

                }
                catch
                {
                    MessageBox.Show("Заполните все поля!");
                }
            }
        }

        public Processor GetProcessor()
        {
            return proc;
        }

    }
}
