using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.ReferenceDocs.FieldExamples
{
    [PageName("General Info Tab Page")]
    class GeneralInfo
    {
        public static readonly AbstractedBy Num1Field = AbstractedBy.Xpath("Num 1 Field", "//div[@sm1-id='num1']//input");
        public static readonly AbstractedBy D2Field = AbstractedBy.Xpath("D2 Field", "//div[@sm1-id='des2']//textarea");
        public static readonly AbstractedBy D2DisclosureButton = AbstractedBy.Xpath("D2 Disclosure Button", "//div[@sm1-id='des2']//a");
        public static readonly AbstractedBy EditValuePopupTextArea = AbstractedBy.Xpath("Edit Value Popup Textarea", "//div[@sm1-id='LOGICALSIMPLESECTION']//textarea");
        public static readonly AbstractedBy D1Field = AbstractedBy.Xpath("D1 Field", "//div[@sm1-id='des1']//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy SummaryCurrentStatusField = AbstractedBy.Xpath("Summary Current Status Textfield", "//div[@sm1-id='WFSTATUS']//input");
        public static readonly AbstractedBy SummaryCurrentStatusTrigger = AbstractedBy.Xpath("Summary Current Status Trigger", "//div[@sm1-id='WFSTATUS']//div[contains(@id,'trigger-open')]");
    }
}
