using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab1
{
    public interface IFunction
    {
        double getManCalories(double weight, double height, double age, int goal, double weight2, double months);
        double getWomanCalories(double weight, double height, double age, int goal, double weight2, double months);
        string getIMT(double weight, double height);
    } 

    internal class Calculator : IFunction
    {
        public double result;
        public double getManCalories(double weight, double height, double age, int goal, double weight2, double months) 
        { 
            if(goal == 0)
            {
                result = 66.5 + (13.75 * weight) + (5.003 * height) - (6.775 * age);
            } else if(goal == 1)
            {
                result = (66.5 + (13.75 * weight) + (5.003 * height) - (6.775 * age)) * 0.75;
            } else
            {
                result = (66.5 + (13.75 * weight) + (5.003 * height) - (6.775 * age)) * 1.25;
            }

            result = result + (((weight - weight2) * 7700) / (months * 30));
            return result;
        }
        public double getWomanCalories(double weight, double height, double age, int goal, double weight2, double months)
        { 
            if(goal == 0)
            {
                result = 655.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age);
            } else if(goal == 1)
            {
                result = (655.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age)) * 0.75;
            } else
            {
                result = (655.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age)) * 1.25;
            }

            result = result + (((weight - weight2) * 7700) / (months * 30));
            return result;
        }

        public string getIMT(double weight, double height)
        {
            double imt = weight / (height * height);
            if(imt < 18.5)
            {
                return "дефицит";
            } else if(imt >= 18.5 || imt <= 24.9)
            {
                return "норма";
            } else if(imt >= 20.0 || imt <= 29.0)
            {
                return "предожирение";
            } else
            {
                return "ожирение";
            }
        }
    }
}
