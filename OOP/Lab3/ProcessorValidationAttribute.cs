using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Laba2
{
    public class ProcessorValidationAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            if (value != null)
            {
                string model = value.ToString();
                Regex regex = new Regex(@"^\d{4}[a-zA-Z]{3}$");
                if (!regex.IsMatch(model))
                    ErrorMessage = "Неверный формат.";  
                else
                    return true;
            }
            return false;
        }
    }
}
