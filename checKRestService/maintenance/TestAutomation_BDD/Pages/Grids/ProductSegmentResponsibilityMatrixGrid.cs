using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    public class ProductSegmentResponsibilityMatrixGrid
    {
        public static readonly AbstractedBy AllUsers = AbstractedBy.Xpath("All Users", "//div[@role='columnheader' and @sm1-id!='DESTABROW']//span[@data-ref='textInnerEl']");
        public static readonly AbstractedBy AllDescriptionNames = AbstractedBy.Xpath("All Description Names", "//td[contains(@class,'x-grid-cell-last') and not(contains(@class, 'sm1gridcheckboxcolumn'))]//div[@class='x-grid-cell-inner ']");
        public static readonly AbstractedBy AllRows = AbstractedBy.Xpath("All Description Names", "//img[contains(@src,'chk_')]/ancestor::table");

        public static AbstractedBy ResponsibilityCheckBox(string Column, string Row) => AbstractedBy.Xpath("Responsibility Checkbox", "(//img[contains(@src,'chk_')]/ancestor::table)[" + Row + "]//td[" + Column+"]");
    }
}
