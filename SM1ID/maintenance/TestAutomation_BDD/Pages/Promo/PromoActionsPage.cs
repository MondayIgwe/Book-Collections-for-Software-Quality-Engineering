using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Promo
{
    [PageName("PromoActionsPage")]
    class PromoActionsPage
    {
        public static readonly AbstractedBy ProductAddButton = AbstractedBy.Xpath("Product Add Button", "//span[text()='Products' and contains(@class, 'x-tab-inner')]/ancestor::div[@role='tablist']/following-sibling::div//span[@role='button']//span[contains(@class, 'toolbar-add')]");
        public static readonly AbstractedBy PromoAddButton = AbstractedBy.Xpath("Promo Add Button", "//a[contains(@class,'x-toolbar-item') and @aria-hidden='false']//span[contains(@class,'toolbar-add')]");

        public static readonly AbstractedBy CustomerEntitySelector = AbstractedBy.Xpath("Customer Entity Selector", GenericElementsPage.TextBoxOpenTriggerBySM1ID("CUSTOMER").ByToString);
        public static readonly AbstractedBy ContractorPopupOkBtn = AbstractedBy.Xpath("OK Contractor Code Button", "//div[@sm1-id='LOGICALAVANCEDENTITYSELECTORPOPUP']//span[@sm1-id='SM1OkButton']");
        public static readonly AbstractedBy NewPromoPopupOkBtn = AbstractedBy.Xpath("New Promo Popup Button", "//div[@sm1-id='LOGICALNEWPROMOACTIONPOPUP']//span[@sm1-id='SM1OkButton']");
        public static readonly AbstractedBy ProductsTab = AbstractedBy.Xpath("Products Tab", "//div[@sm1-id='TAB_H5_PRODUCTS']");
        public static readonly AbstractedBy ReEvaluateAnomaliesButton = AbstractedBy.Xpath("ReEvaluate Anomalies Button", "//a[@sm1-id='ACTION_REEVALUATE_ANOMALIES']");
        public static readonly AbstractedBy AnomaliesRows = AbstractedBy.Xpath("Anomalies Rows", "//div[@sm1-id='CHECKSET']/ancestor::div[@sm1-id='GridContainer']//table");
        public static readonly AbstractedBy KeepTheDayOfTheWeekCheckbox = AbstractedBy.Xpath("Keep the day of the week checkbox", "//*[text()='Keep the day of the week']/ancestor::td");
        public static AbstractedBy PromoPlanScenarioButton = AbstractedBy.Xpath("PromoPlan Scenario Button", "//span[text()='PromoPlan Scenario']/ancestor::a[@data-qtip='PromoPlan Scenario']");
        public static AbstractedBy ContractorTableSelect(string item) => AbstractedBy.Xpath("Customer Code Table", "(//div[contains(text(),'" + item + "')])[1]");

        public static readonly AbstractedBy ConfirmationLevelCombo = AbstractedBy.Xpath("Confirmation Level Combo", GenericElementsPage.TextBoxComboTriggerBySM1ID("DEVELOPMENT").ByToString);
        public static readonly AbstractedBy CoverageCombo = AbstractedBy.Xpath("Coverage Combo", GenericElementsPage.TextBoxComboTriggerBySM1ID("COVERING").ByToString);
        public static readonly AbstractedBy NewPromoActionPopup = AbstractedBy.VisibleSm1ID("New Promo Action Popup", "LOGICALNEWPROMOACTIONPOPUP");
    }
}
