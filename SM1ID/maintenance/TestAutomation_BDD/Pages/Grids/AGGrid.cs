using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("AGGrid")]
    public class AGGrid
    {
        public static AbstractedBy RowSelect(string rowIdentifier) => AbstractedBy.Xpath("Row Identifier",
            "//div[@row-id='"+rowIdentifier+"']");
        public static AbstractedBy ColumnSelect(string rowIdentifier, string columnIdentifier) => AbstractedBy.Xpath("Column Identifier "+rowIdentifier+" "+columnIdentifier,
            "//div[@row-id='"+rowIdentifier+"']/div[@col-id='"+columnIdentifier+"']");
       public static AbstractedBy ContextMenuItem(string itemName) => AbstractedBy.Xpath("",
            "//span[text()='"+itemName+"']");
        public static AbstractedBy ContextMenuItemDisabled(string disabledItemName) => AbstractedBy.Xpath("", "//span[text()='"+ disabledItemName + "']//parent::div[contains(@class,'disabled')]");
        public static readonly AbstractedBy Locator = AbstractedBy.Xpath("AggridLocator", "//div[@aria-hidden='false']//div[@class = 'x-panel sm1-tablepanel x-fit-item x-panel-default']//div[@class = 'ag-root ag-unselectable ag-layout-normal']");
        public static AbstractedBy GetRowID(string rowName) => AbstractedBy.Xpath("", "//span[text() = '" + rowName + "']//ancestor::div[@row-id]");
       
        public static AbstractedBy GetRowText(string rowText) => AbstractedBy.Xpath("", "//div[text()='"+rowText+"']//ancestor::div[@ref='eCenterColsClipper']");
        public static AbstractedBy GetRowID(string rowName1, string rowName2) => AbstractedBy.Xpath("",
            "//span[contains(text(),'" + rowName1.Trim() + "')]//following::div[contains(@row-id,'" + rowName1.Trim() + "')]//span[contains(text(),'" + rowName2.Trim() + "')]//ancestor::div[@row-id]");
        public static AbstractedBy GetColumnID(string colName) => AbstractedBy.Xpath("", "//span[text() = '" + colName + "']//ancestor::div[@col-id]");
        public static AbstractedBy AGGridInputField = AbstractedBy.Xpath("AGGrid Input Field", "//div[@ref='eCenterViewport']//div[@role='gridcell' and contains(@col-id,'WM2')]");

        public static AbstractedBy AggridPopUpValueField(string fieldName) => AbstractedBy.Xpath("Aggrid Pop Up Value Field",
         "//div[text()='" + fieldName + "']//ancestor::div[@sm1-id]//input");
        public static AbstractedBy AggridFiterText(string fieldName) => AbstractedBy.Xpath("Aggrid Filter Text " + fieldName,
            "//div[@sm1-tr='" + fieldName + "']//div[@data-ref='inputWrap']//input");

        public static AbstractedBy AggridGridName(string GridName) => AbstractedBy.Xpath("Grid Name", "//div[@sm1-id='" + GridName + "']");
        public static AbstractedBy AggridColumn(string text) => AbstractedBy.Xpath("Column Name", "//span[contains(text(),'" + text + "')]");
        public static AbstractedBy AggridCellField = AbstractedBy.Xpath("Grid Input Fields", "//div[@ref='eCenterViewport']//div[@role='gridcell' and contains(@col-id,'WM2')]");
        public static AbstractedBy AggridEditValuePopupTextArea = AbstractedBy.Xpath("Edit Value Popup Comment Textarea", "//div[@sm1-id='GWPLANDOC_NOTE']//textarea");
       

    }
}
