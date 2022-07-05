using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.DiscountList
{
    [PageName("CustomerMasterPage")]
    public class CustomerMasterPage
    {
        public static AbstractedBy DropDownOption(string option) => AbstractedBy.Xpath("Customer Master New Dropdown Option", "//div[contains(@sm1-id, 'ACTION')]//a[contains(@id,'menuitem')]//span[text() = '"+option+"']");
    }
}
