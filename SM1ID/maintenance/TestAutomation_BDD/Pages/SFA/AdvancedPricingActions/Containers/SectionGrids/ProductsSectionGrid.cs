using Kantar_BDD.Pages.SFA.Navigators;
using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingActions.Containers.SectionGrids
{
    [PageName("Advanced Pricing Actions - Section - Products Grid")]

    public class ProductsSectionGrid
    {
        // Elements
        public static AbstractedBy Section = AbstractedBy.Xpath("Products Section Grid", GenericElementsPage.ElementBySM1ID("secProductsList").ByToString);
        public static AbstractedBy AddButton = AbstractedBy.Xpath("Add Button", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("AddButton").ByToString);
        public static AbstractedBy RemoveButton = AbstractedBy.Xpath("Remove Button", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("RemoveButton").ByToString);
        public static AbstractedBy SelectionContextMenu = AbstractedBy.Xpath("Selection Context Menu", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("GridSelectionContextMenuButton").ByToString);
        public static AbstractedBy SelectionContext_SelectMenuOption = SFACommonElements.SelectionContext_SelectMenuOption;
        public static AbstractedBy SelectionContext_DeselectMenuOption = SFACommonElements.SelectionContext_DeselectMenuOption;
        public static AbstractedBy SelectionContext_DeselectAllMenuOption = SFACommonElements.SelectionContext_DeselectAllMenuOption;

        public static AbstractedBy SearchIcon = AbstractedBy.Xpath("Search Box Icon", Section.ByToString + GenericElementsPage.ElementBySM1ID("SearchBox").ByToString);
        public static AbstractedBy SearchField = AbstractedBy.Xpath("Search Textbox", Section.ByToString + GenericElementsPage.InputElementBySM1ID("SearchBox").ByToString);
        public static AbstractedBy SearchButton = AbstractedBy.Xpath("Search Button", Section.ByToString + GenericElementsPage.ElementBySM1ID("SearchBox").ByToString + "//*[contains(@id,'component')]");
        public static AbstractedBy NumberOfRowsLabel = AbstractedBy.Xpath("Number of Rows label", Section.ByToString + GenericElementsPage.ElementBySM1ID("RowsNumLabel").ByToString);

        public static AbstractedBy ColumnSettings = AbstractedBy.Xpath(AdvancedPricingActionsNavigator.ColumnSettings.LogicalName, Section.ByToString + AdvancedPricingActionsNavigator.ColumnSettings.ByToString);
        public static AbstractedBy RemoveSortOption = AbstractedBy.Xpath(AdvancedPricingActionsNavigator.RemoveSortOption.LogicalName, Section.ByToString + AdvancedPricingActionsNavigator.RemoveSortOption.ByToString);
        public static AbstractedBy RemoveFiltersOption = AbstractedBy.Xpath(AdvancedPricingActionsNavigator.RemoveFiltersOption.LogicalName, Section.ByToString + AdvancedPricingActionsNavigator.RemoveFiltersOption.ByToString);
        public static AbstractedBy EditFiltersOption = AbstractedBy.Xpath(AdvancedPricingActionsNavigator.EditFiltersOption.LogicalName, Section.ByToString + AdvancedPricingActionsNavigator.EditFiltersOption.ByToString);
        public static AbstractedBy ExcelExportOption = AbstractedBy.Xpath(AdvancedPricingActionsNavigator.ExcelExportOption.LogicalName, Section.ByToString + AdvancedPricingActionsNavigator.ExcelExportOption.ByToString);
        public static AbstractedBy ColumnsOption = AbstractedBy.Xpath(AdvancedPricingActionsNavigator.ColumnsOption.LogicalName, Section.ByToString + AdvancedPricingActionsNavigator.ColumnsOption.ByToString);
        public static AbstractedBy ClearAllPreferencesOption = AbstractedBy.Xpath(AdvancedPricingActionsNavigator.ClearAllPreferencesOption.LogicalName, Section.ByToString + AdvancedPricingActionsNavigator.ClearAllPreferencesOption.ByToString);

        // Section Grid
        public static AbstractedBy SelectAllRowsColumn = AbstractedBy.Xpath("Select All Rows Column", Section.ByToString + "//*[contains(@id, 'checkcolumn')]//*[@class='x-column-header-checkbox']");
        public static AbstractedBy ProductColumn = AbstractedBy.Xpath("Product Column", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("CODART").ByToString);
        public static AbstractedBy ProductDescriptionColumn = AbstractedBy.Xpath("Product Description Column", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("DESART").ByToString);
        public static AbstractedBy EANColumn = AbstractedBy.Xpath("EAN Column", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("CODEAN13").ByToString);
        public static AbstractedBy FreeProductColumn = AbstractedBy.Xpath("Free Product Column", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("FLGGIFT").ByToString);
        public static AbstractedBy OrderUnitColumn = AbstractedBy.Xpath("Order Unit Column", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("UMORD1").ByToString);
        public static AbstractedBy UnitOfMeasureOrder2Column = AbstractedBy.Xpath("Unit Of Measure Order 2 Column", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("UMORD2").ByToString);
        public static AbstractedBy UnitOfMeasureOrder3Column = AbstractedBy.Xpath("Unit Of Measure Order 3 Column", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("UMORD3").ByToString);
        public static AbstractedBy UnitOfMeasureOrder4Column = AbstractedBy.Xpath("Unit Of Measure Order 4 Column", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("UMORD4").ByToString);
        public static AbstractedBy UnitOfMeasureOrder5Column = AbstractedBy.Xpath("Unit Of Measure Order 5 Column", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("UMORD5").ByToString);
    }
}
