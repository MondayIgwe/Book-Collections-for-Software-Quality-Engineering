using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingActions.Containers
{
    [PageName("Advanced Pricing Actions - Attachments Tab")]
    public class AttachmentsTab
    {
        // Elements
        public static AbstractedBy ColumnSettings = AbstractedBy.Xpath(SFACommonElements.ColumnSettings.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.ColumnSettings.ByToString);
        public static AbstractedBy RemoveSortOption = AbstractedBy.Xpath(SFACommonElements.RemoveSortOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar") + SFACommonElements.RemoveSortOption.ByToString);
        public static AbstractedBy RemoveFiltersOption = AbstractedBy.Xpath(SFACommonElements.RemoveFiltersOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.RemoveFiltersOption.ByToString);
        public static AbstractedBy EditFiltersOption = AbstractedBy.Xpath(SFACommonElements.EditFiltersOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.EditFiltersOption.ByToString);
        public static AbstractedBy ExcelExportOption = AbstractedBy.Xpath(SFACommonElements.ExcelExportOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.ExcelExportOption.ByToString);
        public static AbstractedBy ColumnsOption = AbstractedBy.Xpath(SFACommonElements.ColumnsOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.ColumnsOption.ByToString);
        public static AbstractedBy ClearAllPreferencesOption = AbstractedBy.Xpath(SFACommonElements.ClearAllPreferencesOption.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.ClearAllPreferencesOption.ByToString);

        public static AbstractedBy AddButton = AbstractedBy.Xpath(SFACommonElements.AddButton.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.AddButton.ByToString);
        public static AbstractedBy RemoveButton = AbstractedBy.Xpath(SFACommonElements.RemoveButton.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.RemoveButton.ByToString);

        public static AbstractedBy SearchIcon = AbstractedBy.Xpath(SFACommonElements.SearchIcon.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.SearchIcon.ByToString);
        public static AbstractedBy SearchField = AbstractedBy.Xpath(SFACommonElements.SearchField.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.SearchField.ByToString);
        public static AbstractedBy SearchButton = AbstractedBy.Xpath(SFACommonElements.SearchButton.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.SearchButton.ByToString);
        public static AbstractedBy NumberOfRowsLabel = AbstractedBy.Xpath(SFACommonElements.NumberOfRowsLabel.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.NumberOfRowsLabel.ByToString);
        public static AbstractedBy RowDetailButton = AbstractedBy.Xpath(SFACommonElements.RowDetailButton.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.RowDetailButton.ByToString);

        // Columns
        public static readonly AbstractedBy FileNameColumn = AbstractedBy.Xpath("File Name Column", GenericElementsPage.ElementBySM1ID("FILENAME").ByToString);
        public static readonly AbstractedBy PreviewColumn = AbstractedBy.Xpath("Preview Column", GenericElementsPage.ElementBySM1ID("ATTACHMENTPREVIEW").ByToString);
        public static readonly AbstractedBy SubjectColumn = AbstractedBy.Xpath("Subject Column", GenericElementsPage.ElementBySM1ID("DESSUBJECT").ByToString);
        public static readonly AbstractedBy PrimaryColumn = AbstractedBy.Xpath("Primary Column", GenericElementsPage.ElementBySM1ID("FLGPRIMARY").ByToString);
        public static readonly AbstractedBy FileTypeColumn = AbstractedBy.Xpath("File Type Column", GenericElementsPage.ElementBySM1ID("CODFILETYPE").ByToString);
        public static readonly AbstractedBy StatusColumn = AbstractedBy.Xpath("Status Column", GenericElementsPage.ElementBySM1ID("STATUS").ByToString);
        public static readonly AbstractedBy LocationColumn = AbstractedBy.Xpath("Location Column", GenericElementsPage.ElementBySM1ID("METADATA").ByToString);
        public static readonly AbstractedBy LastMaintenanceDateColumn = AbstractedBy.Xpath("Last Maintenance Date Column", GenericElementsPage.ElementBySM1ID("DTEMOD").ByToString);
    }
}
