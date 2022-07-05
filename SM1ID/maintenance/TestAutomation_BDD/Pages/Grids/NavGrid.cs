using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("NavGrid")]
    public class NavGrid
    {
        public static AbstractedBy ContainsTextInNavGrid(string text) => AbstractedBy.Xpath("Contains Text in Navigation Grid",
           "//table//td//div[contains(text(),'" + text + "')]");
        public static AbstractedBy TextInNavGrid(string text) => AbstractedBy.Xpath("Text in Navigation Grid",
            "//table//td//div[text()='" + text + "']");
        public static AbstractedBy Checkbox => AbstractedBy.Xpath("", "//div[@sm1-id='GridContainer']//table//tr//td//div[contains(@class, 'checkcolumn')]");
    }
}
