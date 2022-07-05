using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.Toolbar;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
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


        [When(@"the user creates a new fund and rules with configuration ID: '(.*)' BRCustomerLevel: '(.*)' Description: '(.*)' sellInStart: '(.*)' sellInEnd: '(.*)' productGroup: '(.*)' rateFundSource: '(.*)'")]
        public void WhenTheUserCreatesANewFundAndRules(string configurationID, string BRCustomerLevel, string Description, string sellInStart, string sellInEnd, string productGroup, string rateFundSource)
        {
            PromoStepHelpers.CreatesANewFundAndRules(configurationID, BRCustomerLevel, Description, sellInStart, sellInEnd, productGroup, rateFundSource);
        }

        [When(@"user adds a constraint MinimumDiscount: '(.*)' MaximumDiscount: '(.*)'")]
        public void WhenUserAddsAConstraint(string MinimumDiscount, string MaximumDiscount)
        {
            Selenium.Click(GuiToolbar.AddButton);
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Maximal discount"), MaximumDiscount);
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Minimal discount"), MinimumDiscount);
            Selenium.Click(PopupGenericElements.PopupOkButton("Create New Constraint"));
        }

        [When(@"user adds a ConstraintField: '(.*)' constraint with value ConstraintValue: '(.*)' startDate: '(.*)' endDate: '(.*)' familyConstraints: '(.*)'")]
        public void WhenUserAddsADynamicConstraint(string ConstraintField, string ConstraintValue, string startDate, string endDate, string familyConstraints)
        {
            Selenium.ClickUntilElementIsDisplayed(GuiToolbar.AddButton, GenericElementsPage.InputByLabelName(ConstraintField));
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
                    Selenium.Click(BasicGrid.TableCell(ProductAttribute.Rows("Product attribute 1").ByToString, intRow.ToString(), "1"));
                }
                Selenium.Click(PopupGenericElements.PopupOkButton("Product attribute 1"));
            }
            Selenium.Click(PopupGenericElements.PopupOkButton("Create New Constraint"));

        }

        [When(@"user selects products business rule with description: '(.*)'")]
        public void WhenUserSelectsProductsBusinessRule(string description)
        {
            int businessRulesIndex = 0, count = 0, columnIndex = 0;
            while (columnIndex == 0 && count < 3)
            {
                columnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductGrid.AllBusinessRulesColumnNames, "Description");
                Thread.Sleep(500);
                count++;
            }

            count = 0;
            while (businessRulesIndex == 0 && count < 3)
            {
                businessRulesIndex = GridStepHelpers.GetElementContainingTextIndex(Selenium.GetAbstractedBy("All Business Rules", new string[] { columnIndex.ToString() }), description);
                Thread.Sleep(500);
                count++;
            }
            

            Selenium.Click(ProductGrid.BusinessRuleCheckbox(businessRulesIndex.ToString()));
        }


        [Then(@"user validates products business rule is selected with description: '(.*)'")]
        public void WhenUserValidatesProductsBusinessRuleIsSelected(string description)
        {
            int businessRulesIndex = 0, count = 0, columnIndex = 0;
            while (columnIndex == 0 && count < 3)
            {
                columnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductGrid.AllBusinessRulesColumnNames, "Description");
                Thread.Sleep(500);
                count++;
            }

            count = 0;
            while (businessRulesIndex == 0 && count < 3)
            {
                businessRulesIndex = GridStepHelpers.GetElementContainingTextIndex(Selenium.GetAbstractedBy("All Business Rules", new string[] { columnIndex.ToString() }), description);
                Thread.Sleep(500);
                count++;
            }

            Assert.True(Selenium.ValidateCheckbox(ProductGrid.BusinessRuleCheckbox(businessRulesIndex.ToString())), "Failed to validate that products business rule is selected with description '" + description + "'");
        }

        [When(@"the user creates a new movement with type '(.*)' value '(.*)' reason '(.*)'")]
        public void ThenTheUserCreatesANewMovementWithTypeValueReason(string movementType, string value, string reason)
        {
            PromoStepHelpers.CreateMovement(movementType, value, reason);
        }
    }
}
