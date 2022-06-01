using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("ProductAttribute")]
    public class ProductAttribute
    {
         public static AbstractedBy ColumnHeaders(string popUpName) => AbstractedBy.Xpath("Popup Grid Columns",
            "//div[text()='" + popUpName + "']//ancestor::div[@sm1-id or @role='dialog']//div[@sm1-id='GridContainer'][contains(@class, 'sm1-grid-container')]//div[@role='columnheader'][@aria-hidden = 'false']//div[@class='x-column-header-text']//span[text()]");
         public static AbstractedBy Rows(string popUpName) => AbstractedBy.Xpath("Popup Grid Rows",
           "//div[text()='" + popUpName + "']//ancestor::div[@sm1-id or @role='dialog']//div[@sm1-id='GridContainer']//table");

         }
}
