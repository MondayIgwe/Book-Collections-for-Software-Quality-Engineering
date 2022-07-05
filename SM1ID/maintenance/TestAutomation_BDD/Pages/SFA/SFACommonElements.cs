using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA
{
    [PageName("SFA Common Elements")]
    public class SFACommonElements
    {
        public static AbstractedBy Filter(string popUpName, string columnName) => AbstractedBy.Xpath("", "//div[text()='" + popUpName + "']//ancestor::div[@sm1-id or @role='dialog']//span[text()='" + columnName + "']//ancestor::div[@role='columnheader']//div[contains(@class,'filter')]");
        public static AbstractedBy FilterSM1ID(string popUpName, string columnSM1ID) => AbstractedBy.Xpath("", "//div[text()='" + popUpName + "']//ancestor::div[@sm1-id or @role='dialog']//div[@role='columnheader'][text()='" + columnSM1ID + "']//div[contains(@class,'filter')]");

        //Buttons

        // Grids
        public static AbstractedBy SelectionContext_SelectMenuOption = AbstractedBy.Xpath("Select Option", GenericElementsPage.VisibleElementBySM1ID("GridContextMenu").ByToString + GenericElementsPage.ElementBySM1ID("GridSelectMenuItem").ByToString);
        public static AbstractedBy SelectionContext_DeselectMenuOption = AbstractedBy.Xpath("Deselect Option", GenericElementsPage.VisibleElementBySM1ID("GridContextMenu").ByToString + GenericElementsPage.ElementBySM1ID("GridDeselectFilteredRowsMenuItem").ByToString);
        public static AbstractedBy SelectionContext_DeselectAllMenuOption = AbstractedBy.Xpath("Deselect All Option", GenericElementsPage.VisibleElementBySM1ID("GridContextMenu").ByToString + GenericElementsPage.ElementBySM1ID("GridDeselectAllRowsMenuItem").ByToString);

        public static readonly AbstractedBy AddButton = AbstractedBy.Xpath("Add Button", GenericElementsPage.VisibleElementBySM1ID("AddButton").ByToString);
        public static readonly AbstractedBy RemoveButton = AbstractedBy.Xpath("Remove Button", GenericElementsPage.VisibleElementBySM1ID("RemoveButton").ByToString);
        public static readonly AbstractedBy LinksButton = AbstractedBy.Xpath("Links Button", GenericElementsPage.VisibleElementBySM1ID("LogicalNavCtrl.NAVIGATORLINKS_Button").ByToString);
        public static readonly AbstractedBy ColumnSettings = AbstractedBy.Xpath("Column Settings", GenericElementsPage.ElementBySM1ID("GridContextMenuButton").ByToString);
        public static readonly AbstractedBy RefreshButton = AbstractedBy.Xpath("Refresh Button", GenericElementsPage.ElementBySM1ID("ACTION_refresh").ByToString);


        public static AbstractedBy SearchIcon = AbstractedBy.Xpath("Search Box Icon", GenericElementsPage.ElementBySM1ID("SearchBox").ByToString);
        public static AbstractedBy SearchField = AbstractedBy.Xpath("Search Textbox", GenericElementsPage.InputElementBySM1ID("SearchBox").ByToString);
        public static AbstractedBy SearchButton = AbstractedBy.Xpath("Search Button", GenericElementsPage.ElementBySM1ID("SearchBox").ByToString + "//*[contains(@id,'component')]");
        public static AbstractedBy NumberOfRowsLabel = AbstractedBy.Xpath("Number of Rows label", GenericElementsPage.ElementBySM1ID("RowsNumLabel").ByToString);
        public static AbstractedBy RowDetailButton = AbstractedBy.Xpath("Row Detail Button", GenericElementsPage.VisibleElementBySM1ID("ViewRowButton").ByToString);

        public static readonly AbstractedBy RemoveSortOption = AbstractedBy.Xpath("Remove Sort option", GenericElementsPage.ElementBySM1ID("GridRemoveSortMenuItem").ByToString);
        public static readonly AbstractedBy RemoveFiltersOption = AbstractedBy.Xpath("Remove Filters option", GenericElementsPage.ElementBySM1ID("GridRemoveFiltersMenuItem").ByToString);
        public static readonly AbstractedBy EditFiltersOption = AbstractedBy.Xpath("Edit Filters option", GenericElementsPage.ElementBySM1ID("GridEditFiltersMenuItem").ByToString);
        public static readonly AbstractedBy ExcelExportOption = AbstractedBy.Xpath("Excel Export option", GenericElementsPage.ElementBySM1ID("GridExportExcelMenuItem").ByToString);
        public static readonly AbstractedBy ColumnsOption = AbstractedBy.Xpath("Columns option", GenericElementsPage.ElementBySM1ID("GridSettingsColumnsMenuItem").ByToString);
        public static readonly AbstractedBy ClearAllPreferencesOption = AbstractedBy.Xpath("Clear All Preferences option", GenericElementsPage.ElementBySM1ID("GridPreferencesResetMenuItem").ByToString);
    }
}
