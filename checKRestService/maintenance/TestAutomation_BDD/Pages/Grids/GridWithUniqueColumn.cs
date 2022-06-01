using Kantar_BDD.Support.Selenium;
using System;

namespace Kantar_BDD.Pages.Grids
{
    public class GridWithUniqueColumn
    {
        public static AbstractedBy AllRows(string uniqueColumn) => AbstractedBy.Xpath("Grid With Unique Column Rows", $"//span[contains(text(),'{uniqueColumn}')]/ancestor::div[@role='grid']//table[contains(@class,'x-grid-item')]");
        public static AbstractedBy AllColumns(string uniqueColumn) => AbstractedBy.Xpath("Grid With Unique Column Columns", $"//span[contains(text(),'{uniqueColumn}')]/ancestor::div[contains(@id,'headercontainer')]//div[contains(@id,'headercontainer')]//span[@class='x-column-header-text-inner' and text()]");
        public static AbstractedBy DivByColumnAndRow(string uniqueColumn, string Row, string Column) => AbstractedBy.Xpath("Grid With Unique Column Cell", $"((//span[text()='{uniqueColumn}']/ancestor::div[@role='grid']//table[contains(@class,'x-grid-item')])[{Row}]//td//div[@style='text-align:left;' or @style='text-align:right;'])[{Column}]");
    }

}
