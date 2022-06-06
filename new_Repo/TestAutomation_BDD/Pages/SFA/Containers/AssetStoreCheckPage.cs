using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.Containers
{
    [PageName("Asset Store Check")]
    class AssetStoreCheckPage
    {
        public static readonly AbstractedBy DetaiisSection = AbstractedBy.Xpath("Details Section", "//div[text() = 'Details']");
        public static readonly AbstractedBy DetailsSectionExpand = AbstractedBy.Xpath("Details Section Expand Panel button", "//div[text() = 'Details']//ancestor::div[contains(@id,'panel')]//div[@data-qtip = 'Expand panel']");
        public static readonly AbstractedBy DetailsSectionCollapse = AbstractedBy.Xpath("Details Section Collapse Panel button", "//div[text() = 'Details']//ancestor::div[contains(@id,'panel')]//div[@data-qtip = 'Collapse panel']");
        public static readonly AbstractedBy HQNotesField = AbstractedBy.Xpath("HQ notes field", "//div[@sm1-id = 'DESHQNOTE']//div[@data-ref = 'inputWrap']//textarea");
        public static readonly AbstractedBy PreparationNotesField = AbstractedBy.Xpath("Preparation notes field", "//div[@sm1-id = 'PREPNOTE']//div[@data-ref = 'inputWrap']//textarea");
        public static readonly AbstractedBy NotesField = AbstractedBy.Xpath("Notes field", "//div[@sm1-id = 'DESNOTE']//div[@data-ref = 'inputWrap']//textarea");
        public static readonly AbstractedBy LastVisitNotesField = AbstractedBy.Xpath("Last visit notes field", "//div[@sm1-id = 'PREVNOTES']//div[@data-ref = 'inputWrap']//textarea");
        public static readonly AbstractedBy TimeSpentOnActivityLabel = AbstractedBy.Xpath("Time spent on activity label", "//label[contains(text(),'Time spent on activity')]");
        public static readonly AbstractedBy ObjectiveFlagCheckbox = AbstractedBy.Xpath("Objective flag", "//div[@sm1-id='FLGOBJECTIVE']//input");
        public static readonly AbstractedBy PreviousObjectiveFlagCheckbox = AbstractedBy.Xpath("Previous Objective flag", "//div[@sm1-id='FLGPREVIOUSOBJECTIVE']//input");
    }
}
