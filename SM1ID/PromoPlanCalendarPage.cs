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
        public static readonly AbstractedBy RemoveScenarioButton = AbstractedBy.Xpath("Remove Scenario Button", "//span[text()='Remove Existing Scenario']/parent::a[@aria-disabled='false']");
        public static readonly AbstractedBy ActiveScenario = AbstractedBy.Xpath("Active Scenario", "//a[@sm1-id='ACTION_tagT2']//span[contains(text(),'Active Scenario')]");
        public static readonly AbstractedBy BaseScenarioTextbox = AbstractedBy.Xpath("Base Scenario Textbox", "//div[@sm1-id='Info_BaseScenario']//div[@role='textbox']");

        public static AbstractedBy HierLevel(string hier) => AbstractedBy.Xpath("Hier. level Side Panel", "//div[@sm1-id='FILTER_PANEL']//div[text()='" + hier + "']");
        public static AbstractedBy ContractorTableSelect(string item) => AbstractedBy.Xpath("Customer Code Table", "(//table//div[contains(text(),'"+ item + "')])[1]");
        public static AbstractedBy PromoProductUnderTier(string tier, string productName) => AbstractedBy.Xpath("Promo Product Under Tier", "//span[text()='"+ tier + "']/ancestor::div[@class='x-grid-item-container']//table//span[text()='"+ productName + "']");
        public static AbstractedBy FilterApplyButton = AbstractedBy.VisibleSm1ID("Filter Apply Button", "Filter_Filter");
        public static AbstractedBy SelectedScenarioRemoveCombo = AbstractedBy.Xpath("Selected Scenario Remove Combo", GenericElementsPage.TriggerPickerBySM1ID("SelectedScenarioRemove").ByToString);
        public static AbstractedBy SelectedScenarioUpdateCombo = AbstractedBy.Xpath("Selected Scenario Update Combo", GenericElementsPage.TriggerPickerBySM1ID("SelectedScenarioChangeDescription").ByToString);
    }
}
