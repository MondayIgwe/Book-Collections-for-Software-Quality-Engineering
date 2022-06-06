using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.IBP.IBPDocuments;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.Promo;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using TechTalk.SpecFlow;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class FundsAndRuleStepDefinitions : SeleniumStepDefinition
    {

        public FundsAndRuleStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }


        [When(@"the user creates a new fund and rules '(.*)' '(.*)' '(.*)' '(.*)' '(.*)' '(.*)' '(.*)'")]
        public void WhenTheUserCreatesANewFundAndRules(string configurationID, string BRCustomerLevel, string Description, string sellInStart, string sellInEnd, string productGroup, string rateFundSource)
        {
            PromoStepHelpers.CreatesANewFundAndRules(configurationID, BRCustomerLevel, Description, sellInStart, sellInEnd, productGroup, rateFundSource);
        }

        [When(@"user adds a constraint '(.*)' '(.*)'")]
        public void WhenUserAddsAConstraint(string MinimumDiscount, string MaximumDiscount)
        {
            Selenium.Click(GenericElementsPage.AddButton);
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Maximal discount"), MaximumDiscount);
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Minimal discount"), MinimumDiscount);
            Selenium.Click(PopupGenericElements.PopupOkButton("Create New Constraint"));
        }

        [When(@"user adds a '(.*)' constraint with value '(.*)' '(.*)' '(.*)' '(.*)'")]
        public void WhenUserAddsADynamicConstraint(string ConstraintField, string ConstraintValue, string startDate, string endDate, string familyConstraints)
        {
            Selenium.ClickUntilElementIsDisplayed(GenericElementsPage.AddButton, GenericElementsPage.InputByLabelName(ConstraintField));
            Selenium.ClearByKeys(GenericElementsPage.InputByLabelName(ConstraintField));
            Selenium.SendKeys(GenericElementsPage.InputByLabelName(ConstraintField), ConstraintValue);
            Selenium.LooseFocusFromAnElement();

            if (!startDate.Equals(string.Empty) && !endDate.Equals(string.Empty))
            {
                StepHelpers.SelectDatePeriod(Calendar.PopupValidityPeriodStartField, CommonDates.DateParser(startDate), CommonDates.DateParser(endDate));
            }

            if (!familyConstraints.Equals(string.Empty))
            {
                Selenium.Click(GenericElementsPage.GenericDropDownTrigger("Family"));
                int intColumn = GridStepHelpers.GetColumnPosition(ProductAttribute.ColumnHeaders("Product attribute 1"), "Code 1", -1);

                var familyList = familyConstraints.Split(",");
                foreach (var family in familyList)
                {
                    int intRow = GridStepHelpers.GetRowNumber(ProductAttribute.Rows("Product attribute 1"), intColumn, family);
                    Selenium.Click(BasicGrid.ClickCell(ProductAttribute.Rows("Product attribute 1").ByToString, intRow.ToString(), "1"));
                }
                Selenium.Click(PopupGenericElements.PopupOkButton("Product attribute 1"));
            }
            Selenium.Click(PopupGenericElements.PopupOkButton("Create New Constraint"));

        }

        [When(@"user selects products business rule '(.*)'")]
        public void WhenUserSelectsProductsBusinessRule(string description)
        {
            int businessRulesIndex = 0, count = 0, columnIndex = 0;
            while (columnIndex == 0 && count < 3)
            {
                List<IWebElement> columnHeaders = Selenium.Find(ProductGrid.AllBusinessRulesColumnNames);
                columnIndex = StepHelpers.GetElementIndex(columnHeaders, "Description");
                Thread.Sleep(500);
                count++;
            }

            count = 0;
            while (businessRulesIndex == 0 && count < 3)
            {
                List<IWebElement> businessRules = Selenium.Find(Selenium.GetAbstractedBy("All Business Rules", new string[] { columnIndex.ToString() }));
                businessRulesIndex = StepHelpers.GetElementIndex(businessRules, description);
                Thread.Sleep(500);
                count++;
            }
            

            Selenium.Click(ProductGrid.BusinessRuleCheckbox(businessRulesIndex.ToString()));
        }


        [Then(@"user validates products business rule is selected '(.*)'")]
        public void WhenUserValidatesProductsBusinessRuleIsSelected(string description)
        {
            int businessRulesIndex = 0, count = 0, columnIndex = 0;
            while (columnIndex == 0 && count < 3)
            {
                List<IWebElement> columnHeaders = Selenium.Find(ProductGrid.AllBusinessRulesColumnNames);
                columnIndex = StepHelpers.GetElementIndex(columnHeaders, "Description");
                Thread.Sleep(500);
                count++;
            }

            count = 0;
            while (businessRulesIndex == 0 && count < 3)
            {
                List<IWebElement> businessRules = Selenium.Find(Selenium.GetAbstractedBy("All Business Rules", new string[] { columnIndex.ToString() }));
                businessRulesIndex = StepHelpers.GetElementIndex(businessRules, description);
                Thread.Sleep(500);
                count++;
            }

            Assert.True(Selenium.ValidateCheckbox(ProductGrid.BusinessRuleCheckbox(businessRulesIndex.ToString())));
        }

        [When(@"the user creates a new movement with type '(.*)' value '(.*)' reason '(.*)'")]
        public void ThenTheUserCreatesANewMovementWithTypeValueReason(string movementType, string value, string reason)
        {
            PromoStepHelpers.CreateMovement(movementType, value, reason);
        }



    }
}
