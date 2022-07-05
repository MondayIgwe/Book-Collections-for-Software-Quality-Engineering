using Kantar_BDD.Support.Selenium;
using System;

namespace Kantar_BDD.Pages.Grids
{
    public class ProfitAndLossGrid
    {
        public static AbstractedBy AllElements(string uniqueColumn) =>  AbstractedBy.Xpath("Profit and Loss Elements", "//*[contains(text(),'" + uniqueColumn + "')]/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//div[@class='x-grid-cell-inner ' and @style='text-align:left;']");
        public static AbstractedBy AllColumnNames(string uniqueColumn) => AbstractedBy.Xpath("Prodit And Loss All Columns", "//*[contains(text(),'" + uniqueColumn + "')]/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//div[contains(@id,'headercontainer')]//span[@class='x-column-header-text-inner']");

        public static AbstractedBy ProfitAndLossColumns = AbstractedBy.Xpath("Profit And Loss All Columns", "(//div[contains(@class,'x-panel SM1_LogicalPL')])[1]//div[contains(@id,'headercontainer')]//span[@class='x-column-header-text-inner']");
        public static AbstractedBy ProfitAndLossRetaillerColumns = AbstractedBy.Xpath("Profit And Loss Retailer All Columns", "(//div[contains(@class,'x-panel SM1_LogicalPL')])[2]//div[contains(@id,'headercontainer')]//span[@class='x-column-header-text-inner']");
        public static AbstractedBy ProfitAndLossWhatIfColumns = AbstractedBy.Xpath("Profit And Loss What If All Columns", "(//div[contains(@class,'x-panel SM1_LogicalPL')])[3]//div[contains(@id,'headercontainer')]//span[@class='x-column-header-text-inner']");
        public static AbstractedBy DivByColumnAndRow(string Row, string uniqueColumn) => AbstractedBy.Xpath("Profit And Loss Grid Cell", "(//*[text()='" + uniqueColumn + "']/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//table[@class='x-grid-item'])[" + Row + "]//div[@style='text-align:right;']");
        public static AbstractedBy DivByColumnAndRow(string Column, string Row, string uniqueColumn) => AbstractedBy.Xpath("Profit And Loss Grid Cell", "((//*[text()='" + uniqueColumn + "']/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//table[@class='x-grid-item'])[" + Row + "]//div[@style='text-align:right;'])[" + Column + "]");
}

}
