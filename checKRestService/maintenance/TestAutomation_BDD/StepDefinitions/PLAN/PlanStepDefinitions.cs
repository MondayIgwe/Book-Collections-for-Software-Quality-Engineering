using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.IBP.IBPDocuments;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Support.Selenium;
using NUnit.Framework;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Threading;
using TechTalk.SpecFlow;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class PlanStepDefinitions : SeleniumStepDefinition
    {
        public PlanStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user selects a section '([^']*)' in IBP Summary Tab")]
        public void WhenTheUserSelectsASectionInIBPSummaryTab(string tab)
        {
            Selenium.Click(SummaryPage.SelectSection(tab));
        }

        [When(@"the user changes the filter on Filter Name: '([^']*)' to Filter Value: '([^']*)' and filters with User Code: '([^']*)', Filter Type: '([^']*)' in the IBP Shell Tab")]
        public void WhenTheUserChangesTheFilterOnFilterNameToFilterValueAndFiltersWithUserCodeFilterTypeInTheIBPShellTab(string filterName, string filterValue, string userCode, string like)
        {
            int count = 0;

            while (Selenium.GetAttribute(AGGrid.AggridFiterText(filterName.ToUpper()), "value").Equals(""))
            {
                if (count == 3)
                {
                    break;
                }
                count++;
            }

            Selenium.FluentWaitElementToBeNotPresentInDOM(GenericElementsPage.TextContaining("Data Source is loading, please wait!"));
            Selenium.ValidateElementDisplayed(Selenium.GetAbstractedBy("Clear " + filterName, new object[] { filterName.ToUpper() }), 30);
            Selenium.ClickJavaScript(Selenium.GetAbstractedBy("Clear " + filterName, new object[] { filterName.ToUpper() }), 10);
            Selenium.ClickJavaScript(Selenium.GetAbstractedBy(filterName + " Dropdown", new object[] { filterName.ToUpper() }));

            string[] filters = filterValue.Split(',');
            foreach (string filter in filters)
            {
                int counter = 0;
                while (!Selenium.ValidateElementDisplayed(CustomerShellPage.SelectUserCode(filter), 5) && counter < 10)
                {
                    Selenium.Click(CustomerShellPage.CancelButton);
                    Thread.Sleep(500);
                    counter++;
                    Selenium.ClickJavaScript(Selenium.GetAbstractedBy("Clear " + filterName, new object[] { filterName.ToUpper() }));
                    Selenium.ClickJavaScript(Selenium.GetAbstractedBy(filterName + " Dropdown", new object[] { filterName.ToUpper() }));

                    Thread.Sleep(1000);
                    Selenium.ClickJavaScript(BasicGrid.Filter(userCode));
                    Selenium.ClearByKeys(GridPopups.Field(like));
                    Selenium.SendKeys(GridPopups.Field(like), filterValue);
                    Selenium.Click(PopupGenericElements.PopupOkButton("Column:" + userCode));
                }

                
                if (Selenium.ValidateElementDisplayed(CustomerShellPage.UserCodePopUpCheckboxHeader))
                     Selenium.Click(CustomerShellPage.UserCodePopUpCheckboxHeader);

                if(Selenium.WaitForElementToBePresent(CustomerShellPage.UserCodeCheckbox(filter)))
                { 
                    Assert.That(Selenium.ValidateElementDisplayed(CustomerShellPage.UserCodeCheckbox(filter)), $"Failed to validate that the User Code {filter} checkbox element is selected as expected");
                }
                else
                {
                    Selenium.ScrollToElement(CustomerShellPage.SelectUserCode(filter));
                    Selenium.Click(CustomerShellPage.SelectUserCode(filter));
                    Thread.Sleep(1000);
                }
            }
            Selenium.Click(CustomerShellPage.OkButton);
        }


        [Then(@"the user validates that the Aggrid Grid has the Top Column Header '([^']*)' in IBP")]
        public void ThenTheUserValidatesThatTheAggridGridHasTheTopColumnHeaderInIBP(string aggridColHeader)
        {
            var element = Selenium.FindOne(CustomerShellPage.AGLabelColumnHeader(aggridColHeader));
            Assert.That(element.Text.Equals(aggridColHeader), "Failed to validate column header");
        }

        [When(@"the user enters '([^']*)' into the Aggrid context '([^']*)' pop up menu")]
        public void WhenTheUserEntersIntoTheAggridContextPopUpMenu(string aggridValue, string aggridField)
        {
            Selenium.ClearByKeys(Selenium.GetAbstractedBy("Aggrid Pop Up Value Field", new object[] { aggridField }));
            Selenium.SendKeys(AGGrid.AggridPopUpValueField(aggridField), aggridValue);
            Selenium.Click(CustomerShellPage.OkButton, 15);
            Selenium.ValidateElementDisplayed(AGGrid.Locator, 30);
        }

        [Then(@"the user validates that the Aggrid Table with the value '([^']*)' is displayed in IBP")]
        public void ThenTheUserValidatesThatTheAggridTableWithTheValueIsDisplayedInIBP(string aggridValue)
        {
            Assert.True(Selenium.ValidateElementDisplayed(AGGrid.RowSelect(aggridValue)), "Failed to find the given row in the table");
        }

        [Then(@"the user validates that the Aggrid Table with the value '([^']*)' is not displayed in IBP")]
        public void ThenTheUserValidatesThatTheAggridTableWithTheValueIsNotDisplayedInIBP(string aggridValue)
        {
            var elements = Selenium.Find(AGGrid.RowSelect(aggridValue));
            Assert.That(elements.Count.Equals(0), "An element was unexpectedly found at the given row id - " + aggridValue);
        }

        [When(@"the user enters the text '(.*)' on the Aggrid Grid table")]
        public void ThenTheUserEntersTheTextOnTheAggridGridTable(string AGridInputValue)
        {
            Selenium.SendKeys(AGGrid.AGGridInputField, AGridInputValue + Keys.Enter);
        }

    }
}
