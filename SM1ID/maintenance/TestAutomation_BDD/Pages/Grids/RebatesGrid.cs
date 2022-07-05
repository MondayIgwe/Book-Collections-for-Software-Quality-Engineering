using Kantar_BDD.Support.Selenium;
using System;

namespace Kantar_BDD.Pages.Grids
{
    class RebatesGrid
    {
        public static readonly AbstractedBy Rebatesrows = AbstractedBy.Xpath("Rebates Rows", "//tr[@role='row' and @class]");
        public static readonly AbstractedBy TargetDataSourceField = AbstractedBy.Xpath("Tagret Data Source Field", "//div[text()='Target']//following::div[contains(@class,'sm1-field')]//*[contains(@id,'inputEl')]");
        public static AbstractedBy FixedAmountCellValueTextfield(string Row) => AbstractedBy.Xpath("Fixed Amount Cell Value field", "//div[@sm1-id='CARD_RANGES']//div[@sm1-id='GridContainer']//tr//td[" + Row + "]//div");
        public static readonly AbstractedBy FixedAmountCellInputTextfield = AbstractedBy.Xpath("Fixed Amount Cell Input field", "(//table[contains(@id, 'tableview')]//div[@class='x-grid-cell-inner '])/ancestor::td[@role='gridcell']//input");

    }
}
