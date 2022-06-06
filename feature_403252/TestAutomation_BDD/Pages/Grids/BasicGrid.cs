using Kantar_BDD.Support.Selenium;
using System;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("Basic Grid")]
    public class BasicGrid
    {
        public static AbstractedBy Grid = AbstractedBy.Xpath("Grid Filters",
            "//div[@sm1-id='GRID_FR_FILTERS1']");
        public static AbstractedBy Filter(string columnName) => AbstractedBy.Xpath("Grid Filter", "//span[text()='"+columnName+"']//ancestor::div[@role='columnheader']//div[contains(@class,'filter')]");
        public static AbstractedBy UnfilteredColumnFilter(string columnName) => AbstractedBy.Xpath("Grid Unfiltered Column Filter", "//span[text()='" + columnName + "']//ancestor::div[@role='columnheader']//div[contains(@class,'sm1-grid-column-not-filtered')]");

        public static readonly AbstractedBy FirstRow = AbstractedBy.Xpath("First Row", "(//table[contains(@id,'record')])[1]//span[@documentKey]");
        public static AbstractedBy IndexedRow(string index) => AbstractedBy.Xpath("Indexed Row Link",
            "(//table[contains(@id,'record')])["+index+ "]//span[@class='sm1-column-link']");
        public static AbstractedBy TextInGrid(string text) => AbstractedBy.Xpath("Text in Grid", "//*[text()='"+text+"']");
        public static AbstractedBy DivTextInGrid(string text) => AbstractedBy.Xpath("Div Text in Grid", "//div[text()='"+text+"']");
        public static AbstractedBy TextInTableCell(string text) => AbstractedBy.Xpath("Text In Table Cell", $"//table//tr//td//div[text()='{text}']");

        public static AbstractedBy SelectIndexedRow(string index) => AbstractedBy.Xpath("Select Indexed Row",
            "(//table[contains(@id,'record')]//tr//td[contains(@class,'checkcolumn')]//div[contains(@class,'checkcolumn')])[" + index + "]");
        public static readonly AbstractedBy GridSettings = AbstractedBy.Xpath("Grid Settings Menu", "//span[@sm1-id = 'GridContextMenuButton']");
        public static AbstractedBy GridSettingsOption(string option) => AbstractedBy.Xpath("Grid Settings Menu Option",
            "//div[@sm1-id = 'GridContextMenu'][@aria-hidden = 'false']//a//span[@data-ref][text() = '" + option + "']");
        public static AbstractedBy SelectRow(string index) => AbstractedBy.Xpath("Select Row Checkbox", 
            "(//table//tr//td[contains(@class,'x-grid-cell-checkcolumn')]//div//span[@class='x-grid-checkcolumn'])["+ index + "]");
        public static AbstractedBy IterateCell(string rows, string rowNumber, string columnNumber) => AbstractedBy.Xpath("",
            rows + "[" + rowNumber + "]//tbody//tr//td[" + columnNumber + "]//div");
        public static AbstractedBy CellCheckboxImg(string rows, string row, string col) => AbstractedBy.Xpath("",
            rows + "[" + row + "]//tbody//tr//td[" + col + "]//div//img");
        public static AbstractedBy TableCell(string rows, string row, string col) => AbstractedBy.Xpath("", 
            rows + "[" + row + "]//tbody//tr//td[" + col + "]//div");
        public static AbstractedBy CellInput(string rows, string row, string col) => AbstractedBy.Xpath("", 
            rows + "[" + row + "]//tbody//tr//td[" + col + "]//div//input");
        public static AbstractedBy Cells(string row, string rowNum) => AbstractedBy.Xpath("", 
            row + "[" + rowNum + "]//tbody//tr//td");
        public static AbstractedBy TextInCell(string rows, string row, string col) => AbstractedBy.Xpath("",
            rows + "[" + row + "]//tbody//tr//td[" + col + "]//div[text()]");

        public static AbstractedBy SpanTextInCell(string rows, string row, string col) => AbstractedBy.Xpath("",
            rows + "[" + row + "]//tbody//tr//td[" + col + "]//div//span[text()]");

        public static AbstractedBy SingleGrid_Row_AllCellsInRow(string rowNumber) => AbstractedBy.Xpath("Table Row", "(//div[@sm1-id='GridContainer']//div[contains(@class,'x-panel-default x-grid')]//tr)[" + rowNumber + "]//td");
        public static AbstractedBy FilterOption(string optionValue) => AbstractedBy.Xpath("Filter Option", "//div[@sm1-id='LOGICALTEXTBOXCOLUMNPOPUP']//div[text()='" + optionValue + "']/../..//div[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner']");
        public static AbstractedBy SortedColumn(string columnName, string expectedOrder) => AbstractedBy.Xpath("", "//div[@class='x-column-header-text']//span[text()='"+ columnName + "']//ancestor::div[@role='columnheader'][@aria-hidden = 'false'][@aria-sort = '" + expectedOrder + "']");
        public static AbstractedBy LinkTextInCell(string rows, string row, string col) => AbstractedBy.Xpath("",
            rows + "[" + row + "]//tbody//tr//td[" + col + "]//div//a[text()]");
        public static AbstractedBy GridSelectedRowWithValue(string value) => AbstractedBy.Xpath("Selected Row", "//div[contains(text(),'" + value + "')]//ancestor::tr[@aria-selected='true']");

        public static AbstractedBy GridCheckBox(string uniqueRowText) => AbstractedBy.Xpath("Grid CheckBox", "//*[text()='"+ uniqueRowText + "']/ancestor::tr[position()=1]//*[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner' or (@src and not(contains(@src,'disabled')))]");
        public static AbstractedBy GridCheckBoxContaining(string uniqueRowText) => AbstractedBy.Xpath("Grid CheckBox Containing", "//div[contains(text(),'"+ uniqueRowText + "')]/ancestor::tr[position() = 1]//*[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner' or (contains(@src,'chk') and not(contains(@src,'disabled')))]");
        public static AbstractedBy GridCheckBoxContainingMultiText(string uniqueRowText, string uniqueRowText2) => AbstractedBy.Xpath("Grid CheckBox Containing Multi Texts", "//div[contains(text(),'" + uniqueRowText + "')][contains(text(),'" + uniqueRowText2 + "')]/ancestor::tr[position() = 1]//*[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner' or (contains(@src,'chk') and not(contains(@src,'disabled')))]");
        public static AbstractedBy UncheckedGridCheckBoxContaining(string uniqueRowText) => AbstractedBy.Xpath("Unchecked Grid CheckBox Containing", "//div[contains(text(),'" + uniqueRowText + "')]/ancestor::tr//td[@chkvalue='false']//*[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner' or (contains(@src,'chk') and not(contains(@src,'disabled')))]");
        public static AbstractedBy checkedRowCheckBoxContaining(string uniqueRowText) => AbstractedBy.Xpath("checked Row CheckBox Containing", "//div[contains(text(),'" + uniqueRowText + "')]/ancestor::tr[@aria-selected='true']//*[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner' or (contains(@src,'chk') and not(contains(@src,'disabled')))]");
        public static AbstractedBy ColumnElements(string columnNumber) => AbstractedBy.Xpath("", "//div[@sm1-id='GridContainer']//div[@data-ref='body']//tr//td[not(contains(@class,'selmodel'))]["+ columnNumber + "]");
        public static AbstractedBy Column(string name) => AbstractedBy.Xpath("Basic Grid Column", "//span[contains(@class,'x-column-header-text-inner') and text()='" + name + "']");

        public static AbstractedBy VisibleCellTrigger => AbstractedBy.Xpath("Visible Cell Trigger", "//td[@style]//div[contains(@id,'trigger-select') or contains(@id,'trigger-picker') or contains(@id,'trigger-openStatuses')]");
        public static AbstractedBy GridSettingsPopUp(string popUpMenu) => AbstractedBy.Xpath("Grid Settings Menu", "//div[text()='" + popUpMenu + "']//ancestor::div[@role='dialog']//span[@sm1-id = 'GridContextMenuButton']");
        
        public static AbstractedBy Columns = AbstractedBy.Xpath("Columns", "//div[@sm1-id='GridContainer']//div[@role='columnheader' and @aria-hidden='false' or contains(@class,'x-group-header')]//span[@data-ref]");

        public static AbstractedBy Rows = AbstractedBy.Xpath("Basic Grid Rows", "//div[@sm1-id='GridContainer']//table");
        public static AbstractedBy ColumnContainer(string columnHeading) => AbstractedBy.Xpath("Column Heading", "//div[@sm1-id='GridContainer']//span[text()='" + columnHeading + "']/ancestor::div[@role='columnheader' or contains(@class,'x-group-header')]");
        public static AbstractedBy ColumnGeneric(string columnHeading) => AbstractedBy.Xpath("Column", "//div[@sm1-id='GridContainer']//div[@role='columnheader' and @aria-hidden='false' or contains(@class,'x-group-header')]//span[text()='" + columnHeading + "']");
        public static AbstractedBy VisibleInputField = AbstractedBy.Xpath("", "//td[@style]//div//input");
        public static AbstractedBy SelectedRowIndexNumber(string rownNumber) => AbstractedBy.Xpath("Selected Index Row", "(//table//tr)["+ rownNumber + "]");
        public static AbstractedBy LeftMultiGridRows = AbstractedBy.Xpath("Basic Multigrid Left Rows", "//div[@sm1-id='GridContainer']//div[@class='x-grid-scrollbar-clipper x-grid-scrollbar-clipper-locked ']//table");
        public static AbstractedBy RightMultiGridRows = AbstractedBy.Xpath("Basic Multigrid Right Rows", "//div[@sm1-id='GridContainer']//div[@class='x-grid-scrollbar-clipper ']//table");
        public static AbstractedBy Checkboxes = AbstractedBy.Xpath("Checkboxes", "//div[@sm1-id='GridContainer']//table//tr//td//div[@class='x-grid-cell-inner ']//img");
        public static AbstractedBy ContainsDivTextInGrid(string text) => AbstractedBy.Xpath("Contains Div Text in Grid", "//div[contains(text(),'" + text + "')]");
        public static AbstractedBy MultiGridColumns = AbstractedBy.Xpath("Basic Multigrid Column", "//div[@sm1-id='GridContainer']//div[@role='columnheader' and @aria-hidden='false' or contains(@class,'x-group-header')]//span[@data-ref]");
        public static AbstractedBy ContainsTextInGrid(string text) => AbstractedBy.Xpath("Contains Text in Grid", "//*[contains(text(),'" + text + "')]");
        public static AbstractedBy GridCheckBoxWith2Values(string uniqueRowText1, string uniqueRowText2) => AbstractedBy.Xpath("Grid CheckBox With 2 Values", "//div[text() = '" + uniqueRowText1 + "']//ancestor::td//following-sibling::td//div[text() = '" + uniqueRowText2 + "']/ancestor::tr[position() = 1]//*[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner' or (contains(@src,'chk') and not(contains(@src,'disabled')))]");
        public static AbstractedBy GridCheckBoxContaining2ValuesDisabled(string uniqueRowText1, string uniqueRowText2) => AbstractedBy.Xpath("Disabled Grid CheckBox With 2 Values", "//div[contains(text(),'" + uniqueRowText1 + "')]//ancestor::td//following-sibling::td//div[contains(text(),'" + uniqueRowText2 + "')]/ancestor::tr[position() = 1]//*[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner' or (contains(@src,'chk') and not(contains(@src,'disabled')))]");
        public static AbstractedBy GridCheckBoxContaining2Values(string uniqueRowText1, string uniqueRowText2) => AbstractedBy.Xpath("Grid CheckBox Containing 2 Values", "//div[contains(text(),'" + uniqueRowText1 + "')]//ancestor::td//following-sibling::td//div[contains(text(),'" + uniqueRowText2 + "')]/ancestor::tr[position() = 1]//*[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner' or (contains(@src,'chk'))]");
        public static AbstractedBy Cell(string row, string rowNum, string col) => AbstractedBy.Xpath("",
            row + "[" + rowNum + "]//tbody//tr//td[" + col + "]");
        public static AbstractedBy RowNumberGridCheckbox(string rowNum) => AbstractedBy.Xpath("Grid CheckBox By Row Number", "(//tr[position() = 1]//*[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner' or (contains(@src,'chk') and not(contains(@src,'disabled')))])[" + rowNum + "]");

        public static AbstractedBy TableCellCheckbox(string cell) => AbstractedBy.Xpath("", cell + "//ancestor::td");
        public static AbstractedBy HeaderCheckBox(string cell) => AbstractedBy.Xpath("Header Check Box", cell + "//span[@class='x-column-header-checkbox']");
    }
}