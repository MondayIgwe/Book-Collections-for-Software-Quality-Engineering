using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Promo
{
    [PageName("PromoPlanCalendarPage")]
    class PromoPlanCalendarPage
    {
        public static readonly AbstractedBy ContractorMenuIcon = AbstractedBy.Xpath("Contractor Menu Icon", "//div[@sm1-id='CUSTOMER']//div[@class='sm1-triggers']//div[not(@style)]");
        public static readonly AbstractedBy ContractorPopupOkBtn = AbstractedBy.Xpath("OK Customer Code Button", "//div[@sm1-id='LOGICALAVANCEDENTITYSELECTORPOPUP']//span[@sm1-id='SM1OkButton']");
        public static readonly AbstractedBy NewPromoPopupOkBtn = AbstractedBy.Xpath("OK Customer Code Button", "//div[@sm1-id='LOGICALNEWPROMOACTIONPOPUP']//span[@sm1-id='SM1OkButton']");
        public static readonly AbstractedBy RemoveScenarioButton = AbstractedBy.Xpath("Remove Scenario Button", "//span[text()='Remove Existing Scenario']/parent::a[@aria-disabled='false']");
        public static readonly AbstractedBy ActiveScenario = AbstractedBy.Xpath("Active Scenario", "//a[@sm1-id='ACTION_tagT2']//span[contains(text(),'Active Scenario')]");


        

        public static readonly AbstractedBy BaseScenarioTextbox = AbstractedBy.Xpath("Base Scenario Textbox", "//div[@sm1-id='Info_BaseScenario']//div[@role='textbox']");

        public static AbstractedBy HierLevel(string hier) => AbstractedBy.Xpath("Hier. level Side Panel", "//div[@sm1-id='FILTER_PANEL']//div[text()='" + hier + "']");
        public static AbstractedBy ContractorTableSelect(string item) => AbstractedBy.Xpath("Customer Code Table", "(//table//div[contains(text(),'"+ item + "')])[1]");
        public static AbstractedBy PromoProductUnderTier(string tier, string productName) => AbstractedBy.Xpath("Promo Product Under Tier", "//span[text()='"+ tier + "']/ancestor::div[@class='x-grid-item-container']//table//span[text()='"+ productName + "']");
    }
}
