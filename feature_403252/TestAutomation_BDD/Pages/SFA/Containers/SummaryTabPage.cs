using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.Containers
{
    [PageName("Summary Tab Page")]
    public class SummaryTabPage
    {
        public static readonly AbstractedBy OrderNumberField = AbstractedBy.Xpath("Order Number Field", "//div[@sm1-id = 'NUMORD']//div[@data-componentid][text()]");
        public static AbstractedBy ParentGenericDropDownTrigger(string Field) => AbstractedBy.Xpath("Parent Generic Drop Down Trigger", "//span[text()='" + Field + ":']//ancestor::label/following-sibling::div//div[@class='sm1-triggers']");
    }
}
