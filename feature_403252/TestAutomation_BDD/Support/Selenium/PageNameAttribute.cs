using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Support.Selenium
{
    //This attribute is used to mark a class as a page for logical name searches
    [AttributeUsage(AttributeTargets.Class)]
    public class PageNameAttribute : Attribute
    {
        public string Name { get; set; }
        public PageNameAttribute(string name) 
        {
            this.Name = name;
        }
    }
}
