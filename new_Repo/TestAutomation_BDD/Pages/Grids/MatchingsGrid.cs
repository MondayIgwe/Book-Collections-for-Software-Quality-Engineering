using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Grids
{
    class MatchingsGrid
    {
        public static AbstractedBy MatchingsTableCell(string Row) => AbstractedBy.Xpath("Matchings Table Cell", "//div[@sm1-id = 'GridContainer']//tr[@role='row']//td["+Row+"]");
        public static AbstractedBy MatchingsTableCheckboxCell(string state) => AbstractedBy.Xpath("Matchings Table Checkbox Cell", "//div[@sm1-id = 'GridContainer']//tr[@role='row']//td[contains(@class,'sm1checkboxcolumn') and @chkvalue='"+state+"']");
    }
}
