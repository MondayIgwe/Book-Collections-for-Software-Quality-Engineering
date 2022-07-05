using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingActions.Containers
{
    [PageName("Advanced Pricing Actions - Excluded Actions Tab")]
    public class ExcludedActionsTab
    {
        // Elements
        public static AbstractedBy ColumnSettings = AbstractedBy.Xpath(SFACommonElements.ColumnSettings.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.ColumnSettings.ByToString);
        public static AbstractedBy RemoveSortOption = AbstractedBy.Xpath(SFACommonElements.RemoveSortOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar") + SFACommonElements.RemoveSortOption.ByToString);
        public static AbstractedBy RemoveFiltersOption = AbstractedBy.Xpath(SFACommonElements.RemoveFiltersOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.RemoveFiltersOption.ByToString);
        public static AbstractedBy EditFiltersOption = AbstractedBy.Xpath(SFACommonElements.EditFiltersOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.EditFiltersOption.ByToString);
        public static AbstractedBy ExcelExportOption = AbstractedBy.Xpath(SFACommonElements.ExcelExportOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.ExcelExportOption.ByToString);
        public static AbstractedBy ColumnsOption = AbstractedBy.Xpath(SFACommonElements.ColumnsOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.ColumnsOption.ByToString);
        public static AbstractedBy ClearAllPreferencesOption = AbstractedBy.Xpath(SFACommonElements.ClearAllPreferencesOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.ClearAllPreferencesOption.ByToString);

        public static AbstractedBy SearchIcon = AbstractedBy.Xpath(SFACommonElements.SearchIcon.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.SearchIcon.ByToString);
        public static AbstractedBy SearchField = AbstractedBy.Xpath(SFACommonElements.SearchField.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.SearchField.ByToString);
        public static AbstractedBy SearchButton = AbstractedBy.Xpath(SFACommonElements.SearchButton.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.SearchButton.ByToString);
        public static AbstractedBy NumberOfRowsLabel = AbstractedBy.Xpath(SFACommonElements.NumberOfRowsLabel.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.NumberOfRowsLabel.ByToString);

        // Columns
        public static AbstractedBy ExcludedColumn = AbstractedBy.Xpath("Excluded Column", GenericElementsPage.VisibleElementBySM1ID("FLGEXCL").ByToString);
        public static AbstractedBy CodeColumn = AbstractedBy.Xpath("Code Column", GenericElementsPage.VisibleElementBySM1ID("CODCNVACT").ByToString);
        public static AbstractedBy DesciptionColumn = AbstractedBy.Xpath("Desciption Column", GenericElementsPage.VisibleElementBySM1ID("DESCNVACT").ByToString);
        public static AbstractedBy ApplicationTypeColumn = AbstractedBy.Xpath("Application Type Column", GenericElementsPage.VisibleElementBySM1ID("CODDISCR").ByToString);
        public static AbstractedBy StatusColumn = AbstractedBy.Xpath("Status Column", GenericElementsPage.VisibleElementBySM1ID("CODSTATUS").ByToString);
        public static AbstractedBy BenefitReasonColumn = AbstractedBy.Xpath("Benefit Reason Column", GenericElementsPage.VisibleElementBySM1ID("BENREASON").ByToString);

        //  Grid Link
        public static AbstractedBy OpenCode(string codeLink) => AbstractedBy.Xpath("Open Code", "//*[@class='sm1-column-link'][text() = '" + codeLink + "']");

        // Excluded Column Checkbox via link
        public static AbstractedBy ExcludedColumnOnCode(string codeLink) => AbstractedBy.Xpath("Excluded Column On Code", "//*[@class='sm1-column-link'][text() = '" + codeLink + "']//ancestor::*[@role='row']//*[@class = 'x-grid-cell-inner ']//*[@chkvalue]");

        // Excluded Column Checkbox via row number
        public static AbstractedBy ExcludedColumnOnRowNumber(string rowNumber) => AbstractedBy.Xpath("Excluded Column On Row Number", "(//*[@role='row']//*[@class = 'x-grid-cell-inner ']//*[@chkvalue])["+ rowNumber +"]");
    }
}
