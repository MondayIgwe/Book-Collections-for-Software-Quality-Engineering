using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.IBP.IBPDocuments;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.Promo;
using Kantar_BDD.Pages.ReferenceDocs.FieldExamples;
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
    public class FRMStepDefinitions : SeleniumStepDefinition
    {
        public FRMStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user creates a Reference doc '(.*)' '(.*)' '(.*)' '(.*)' '(.*)' '(.*)'")]
        public void WhenTheUserCreatesARefDoc(string date1, string date2, string textboxValue, string comboValue, string datePickerValue, string forceUpperCaseValidationVal)
        {
            Selenium.Click(GenericElementsPage.AddButton);
            Selenium.Click(RefDocDetailPopup.Date1CalendarIcon);
            if (date1.ToLower().Equals("today"))
                Selenium.Click(GenericElementsPage.CalendarTodayButton);
            else
                StepHelpers.SelectDate(date1);

            Selenium.Click(RefDocDetailPopup.Date2CalendarIcon);
            if (date2.ToLower().Equals("today"))
                Selenium.Click(GenericElementsPage.CalendarTodayButton);
            else
                StepHelpers.SelectDate(date2);

            Selenium.Click(GenericElementsPage.OkButton);
            Selenium.Click(GenericElementsPage.HorizontalPanelTab("Transactional Data"));
            string toSave = Selenium.GetText(Selenium.GetAbstractedBy("Progressive Field")).Split('.')[0];
            ScenarioContext.Add("ProgressiveValue", toSave);
            Selenium.Click(GenericElementsPage.SidePanelTab("Field Examples"));
            Selenium.SendKeys(AvailableFields.TextboxField, textboxValue);
            Selenium.SendKeys(AvailableFields.ComboField, comboValue);
            Selenium.Click(AvailableFields.DatePickerCalendarIcon);
            if (datePickerValue.ToLower().Equals("today"))
                Selenium.Click(GenericElementsPage.CalendarTodayButton);
            else
                StepHelpers.SelectDate(datePickerValue);

            Selenium.Click(GenericElementsPage.HorizontalPanelTab("Field Validation"));
            Selenium.SendKeys(FieldValidation.ForceOnUpperCaseValidationField, forceUpperCaseValidationVal);
            Selenium.Click(NavigationMenu.SaveButton);
            Selenium.Click(NavigationMenu.ToolbarHomeCloseButton);
        }
    }
}
