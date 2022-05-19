using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Popups
{
    [PageName("New Sales Order Popup")]
    public class NewSalesOrder
    {
        public static readonly AbstractedBy NewOrderPopUp = AbstractedBy.Xpath("New Order pop up", "//div[text() = 'New Order']//ancestor::div[@sm1-id]");
    }
}
