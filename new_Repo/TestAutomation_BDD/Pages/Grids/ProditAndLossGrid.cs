using Kantar_BDD.Support.Selenium;
using System;

namespace Kantar_BDD.Pages.Grids
{
    public class ProditAndLossGrid
    {
        public static AbstractedBy AllElements(string uniqueColumn) =>  AbstractedBy.Xpath("Profit and Loss Elements", "//*[contains(text(),'" + uniqueColumn + "')]/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//div[@class='x-grid-cell-inner ' and @style='text-align:left;']");
        public static AbstractedBy AllColumnNames(string uniqueColumn) => AbstractedBy.Xpath("Prodit And Loss All Columns", "//*[contains(text(),'" + uniqueColumn + "')]/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//div[contains(@id,'headercontainer')]//span[@class='x-column-header-text-inner']");
        public static AbstractedBy DivByColumnAndRow(string Row, string uniqueColumn) => AbstractedBy.Xpath("Profit And Loss Grid Cell", "(//span[text()='" + uniqueColumn + "']/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//table[@class='x-grid-item'])[" + Row + "]//div[@style='text-align:right;']");
        public static AbstractedBy DivByColumnAndRow(string Column, string Row, string uniqueColumn) => AbstractedBy.Xpath("Profit And Loss Grid Cell", "((//span[text()='" + uniqueColumn + "']/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//table[@class='x-grid-item'])[" + Row + "]//div[@style='text-align:right;'])[" + Column + "]");
}

}
