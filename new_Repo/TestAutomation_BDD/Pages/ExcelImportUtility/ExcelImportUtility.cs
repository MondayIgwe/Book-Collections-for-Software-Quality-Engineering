using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages
{
    [PageName("Excel Import Utility Page")]
    public class ExcelImportUtility
    {
        public static readonly AbstractedBy ToastMessageField = AbstractedBy.Xpath("Status Bar Field", "//div[contains(@class,'sm1-importExportUtility-statusBar')]//div[contains(@class,'x-toolbar-text')]");
    }
}
