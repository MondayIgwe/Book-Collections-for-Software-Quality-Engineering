using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.DiscountList
{
    [PageName("NewDiscountListPopUp")]
    public class NewDiscountListPopUp
    {
        public static readonly AbstractedBy NodeCodeDropDown = AbstractedBy.Xpath("", "//span[text()='Node code:']//ancestor::label/following-sibling::div//div[@class='sm1-triggers']");
    }
}
