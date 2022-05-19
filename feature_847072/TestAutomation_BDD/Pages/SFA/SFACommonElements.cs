using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA
{
    [PageName("SFACommonElements")]
    public class SFACommonElements
    {
        public static AbstractedBy Filter(string popUpName, string columnName) => AbstractedBy.Xpath("", "//div[text()='" + popUpName + "']//ancestor::div[@sm1-id or @role='dialog']//span[text()='" + columnName + "']//ancestor::div[@role='columnheader']//div[contains(@class,'filter')]");
    }
}
