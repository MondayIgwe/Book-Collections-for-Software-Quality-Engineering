using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages
{
    [PageName("Top Tabs")]
    public class TopTabs
    {
        public static AbstractedBy GeneralInfoTopTab = AbstractedBy.Xpath("General Info Top Tab", GenericElementsPage.ElementBySM1ID("mainInfo").ByToString);
        public static AbstractedBy TransactionalDataTopTab = AbstractedBy.Xpath("Transactional Data Top Tab", GenericElementsPage.ElementBySM1ID("transaction").ByToString);
        public static AbstractedBy AvailableFieldsTopTab = AbstractedBy.Xpath("Available Fields Top Tab", GenericElementsPage.ElementBySM1ID("FieldList").ByToString);
        public static AbstractedBy FieldValidationTopTab = AbstractedBy.Xpath("Field Validation Top Tab", GenericElementsPage.ElementBySM1ID("FieldValidation").ByToString);
        public static AbstractedBy Button_ActionsTopTab = AbstractedBy.Xpath("Button_Actions Top Tab", GenericElementsPage.ElementBySM1ID("BUTTONS_ACTIONS").ByToString);
        public static AbstractedBy Toast_ControlsTopTab = AbstractedBy.Xpath("Toast_Controls Top Tab", GenericElementsPage.ElementBySM1ID("TOAST_CONTROLS").ByToString);
        public static AbstractedBy HeaderInfoTopTab = AbstractedBy.Xpath("Header Info Top Tab", GenericElementsPage.ElementBySM1ID("SUB_TAB_HEADER_INFO").ByToString);
        public static readonly AbstractedBy ProfitAndLossTab = AbstractedBy.VisibleSm1ID("Profit & Loss Top Tab", "TAB_H5_PL");
        public static readonly AbstractedBy ProfitAndLossRetailerTab = AbstractedBy.VisibleSm1ID("Profit & Loss Retailer Top Tab", "TAB_H5_PLRETAILER");
        public static readonly AbstractedBy ProfitAndLossWhatIFTab = AbstractedBy.VisibleSm1ID("Profit & Loss What-IF Top Tab", "TAB_H5_PLWHATIF");
        public static readonly AbstractedBy ProfitAndLossDirectCustomersTab = AbstractedBy.VisibleSm1ID("Profit & Loss Direct Customers Top Tab", "TAB_H5_PLDC");
        //products
        public static readonly AbstractedBy ProductsTopTab = AbstractedBy.VisibleSm1ID("Products Top Tab", "TAB_H5_SUB_PRODUCTS");
        public static readonly AbstractedBy WeeklySplitTopTab = AbstractedBy.VisibleSm1ID("Weekly Split Top Tab", "TAB_H5_SUB_WEEKSPLIT");
        public static readonly AbstractedBy ProductsInvolvedTopTab = AbstractedBy.VisibleSm1ID("Products Involved Top Tab", "TAB_H5_SUB_PRODUCTSINVOLVED");
        public static readonly AbstractedBy FundsTopTab = AbstractedBy.VisibleSm1ID("Funds Top Tab", "TAB_H5_SUB_FUNDS");
        public static readonly AbstractedBy BusinessRulesTopTab = AbstractedBy.VisibleSm1ID("Business Rules Top Tab", "TAB_H5_SUB_BUSINESSRULES");

    }
}
