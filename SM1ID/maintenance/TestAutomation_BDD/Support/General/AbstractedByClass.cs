using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Support.General
{
    public class AbstractedByClass
    {
        public string Name { get; set; }
        public List<AbstractedBy> Selectors { get; set; }

        public static AbstractedByClass GetClassLocators(string name, List<AbstractedBy> locators)
        {
            return new AbstractedByClass()
            {
                Name = name,
                Selectors = locators
            };
        }
    }
}
