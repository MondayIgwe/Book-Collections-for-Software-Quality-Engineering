using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.ReferenceDocs.FieldExamples
{
    [PageName("General Info Tab Page")]
    class GeneralInfo
    {
        public static readonly AbstractedBy D1Textbox = AbstractedBy.Xpath("D1 Textbox", GenericElementsPage.InputElementBySM1ID("des1").ByToString);
        public static readonly AbstractedBy D1TextboxClearTrigger = AbstractedBy.Xpath("D1 Textbox Clear Trigger Icon", GenericElementsPage.TextboxClearTriggerBySM1ID("des1").ByToString);
        public static readonly AbstractedBy CurrentStatusTextbox = AbstractedBy.Xpath("Current Status Textbox", "//*[@sm1-id='WFSTATUS' or @sm1-id='wfStatus']//*[contains(@id,'inputEl')]");
        public static readonly AbstractedBy CurrentStatusTextboxStatusTrigger = AbstractedBy.Xpath("Current Status Textbox Status Trigger", "//*[@sm1-id='WFSTATUS' or @sm1-id='wfStatus']//div[@class='sm1-triggers']//*[contains(@id,'trigger')]");
        public static readonly AbstractedBy Num1NumericBox = AbstractedBy.Xpath("Num 1 Numeric Box", GenericElementsPage.InputElementBySM1ID("num1").ByToString);
        public static readonly AbstractedBy Num2NumericBox = AbstractedBy.Xpath("Num 2 Numeric Box", GenericElementsPage.InputElementBySM1ID("num2").ByToString);
        public static readonly AbstractedBy D2Textarea = AbstractedBy.Xpath("D2 Textarea", GenericElementsPage.TextareaBySM1ID("des2").ByToString);
        public static readonly AbstractedBy GUIREFERENCEDOC_REFERENCEDOC_dtpPeriod2StartDateTextbox = AbstractedBy.Xpath("[GUIREFERENCEDOC.REFERENCEDOC.dtpPeriod2] Start Date Textbox", GenericElementsPage.InputElementBySM1ID("dtpPeriod2").ByToString);
        public static readonly AbstractedBy GUIREFERENCEDOC_REFERENCEDOC_dtpPeriod2EndDateTextbox = AbstractedBy.Xpath("[GUIREFERENCEDOC.REFERENCEDOC.dtpPeriod2] End Date Textbox", GenericElementsPage.InputElementBySM1ID("dtpPeriod2").ByToString);
        public static readonly AbstractedBy FieldEntitySelectorTextbox = AbstractedBy.Xpath("Field Entity Selector Textbox", GenericElementsPage.InputElementBySM1ID("ent2").ByToString);
        public static readonly AbstractedBy FieldEntitySelectorTextboxHamburgerSelectTrigger = AbstractedBy.Xpath("Field Entity Selector Hamburger Select Trigger", GenericElementsPage.TextBoxHamburgerSelectTriggerBySM1ID("ent2").ByToString);
        public static readonly AbstractedBy Date1Textbox = AbstractedBy.Xpath("Date 1 Textbox", GenericElementsPage.InputElementBySM1ID("dtp1").ByToString);
        public static readonly AbstractedBy Date1CalendarTrigger = AbstractedBy.Xpath("Date 1 Calendar Trigger", GenericElementsPage.TextBoxCalendarTriggerBySM1ID("dtp1").ByToString);
        public static readonly AbstractedBy Date2Textbox = AbstractedBy.Xpath("Date 2 Textbox", GenericElementsPage.InputElementBySM1ID("dtp2").ByToString);
        public static readonly AbstractedBy Date2CalendarTrigger = AbstractedBy.Xpath("Date 2 Calendar Trigger", GenericElementsPage.TextBoxCalendarTriggerBySM1ID("dtp2").ByToString);
        public static readonly AbstractedBy PeriodStartDateTextbox = AbstractedBy.Xpath("Period Start Date Textbox", GenericElementsPage.InputElementBySM1ID("dtpPeriod").ByToString);
        public static readonly AbstractedBy PeriodEndDateTextbox = AbstractedBy.Xpath("Period End Date Textbox", GenericElementsPage.InputElementBySM1ID("dtpPeriod").ByToString);
        public static readonly AbstractedBy PeriodCalendarTrigger = AbstractedBy.Xpath("Period Calendar Trigger", GenericElementsPage.TextBoxCalendarTriggerBySM1ID("dtpPeriod").ByToString);

    }
}
