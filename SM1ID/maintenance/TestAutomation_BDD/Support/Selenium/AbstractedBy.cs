using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Support.Selenium
{
    public class AbstractedBy
    {
        public string LogicalName { get; set; }
        public By SeleniumBy { get; set; }

        public string ByToString { get; set; }

        public static AbstractedBy Id(string name, string Id) 
        {
            return new AbstractedBy()
            {
                LogicalName = name,
                SeleniumBy = By.Id(Id),
                ByToString = Id
            };
        }

        public static AbstractedBy Name(string name, string byName)
        {
            return new AbstractedBy()
            {
                LogicalName = name,
                SeleniumBy = By.Name(byName),
                ByToString = byName
            };
        }

        public static AbstractedBy Xpath(string name, string xpath)
        {
            return new AbstractedBy()
            {
                LogicalName = name,
                SeleniumBy = By.XPath(xpath),
                ByToString = xpath
            };
        }

        public static AbstractedBy Sm1ID(string name, string sm1Id)
        {
            string xpath = $"//*[@sm1-Id='{sm1Id}']";
            return new AbstractedBy()
            {
                LogicalName = name,
                SeleniumBy = By.XPath(xpath),
                ByToString = xpath
            };
        }

        public static AbstractedBy VisibleSm1ID(string name, string sm1Id)
        {
            string xpath = $"//*[@sm1-Id='{sm1Id}'][@aria-hidden='false']";
            return new AbstractedBy()
            {
                LogicalName = name,
                SeleniumBy = By.XPath(xpath),
                ByToString = xpath
            };
        }
    }
}
