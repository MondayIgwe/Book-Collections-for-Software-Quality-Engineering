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

        public static readonly AbstractedBy ProfitLossRefreshButton = AbstractedBy.Xpath("Profit And Loss Refresh Button", "//*[text()='Total Promo Rebate ']/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//a[@sm1-id='ACTION_FETCH']");
        public static readonly AbstractedBy ProfitLossRetailerRefreshButton = AbstractedBy.Xpath("Profit And Loss Retailer Refresh Button", "//*[text()='Retail Cash Margin']/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//a[@sm1-id='ACTION_FETCH']");
        public static AbstractedBy ProfitLossRefreshButtonByField(string Field) => AbstractedBy.Xpath("Profit And Loss Refresh Button", "//*[text()='"+ Field + "']/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//a[@sm1-id='ACTION_FETCH']");

        public static AbstractedBy ProfitLossDropDownTrigger(string Field) => AbstractedBy.Xpath("Profit Loss Drop Down Trigger", "//div[text()='Total Promo Discount ']/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//span[text()='"+ Field + ":']//ancestor::label/following-sibling::div//div[@class='sm1-triggers']//div[contains(@class,'sm1selecttrigger')][1]");
        public static AbstractedBy ProfitLossRetailerDropDownTrigger(string Field) => AbstractedBy.Xpath("Profit Loss Retailer Drop Down Trigger", "//div[text()='Retail Sales value']/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//span[text()='" + Field + ":']//ancestor::label/following-sibling::div//div[@class='sm1-triggers']//div[contains(@class,'sm1selecttrigger')]");
        public static AbstractedBy ProfitLossWhatIfDropDownTrigger(string Field) => AbstractedBy.Xpath("Profit Loss WhatIf Drop Down Trigger", "//div[text()='Gross Amount']/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//span[text()='" + Field + ":']//ancestor::label/following-sibling::div//div[@class='sm1-triggers']//div[contains(@class,'sm1selecttrigger')]");

        public static AbstractedBy DropDownTrigger(string uniqueRowName, string Field) => AbstractedBy.Xpath("Profit Loss Drop Down Trigger", "//div[contains(text(),'" + uniqueRowName + "')]/ancestor::div[contains(@class,'x-panel SM1_LogicalPL')]//span[text()='" + Field + ":']//ancestor::label/following-sibling::div//div[@class='sm1-triggers']//div[contains(@class,'sm1selecttrigger')][1]");

    }
}
