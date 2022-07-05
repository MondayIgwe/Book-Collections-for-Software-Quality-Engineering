using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Promo
{
    [PageName("ProfitAndLossPage")]
    class ProfitAndLossPage
    {
        public static readonly AbstractedBy ProfitLossRefreshButtonOnly = AbstractedBy.Xpath("P&L refresh Button Only", "/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//a[@sm1-id='ACTION_FETCH']");
        public static readonly AbstractedBy ProfitLossRefreshButton = AbstractedBy.Xpath("Profit And Loss Refresh Button", "//*[text()='Total Promo Rebate ']" + ProfitLossRefreshButtonOnly.ByToString);
        public static readonly AbstractedBy ProfitLossRetailerRefreshButton = AbstractedBy.Xpath("Profit And Loss Retailer Refresh Button", "//*[text()='Retail Cash Margin']" + ProfitLossRefreshButtonOnly.ByToString);
        public static readonly AbstractedBy ProfitLossWhatIfRefreshButton = AbstractedBy.Xpath("Profit And Loss What If Refresh Button", "//*[text()='Gross Amount']" + ProfitLossRefreshButtonOnly.ByToString);
        public static AbstractedBy ProfitLossRefreshButtonByField(string Field) => AbstractedBy.Xpath("Profit And Loss Refresh Button", "//*[text()='"+ Field + "']" + ProfitLossRefreshButtonOnly.ByToString);
        public static AbstractedBy DropDownTrigger(string uniqueRowName, string Field) => AbstractedBy.Xpath("Profit Loss Drop Down Trigger", "//div[contains(text(),'" + uniqueRowName + "')]/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//span[text()='" + Field + ":']//ancestor::label/following-sibling::div//div[@class='sm1-triggers']//div[contains(@class,'sm1selecttrigger')][1]");
        public static AbstractedBy AggregateProductsCheckbox(string field) => AbstractedBy.Xpath("Aggregate Products Checkbox By Unique Field", $"//*[text()='{field}']//ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//label[text()='Aggregate products']/ancestor::div[contains(@class,'sm1checkbox') or contains(@class,'x-form-cb-wrap-inner')]//input");

        public static AbstractedBy ProfitAndLossDetailTypeTriggerIcon = AbstractedBy.Xpath("Profit And Loss Detail Type Trigger Icon", "(" + GenericElementsPage.TextBoxHamburgerSelectTriggerBySM1ID("detailType").ByToString + ")[1]");
        public static AbstractedBy ProfitAndLossWhatIfDetailTypeTriggerIcon = AbstractedBy.Xpath("Profit And Loss What If Detail Type Trigger Icon", "(" + GenericElementsPage.TextBoxHamburgerSelectTriggerBySM1ID("detailType").ByToString + ")[2]");
        public static AbstractedBy ProfitAndLossRetailerDetailTypeTriggerIcon = AbstractedBy.Xpath("Profit And Loss Retailer Detail Type Trigger Icon", "(" + GenericElementsPage.TextBoxHamburgerSelectTriggerBySM1ID("detailType").ByToString + ")[last()]");
        public static AbstractedBy ProfitAndLossDetailDataTriggerIcon = AbstractedBy.Xpath("Profit And Loss Detail Data Trigger Icon", "(" + GenericElementsPage.TextBoxHamburgerSelectTriggerBySM1ID("detailData").ByToString + ")[1]");
        public static AbstractedBy ProfitAndLossWhatIfDetailDataTriggerIcon = AbstractedBy.Xpath("Profit And Loss What If Detail Data Trigger Icon", "(" + GenericElementsPage.TextBoxHamburgerSelectTriggerBySM1ID("detailData").ByToString + ")[2]");
        public static AbstractedBy ProfitAndLossRetailerDetailDataTriggerIcon = AbstractedBy.Xpath("Profit And Loss Retailer Detail Data Trigger Icon", "(" + GenericElementsPage.TextBoxHamburgerSelectTriggerBySM1ID("detailData").ByToString + ")[last()]");
    }
}
