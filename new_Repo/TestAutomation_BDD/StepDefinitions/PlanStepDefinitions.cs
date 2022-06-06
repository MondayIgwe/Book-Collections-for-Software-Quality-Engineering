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

        [When(@"the user changes the filter on '(.*)' to '(.*)' and filters with '(.*)', '(.*)' in the IBP Shell Tab")]
        public void WhenTheUserChangesTheFilterOnToAndFiltersWithInTheIBPShellTab(string filterName, string filterValue, string userCode, string filtervalue)
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

            Selenium.ValidateEnabledAndDisplayed(Selenium.GetAbstractedBy("Clear " + filterName, new object[] { filterName.ToUpper() }), 30);
            Selenium.ClickJavaScript(Selenium.GetAbstractedBy("Clear " + filterName, new object[] { filterName.ToUpper() }), 10);
            Selenium.ClickJavaScript(Selenium.GetAbstractedBy(filterName + " Dropdown", new object[] { filterName.ToUpper() }));

            string[] filters = filterValue.Split(',');
            foreach (string filter in filters)
            {
                int counter = 0;
                while (!Selenium.ValidateEnabledAndDisplayed(CustomerShellPage.SelectUserCode(filter), 5) && counter < 10)
                {

                    Selenium.Click(CustomerShellPage.CancelButton);
                    Thread.Sleep(500);
                    counter++;
                    Selenium.ClickJavaScript(Selenium.GetAbstractedBy("Clear " + filterName, new object[] { filterName.ToUpper() }));
                    Selenium.ClickJavaScript(Selenium.GetAbstractedBy(filterName + " Dropdown", new object[] { filterName.ToUpper() }));

                    Thread.Sleep(1000);
                    Selenium.ClickJavaScript(BasicGrid.Filter(userCode));
                    Selenium.ClearByKeys(GridPopups.Field(filtervalue));
                    Selenium.SendKeys(GridPopups.Field(filtervalue), filterValue);
                    Selenium.Click(PopupGenericElements.PopupOkButton("Column:" + userCode));
                }

                Selenium.ScrollToElement(CustomerShellPage.SelectUserCode(filter));
                Selenium.Click(CustomerShellPage.SelectUserCode(filter));
                Thread.Sleep(1000);
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
            Selenium.ValidateEnabledAndDisplayed(AGGrid.Locator, 30);
        }

        [Then(@"the user changes the filter on '([^']*)' to '([^']*)' in the IBP Shell Tab")]
        public void ThenTheUserChangesTheFilterOnToInTheIBPShellTab(string p0, string p1)
        {
            throw new PendingStepException();
        }

        [Then(@"the user validates that the Aggrid Table with the value '([^']*)' is displayed in IBP")]
        public void ThenTheUserValidatesThatTheAggridTableWithTheValueIsDisplayedInIBP(string aggridValue)
        {
            Assert.True(Selenium.ValidateEnabledAndDisplayed(AGGrid.RowSelect(aggridValue)), "Failed to find the given row in the table");
        }

        [Then(@"the user validates that the Aggrid Table with the value '([^']*)' is not displayed in IBP")]
        public void ThenTheUserValidatesThatTheAggridTableWithTheValueIsNotDisplayedInIBP(string aggridValue)
        {
            var elements = Selenium.Find(AGGrid.RowSelect(aggridValue));
            Assert.That(elements.Count.Equals(0), "An element was unexpectedly found at the given row id - " + aggridValue);
        }

        [When(@"the user selects the cell '(.*)' in '(.*)'")]
        public void WhenTheUserSelectsTheCellIn(string aggCell, string agridName)
        {
            string[] aggCells = aggCell.Split(",");

            for(int i = 0; i < aggCells.Length; i++)
            {
                Selenium.ValidateEnabledAndDisplayed(AGGrid.AggridGridName(agridName), 30);   
                var ele = Selenium.FindOne(AGGrid.AggridColumn(aggCells[i]));
                 if (ele.Text.Contains(aggCells[i]))
                    {
                        Selenium.Click(AGGrid.AggridCellField);
                    return;
                    }
            }  
        }

        [When(@"the user enters the text '(.*)' on the Aggrid Grid table")]
        public void ThenTheUserEntersTheTextOnTheAggridGridTable(string AGridInputValue)
        {
            Selenium.SendKeys(AGGrid.AGGridInputField, AGridInputValue + Keys.Enter);
        }

    }
}
