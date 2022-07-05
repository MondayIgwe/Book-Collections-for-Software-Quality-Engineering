using Kantar_BDD.Support.Selenium;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Popups
{
    [PageName("SFA Main Information Tab Page")]
    class MainInformationTab
    {
        public static readonly AbstractedBy SupplierCodeOneField = AbstractedBy.Xpath("Supplier Code 1 Options field", "//span[text()='Supplier Code 1:']/ancestor:: div[contains(@class,'sm1-field')]//*[contains(@id,'inputEl')]//input");
    }
}
