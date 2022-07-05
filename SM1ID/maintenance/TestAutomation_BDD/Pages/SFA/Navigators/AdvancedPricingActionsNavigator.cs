using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.Navigators
{
    [PageName("Advanced Pricing Actions Navigator")]
    public class AdvancedPricingActionsNavigator
    {
        public static readonly AbstractedBy AddButton = SFACommonElements.AddButton;
        public static readonly AbstractedBy RemoveButton = SFACommonElements.RemoveButton;
        public static readonly AbstractedBy CopyButton = AbstractedBy.Xpath("Copy Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_COPYCNV").ByToString);
        public static readonly AbstractedBy LinksButton = SFACommonElements.LinksButton;
        public static readonly AbstractedBy ColumnSettings = SFACommonElements.ColumnSettings;
        
        // Drop-down options
        public static readonly AbstractedBy AdvancedPricingBooksOption = AbstractedBy.Xpath("Advanced Pricing Books option", GenericElementsPage.ElementBySM1ID("ACTION_navlink-CANVASS").ByToString);

        public static readonly AbstractedBy RemoveSortOption = SFACommonElements.RemoveSortOption;
        public static readonly AbstractedBy RemoveFiltersOption = SFACommonElements.RemoveFiltersOption;
        public static readonly AbstractedBy EditFiltersOption = SFACommonElements.EditFiltersOption;
        public static readonly AbstractedBy ExcelExportOption = SFACommonElements.ExcelExportOption;
        public static readonly AbstractedBy ColumnsOption = SFACommonElements.ColumnsOption;
        public static readonly AbstractedBy ClearAllPreferencesOption = SFACommonElements.ClearAllPreferencesOption;
    }
}
