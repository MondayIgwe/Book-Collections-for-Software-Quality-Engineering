using Kantar_BDD.Support.Selenium;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Support.General
{
    public class RootObject 
    {
        public ObjectModel ObjectModel { get; set; }
    }
    public class ObjectModel
    {
       public List<Page> Pages { get; set; } = new List<Page> { new Page() };
    }

    public class Page
    {
        public string Name { get; set; }
        public List<AbstractedBy> Locators { get; set; }
        public List<AbstractedByMethod> LocatorMethods { get; set; } = new List<AbstractedByMethod>();
    }

    public class AbstractedByMethod
    {
        public string LogicalName { get; set; }
        public By SeleniumBy { get; set; }
        public List<AbstractedByArgument> Arguments { get; set; } = new List<AbstractedByArgument>();
        
    }

    public class AbstractedByArgument 
    {
        public string Name { get; set; }
        public string Type { get; set; }
    }


}
