using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.Toolbar;
using TechTalk.SpecFlow;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class SFADiscountListStepDefinition : SeleniumStepDefinition
    {
        public SFADiscountListStepDefinition(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user adds a new Discount List where Type:'([^']*)', Code: '([^']*)', Customer Level: '([^']*)' ,Customer Code: '([^']*)', Application Type: '([^']*)',  Enable Brackets: '([^']*)'")]
        public void WhenTheUserAddsANewDiscountListWhereTypeCodeCustomerLevelCustomerCodeApplicationTypeEnableBrackets(string type, string code, string customerLevel, string customerCode, string applicationType, string enableBrackets)
        {
            if (string.IsNullOrEmpty(enableBrackets))
                enableBrackets = null;
            Selenium.Click(GuiToolbar.AddButton, 30);
            DiscountListsStepHelpers.PopulateNewDiscountListPopUp(type, code, customerLevel, customerCode, null, null, applicationType, enableBrackets);
            Selenium.Click(PopupGenericElements.PopupOkButton("New discount list"));
        }
    }
}
