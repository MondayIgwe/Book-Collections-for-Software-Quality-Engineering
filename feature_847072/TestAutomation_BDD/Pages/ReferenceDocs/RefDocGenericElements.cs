using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Pages.ReferenceDocs
{
    [PageName("Reference Doc Generic Elements")]
    class RefDocGenericElements
    {
        public static readonly AbstractedBy ContextualMenu = AbstractedBy.Xpath("Contextual Menu", "//div[@sm1-id='ContextualMenu']//span[text()='Item 1']");
        public static readonly AbstractedBy ActionDropdownPanel = AbstractedBy.Xpath("Dropdown Panel", "//div[contains(@class,'dropdown-panel')]");
        public static readonly AbstractedBy SubTabRemoveButton = AbstractedBy.Xpath("Sub Tab Remove Button", "//div[contains(@class,'sm1-tabitem')][@aria-hidden='false']//span[@sm1-id='RemoveButton' and @aria-hidden='false']");
        public static readonly AbstractedBy RefDocSubTabAddButton = AbstractedBy.Xpath("Ref Doc Sub Tab Add Button", "//div[contains(@class,'sm1-tabitem')][@aria-hidden='false']//span[@sm1-id='AddButton' and @aria-hidden='false']");
        public static AbstractedBy ContextualMenuItem(string itemLabel) => AbstractedBy.Xpath("Contextual Menu Item", "//div[@sm1-id='ContextualMenu']//span[text()='" + itemLabel + "']/ancestor::a");
        public static AbstractedBy Section(string sectionName) => AbstractedBy.Xpath("Section", "//div[text() = '" + sectionName + "']//ancestor::div[contains(@class,'sm1section sm1cardsection ')]");
        public static AbstractedBy CardSectionBody(string toolbarLabel) => AbstractedBy.Xpath("Card Section Body", "//div[text()='" + toolbarLabel + "']/ancestor::div[contains(@class,'x-panel sm1section')]//div[contains(@class,'sm1section-body')]");
        public static AbstractedBy CardSectionArrowIcon(string toolbarLabel) => AbstractedBy.Xpath("Card Section Arrow Icon", "//div[text()='" + toolbarLabel + "']/ancestor::div[contains(@class,'x-panel sm1section')]//div[@role='button']");
        public static AbstractedBy CarddSectionAddButton(string toolbarLabel) => AbstractedBy.Xpath("Card Section Add Button", "//div[text()='" + toolbarLabel + "']/ancestor::div[contains(@class,'x-panel sm1section')]//span[@sm1-id='AddButton']");
        public static AbstractedBy CardSectionRemoveButton(string toolbarLabel) => AbstractedBy.Xpath("Card Section Remove Button", "//div[text()='" + toolbarLabel + "']/ancestor::div[contains(@class,'x-panel sm1section')]//span[@sm1-id='RemoveButton']");
        public static AbstractedBy CardSection(string label) => AbstractedBy.Xpath("Card Section", "//div[@class='x-panel sm1section sm1cardsection x-panel-default']//div[text()='" + label + "']");
        public static AbstractedBy DropdownPanelCheckbox(string checkboxLabel) => AbstractedBy.Xpath("Dropdown Panel Checkbox", "//div[contains(@class,'dropdown-panel')][not(contains(@style,'none'))]//span[text()='" + checkboxLabel + "']/ancestor::tr//div[contains(@class,'checkcolumn')]");
        public static AbstractedBy DropdownPanelItem(string checkboxLabel) => AbstractedBy.Xpath("Dropdown Panel Item", "//div[contains(@class,'dropdown-panel')][not(contains(@style,'none'))]//span[text()='" + checkboxLabel + "']/ancestor::table");
        public static AbstractedBy DropdownPanelButton(string buttonLabel) => AbstractedBy.Xpath("Dropdown Panel Button", "//div[contains(@class,'dropdown-panel')][not(contains(@style,'none'))]//span[text()='" + buttonLabel + "']");
        public static AbstractedBy FilterPopupFilters(string filterName) => AbstractedBy.Xpath("Filter", "//div[@sm1-id='LOGICALPOPUP']//div[@class='x-grid-cell-inner '][contains(text(),'"+ filterName + "')]");
        public static AbstractedBy TreeNodeLeaf(string label) => AbstractedBy.Xpath("Custom Tree West Node Leaf", "//div[@sm1-id='customTreeWest']//span[@class='x-tree-node-text '][text()='" + label + "']/ancestor::tr");
        public static AbstractedBy TreeNodeLeafExpander(string label) => AbstractedBy.Xpath("Tree Node Leaf Expander", "//span[@class='x-tree-node-text '][text()='" + label + "']/preceding-sibling::div[contains(@class,'tree-expander')]");
        public static AbstractedBy TabSettingsIcon(string tabName) => AbstractedBy.Xpath("Tab Settings Icon", "//span[text()='"+ tabName + "']/ancestor::a[@sm1-id]//span[contains(@class,'spanner')]");
    }
}
