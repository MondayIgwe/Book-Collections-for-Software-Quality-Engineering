using Kantar_BDD.Pages.SFA.Navigators;
using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingActions.Containers.SectionGrids
{
    [PageName("Advanced Pricing Actions - Section - Free Goods List Grid")]
    public class FreeGoodsListSectionGrid
    {
        // Elements
        public static AbstractedBy Section = AbstractedBy.Xpath("Free Goods List Section Grid", GenericElementsPage.ElementBySM1ID("secFreeGoodsList").ByToString);
        public static AbstractedBy AddButton = AbstractedBy.Xpath("Add Button", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("AddButton").ByToString);
        public static AbstractedBy RemoveButton = AbstractedBy.Xpath("Remove Button", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("RemoveButton").ByToString);
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
        public static AbstractedBy DescriptionColumn = AbstractedBy.Xpath("Description Column", Section.ByToString + GenericElementsPage.VisibleElementBySM1ID("DESBENARTGRP").ByToString);
        public static AbstractedBy RowToSelect(string rowNumber) => AbstractedBy.Xpath("Free Goods List Row", Section.ByToString + GenericElementsPage.ElementBySM1ID("GridContainer").ByToString + "//table[" + rowNumber + "]//tr//td//div");
    }
}

