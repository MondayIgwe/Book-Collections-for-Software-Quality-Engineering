using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages
{
    public class GridToolbarToDelete
    {
        //Stays Here
        public static readonly AbstractedBy NumberOfRows = AbstractedBy.Xpath("Toolbar Grid Record Count", "//div[@role='toolbar'][@aria-hidden = 'false']//div[@sm1-id='RowsNumLabel']");
        //Stays Here
        public static AbstractedBy DropDownMenu(string menuName) => AbstractedBy.Xpath("", "//span[@role='button'][@aria-hidden = 'false']//span[text() = '" + menuName + "']");
        //Stays Here
        public static AbstractedBy DropDownMenuOption(string menuOption) => AbstractedBy.Xpath("", "//div//a//span[text()='" + menuOption + "']");
        //Stays Here
        public static readonly AbstractedBy RowDetailButton = AbstractedBy.Xpath("Toolbar Row Detail Button", "//span[@sm1-id][@aria-hidden = 'false']//span[text()='Row Detail']");
        //goes to BasicGrid.cs
        public static readonly AbstractedBy GridAllCheckbox = AbstractedBy.Xpath("Grid All Checkbox", "//span[@class='x-column-header-checkbox']");
        //goes to BasicGrid.cs
        public static  AbstractedBy GridAllCheckboxAtIndex(string index) => AbstractedBy.Xpath("Grid All Checkbox Index", "(//span[@class='x-column-header-checkbox'])["+index+"]");
        //Does not belong hewre
        public static AbstractedBy PopUpErrorToolbar(string errorMessage) => AbstractedBy.Xpath("Pop Up Error Message", "//div[contains(@class,'x-toolbar sm1-gui-toolbar x-docked')]//a[contains(@class,'sm1-maintoolbar-error-icon x-unselectable')]//following-sibling::div[contains(text(),'"+ errorMessage + "')]");
        //Stays Here
        public static AbstractedBy NumberOfRowsPopUp(string popUpName) => AbstractedBy.Xpath("Pop Up Toolbar Grid Record Count",
            "//div[text()='" + popUpName + "']//ancestor::div[contains(@class, 'x-window-default x-closabl')]//div[@role='toolbar'][@aria-hidden = 'false']//div[@sm1-id='RowsNumLabel']");
    }
}
