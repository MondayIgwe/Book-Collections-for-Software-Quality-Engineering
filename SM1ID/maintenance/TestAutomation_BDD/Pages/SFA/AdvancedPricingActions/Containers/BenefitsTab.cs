using Kantar_BDD.Pages.SFA.Navigators;
using Kantar_BDD.Support.Helpers;
using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingBooks.Containers
{
    [PageName("Advanced Pricing Actions - Benefits Tab")]
    public class BenefitsTab
    {
        //Top tabs
        public static AbstractedBy BenefitTab = AbstractedBy.Xpath("Benefit Top Tab", GenericElementsPage.VisibleElementBySM1ID("tabBenefitTree").ByToString);
        public static AbstractedBy BenefitBracketsTab = AbstractedBy.Xpath("Benefit Brackets Top Tab", GenericElementsPage.VisibleElementBySM1ID("tabBenefitBrackets").ByToString);
        public static AbstractedBy FreeGoodsListTab = AbstractedBy.Xpath("Free Goods List Top Tab", GenericElementsPage.VisibleElementBySM1ID("tabBenefitFreeGoodsList").ByToString);

        //Common Elements
        public static AbstractedBy EditButton = AbstractedBy.Xpath("Edit Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_edit").ByToString);
        public static AbstractedBy RemoveButton = AbstractedBy.Xpath("Remove Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_remove").ByToString);
        public static AbstractedBy OKButton = GenericElementsPage.OkButton;
        public static AbstractedBy CancelButton = GenericElementsPage.CancelButton;

        // ---> Benefit Tab
        public static AbstractedBy NotesListTab = AbstractedBy.Xpath("Notes Top Tab", GenericElementsPage.VisibleElementBySM1ID("TABDESBENTREE").ByToString);
        public static AbstractedBy CollapseNotesPopUp = AbstractedBy.Xpath("Collapse Notes Top Tab", GenericElementsPage.VisibleElement("//*[@aria-label='Collapse panel']").ByToString);
        public static AbstractedBy ExpandNotesPopUp = AbstractedBy.Xpath("Expand Notes Top Tab", GenericElementsPage.VisibleElement("//*[@aria-label='Expand panel']").ByToString);

        //Toolbar
        // ---> Benefit Top Tab
        public static AbstractedBy CopyFromValorizationTreeCheckbox = AbstractedBy.Xpath("Copy From Valorization Tree Checkbox", GenericElementsPage.InputElementBySM1ID("FLGBENTREE").ByToString);

        public static AbstractedBy AddLeafButton = AbstractedBy.Xpath("Add Leaf Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_leaf").ByToString);
        public static AbstractedBy AddBasketButton = AbstractedBy.Xpath("Add Basket Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_basket").ByToString);
        public static AbstractedBy ANDButton = AbstractedBy.Xpath("AND Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_and").ByToString);
        public static AbstractedBy ORButton = AbstractedBy.Xpath("OR Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_or").ByToString);
        public static AbstractedBy NOTButton = AbstractedBy.Xpath("NOT Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_not").ByToString);
        public static AbstractedBy CopyButton = AbstractedBy.Xpath("Copy Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_copy").ByToString);
        public static AbstractedBy PasteButton = AbstractedBy.Xpath("Paste Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_paste").ByToString);
        
        // ---> Benefit Brackets Top Tab
        public static AbstractedBy ThresholdButton = AbstractedBy.Xpath("Threshold Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_threshold").ByToString);
        public static AbstractedBy BenefitGroupButton = AbstractedBy.Xpath("Benefit Group Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_benefit-group").ByToString);
        public static AbstractedBy BenefitButton = AbstractedBy.Xpath("Benefit Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_benefit").ByToString);
    }
}
