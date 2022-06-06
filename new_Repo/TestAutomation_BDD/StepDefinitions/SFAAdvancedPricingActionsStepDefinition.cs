using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.SFA.Containers;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TechTalk.SpecFlow;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class SFAAdvancedPricingActionsStepDefinition : SeleniumStepDefinition
    {
        public SFAAdvancedPricingActionsStepDefinition(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user clicks on the hierarchical node with the value '([^']*)'")]
        public void WhenTheUserClicksOnTheHierarchicalNodeWithTheValue(string node)
        {
            Selenium.Click(BenefitsTab.Node(node), 30);
        }

        [When(@"the user clicks on the hierarchical node with the value '([^']*)' -> '([^']*)'")]
        public void WhenTheUserClicksOnTheHierarchicalNodeWithTheValue_(string parentNode, string childNode)
        {
            Selenium.Click(BenefitsTab.Node(parentNode, childNode), 30);
        }

        [Then(@"the user validates that the hierarchical node with value '([^']*)' -> '([^']*)' -> '([^']*)' is visible")]
        public void ThenTheUserValidatesThatTheHierarchicalNodeWithValue__IsVisible(string grandParent, string parentNode, string childNode)
        {
            Selenium.FluentWaitElementToBePresent(BenefitsTab.Node(grandParent, parentNode, childNode));
            Assert.That(Selenium.Find(BenefitsTab.Node(grandParent, parentNode, childNode)).Count > 0, "Hierarchical node with value '"+ grandParent + " -> " + parentNode + " -> " + childNode + "' did not qualify as being present.");
        }

        [When(@"the user adds a new Advanced Pricing Action with Advanced Pricing Book: '([^']*)', Application Type: '([^']*)', Valorization Type: '([^']*)'")]
        public void WhenTheUserAddsANewAdvancedProcingActionWithAdvancedPricingBookApplicationTypeValorizationType(string advancedPricingBook, string applicationType, string valorizationType)
        {
            Selenium.Click(GenericElementsPage.AddButton, 30);
            AdvancedPricingActionsStepHelpers.PopulateAdvancedPricingActionsPopUp(null, advancedPricingBook, false, applicationType, valorizationType);
            Selenium.Click(PopupGenericElements.PopupOkButton("New Advanced Pricing Action"));
            ScenarioContext.Add("AdvancedPricingActionCode", AdvancedPricingActionsStepHelpers.AdvancedPricingActionsCode);
        }

        [When(@"the user populates the '([^']*)' tab where '([^']*)' input field: '([^']*)', '([^']*)' input field: '([^']*)', '([^']*)' input field: '([^']*)'")]
        public void WhenTheUserPopulatesTheTabWhereInputFieldInputFieldInputField(string tab, string fieldOne, string fieldOneText, string fieldTwo, string fieldTwoText, string fieldThree, string fieldThreeText)
        {
            Selenium.Click(GenericElementsPage.SidePanelTab(tab), 30);

            Selenium.Click(GenericElementsPage.InputByLabelName(fieldOne), 30);
            Selenium.ClearByKeys(GenericElementsPage.InputByLabelName(fieldOne));
            Selenium.EnterTextByKeys(GenericElementsPage.InputByLabelName(fieldOne), fieldOneText);
            Selenium.LooseFocusFromAnElement();

            Selenium.Click(GenericElementsPage.InputByLabelName(fieldTwo), 30);
            Selenium.ClearByKeys(GenericElementsPage.InputByLabelName(fieldTwo));
            Selenium.EnterTextByKeys(GenericElementsPage.InputByLabelName(fieldTwo), fieldTwoText);
            Selenium.LooseFocusFromAnElement();

            Selenium.Click(GenericElementsPage.InputByLabelName(fieldThree), 30);
            Selenium.ClearByKeys(GenericElementsPage.InputByLabelName(fieldThree));
            Selenium.EnterTextByKeys(GenericElementsPage.InputByLabelName(fieldThree), fieldThreeText);
            Selenium.LooseFocusFromAnElement();
        }

        [When(@"the user populates the '([^']*)' tab where '([^']*)' input field: '([^']*)', '([^']*)' input field: '([^']*)'")]
        public void WhenTheUserPopulatesTheTabWhereInputFieldInputFieldInputField(string tab, string fieldOne, string fieldOneText, string fieldTwo, string fieldTwoText)
        {
            Selenium.Click(GenericElementsPage.SidePanelTab(tab), 30);

            Selenium.Click(GenericElementsPage.InputByLabelName(fieldOne), 30);
            Selenium.ClearByKeys(GenericElementsPage.InputByLabelName(fieldOne));
            Selenium.EnterTextByKeys(GenericElementsPage.InputByLabelName(fieldOne), fieldOneText);
            Selenium.LooseFocusFromAnElement();

            Selenium.Click(GenericElementsPage.InputByLabelName(fieldTwo), 30);
            Selenium.ClearByKeys(GenericElementsPage.InputByLabelName(fieldTwo));
            Selenium.EnterTextByKeys(GenericElementsPage.InputByLabelName(fieldTwo), fieldTwoText);
            Selenium.LooseFocusFromAnElement();
        }

        [When(@"the user adds a new Advanced Pricing Action with Code: '([^']*)', Advanced Pricing Book: '([^']*)', Application Type: '([^']*)', Valorization Type: '([^']*)'")]
        public void WhenTheUserAddsANewAdvancedPricingActionWithCodeAdvancedPricingBookApplicationTypeValorizationType(string code, string advancedPricingBook, string applicationType, string valorizationType)
        {
            Selenium.Click(GenericElementsPage.AddButton, 30);
            AdvancedPricingActionsStepHelpers.PopulateAdvancedPricingActionsPopUp(code, advancedPricingBook, false, applicationType, valorizationType);
            Selenium.Click(PopupGenericElements.PopupOkButton("New Advanced Pricing Action"));
        }

        [When(@"the user adds a new Advanced Pricing Action with Code: '([^']*)', Advanced Pricing Book: '([^']*)', Target Discount: '([^']*)', Application Type: '([^']*)', Valorization Type: '([^']*)'")]
        public void WhenTheUserAddsANewAdvancedPricingActionWithCodeAdvancedPricingBookTargetDiscountApplicationTypeValorizationType(string code, string advancedPricingBook, string yesOrNo, string applicationType, string valorizationType)
        {
            Selenium.Click(GenericElementsPage.AddButton, 30);
            AdvancedPricingActionsStepHelpers.PopulateAdvancedPricingActionsPopUp(code, advancedPricingBook, yesOrNo.Trim().ToLower().Equals("yes") , applicationType, valorizationType);
            Selenium.Click(PopupGenericElements.PopupOkButton("New Advanced Pricing Action"));
        }

        [Then(@"the user validates that the hierarchical node with the value '([^']*)' is visible")]
        public void ThenTheUserValidatesThatTheHierarchicalNodeWithTheValueIsVisible(string node)
        {
            Selenium.FluentWaitElementToBePresent(BenefitsTab.Node(node));
            Assert.That(Selenium.Find(BenefitsTab.Node(node)).Count > 0, "Hierarchical node with value '" + node + "' did not qualify as being present.");
        }

        [Then(@"the user validates that the hierarchical node with value '([^']*)' -> '([^']*)' is visible")]
        public void ThenTheUserValidatesThatTheHierarchicalNodeWithValue_IsVisible(string parentNode, string childNode)
        {
            Selenium.FluentWaitElementToBePresent(BenefitsTab.Node(parentNode, childNode));
            Assert.That(Selenium.Find(BenefitsTab.Node(parentNode, childNode)).Count > 0, "Hierarchical node with value '" + parentNode + " -> " + childNode + "' did not qualify as being present.");
        }

        [When(@"the user clicks on the hierarchical node with the value '([^']*)' -> '([^']*)' -> '([^']*)'")]
        public void WhenTheUserClicksOnTheHierarchicalNodeWithTheValue__(string grandParent, string parentNode, string childNode)
        {
            Selenium.Click(BenefitsTab.Node(grandParent, parentNode, childNode), 30);
        }
    }
}
