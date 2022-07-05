using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.Toolbar;
using TechTalk.SpecFlow;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class SFACustomerMasterStepDefinition : SeleniumStepDefinition
    {
        public SFACustomerMasterStepDefinition(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user adds a new Customer Master where Action: '([^']*)', Customer Type: '([^']*)', Nation: '([^']*)', VAT Code: '([^']*)'")]
        public void WhenTheUserAddsANewCustomerMasterWhereActionCustomerTypeNationVATCode(string customerAction, string customerType, string nation, string vatCode)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            Selenium.Click(GenericElementsPage.RadioButton(customerAction), 30);
            CustomerMasterStepHelpers.AddNewCustomerMaster(customerType, nation, vatCode);
            Selenium.Click(PopupGenericElements.PopupOkButton("Customer"));
        }

        [When(@"the user adds a new Customer Master where Action: '([^']*)', Customer Type: '([^']*)', Bill-To: '([^']*)'")]
        public void WhenTheUserAddsANewCustomerMasterWhereActionCustomerTypeBill_To(string customerAction, string customerType, string billTo)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            Selenium.Click(GenericElementsPage.RadioButton(customerAction), 30);
            CustomerMasterStepHelpers.AddNewCustomerMaster(customerType, null, null, billTo);
            Selenium.Click(PopupGenericElements.PopupOkButton("Customer"));
        }

        [When(@"the user adds a new Customer Master where Action: '([^']*)', Customer Type: '([^']*)', Ship-To: '([^']*)'")]
        public void WhenTheUserAddsANewCustomerMasterWhereActionCustomerTypeShip_To(string customerAction, string customerType, string shipTo)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            Selenium.Click(GenericElementsPage.RadioButton(customerAction), 30);
            CustomerMasterStepHelpers.AddNewCustomerMaster(customerType, null, null, null, shipTo);
            Selenium.Click(PopupGenericElements.PopupOkButton("Customer"));
        }

        [When(@"the user adds a new Customer Master where Action: '([^']*)', Customer Type: '([^']*)', Ship-To: '([^']*)' and extract selectted Customer Code")]
        public void WhenTheUserAddsANewCustomerMasterWhereActionCustomerTypeShip_ToAndExtractSelecttedCustomerCode(string customerAction, string customerType, string shipTo)
        {
            Selenium.ValidateAllElementsLoaded(GuiToolbar.AddButton);
            Selenium.Click(GuiToolbar.AddButton, 30);
            Selenium.Click(GenericElementsPage.RadioButton(customerAction), 30);
            CustomerMasterStepHelpers.AddNewCustomerMaster(customerType, null, null, null, shipTo);
            RetrievedValue = CustomerMasterStepHelpers.CustomerCodeSelected;
            Selenium.Click(PopupGenericElements.PopupOkButton("Customer"));
        }

        [When(@"the user adds a new Customer where Action: '([^']*)', Customer Type: '([^']*)', Customer Position: (.*)")]
        public void WhenTheUserAddsANewCustomerWhereActionCustomerTypeCustomerPosition(string customerAction, string customerType, int positionOnCustomerMasterGrid)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            Selenium.Click(GenericElementsPage.RadioButton(customerAction), 30);
            CustomerMasterStepHelpers.AddNewCustomerMaster(customerType, null, null, null, null, positionOnCustomerMasterGrid);
            Selenium.Click(PopupGenericElements.PopupOkButton("Customer"));
        }


        [When(@"the user adds a new Customer and does not close the popup where Action: '([^']*)', Customer Type: '([^']*)', Customer Position: (.*)")]
        public void WhenTheUserAddsANewCustomerAndDoesNotCloseThePopupWhereActionCustomerTypeCustomerPosition(string customerAction, string customerType, int positionOnCustomerMasterGrid)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            Selenium.Click(GenericElementsPage.RadioButton(customerAction), 30);
            CustomerMasterStepHelpers.AddNewCustomerMaster(customerType, null, null, null, null, positionOnCustomerMasterGrid);
           
        }

        [When(@"the user adds a new Customer where Action: '([^']*)', Customer Type: '([^']*)', Nation: '([^']*)', VAT Code: '([^']*)', Customer Position: (.*)")]
        public void WhenTheUserAddsANewCustomerWhereActionCustomerTypeNationVATCodeCustomerPosition(string customerAction, string customerType, string nation, string vatCode, int positionOnCustomerMasterGrid)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            Selenium.Click(GenericElementsPage.RadioButton(customerAction), 30);
            CustomerMasterStepHelpers.AddNewCustomerMaster(customerType, nation, vatCode, null, null, positionOnCustomerMasterGrid);
            Selenium.Click(PopupGenericElements.PopupOkButton("Customer"));
        }

    }
}
