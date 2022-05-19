using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.ProductsGroup
{
    [PageName("ProductsGroupPage")]
    class ProductsGroup
    {
        public static readonly AbstractedBy CodeField = AbstractedBy.Xpath("Code Field", "//div[@sm1-id='CODPG']//input");
        public static readonly AbstractedBy CodeFieldRandomNumber = AbstractedBy.Xpath("Code Field Number Generator Button", "//div[@sm1-id='CODPG']//div[contains(@id,'sm1textboxactiontrigger') and not(@style)]");
        public static readonly AbstractedBy CodeFieldClearIcon = AbstractedBy.Xpath("Code Field Clear Button", "//div[@sm1-id='CODPG']//div[contains(@id,'clear')]");
        public static readonly AbstractedBy MacroTypeField = AbstractedBy.Xpath("Macro Type Field", "//div[@sm1-id='CODTYPPG']//input");
    }
}
