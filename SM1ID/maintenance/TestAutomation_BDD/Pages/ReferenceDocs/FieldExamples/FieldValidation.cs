using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.ReferenceDocs.FieldExamples
{
    [PageName("Field Validation Tab Page")]
    class FieldValidation
    {
        public static readonly AbstractedBy MandatoryFieldTextbox = AbstractedBy.Xpath("Mandatory Field Textbox", GenericElementsPage.InputElementBySM1ID("mandatorytextbox").ByToString);
        public static readonly AbstractedBy ForceUppercaseOnvalidationTextbox = AbstractedBy.Xpath("Force Uppercase On Validation Textbox", GenericElementsPage.InputElementBySM1ID("txtForceUppercase").ByToString);
        public static readonly AbstractedBy FieldValidationDatePickerTextbox = AbstractedBy.Xpath("Field Validation Date Picker Textbox", GenericElementsPage.InputElementBySM1ID("dtp11").ByToString);
        public static readonly AbstractedBy FieldValidationDatePickerCalendarTrigger = AbstractedBy.Xpath("Field Validation Date Picker Calendar Trigger", GenericElementsPage.TextBoxCalendarTriggerBySM1ID("dtp11").ByToString);
    }
}
