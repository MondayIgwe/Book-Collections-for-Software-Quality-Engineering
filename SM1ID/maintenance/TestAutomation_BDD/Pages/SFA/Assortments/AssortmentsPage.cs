using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.SFA.Assortments
{
    [PageName("Assortments Page")]
    class AssortmentsPage
    {

        public static readonly AbstractedBy Assortment = AbstractedBy.Xpath("Assortment", "//div[@sm1-id = 'CODASSORTMENT']//input");
        public static readonly AbstractedBy AssortmentDescription = AbstractedBy.Xpath("Assortment Description", "//div[@sm1-id = 'DESASSORTMENT']//input");
        public static readonly AbstractedBy AssortmentStatusCode = AbstractedBy.Xpath("Assortment Status Code", "//div[@sm1-id = 'CODSTATUS']//input");
        public static readonly AbstractedBy MandatoryFlag = AbstractedBy.Xpath("Mandatory Flag", "//div[@sm1-id = 'FLGMANDATORY'//input]");
        public static readonly AbstractedBy ImportAssortment = AbstractedBy.Xpath("Import Assortment", "//a[@sm1-id = 'ACTION_IMPORT']");
        public static readonly AbstractedBy ChooseFile = AbstractedBy.Xpath("Choose File", "//div[@sm1-id = 'fileChooser']");
        public static readonly AbstractedBy WorksheetField = AbstractedBy.Xpath("Worksheet Field", "//div[@sm1-id = 'worksheet']//input");
        public static readonly AbstractedBy StartingRowField = AbstractedBy.Xpath("Starting Row Field", "//div[@sm1-id = 'startingRow']//input");
    }
}
