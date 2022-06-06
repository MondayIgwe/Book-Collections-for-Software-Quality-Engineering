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
        public static readonly AbstractedBy SellInDate = AbstractedBy.Xpath("Sell In Date", "//div[@sm1-id='DATE_SELLIN']//div[contains(@data-componentid,'sm1dateperiod')]//input[contains(@class, 'sm1-startDate') or @value='Start Date']");
        public static readonly AbstractedBy SellInEndDate = AbstractedBy.Xpath("Sell In End Date", "//div[@sm1-id='DATE_SELLIN']//div[contains(@data-componentid,'sm1dateperiod')]//input[contains(@class, 'sm1-endDate') or @value='End Date']");
        public static readonly AbstractedBy SellOutStartDate = AbstractedBy.Xpath("Sell Out Start Date", "//div[@sm1-id='DATE_SELLOUT']//div[contains(@data-componentid,'sm1dateperiod')]//input[contains(@class, 'sm1-startDate') or @value='Start Date']");
        public static readonly AbstractedBy SellOutEndDate = AbstractedBy.Xpath("Sell Out End Date", "//div[@sm1-id='DATE_SELLOUT']//div[contains(@data-componentid,'sm1dateperiod')]//input[contains(@class, 'sm1-endDate') or @value='End Date']");
        public static readonly AbstractedBy DescriptionInput = AbstractedBy.Xpath("Description", "//div[@sm1-id='PROMO_DESCRIPTION']//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy PromoWorkflowStatusTrigger = AbstractedBy.Xpath("Promo Workflow Status Trigger", "//div[@sm1-id='PROMO_WORKFLOW_STATUS']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy CardProductsCount = AbstractedBy.Xpath("Card Products Count", "//div[@sm1-id='CARD_PRODUCTS']//label[contains(@class, 'sm1sectionrighttext')]");
        public static AbstractedBy MechanicsCheckBox(string text) => AbstractedBy.Xpath("Mechanics CheckBox", "//div[@sm1-id='GridContainer']//div[text()='" + text + "']/../..//td[contains(@data-columnid,'sm1gridcheckboxcolumn')]//div[@class='x-grid-cell-inner ']");
    }
}
