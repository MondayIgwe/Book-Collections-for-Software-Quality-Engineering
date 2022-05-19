using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("FundsGrid")]
    class FundsGrid
    {
        public static AbstractedBy DivByUniqueTableColumn(string row, string column) => AbstractedBy.Xpath("Grid Cell", "(//*[text()='Committed Balance']/ancestor::div[@sm1-id='GridContainer']//table[contains(@id, 'tableview')][" + row + "]//div[@class='x-grid-cell-inner '  or @class='x-grid-cell-inner x-grid-cell-inner-action-col'])[" + column + "]");
        public static AbstractedBy ColumnsByUniqueTableColumn = AbstractedBy.Xpath("All Columns", "//*[text()='Committed Balance']/ancestor::div[@sm1-id='GridContainer']//div[contains(@class,'x-column-header ')][@aria-hidden='false']");
        public static AbstractedBy RowsByUniqueTableColumn = AbstractedBy.Xpath("All Rows", "//*[text()='Committed Balance']/ancestor::div[@sm1-id='GridContainer']//tr[@role='row' and @class]");
        public static AbstractedBy FundsFolderIconByRow(string row) => AbstractedBy.Xpath("Funds Folder Icon By Row", "(//*[text()='Uncommitted Balance']/ancestor::div[@sm1-id='GridContainer']//tr[@role='row' and @class])["+ row + "]//img[contains(@src,'folder_open')]");

        
    }
}
