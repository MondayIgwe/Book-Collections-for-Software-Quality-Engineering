using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("Sales Order Product Grid")]
    public class SalesOrderProductsGrid
    {
        public static readonly AbstractedBy ColumnHeaders = AbstractedBy.Xpath("Sales Order Product Grid Columns", "//div[contains(@class,'SM1_LogicalOrderRowGrid')]//div[@sm1-id][@aria-hidden='false']//div[@class = 'x-column-header-text']//span[@class='x-column-header-text-inner'][text()]");
        public static readonly AbstractedBy RowsLeftSide = AbstractedBy.Xpath("Sales Order Product Grid Left Side Rows", "//div[contains(@class,'SM1_LogicalOrderRowGrid')]//div[contains(@class,'x-grid-scrollbar-clipper-locked')]//table");
        public static readonly AbstractedBy RowsRightSide = AbstractedBy.Xpath("Sales Order Product Grid Right Side Rows", "//div[contains(@class,'SM1_LogicalOrderRowGrid')]//div[not(contains(@class,'x-focus'))][@class = 'x-grid-view x-grid-with-row-lines x-fit-item x-grid-view-default x-scroller']//table");
    }
}
