using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Popups
{
    [PageName("Reference Doc Detail Popup")]
    public class RefDocDetailPopup
    {
        public static readonly AbstractedBy Date1CalendarIcon = AbstractedBy.Xpath("Date 1 Calendar Icon", "//div[@sm1-id='DTE1']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy Date2CalendarIcon = AbstractedBy.Xpath("Date 2 Calendar Icon", "//div[@sm1-id='DTE2']//div[@class='sm1-triggers']");
    }
}
