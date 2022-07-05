using Kantar_BDD.Support.Selenium;
using System;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("Side Panel Basic Grid")]
    public class SidePanelBasicGrid
    {
        public static AbstractedBy Columns(string sidePane) => AbstractedBy.Xpath("Columns By Side Panel", $"//div[contains(@class,'x-title-text')][text()='{sidePane}']/ancestor::div[contains(@class,'sm1-tabitem')]//div[@sm1-id='GridContainer']//div[@role='columnheader' and @aria-hidden='false' or contains(@class,'x-group-header')]//span[@data-ref]");
        public static AbstractedBy Rows(string sidePane) => AbstractedBy.Xpath("Basic Grid Rows By Side Panel", $"(//div[contains(@class,'x-title-text')][text()='{sidePane}']/ancestor::div[contains(@class,'sm1-tabitem')]//div[@sm1-id='GridContainer']//table[contains(@id, 'tableview')])");
        public static AbstractedBy DivByColumnAndRow(string sidePane, string Row, string Column) => AbstractedBy.Xpath("Grid Cell By Side Panel", $"(//div[contains(@class,'x-title-text')][text()='{sidePane}']/ancestor::div[contains(@class,'sm1-tabitem')]//div[@sm1-id='GridContainer']//table[contains(@id, 'tableview')][{Row}]//div[@class='x-grid-cell-inner '  or @class='x-grid-cell-inner x-grid-cell-inner-action-col'])[{Column}]");
        public static AbstractedBy InputBySidePanel(string sidePane) => AbstractedBy.Xpath("Grid Cell Input By Side Panel", $"//div[contains(@class,'x-title-text')][text()='{sidePane}']/ancestor::div[contains(@class,'sm1-tabitem')]//div[@sm1-id='GridContainer']//table[contains(@id, 'tableview')]//input");
    }
}