using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Support.General
{
    public class StepModeller
    {
        public List<Step> Steps { get; set; } = new();
    }

    public class Step 
    {
        public string KeywordType { get; set; }
        public string Regex { get; set; }

    }
}
