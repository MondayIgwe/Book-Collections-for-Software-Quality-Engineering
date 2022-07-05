using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.ReferenceDocs.FieldExamples;
using Kantar_BDD.Pages.Toolbar;
using TechTalk.SpecFlow;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class ReferenceDocsStepDefinitions : SeleniumStepDefinition
    {
        public ReferenceDocsStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user creates a Reference doc with Date 1: '(.*)'  Date 2: '(.*)' Textbox: '(.*)' Combo: '(.*)' DatePicker: '(.*)' Force Uppercase On Validation: '(.*)'")]
        public void WhenTheUserCreatesARefDoc(string date1, string date2, string textboxValue, string comboValue, string datePickerValue, string forceUpperCaseValidationVal)
        {
                Selenium.Click(GuiToolbar.AddButton);
                Selenium.Click(RefDocDetailPopup.Date1CalendarIcon);
                if (date1.ToLower().Equals("today"))
                    Selenium.Click(Calendar.TodayButton);
                else
                    StepHelpers.SelectDate(date1);

                Selenium.Click(RefDocDetailPopup.Date2CalendarIcon);
                if (date2.ToLower().Equals("today"))
                    Selenium.Click(Calendar.TodayButton);
                else
                    StepHelpers.SelectDate(date2);

                Selenium.Click(GenericElementsPage.OkButton);
                Selenium.Click(TopTabs.TransactionalDataTopTab);
                string toSave = Selenium.GetText(TransactionalData.ProgressiveNumericBox).Split('.')[0];
                SaveValue("ProgressiveValue", toSave);
                Selenium.Click(SideTabs.RefDocsFieldExamplesTab);
                Selenium.SendKeys(AvailableFields.TextboxTextbox, textboxValue);
                Selenium.SendKeys(AvailableFields.ComboTextbox, comboValue);
                Selenium.Click(AvailableFields.AvailableFieldsDatePickerCalendarTrigger);
                if (datePickerValue.ToLower().Equals("today"))
                    Selenium.Click(Calendar.TodayButton);
                else
                    StepHelpers.SelectDate(datePickerValue);

                Selenium.Click(TopTabs.FieldValidationTopTab);
                Selenium.SendKeys(FieldValidation.ForceUppercaseOnvalidationTextbox, forceUpperCaseValidationVal);
                Selenium.Click(GuiToolbar.SaveButton);
                Selenium.Click(TopToolbar.BackButton);
        }
    }
}
