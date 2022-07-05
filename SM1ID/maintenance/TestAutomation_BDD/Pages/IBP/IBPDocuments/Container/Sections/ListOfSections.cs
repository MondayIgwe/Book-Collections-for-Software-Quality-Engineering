using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.IBP.IBPDocuments.Containers
{
    [PageName("IBP Plan Documents - Summary Tab - List Of Sub-Sections")]
    public class ListOfSections
    {
        public static readonly AbstractedBy CardSections = AbstractedBy.Xpath("Card Sections", GenericElementsPage.ElementBySM1ID("CARD_SECTIONS").ByToString);

        public static AbstractedBy SectionLink(string sectionName) => AbstractedBy.Xpath("Section Text Link", "//td[text()='" + sectionName + "']");
    }
}
