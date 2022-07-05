using Kantar_BDD.Support.Selenium;
using System;

namespace Kantar_BDD.Pages.Grids
{
    class ProductWeeklySplitGrid
    {
        public static readonly AbstractedBy columns = AbstractedBy.Xpath("Weekly Split Columns", "//div[@sm1-id='W1']/ancestor::div[@role='row']//div[@role='columnheader']");
        public static readonly AbstractedBy rows = AbstractedBy.Xpath("Rows", "//div[text()='Estimated quantity']/ancestor::div[@role='rowgroup'][position() = 1]//table");
        public static readonly AbstractedBy allProducts = AbstractedBy.Xpath("All Weekly Split Products", "//div[contains(text(),'Product -')]/ancestor::*[@role='rowgroup'][position()=1]//table");

        public static AbstractedBy DivByColumnAndRow(string rowName, string Row, string Column) => AbstractedBy.Xpath("Grid Cell", "//div[text()='"+ rowName + "']/ancestor::div[@role='rowgroup'][position() = 1]//table["+ Row + "]//td["+ Column + "]");
        public static AbstractedBy InputByColumnAndRow(string Row) => AbstractedBy.Xpath("Grid Cell", "//div[text()='Estimated quantity']/ancestor::div[@role='rowgroup'][position() = 1]//table[" + Row + "]//td//input");

    }
}
