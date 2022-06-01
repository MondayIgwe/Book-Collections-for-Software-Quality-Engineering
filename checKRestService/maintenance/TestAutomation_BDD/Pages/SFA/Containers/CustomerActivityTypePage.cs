using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.Containers
{
    [PageName("CustomerActivityType")]
    public class CustomerActivityTypePage
    {
        public static readonly AbstractedBy GeneralDataSection = AbstractedBy.Xpath("Customer Activity Type General Data Section", "//div[@class='x-panel sm1-tabitem x-fit-item x-panel-default']//div[@aria-hidden='false']//div[@sm1-id='secGeneralData']");
    }
}
