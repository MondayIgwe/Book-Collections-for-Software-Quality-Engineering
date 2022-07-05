using Kantar_BDD.Pages.SFA.Navigators;
using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingActions.Containers.PopUps
{
    [PageName("Advanced Pricing Actions - Add New Product Grid")]
    public class AddNewProductGrid
    {
        public static AbstractedBy SelectProductRow(string rowNumber) => AbstractedBy.Xpath("Select Product Row", NewProductPopUp.ByToString + "//*[contains(@class, 'x-grid-scrollbar-clipper-locked')]//table[" + rowNumber + "]//tr//td//*[@class='x-grid-checkcolumn']");
        public static AbstractedBy NewProductPopUp = AbstractedBy.Xpath("Add New Product Grid", "//*[@data-ref='tabGuardBeforeEl']//ancestor::*[@role='dialog'][not(contains(@class, 'sm1-popup'))]");
        public static AbstractedBy OKButton = AbstractedBy.Xpath(GenericElementsPage.OkButton.LogicalName, NewProductPopUp.ByToString + GenericElementsPage.OkButton.ByToString);
        public static AbstractedBy CancelButton = AbstractedBy.Xpath(GenericElementsPage.CancelButton.LogicalName, NewProductPopUp.ByToString + GenericElementsPage.CancelButton.ByToString);

        public static AbstractedBy SearchBoxIcon = AbstractedBy.Xpath("Search Box Icon", NewProductPopUp.ByToString + GenericElementsPage.ElementBySM1ID("SearchBox").ByToString);
        public static AbstractedBy SearchField = AbstractedBy.Xpath("Search Textbox", NewProductPopUp.ByToString + GenericElementsPage.InputElementBySM1ID("SearchBox").ByToString);
        public static AbstractedBy SearchButton = AbstractedBy.Xpath("Search Button", NewProductPopUp.ByToString + GenericElementsPage.ElementBySM1ID("SearchBox").ByToString + "//*[contains(@id,'component')]");
        public static AbstractedBy NumberOfRowsLabel = AbstractedBy.Xpath("Number of Rows label", NewProductPopUp.ByToString + GenericElementsPage.ElementBySM1ID("RowsNumLabel").ByToString);

        public static AbstractedBy ColumnSettings = AbstractedBy.Xpath(AdvancedPricingActionsNavigator.ColumnSettings.LogicalName, NewProductPopUp.ByToString + AdvancedPricingActionsNavigator.ColumnSettings.ByToString);
        public static AbstractedBy RemoveSortOption = AbstractedBy.Xpath(AdvancedPricingActionsNavigator.RemoveSortOption.LogicalName, NewProductPopUp.ByToString + AdvancedPricingActionsNavigator.RemoveSortOption.ByToString);
        public static AbstractedBy RemoveFiltersOption = AbstractedBy.Xpath(AdvancedPricingActionsNavigator.RemoveFiltersOption.LogicalName, NewProductPopUp.ByToString + AdvancedPricingActionsNavigator.RemoveFiltersOption.ByToString);
        public static AbstractedBy EditFiltersOption = AbstractedBy.Xpath(AdvancedPricingActionsNavigator.EditFiltersOption.LogicalName, NewProductPopUp.ByToString + AdvancedPricingActionsNavigator.EditFiltersOption.ByToString);
        public static AbstractedBy ExcelExportOption = AbstractedBy.Xpath(AdvancedPricingActionsNavigator.ExcelExportOption.LogicalName, NewProductPopUp.ByToString + AdvancedPricingActionsNavigator.ExcelExportOption.ByToString);
        public static AbstractedBy ColumnsOption = AbstractedBy.Xpath(AdvancedPricingActionsNavigator.ColumnsOption.LogicalName, NewProductPopUp.ByToString + AdvancedPricingActionsNavigator.ColumnsOption.ByToString);
        public static AbstractedBy ClearAllPreferencesOption = AbstractedBy.Xpath(AdvancedPricingActionsNavigator.ClearAllPreferencesOption.LogicalName, NewProductPopUp.ByToString + AdvancedPricingActionsNavigator.ClearAllPreferencesOption.ByToString);
    }
}
