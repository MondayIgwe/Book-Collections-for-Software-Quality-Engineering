using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.Toolbar;
using Kantar_BDD.Pages.TTC;
using Kantar_BDD.Support.Helpers;
using System.Threading;
using TechTalk.SpecFlow;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    class SaStepDefinitions : SeleniumStepDefinition
    {
        public SaStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user creates a New Claim with Document Type: '(.*)' Document Number: '(.*)' Level: '(.*)' Customer: '(.*)' Amount: '(.*)'")]
        public void WhenTheUserCreatesANewClaim(string docType, string docNumber, string level, string customer, string amount)
        {
            Selenium.Click(GuiToolbar.AddButton);
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Document Type"), docType);
            Selenium.SendKeys(ClaimsPage.CustomerDocumentNrTextField, docNumber);
            Selenium.Click(ClaimsPage.CustomerSelectorOpenTriggerIcon);
            Selenium.Click(GenericElementsPage.HierLevel(level));
            StepHelpers.FilterGrid("Customer code", "Like", customer);
            Selenium.Click(BasicGrid.TextInGrid(customer));
            Selenium.Click(PopupGenericElements.PopupOkButton("New Customer"));
            Selenium.Click(Calendar.DocumentDateCalendarIcon);
            Selenium.Click(Calendar.TodayButton);
            Selenium.SendKeys(ClaimsPage.AmountTextbox, amount);
            Selenium.Click(ClaimsPage.CustomerDocumentNrTextField);
            Selenium.Click(PopupGenericElements.PopupOkButton("New Claim"));
        }

        [When(@"the user creates a New Document with Level: '(.*)' Customer: '(.*)' Agreement Code: '(.*)' Agreement Description: '(.*)'")]
        public void WhenTheUserCreatesANewDocument(string level, string customer, string agreementCode, string agreementDescription)
        {
            Selenium.Click(GuiToolbar.AddButton);
            Selenium.Click(GenericElementsPage.TriggerByFieldName("Customer Holder"));
            Selenium.Click(GenericElementsPage.HierLevel(level));
            StepHelpers.FilterGrid("Customer code", "Like", customer);
            Selenium.Click(BasicGrid.TextInGrid(customer));
            Selenium.Click(PopupGenericElements.PopupOkButton("Customer Plan"));
            Selenium.FluentWaitElementToBeNotPresentInDOM(Selenium.GetAbstractedBy("Popup Ok Button", new string[] { "Customer Plan" }));
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Agreement Description"), agreementDescription);
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Agreement Code"), agreementCode);
            Selenium.Click(PopupGenericElements.PopupOkButton("New Agreement"));
        }

        [When(@"the user checks that grid row is selected and clicks Mass copy '(.*)'")]
        public void WhenTheUserChecksthatGridRowIsSelectedAndClicksMassCopy(string textOnGrid)
        {
            textOnGrid = GetValue(textOnGrid);
            if (!Selenium.WaitForElementToBePresent(BasicGrid.checkedRowCheckBoxContaining(textOnGrid)))
            {
                Selenium.Click(BasicGrid.GridCheckBox(textOnGrid));

                if (!Selenium.WaitForElementToBePresent(BasicGrid.checkedRowCheckBoxContaining(textOnGrid)))
                {
                    Selenium.Click(GenericElementsPage.ElementBySM1ID("ACTION_MASSCOPY"));
                }
                else
                {
                    Selenium.Click(GenericElementsPage.ElementBySM1ID("ACTION_MASSCOPY"));
                }
            }
            else
            {
                Selenium.Click(GenericElementsPage.ElementBySM1ID("ACTION_MASSCOPY"));
            }
            Thread.Sleep(1000);
        }
        [When(@"the user creates a Rebate with Level: '(.*)' Customer: '(.*)' Classification: '(.*)' Reason: '(.*)' Target Type: '(.*)'")]
        public void WhenTheUserCreatesARebate(string level, string customer, string Classification, string Reason, string TargetType)
        {
            Selenium.Click(GuiToolbar.AddButton);
            Selenium.Click(Rebates.CustomerHolderIcon);
            Selenium.Click(GenericElementsPage.HierLevel(level));
            StepHelpers.FilterGrid("Customer code", "Like", customer);
            Selenium.Click(BasicGrid.TextInGrid(customer));
            Selenium.Click(PopupGenericElements.PopupOkButton("Customer Holder"));
            Selenium.SelectValueFromDropDownList(Classification, "Classification");
            Selenium.SelectValueFromDropDownList(Reason, "Reason");
            Selenium.SendKeys(Selenium.GetAbstractedBy("Input By Label Name", new string[] { "Target Type" }), TargetType);
            Selenium.Click(Selenium.GetAbstractedBy("Input By Label Name", new string[] { "Reason" }));
            Selenium.Click(PopupGenericElements.PopupOkButton("New Rebate"));
        }

        [When(@"the user populates the Rebate mandatory fields with Data Source: '(.*)' Payment Mode: '(.*)' Payment Frequency: '(.*)'")]
        public void WhenTheUserPopulatesRebateMandatoryFields(string DataSource, string PaymentMode, string PaymentFrequency)
        {
            Selenium.SelectValueFromDropDownList(DataSource, "Data source");
            Selenium.SelectValueFromDropDownList(PaymentMode, "Payment mode");
            Selenium.SelectValueFromDropDownList(PaymentFrequency, "Payment Frequency");
            Selenium.Click(Selenium.GetAbstractedBy("Input By Label Name", new string[] { "DESCRIPTION" }));
        }   

        [When(@"the user populates the New Rebate Details Classification: '(.*)' Reason: '(.*)' Target Type: '(.*)' Payment Mode: '(.*)' Calculation Basis: '(.*)' Description: '(.*)'")]
        public void WhenTheUserPopulatesNewRebateDetails(string classification, string reason, string targetType, string paymentMode, string calculationBasis, string description)
        {
            Selenium.Click(GenericElementsPage.SubTabAddBUtton("Rebate Header"));
            Selenium.SelectValueFromDropDownList(classification, "Classification");
            Selenium.SelectValueFromDropDownList(reason, "Reason");
            Selenium.SendKeys(Selenium.GetAbstractedBy("Input By Label Name", new string[] { "Target Type" }), targetType);
            Selenium.SelectValueFromDropDownList(paymentMode, "Payment Mode");
            Selenium.SendKeys(Selenium.GetAbstractedBy("Input By Label Name", new string[] { "Calculation Basis" }), calculationBasis);
            Selenium.SendKeys(Selenium.GetAbstractedBy("Input By Label Name", new string[] { "Description" }), description);
            Selenium.LooseFocusFromAnElementByClickingAwayFromElement();
        }

        [When(@"the user populates the Rebate Details Payment Mode: '(.*)' Data Source: '(.*)' Description: '(.*)'")]
        public void WhenTheUserPopulatesRebateDetails(string paymentMode, string calculationBasis, string description)
        {
            Selenium.SelectValueFromDropDownList(paymentMode, "Payment mode");
            Selenium.SendKeys(GenericElementsPage.SectionInputByLabelName("Calculation Basis", "Data source"), calculationBasis);
            Selenium.SendKeys(Selenium.GetAbstractedBy("Input By Label Name", new string[] { "DESCRIPTION" }), description);
            Selenium.LooseFocusFromAnElementByClickingAwayFromElement();
        }

        [When(@"user creates a new balance with Customer Level: '(.*)' Customer: '(.*)' Balance Year: '(.*)' Supplier: '(.*)'")]
        public void WhenUserCreatesANewBalance(string customerLevel, string customer, string balanceYear, string supplier)
        {
            SAStepHelpers.CreateABalance(customerLevel, customer, balanceYear);
        }
    }
}
