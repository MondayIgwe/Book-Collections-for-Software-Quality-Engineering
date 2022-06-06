using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.ReferenceDocs.Workflow
{
    [PageName("Workflow Tab Page")]
    class Workflow
    {
        public static readonly AbstractedBy FieldbackField = AbstractedBy.Xpath("Feedback Field", "//div[@sm1-id='wfFeedback']//textarea");
        public static readonly AbstractedBy WorkflowCurrentstatusField = AbstractedBy.Xpath("Workflow Current Status Textfield", "//div[@sm1-id='wfStatus']//input");
        public static readonly AbstractedBy WorkflowCurrentstatusTrigger = AbstractedBy.Xpath("Workflow Current Status Trigger", "//div[@sm1-id='wfStatus']//div[contains(@id,'trigger-open')]");

    }
}
