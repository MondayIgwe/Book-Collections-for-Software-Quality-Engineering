using Kantar_BDD.Pages;
using System.Threading;
using TechTalk.SpecFlow;
using Kantar_BDD.Support.Utils;

namespace Kantar_BDD.StepDefinitions.Common
{
    [Binding]
    public class CalendarDateStepDefinitions : SeleniumStepDefinition
    {
        private int PageLoadTimeout { get; set; } = 300;

        public CalendarDateStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user selects validity period from: '(.*)' to: '(.*)' on the '(.*)' field")]
        public void WhenTheUserSelectsValidityPeriodOnTheField(string startDate, string endDate, string elementName)
        {
            startDate = CommonDates.DateParser(startDate);
            endDate = CommonDates.DateParser(endDate);
            int count = 0;
            while (!StepHelpers.ValidateDateField(GenericElementsPage.Sm1IdAttributeOfField(Selenium.GetAbstractedBy(elementName).ByToString), startDate, endDate) && count < 5)
            {
                count++;
                StepHelpers.SelectDatePeriod(Selenium.GetAbstractedBy(elementName), startDate, endDate);
                Thread.Sleep(1000);
            }
        }

        [When(@"the user selects a date '([^']*)' in the date field '([^']*)' with value '([^']*)'")]
        public void WhenTheUserSeledtsADateInTheDateFieldWithValue(string date, string elementName, string elementValue)
        {
            date = CommonDates.DateParser(date);
            Selenium.Click(Selenium.GetAbstractedBy(elementName, new object[] { elementValue }));
            StepHelpers.SelectDate(date, false);
            Thread.Sleep(1000);
        }
    }
}