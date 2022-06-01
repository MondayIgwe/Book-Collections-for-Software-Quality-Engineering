using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("GridPopups")]
    public class GridPopups
    {
        public static readonly AbstractedBy LikeField = AbstractedBy.Xpath("Data Grid Filter Like", "//span[text()='Like:']//ancestor::td//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy NotLikeField = AbstractedBy.Xpath("Data Grid Filter Not Like", "//span[text()='Not Like:']//ancestor::td//div[contains(@id,'inputEl')]");
        public static AbstractedBy Field(string fieldName) => AbstractedBy.Xpath("Custom Field", "//span[text()='" + fieldName + ":']//ancestor::td//*[contains(@id,'inputEl')]");
        public static readonly AbstractedBy OkButton = AbstractedBy.Xpath("OK Button", "//span[text()='OK']");
        public static AbstractedBy ColumnHeaders(string popUpName, string smOneId = "") => AbstractedBy.Xpath("Popup Grid Columns",
            "//div[contains(text(),'" + popUpName + "')]//ancestor::div[@sm1-id='"+ smOneId+"' or(@sm1-id and @role='dialog')]//div[@sm1-id='GridContainer'][contains(@class, 'sm1-grid-container')]//div[@role='columnheader'][@aria-hidden = 'false']//div[@class='x-column-header-text']//span[text()]");
        public static AbstractedBy Rows(string popUpName, string smOneId = "") => AbstractedBy.Xpath("SM1ID Popup Grid Rows",
            "//div[text()='" + popUpName + "']//ancestor::div[@sm1-id='" + smOneId + "' or(@sm1-id and @role='dialog')]//div[@sm1-id='GridContainer']//table[contains(@id, 'tableview')]");
        public static AbstractedBy Rows(string popUpName) => AbstractedBy.Xpath("Popup Grid Rows",
           "//div[contains(text(),'" + popUpName + "')]//ancestor::div[@sm1-id or(@sm1-id and @role='dialog')][position() = 1]//div[@sm1-id='GridContainer']//table");

        public static AbstractedBy ColumnHeadersBySm1Id(string smOneId) => AbstractedBy.Xpath("Columns By SM1ID",
            "//div[@sm1-id='" + smOneId + "' or(@sm1-id and @role='dialog')]//div[@sm1-id='GridContainer'][contains(@class, 'sm1-grid-container')]//div[@role='columnheader'][@aria-hidden = 'false']//div[@class='x-column-header-text']//span[text()]");
        public static AbstractedBy RowsBySm1Id(string smOneId) => AbstractedBy.Xpath("Rows By SM1ID",
           "//div[@sm1-id='"+ smOneId+"' or(@sm1-id and @role='dialog')]//div[@sm1-id='GridContainer']//table");

        public static readonly AbstractedBy FilterPopupOkButton = AbstractedBy.Xpath("Filter Popup OK Button", "//div[@sm1-id='LOGICALTEXTBOXCOLUMNPOPUP']//span[text()='OK']");
        public static AbstractedBy Node(string popup, string node) => AbstractedBy.Xpath("Generic Grid Node",
            "//div[text() = '" + popup + "']//ancestor::div[@role='dialog']//table//tbody//tr//td//div[@class='x-grid-cell-inner '][text()='" + node + "']");
        public static AbstractedBy SelectRow(string popup, string rowNumber) => AbstractedBy.Xpath("Popup Grid Row",
            "(//div[text() = '" + popup + "']//ancestor::div[@role='dialog']//table//tbody//tr[@role='row'])[" + rowNumber + "]");
        public static AbstractedBy MultipleLeftSideRows(string popUpName) => AbstractedBy.Xpath("", "//div[text()='" + popUpName + "']//ancestor::div[@sm1-id]//div[@sm1-id='GridContainer']//div[contains(@class,'x-grid-scrollbar-clipper-locked')]//table");
        public static AbstractedBy MultipleRightSideRows(string popUpName) => AbstractedBy.Xpath("", "//div[text()='" + popUpName + "']//ancestor::div[@sm1-id]//div[@sm1-id='GridContainer']//div[not(contains(@class,'x-grid-scrollbar-clipper-locked'))][contains(@class,'x-grid-scrollbar-clipper')]//table");
        public static AbstractedBy Filter(string popUpName, string columnName) => AbstractedBy.Xpath("", "//div[text()='" + popUpName + "']//ancestor::div[@sm1-id and @role='dialog']//span[text()='" + columnName + "']//ancestor::div[@role='columnheader']//div[contains(@class,'filter')]");
        public static AbstractedBy MultipleLeftSideRow(string popUpName, string row) => AbstractedBy.Xpath("", "//div[text()='" + popUpName + "']//ancestor::div[@sm1-id]//div[@sm1-id='GridContainer']//div[contains(@class,'x-grid-scrollbar-clipper-locked')]//table[" + row + "]");
        public static AbstractedBy MultipleRightSideRow(string popUpName, string row) => AbstractedBy.Xpath("", "//div[text()='" + popUpName + "']//ancestor::div[@sm1-id]//div[@sm1-id='GridContainer']//div[not(contains(@class,'x-grid-scrollbar-clipper-locked'))][contains(@class,'x-grid-scrollbar-clipper')]//table[" + row + "]");
        public static AbstractedBy MultipleRowCells(string popUpName, string row) => AbstractedBy.Xpath("", "//div[text()='" + popUpName + "']//ancestor::div[@sm1-id]//div[@sm1-id='GridContainer']//div[not(contains(@class,'x-grid-scrollbar-clipper-locked'))][contains(@class,'x-grid-scrollbar-clipper')]//table[" + row + "]//tbody//tr//td");
        public static AbstractedBy ColumnHeadersWithPopUpSM1ID(string popUpSM1ID) => AbstractedBy.Xpath("",
            "//div[@sm1-id = '" + popUpSM1ID + "']//div[@sm1-id='GridContainer'][contains(@class, 'sm1-grid-container')]//div[@aria-hidden='false'][contains(@class,'sm1-grid-editable')]//div[@role='columnheader'][@aria-hidden = 'false']//div[@class='x-column-header-text']//span[text()]");

        public static AbstractedBy PopupGridCell(string Popup, string Row, string Column, string smOneId = "") => AbstractedBy.Xpath("Popup Grid Cell", "(//div[text()='" + Popup + "']//ancestor::div[@sm1-id='" + smOneId + "' or(@sm1-id and @role='dialog')]//table[contains(@id, 'tableview')][" + Row + "]//div[@class='x-grid-cell-inner '  or @class='x-grid-cell-inner x-grid-cell-inner-action-col'])[" + Column + "]");
        public static AbstractedBy PopupGridCellInput(string Popup, string smOneId = "") => AbstractedBy.Xpath("Popup Grid Cell Input", "//div[text()='" + Popup + "']//ancestor::div[@sm1-id='" + smOneId + "' or(@sm1-id and @role='dialog')]//table[contains(@id, 'tableview')]//input");
        public static AbstractedBy PopupGridSelectedRows(string Popup) => AbstractedBy.Xpath("Popup Grid Selected Rows", "//div[text()='" + Popup + "']//ancestor::div[@role='dialog']//tr[@aria-selected='true']");
        public static readonly AbstractedBy FilterRemoveAll = AbstractedBy.Xpath("Remove Filter", "//a[@sm1-id='ACTION_removeAllFilters']");
        public static AbstractedBy PopUpGridCheckBoxByName(string Popup, string value) => AbstractedBy.Xpath("PopUp Grid CheckBox By Name", "//div[text()='" + Popup + "']//ancestor::div[@sm1-id or @role='dialog']//div[text()='" + value + "']/ancestor::tr//*[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner' or (@src and not(contains(@src,'disabled')))]");
        public static AbstractedBy PopUpGridCheckBoxByNameContaining(string Popup, string value) => AbstractedBy.Xpath("PopUp Grid CheckBox By Name Containing", $"//div[text()='{Popup}']//ancestor::div[@sm1-id or(@sm1-id and @role='dialog')][position() = 1]//div[contains(text(),'{value}')]/ancestor::tr[position() = 1]//*[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner' or (@src and not(contains(@src,'disabled')))]");
        public static AbstractedBy PopUpGridCheckBox(string value) => AbstractedBy.Xpath("PopUp Grid CheckBox", "(//div[@sm1-id or @role='dialog']//div[text()='"+ value + "']/ancestor::tr)[1]//*[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner' or (@src)]");
        public static AbstractedBy PopUpColumns(string popUpName) => AbstractedBy.Xpath("", "//div[text()='" + popUpName + "']//ancestor::div//div//ancestor::div[@role='columnheader'][@aria-hidden='false']");
        public static AbstractedBy SelectRowCheckbox(string popUpName, string index) => AbstractedBy.Xpath("Popup Select Row Checkbox",
            "(//div[text()='" + popUpName + "']//ancestor::div//table//tr//td[contains(@class,'x-grid-cell-checkcolumn')]//div)[" + index + "]");
        public static AbstractedBy ColumnHeaders(string columnName) => AbstractedBy.Xpath("Grid Column", "//div[@sm1-id='GridContainer'][contains(@class, 'sm1-grid-container')]//div[@role='columnheader'][@aria-hidden = 'false']//div[@class='x-column-header-text']//span[contains(text(),'"+ columnName+"')]");
        public static AbstractedBy PopupGridCell(string Row, string Column, string smOneId) => AbstractedBy.Xpath("Popup Grid Cell", "(//div[@sm1-id='"+ smOneId+"' or(@sm1-id and @role='dialog')]//table[contains(@id, 'tableview')]["+Row+"]//div[@class='x-grid-cell-inner '  or @class='x-grid-cell-inner x-grid-cell-inner-action-col'])["+Column+"]");
        public static AbstractedBy PopupGridCheckboxByRowColumn(string Popup, string Row, string Column) => AbstractedBy.Xpath("Popup Grid Cell Checkbox By Row", "((//div[text()='" + Popup + "']//ancestor::div[@sm1-id and @role='dialog'][position() = 1]//table[contains(@id, 'tableview')])[" + Row + "]//div[@class='x-grid-cell-inner '  or @class='x-grid-cell-inner x-grid-cell-inner-action-col'])[" + Column + "]//img[@chkvalue]");
        public static AbstractedBy PopUpAddButton(string popUpName) => AbstractedBy.Xpath("Pop Up Add Button", "//div[text()='" + popUpName + "']//ancestor::div[contains(@class, 'sm1-popup')][not(contains(@class, 'sm1-popup-header-draggable'))]//span[contains(@class, 'toolbar-add')]");
        public static AbstractedBy GridSettings(string popUpName) => AbstractedBy.Xpath("Pop Up Grid Settings Menu", "//div[contains(text(),'" + popUpName + "')]/ancestor::div[@role='dialog']//span[@sm1-id = 'GridContextMenuButton']");
        public static AbstractedBy PopUpGridNode(string node) => AbstractedBy.Xpath("Popup Grid Node",
                "//div[@role='dialog']//table//tbody//tr//td//div[@class='x-grid-cell-inner '][text()='" + node + "']");
        public static AbstractedBy TextInGrid(string popup, string text) => AbstractedBy.Xpath("Pop Up Text in Grid",
            "//div[text()='" + popup + "']//ancestor::div[@role='dialog']//table//tr//td//*[text()='" + text + "']");
        public static AbstractedBy TextInGridContains(string popup, string text) => AbstractedBy.Xpath("Pop Up Text in Grid Containing",
            "//div[text()='" + popup + "']//ancestor::div[@role='dialog']//table//tr//td//*[text()='" + text + "']");
        public static AbstractedBy TextInGrid(string text) => AbstractedBy.Xpath("Any Pop Up Text in Grid",
            "//div[@role='dialog']//table//tr//td//*[text()='" + text + "']");
    }
}
