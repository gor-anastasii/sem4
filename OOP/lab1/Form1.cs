using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace lab1
{
public partial class Form1 : Form
    {
        public bool flagMan = true;
        Calculator calculator;
        public int goal = 0;

        public Form1()
        {
            InitializeComponent();
            calculator = new Calculator();
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            goal = 0;
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            goal = 1;
        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {
            goal = 2;
        }

        private void radioButtonWoman_CheckedChanged(object sender, EventArgs e)
        {
            flagMan = false;
        }

        private void radioButtonMan_CheckedChanged(object sender, EventArgs e)
        {
            flagMan = true;
        }

   
        private void buttonResult_Click(object sender, EventArgs e)
        {
            try
            {
                double weight = double.Parse(textBoxWeight.Text);
                if (weight <= 0 || weight > 500)
                {
                    throw new Exception("Введите корректные данные.");
                }

                double weight2 = double.Parse(textBoxWeigth2.Text);
                if (weight2 <= 0 || weight2 > 500)
                {
                    throw new Exception("Введите корректные данные.");
                }
                
                double height = double.Parse(textBoxHeight.Text);
                if (height <= 0 || height > 300)
                {
                    throw new Exception("Введите корректные данные.");
                }

                double age = double.Parse(textBoxAge.Text);
                if (age <= 0 || age > 100)
                {
                    throw new Exception("Введите корректные данные.");
                }

                double months = double.Parse(textBoxMonth.Text);
                if (months <= 0 || months > 300)
                {
                    throw new Exception("Введите корректные данные.");
                }

                if(goal == 2)
                {
                    if(weight2 <= weight)
                    {
                        throw new Exception("Введите корректные данные: желаемый вес должен быть больше, чем вес в данный момент");
                    }
                }

                if (goal == 1)
                {
                    if (weight2 >= weight)
                    {
                        throw new Exception("Введите корректные данные: желаемый вес должен быть ниже, чем вес в данный момент");
                    }
                }

                if (flagMan)
                {
                    labelResult.Text = Convert.ToString(Math.Round(calculator.getManCalories(weight, height, age, goal, weight2, months))); 
                } else
                {
                    labelResult.Text = Convert.ToString(Math.Round(calculator.getWomanCalories(weight, height, age, goal, weight2, months)));
                }

                labelIMT.Text = calculator.getIMT(weight, height);
            }
            catch (FormatException)
            {
                MessageBox.Show("Введите корректные данные.");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Произошла ошибка: " + ex.Message);
            } 
        }
    }
}
