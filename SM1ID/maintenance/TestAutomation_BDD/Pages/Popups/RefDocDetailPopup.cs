using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Popups
{
    [PageName("Reference Doc Detail Popup")]
    public class RefDocDetailPopup
    {
        public static readonly AbstractedBy Date1CalendarIcon = AbstractedBy.Xpath("Date 1 Calendar Trigger Icon", GenericElementsPage.TextBoxCalendarTriggerBySM1ID("DTE1").ByToString);
        public static readonly AbstractedBy Date1Textbox = AbstractedBy.Xpath("Date 1 Textbox", GenericElementsPage.InputElementBySM1ID("DTE1").ByToString);
        public static readonly AbstractedBy Date2CalendarIcon = AbstractedBy.Xpath("Date 2 Calendar Trigger Icon", GenericElementsPage.TextBoxCalendarTriggerBySM1ID("DTE2").ByToString);
        public static readonly AbstractedBy Date2Textbox = AbstractedBy.Xpath("Date 2 Textbox", GenericElementsPage.InputElementBySM1ID("DTE2").ByToString);
    }
}
