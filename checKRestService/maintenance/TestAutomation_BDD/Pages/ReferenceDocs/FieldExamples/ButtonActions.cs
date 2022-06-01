using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.ReferenceDocs.FieldExamples
{
    [PageName("Button Actions Tab Page")]
    class ButtonActions
    {
        public static readonly AbstractedBy TealButtonLabel = AbstractedBy.Xpath("Teal Button Label", "//a[@sm1-id = 'ACTION_tagT1']//span[@data-ref='btnInnerEl']");
        public static readonly AbstractedBy TealButton = AbstractedBy.Xpath("Teal Button", "//a[@sm1-id = 'ACTION_tagT1']");
        public static readonly AbstractedBy OrangeButtonLabel = AbstractedBy.Xpath("Orange Button Label", "//a[@sm1-id = 'ACTION_tagO1']//span[@data-ref='btnInnerEl']");
        public static readonly AbstractedBy OrangeButton = AbstractedBy.Xpath("Orange Button", "//a[@sm1-id = 'ACTION_tagO1']");
        public static readonly AbstractedBy RedButtonLabel = AbstractedBy.Xpath("Red Button Label", "//a[@sm1-id = 'ACTION_tagR1']//span[@data-ref='btnInnerEl']");
        public static readonly AbstractedBy RedButton = AbstractedBy.Xpath("Red Button", "//a[@sm1-id = 'ACTION_tagR1']");
        public static readonly AbstractedBy GreenButtonLabel = AbstractedBy.Xpath("Green Button Label", "//a[@sm1-id = 'ACTION_tagG1']//span[@data-ref='btnInnerEl']");
        public static readonly AbstractedBy GreenButton = AbstractedBy.Xpath("Green Button", "//a[@sm1-id = 'ACTION_tagG1']");

    }
}
