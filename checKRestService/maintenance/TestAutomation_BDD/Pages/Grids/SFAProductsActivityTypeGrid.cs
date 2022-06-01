using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("SFA Products Activity Type Grid")]
    public class SFAProductsActivityTypeGrid
    {
        public static readonly AbstractedBy Column = AbstractedBy.Xpath("SFA Products Activity Type Column",
            "//div[@sm1-id='secProducts']//div[@sm1-id='GridContainer']//div[@role='columnheader'][@aria-hidden='false']//span[@class='x-column-header-text-inner'][text()]");
        public static AbstractedBy Columns(string columnName) => AbstractedBy.Xpath("SFA Products Activity Type Columns",
            "//div[@sm1-id='secProducts']//div[@sm1-id='GridContainer']//div[@role='columnheader'][@aria-hidden='false']//span[@class='x-column-header-text-inner'][text()='"+columnName+"']//ancestor::div[@role='columnheader'][@aria-hidden='false']");
        public static readonly AbstractedBy LeftRows = AbstractedBy.Xpath("SFA Products Activity Type Left Rows",
            "//div[@sm1-id='secProducts']//div[@sm1-id='GridContainer']//div[contains(@class,'x-grid-scrollbar-clipper-locked')]//table");
        public static readonly AbstractedBy RightRows = AbstractedBy.Xpath("SFA Products Activity Type Right Rows",
            "//div[@sm1-id='secProducts']//div[@sm1-id='GridContainer']//div[@class='x-grid-scrollbar-clipper ']//table");
    }
}
