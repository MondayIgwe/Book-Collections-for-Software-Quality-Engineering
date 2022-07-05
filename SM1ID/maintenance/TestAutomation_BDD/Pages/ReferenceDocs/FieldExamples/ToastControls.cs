using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.ReferenceDocs.FieldExamples
{
    [PageName("Toast Controls Tab Page")]
    class ToastControls
    {
        public static readonly AbstractedBy InfoToastMessage = AbstractedBy.Xpath("Info Toast Message", "//div[contains(@class,'sm1-toastbox-info')]");
        public static readonly AbstractedBy WarningToastMessage = AbstractedBy.Xpath("Warning Toast Message", "//div[contains(@class,'sm1-toastbox-warn')]");
        public static readonly AbstractedBy ErrorToastMessage = AbstractedBy.Xpath("Error Toast Message", "//div[contains(@class,'sm1-toastbox-error')]");
        public static readonly AbstractedBy SuccessToastMessage = AbstractedBy.Xpath("Success Toast Message", "//div[contains(@class,'sm1-toastbox-success')]");
    }
}
