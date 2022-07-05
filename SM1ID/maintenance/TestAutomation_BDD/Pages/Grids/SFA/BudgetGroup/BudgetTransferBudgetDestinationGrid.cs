using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids.SFA.BudgetGroup
{
    [PageName("BudgetTransferBudgetDestinationGrid")]
    public class BudgetTransferBudgetDestinationGrid
    {
        public static readonly AbstractedBy Columns = AbstractedBy.Xpath("Budget Transfer Budget Destination Columns",
            "//div[@sm1-id='secBudgetDestination']//div[contains(@id,'headercontainer')][@aria-hidden='false']//div[contains(@class, 'x-column-header')]//div[@data-ref='titleEl'][contains(@class,'x-column-header-inner')]//div[@data-ref='textEl']//span");
        public static readonly AbstractedBy Rows = AbstractedBy.Xpath("Budget Transfer Budget Destination Rows",
            "//div[@sm1-id='secBudgetDestination']//div[contains(@id,'sm1grid')][@data-ref='body']//table");
    }
}
