using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("DropDownGrid")]
    public class DropDownGrid
    {
        public static readonly AbstractedBy DropDownOptions = AbstractedBy.Xpath("", "//div[contains(@class,'sm1-field-dropdown-panel')]//div//table//tbody//tr//td//div//span[text()]");
        public static AbstractedBy DropDownOption(string option) => AbstractedBy.Xpath("", "//div[contains(@class,'sm1-field-dropdown-panel')]//div//table//tbody//tr//td//div//span[text()='" + option + "']");
        public static AbstractedBy DropDownButton(string button) => AbstractedBy.Xpath("", "//div[contains(@class,'sm1-field-dropdown-panel')]//span[text()='"+button+"']");
    }
}
