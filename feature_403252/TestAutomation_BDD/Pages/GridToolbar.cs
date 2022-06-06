using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages
{
    public class GridToolbar
    {
        public static readonly AbstractedBy NumberOfRows = AbstractedBy.Xpath("Toolbar Grid Record Count", "//div[@role='toolbar'][@aria-hidden = 'false']//div[@sm1-id='RowsNumLabel']");
        public static AbstractedBy DropDownMenu(string menuName) => AbstractedBy.Xpath("", "//span[@role='button'][@aria-hidden = 'false']//span[text() = '" + menuName + "']");
        public static AbstractedBy DropDownMenuOption(string menuOption) => AbstractedBy.Xpath("", "//div//a//span[text()='" + menuOption + "']");
        public static readonly AbstractedBy RowDetailButton = AbstractedBy.Xpath("Toolbar Row Detail Button", "//span[@sm1-id][@aria-hidden = 'false']//span[text()='Row Detail']");
        public static readonly AbstractedBy GridAllCheckbox = AbstractedBy.Xpath("Grid All Checkbox", "//span[@class='x-column-header-checkbox']");
        public static  AbstractedBy GridAllCheckboxAtIndex(string index) => AbstractedBy.Xpath("Grid All Checkbox Index", "(//span[@class='x-column-header-checkbox'])["+index+"]");
        public static AbstractedBy PopUpErrorToolbar(string errorMessage) => AbstractedBy.Xpath("Pop Up Error Message", "//div[contains(@class,'x-toolbar sm1-gui-toolbar x-docked')]//a[contains(@class,'sm1-maintoolbar-error-icon x-unselectable')]//following-sibling::div[contains(text(),'"+ errorMessage + "')]");
        //div[text()='Ship-to Customers']//ancestor::div[contains(@class, 'x-window-default x-closabl')]//div[@role='toolbar'][@aria-hidden = 'false']//div[@sm1-id='RowsNumLabel']
        public static AbstractedBy NumberOfRowsPopUp(string popUpName) => AbstractedBy.Xpath("Pop Up Toolbar Grid Record Count",
            "//div[text()='" + popUpName + "']//ancestor::div[contains(@class, 'x-window-default x-closabl')]//div[@role='toolbar'][@aria-hidden = 'false']//div[@sm1-id='RowsNumLabel']");
    }
}
