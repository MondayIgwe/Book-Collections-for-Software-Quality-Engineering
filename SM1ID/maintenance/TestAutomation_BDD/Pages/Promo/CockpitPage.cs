using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Promo
{
    [PageName("CockpitPage")]
    class CockpitPage
    {
        public static readonly AbstractedBy MechanicsViewAllButton = AbstractedBy.Xpath("MechanicsViewAllButton", "//div[@sm1-id='CARD_MECHANICS']//a[@sm1-id='ACTION_VIEWALL']");
        public static readonly AbstractedBy PromoDescriptionTextField = AbstractedBy.Xpath("Promo Description Textbox", GenericElementsPage.InputElementBySM1ID("PROMO_DESCRIPTION").ByToString);
        public static readonly AbstractedBy PromoWorkflowStatusTrigger = AbstractedBy.Xpath("Promo Workflow Status Trigger", "//div[@sm1-id='PROMO_WORKFLOW_STATUS']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy CardProductsCount = AbstractedBy.Xpath("Card Products Count", "//div[@sm1-id='CARD_PRODUCTS']//label[contains(@class, 'sm1sectionrighttext')]");
        public static AbstractedBy MechanicsCheckBox(string text) => AbstractedBy.Xpath("Mechanics CheckBox", "//div[@sm1-id='GridContainer']//div[text()='" + text + "']/../..//td[contains(@data-columnid,'sm1gridcheckboxcolumn')]//div[@class='x-grid-cell-inner ']");
        public static readonly AbstractedBy ActionIDTextbox = AbstractedBy.Xpath("Action ID Textbox", GenericElementsPage.InputElementBySM1ID("IDACTIONNUM").ByToString);
        public static readonly AbstractedBy PromoCockpitStatusTrigger = AbstractedBy.Xpath("Promo Cockpit Status Trigger", GenericElementsPage.TextboxStatusTriggerBySM1ID("PROMO_WORKFLOW_STATUS").ByToString);
        public static readonly AbstractedBy CustomerHolderTextbox = AbstractedBy.Xpath("Customer Holder Textbox", GenericElementsPage.InputElementBySM1ID("PROMO_CONTRACTOR").ByToString);
    }
}
