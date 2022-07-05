using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Support.Helpers;
using Kantar_BDD.Pages.SFA.Containers;
using NUnit.Framework;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TechTalk.SpecFlow;
using Kantar_BDD.Pages.Toolbar;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class SFAStepDefinition : SeleniumStepDefinition
    {
        public SFAStepDefinition(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user creates a new assortment Type: '(.*)', Customer: '(.*)', Start: '(.*)', End: '(.*)'")]
        public void WhenTheUserCreatesANewAssortmentTypeCustomerStartEnd(string Type, string CustomerNode, string StartDate, string EndDate)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            AssortmentStepHelpers.PopulateNewAssortmentPopUp(Type, CustomerNode, StartDate, EndDate);
        }

        [When(@"the user creates a new assortment of Type: '(.*)', Customer: '(.*)', Start: '(.*)', End: '(.*)', Description: '(.*)', Status: '(.*)', Save: '(.*)'")]
        public void WhenTheUserCreatesANewAssortmentTypeCustomerStartEndDescriptionStatusSave(string Type, string CustomerNode, string StartDate, string EndDate, string Description, string Status, string YesOrNo)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            AssortmentStepHelpers.PopulateNewAssortmentPopUp(Type, CustomerNode, StartDate, EndDate);
            AssortmentStepHelpers.PopulateGeneralInfoTabAndSave(Description, Status, YesOrNo);
        }

        [When(@"the user creates a new assortment of Type: '([^']*)', Assortment Type: '([^']*)', Customer Level: '([^']*)', Customer: '([^']*)', Description: '([^']*)', Save: '([^']*)'")]
        public void WhenWhenTheUserCreatesANewAssortmentOfTypeAssortmentTypeCustomerLevelCustomerDescriptionSave(string type, string assortmentTypeProductLine, string customerLevel, string customerCode, string assortmentDescription, string yesOrNo)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            AssortmentStepHelpers.PopulateNewAssortmentPopUp(type, customerCode, null, null, assortmentTypeProductLine, customerLevel);
            AssortmentStepHelpers.PopulateGeneralInfoTabAndSave(assortmentDescription, null, yesOrNo);
        }

        [When(@"the user creates a new assortment of Type: '([^']*)', Assortment Type: '([^']*)', Customer Level: '([^']*)', Customer Description: '([^']*)', Customer: '([^']*)', Start Date: '([^']*)', End Date: '([^']*)',Description: '([^']*)'")]
        public void WhenWhenTheUserCreatesANewAssortmentOfTypeAssortmentTypeCustomerLevelCustomerDescriptionCustomerDescription(string type, string assortmentTypeProductLine, string customerLevel, string customerDescription, string customerCode, string StartDate, string EndDate, string assortmentDescription)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            AssortmentStepHelpers.PopulateNewAssortmentPopUp(type, customerCode, StartDate, EndDate, assortmentTypeProductLine, customerLevel, customerDescription);
            AssortmentStepHelpers.PopulateGeneralInfoTabAndSave(assortmentDescription, null, null);
        }

        [When(@"the user creates a new assortment of Type: '([^']*)', Customer Level: '([^']*)', Customer: '([^']*)', Start Date: '([^']*)', End Date: '([^']*)', Description: '([^']*)'")]
        public void WhenTheUserCreatesANewAssortmentOfTypeCustomerLevelCustomerStartDateEndDateDescription(string assortmentType, string customerLevel, string customerCode, string startDate, string endDate, string assortmentDescription)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            AssortmentStepHelpers.PopulateNewAssortmentPopUp(assortmentType, customerCode, startDate, endDate, null, customerLevel);
            AssortmentStepHelpers.PopulateGeneralInfoTabAndSave(assortmentDescription, null, null);
        }

        [When(@"the user adds a new list where Type: '([^']*)', Customer Type: '([^']*)', List Code: '([^']*)', Customer Level: '([^']*)', Customer Description: '([^']*)', List Description: '([^']*)'")]
        public void WhenTheUserAddsANewPriceListWhereTypeCustomerTypeListCodeCustomerLevelCustomerDescriptionListDescriptionStartEnd(string priceListType, string customerCode, string listCode1, string customerLevel, string customerDescription, string listDescription)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            SalesForceStepHelpers.PopulateNewPriceListPopUp(priceListType, listCode1, customerLevel, customerDescription, customerCode);
            SalesForceStepHelpers.PopulateGeneralInfoTabAndSave(listDescription, null, null);

        }

        [When(@"the user adds a new list where Type: '([^']*)', List Code: '([^']*)', Modified End Date: '(.*)', End Date: '([^']*)', Description: '([^']*)'")]
        public void WhenTheUserAddsANewListWhereTypeListCodeModifiedEndDateEndDateDescription(string priceListType, string listCode1, string modifiedEndDate, string endDate, string customerDescription)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            SalesForceStepHelpers.PopulateNewPriceListPopUp(priceListType, listCode1, null, null, null, modifiedEndDate, endDate);
            SalesForceStepHelpers.PopulateGeneralInfoTabAndSave(customerDescription, null, null);
        }

        [Then(@"the user validates that the customer '([^']*)' on row '([^']*)' is present")]
        public void ThenTheUserValidatesThatTheCustomerOnRowIsListedInTheGrid(string elementName, string rowNumber)
        {
            Selenium.ValidateElementDisplayed(CustomersPage.AssortmentCustomerCustomerCode(elementName, rowNumber));
        }

        [When(@"the user creates a new assortment of Type: '([^']*)', Assortment Type: '([^']*)', Customer Level: '([^']*)', Customer: '([^']*)', Start Date: '([^']*)', End Date: '([^']*)', Description: '([^']*)'")]
        public void WhenTheUserCreatesANewAssortmentOfTypeAssortmentTypeCustomerLevelCustomerStartDateEndDateDescription(string type, string assortmentTypeProductLine, string customerLevel, string customerCode, string startDate, string endDate, string description)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            AssortmentStepHelpers.PopulateNewAssortmentPopUp(type, customerCode, startDate, endDate, assortmentTypeProductLine, customerLevel);
            AssortmentStepHelpers.PopulateGeneralInfoTabAndSave(description, null, null);
        }

        [When(@"the user changes the assortment status to '([^']*)'")]
        public void WhenTheUserChangesTheAssortmentStatusTo(string status)
        {
            AssortmentStepHelpers.PopulateGeneralInfoTabAndSave(null, status, null);
        }
    }
}

