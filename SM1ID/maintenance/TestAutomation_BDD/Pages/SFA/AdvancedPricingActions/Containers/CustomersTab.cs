using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingActions.Containers
{
    [PageName("Advanced Pricing Actions - Customers Tab")]
    public class CustomersTab
    {
        // Customer Attributes
        public static readonly AbstractedBy CustomerAttributesTopTab = AbstractedBy.Xpath("Customer Attributes Top Tab", GenericElementsPage.VisibleElementBySM1ID("tabMainCustAttributes").ByToString);
        public static readonly AbstractedBy CustomerSimulationTopTab = AbstractedBy.Xpath("Customer Simulation Top Tab", GenericElementsPage.VisibleElementBySM1ID("tabCustomerSimulation").ByToString);

        public static readonly AbstractedBy InclusionRulesSubTab = AbstractedBy.Xpath("Inclusion Rules Sub Tab", GenericElementsPage.VisibleElementBySM1ID("tabInclusions").ByToString);
        public static readonly AbstractedBy InclusionRulesSubTabNumberOfRules = AbstractedBy.Xpath("Inclusion Rules Sub Tab Number Of Rules", GenericElementsPage.VisibleElementBySM1ID("tabInclusions").ByToString + "//*[@data-ref='btnInnerEl']");

        public static readonly AbstractedBy ExclusionRulesSubTab = AbstractedBy.Xpath("Exclusion Rules Sub Tab", GenericElementsPage.VisibleElementBySM1ID("tabExclusions").ByToString);
        public static readonly AbstractedBy ExclusionRulesSubTabNumberOfRules = AbstractedBy.Xpath("Exclusion Rules Sub Tab Number Of Rules", GenericElementsPage.VisibleElementBySM1ID("tabExclusions").ByToString + "//*[@data-ref='btnInnerEl']");

        public static readonly AbstractedBy SelectAttributesButton = AbstractedBy.Xpath("Select Attributes Button", GenericElementsPage.ElementBySM1ID("secCustomerRulesI").ByToString + "//*[contains(@class, 'sm1action')]");
        public static AbstractedBy AttributesToSelect(string attributes) => AbstractedBy.Xpath("Attribute To Select",
            GenericElementsPage.ElementBySM1ID("GridContainer").ByToString + "//*[@aria-multiselectable='true'][contains(@class, 'x-grid-header-hidden')]//*[contains(text(),'" + attributes + "')]//ancestor::*[@role='row']//*[@class='x-grid-checkcolumn']");
        public static readonly AbstractedBy OKButton = AbstractedBy.Xpath("Select Attributes Drop Down Menu " + GenericElementsPage.OkButton.LogicalName, "//*[contains(@class, 'sm1-action-dropdown-panel')]" + GenericElementsPage.OkButton.ByToString);
        public static readonly AbstractedBy CancelButton = AbstractedBy.Xpath("Select Attributes Drop Down Menu " + GenericElementsPage.CancelButton.LogicalName, "//*[contains(@class, 'sm1-action-dropdown-panel')]" + GenericElementsPage.CancelButton.ByToString);

        public static readonly AbstractedBy SelectionContextMenu = AbstractedBy.Xpath("Selection Context Menu", GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + GenericElementsPage.VisibleElementBySM1ID("GridSelectionContextMenuButton").ByToString);
        public static readonly AbstractedBy SelectionContext_SelectMenuOption = SFACommonElements.SelectionContext_SelectMenuOption;
        public static readonly AbstractedBy SelectionContext_DeselectMenuOption = SFACommonElements.SelectionContext_DeselectMenuOption;
        public static readonly AbstractedBy SelectionContext_DeselectAllMenuOption = SFACommonElements.SelectionContext_DeselectAllMenuOption;

        public static readonly AbstractedBy AddButton = AbstractedBy.Xpath(SFACommonElements.AddButton.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.AddButton.ByToString);
        public static readonly AbstractedBy RemoveButton = AbstractedBy.Xpath(SFACommonElements.RemoveButton.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.RemoveButton.ByToString);

        public static AbstractedBy SearchIcon = AbstractedBy.Xpath(SFACommonElements.SearchIcon.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.SearchIcon.ByToString);
        public static AbstractedBy SearchField = AbstractedBy.Xpath(SFACommonElements.SearchField.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.SearchField.ByToString);
        public static AbstractedBy SearchButton = AbstractedBy.Xpath(SFACommonElements.SearchButton.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.SearchButton.ByToString);
        public static AbstractedBy NumberOfRowsLabel = AbstractedBy.Xpath(SFACommonElements.NumberOfRowsLabel.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.NumberOfRowsLabel.ByToString);

        public static AbstractedBy ColumnSettings = AbstractedBy.Xpath(SFACommonElements.ColumnSettings.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.ColumnSettings.ByToString);
        public static AbstractedBy RemoveSortOption = AbstractedBy.Xpath(SFACommonElements.RemoveSortOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar") + SFACommonElements.RemoveSortOption.ByToString);
        public static AbstractedBy RemoveFiltersOption = AbstractedBy.Xpath(SFACommonElements.RemoveFiltersOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.RemoveFiltersOption.ByToString);
        public static AbstractedBy EditFiltersOption = AbstractedBy.Xpath(SFACommonElements.EditFiltersOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.EditFiltersOption.ByToString);
        public static AbstractedBy ExcelExportOption = AbstractedBy.Xpath(SFACommonElements.ExcelExportOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.ExcelExportOption.ByToString);
        public static AbstractedBy ColumnsOption = AbstractedBy.Xpath(SFACommonElements.ColumnsOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.ColumnsOption.ByToString);
        public static AbstractedBy ClearAllPreferencesOption = AbstractedBy.Xpath(SFACommonElements.ClearAllPreferencesOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.ClearAllPreferencesOption.ByToString);

        public static AbstractedBy SelectRowByRowNumber(string rowNumber) => AbstractedBy.Xpath("Select Row By Row Number",
            "//*[@sm1-id='GridContainer'][contains(@class, 'SM1_LogicalCustomerRulesGrid')]//table[" + rowNumber + "]//*[@class='x-grid-checkcolumn']");

        // ---> Columns
        public static readonly AbstractedBy SelectAllRowsColumn = AbstractedBy.Xpath("Select All Rows Column",
            GenericElementsPage.ElementBySM1ID("GridContainer").ByToString + "[contains(@class, 'SM1_LogicalCustomerRulesGrid')]//*[contains(@id, 'checkcolumn')]//*[@class='x-column-header-checkbox']");

        public static readonly AbstractedBy SalesAreaColumn = AbstractedBy.Xpath("Sales Area Column", GenericElementsPage.ElementBySM1ID("ATTRVAL1").ByToString);
        public static readonly AbstractedBy CustomerCategoryColumn = AbstractedBy.Xpath("Customer Category Column", GenericElementsPage.ElementBySM1ID("ATTRVAL2").ByToString);
        public static readonly AbstractedBy SalesLevelCodeColumn = AbstractedBy.Xpath("Sales Level Code Column", GenericElementsPage.ElementBySM1ID("ATTRVAL3").ByToString);
        public static readonly AbstractedBy SubGroupCodeColumn = AbstractedBy.Xpath("Sub Group Code Column", GenericElementsPage.ElementBySM1ID("ATTRVAL4").ByToString);
        public static readonly AbstractedBy GroupCodeColumn = AbstractedBy.Xpath("Group Code Column", GenericElementsPage.ElementBySM1ID("ATTRVAL5").ByToString);
        public static readonly AbstractedBy RetailerCodeColumn = AbstractedBy.Xpath("Retailer Code Column", GenericElementsPage.ElementBySM1ID("ATTRVAL6").ByToString);
        public static readonly AbstractedBy DistrictColumn = AbstractedBy.Xpath("District Column", GenericElementsPage.ElementBySM1ID("ATTRVAL7").ByToString);
        public static readonly AbstractedBy CustomerCodeColumn = AbstractedBy.Xpath("Customer Code Column", GenericElementsPage.ElementBySM1ID("ATTRVAL8").ByToString);
        public static readonly AbstractedBy AssetListColumn = AbstractedBy.Xpath("Asset List Column", GenericElementsPage.ElementBySM1ID("ATTRVAL9").ByToString);

    }
}
