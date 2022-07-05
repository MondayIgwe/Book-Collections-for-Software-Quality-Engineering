using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.ReferenceDocs.FieldExamples
{
    [PageName("TransactionalDataTabPage")]
    class TransactionalData
    {
        public static readonly AbstractedBy ProgressiveNumericBox = AbstractedBy.Xpath("Progressive Numeric Box", GenericElementsPage.InputElementBySM1ID("prgId").ByToString);
        public static readonly AbstractedBy DocumentKeyTextbox = AbstractedBy.Xpath("Document Key Textbox", GenericElementsPage.InputElementBySM1ID("documentKey").ByToString);
        public static readonly AbstractedBy UserCreatorTagField = AbstractedBy.Xpath("User Creator Tag Field", GenericElementsPage.TagFieldBySM1ID("codUsrCre").ByToString);
        public static readonly AbstractedBy UserCreatorTagFieldCloseIcon = AbstractedBy.Xpath("User Creator Tag Field Close Icon", GenericElementsPage.TagFieldCloseIconBySM1ID("codUsrCre").ByToString);
        public static readonly AbstractedBy UserCreatorHamburgerSelectTrigger = AbstractedBy.Xpath("User Creator Hamburger Select Trigger", GenericElementsPage.TextBoxHamburgerSelectTriggerBySM1ID("codUsrCre").ByToString);
        public static readonly AbstractedBy UserCreatorOpenTrigger = AbstractedBy.Xpath("User Creator Open Trigger", GenericElementsPage.TextBoxOpenTriggerBySM1ID("codUsrCre").ByToString);
        public static readonly AbstractedBy LoggedUserTagField = AbstractedBy.Xpath("Logged User Tag Field", GenericElementsPage.TagFieldBySM1ID("codUsrMod").ByToString);
        public static readonly AbstractedBy LoggedUserTagFieldCloseIcon = AbstractedBy.Xpath("Logged User Tag Field Close Icon", GenericElementsPage.TagFieldCloseIconBySM1ID("codUsrMod").ByToString);
        public static readonly AbstractedBy LoggedUserHamburgerSelectTrigger = AbstractedBy.Xpath("Logged User Hamburger Select Trigger", GenericElementsPage.TextBoxHamburgerSelectTriggerBySM1ID("codUsrMod").ByToString);
        public static readonly AbstractedBy LoggedUserOpenTrigger = AbstractedBy.Xpath("Logged User Open Trigger", GenericElementsPage.TextBoxOpenTriggerBySM1ID("codUsrMod").ByToString);
        public static readonly AbstractedBy CreationDateTextbox = AbstractedBy.Xpath("Creation Date Textbox", GenericElementsPage.InputElementBySM1ID("dteCre").ByToString);
        public static readonly AbstractedBy CreationDateCalendarTrigger = AbstractedBy.Xpath("Creation Calendar Trigger", GenericElementsPage.TextBoxCalendarTriggerBySM1ID("dteCre").ByToString);
        public static readonly AbstractedBy LastMaintenanceDateTextbox = AbstractedBy.Xpath("Last Maintenance Date Textbox", GenericElementsPage.InputElementBySM1ID("dteMod").ByToString);
        public static readonly AbstractedBy LastMaintenanceDateCalendarTrigger = AbstractedBy.Xpath("Last Maintenance Date Calendar Trigger", GenericElementsPage.TextBoxCalendarTriggerBySM1ID("dteMod").ByToString);
    }
}
