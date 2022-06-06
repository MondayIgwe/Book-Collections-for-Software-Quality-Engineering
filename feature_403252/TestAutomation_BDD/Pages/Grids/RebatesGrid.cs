using Kantar_BDD.Support.Selenium;
using System;

namespace Kantar_BDD.Pages.Grids
{
    class RebatesGrid
    {
        public static AbstractedBy DivByColumnAndRow(string Row, string Column) => AbstractedBy.Xpath("Rebates Grid Cell", "(//table[contains(@id, 'tableview')][" + Row + "]//div[@class='x-grid-cell-inner '  or @class='x-grid-cell-inner x-grid-cell-inner-action-col'])[" + Column + "]");
        public static AbstractedBy inputByColumnAndRow(string Row, string Column) => AbstractedBy.Xpath("Rebates Grid Cell Input", "(//table[contains(@id, 'tableview')][" + Row + "]//div[@class='x-grid-cell-inner ' or @class='x-grid-cell-inner x-grid-cell-inner-action-col'])[" + Column + "]//input");
        public static AbstractedBy FixedAmountCellValueTextfield(string Row) => AbstractedBy.Xpath("Fixed Amount Cell Value field", "//div[@sm1-id='CARD_RANGES']//div[@sm1-id='GridContainer']//tr//td[" + Row + "]//div");
        public static readonly AbstractedBy FixedAmountCellInputTextfield = AbstractedBy.Xpath("Fixed Amount Cell Input field", "(//table[contains(@id, 'tableview')]//div[@class='x-grid-cell-inner '])/ancestor::td[@role='gridcell']//input");
        public static readonly AbstractedBy columns = AbstractedBy.Xpath("Columns", "//div[contains(@class,'x-column-header ')][@aria-hidden='false']");
        public static readonly AbstractedBy Rebatesrows = AbstractedBy.Xpath("Rebates Rows", "//tr[@role='row' and @class]");
        public static AbstractedBy gridRows(string gridName) => AbstractedBy.Xpath("Grid Rows", "//div[text()='" + gridName + ":']//following::tr[@role='row' and @class]");
        public static AbstractedBy gridColumns(string gridName) => AbstractedBy.Xpath("Grid Columns", "//div[text()='" + gridName + ":']//following::div[contains(@class,'x-column-header ')][@aria-hidden='false']");
        public static AbstractedBy GridCellByColumnAndRow(string Row, string Column, string gridName) => AbstractedBy.Xpath("Grid Cell", "(//div[text()='" + gridName + "']//following::table[contains(@id, 'tableview')][" + Row + "]//div[@class='x-grid-cell-inner '  or @class='x-grid-cell-inner x-grid-cell-inner-action-col'])[" + Column + "]");
        public static AbstractedBy GridCellInputByColumnAndRow(string Row, string Column, string gridName) => AbstractedBy.Xpath("Grid Cell Input", "(//div[text()='" + gridName + "']//following::table[contains(@id, 'tableview')][" + Row + "]//div[@class='x-grid-cell-inner '  or @class='x-grid-cell-inner x-grid-cell-inner-action-col'])[" + Column + "]//input");

        public static readonly AbstractedBy CellInputTextfield = AbstractedBy.Xpath("Cell Input field", "(//table[contains(@id, 'tableview')]//div[@class='x-grid-cell-inner '])/ancestor::td[@role='gridcell']//input");
        public static readonly AbstractedBy TargetDataSourceField = AbstractedBy.Xpath("Tagret Data Source Field", "//div[text()='Target']//following::div[contains(@class,'sm1-field')]//*[contains(@id,'inputEl')]");
        public static readonly AbstractedBy FinalizationGridColumns = AbstractedBy.Xpath("Finalization Grid Columns", "//span[text()='Amount to match']//ancestor::div[@sm1-id='GridContainer']//span[contains(@class,'column-header')]");
        public static readonly AbstractedBy FinalizationGridRows = AbstractedBy.Xpath("Finalization Grid Rows", "//span[text()='Amount to match']//ancestor::div[@sm1-id='GridContainer']//table[@role='presentation']");
    }
}
