using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids.SFA
{
    [PageName("SFA Assortments Product Grid")]
    public class SFAAssortmentsProductGrid
    {
        public static readonly AbstractedBy ProductTopColumnHeader = AbstractedBy.Xpath("Assortment Product upper Columns", "//div[@role='grid'][contains(@class, 'sm1-grid-editable')]//div[@class='x-column-header-inner']//span[contains(@class,'x-column-header-text-inner')]");
        public static readonly AbstractedBy ProductLowColumnHeader = AbstractedBy.Xpath("Assortment Product lower Columns", "//div[@role='grid'][contains(@class, 'sm1-grid-editable')]//div[contains(@class,'x-column-header-inner') and contains(@class,'x-leaf-column-header')]//span[contains(@class,'x-column-header-text-inner')]");
        public static readonly AbstractedBy ProductRows = AbstractedBy.Xpath("Assortment Product Rows", "//div[@role='grid'][contains(@class, 'sm1-grid-editable')]//table");
    }
}