using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Support.Selenium;
using NUnit.Framework;
using System;
using System.Reflection;
using System.Threading;
using TechTalk.SpecFlow;
using Kantar_BDD.Support.Utils;
using System.Linq;
using OpenQA.Selenium;
using Kantar_BDD.Pages.Grids;
using System.Collections.Generic;
using System.Globalization;
using Kantar_BDD.Pages.TTC;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class FeatureStepDefinitions : SeleniumStepDefinition
    {
        private int PageLoadTimeout { get; set; } = 300;
        ScenarioContext scenarionContext;
        private string DateTime { get; set; }

        public FeatureStepDefinitions(ScenarioContext scenarioContext) : base(scenarioContext)
        {
            this.ScenarioContext = scenarioContext;
        }

        [Given(@"the user navigates to the '(.*)' page under division'(.*)'")]
        [When(@"the user navigates to the '(.*)' page under division'(.*)'")]
        [Given(@"the user navigates to the '(.*)' page under division '(.*)'")]
        [When(@"the user navigates to the '(.*)' page under division '(.*)'")]
        public void GivenTheUserNavigatesToThePageUnderDivision(string page, string division)
        {
            int counter = 0;
            while (!Selenium.ValidateEnabledAndDisplayed(NavigationMenu.MenuButton, PageLoadTimeout) && counter < 180)
            {
                Thread.Sleep(1000);
                counter++;
            }
            Selenium.ClickUntilElementIsDisplayed(NavigationMenu.MenuButton, NavigationMenu.ViewCompleteMenuButton);
            Selenium.Click(NavigationMenu.ViewCompleteMenuButton);
            Selenium.SendKeys(NavigationMenu.MenuSearchBar, page);
            Selenium.Click(NavigationMenu.SelectedPage(division, page));
        }

        [Given(@"the user navigates to the '([^']*)' page")]
        [When(@"the user navigates to the '([^']*)' page")]
        public void GivenTheUserNavigateToThePage(string page)
        {
            int counter = 0;
            while (!Selenium.ValidateEnabledAndDisplayed(NavigationMenu.MenuButton, PageLoadTimeout) && counter < 180)
            {
                Thread.Sleep(1000);
                counter++;
            }
            Selenium.ClickUntilElementIsDisplayed(NavigationMenu.MenuButton, NavigationMenu.ViewCompleteMenuButton);
            Selenium.Click(NavigationMenu.ViewCompleteMenuButton);
            Selenium.SendKeys(NavigationMenu.MenuSearchBar, page);
            Selenium.ClickUntilElementIsDisplayed(NavigationMenu.SelectedPage(page), NavigationMenu.HomeToolbarPageName(page));
        }

        [Given(@"the user navigates to the '([^']*)' page by sm1-id '([^']*)'")]
        [When(@"the user navigates to the '([^']*)' page by sm1-id '([^']*)'")]
        public void GivenTheUserNavigateToThePageBySm1ID(string page, string sm1ID)
        {
            int counter = 0;
            while (!Selenium.ValidateEnabledAndDisplayed(NavigationMenu.MenuButton, PageLoadTimeout) && counter < 180)
            {
                Thread.Sleep(1000);
                counter++;
            }
            Selenium.ClickUntilElementIsDisplayed(NavigationMenu.MenuButton, NavigationMenu.ViewCompleteMenuButton);
            Selenium.Click(NavigationMenu.ViewCompleteMenuButton);
            Selenium.SendKeys(NavigationMenu.MenuSearchBar, page);
            Selenium.ClickUntilElementIsDisplayed(GenericElementsPage.ElementBySM1ID(sm1ID), NavigationMenu.HomeToolbarPageName(page));
        }


        [Given(@"The user navigates to ""([^""]*)""")]
        public void GivenTheUserNavigatesTo(string url)
        {
            Selenium.Driver.Url = url;
        }

        [Given(@"The user is on the '([^']*)' page")]
        public void GivenTheUserIsOnThePage(string pageName)
        {
            Selenium.CurrentPageName = pageName;
        }


        [When(@"The user types '([^']*)' into the '([^']*)'")]
        [When(@"the user enters '([^']*)' in the '([^']*)'")]
        public void WhenTheUserTypesIntoThe(string text, string elementName)
        {
            if (text.Contains("/") && (text.Contains("d") || text.Contains("m") || text.Contains("y")))
            {
                text = CommonDates.DateParser(text);
            }
            Selenium.ClearByKeys(Selenium.GetAbstractedBy(elementName));
            Selenium.SendKeys(Selenium.GetAbstractedBy(elementName), text);
            Selenium.LooseFocusFromAnElement();
        }

        [Then(@"the user clicks on the '(.*)'")]
        [When(@"the user clicks on the '(.*)'")]
        public void WhenTheUserClicks(string elementName)
        {
            Selenium.Click(Selenium.GetAbstractedBy(elementName));
        }

        [When(@"the user clicks on the '(.*)' if it exists")]
        public void WhenTheUserClicksIfExists(string elementName)
        {
            if (Selenium.ValidateElementOnPage(Selenium.GetAbstractedBy(elementName)))
            {
                Selenium.Click(Selenium.GetAbstractedBy(elementName));
            }

        }

        [When(@"the user clicks on '(.*)' with value '(.*)'")]
        [Then(@"the user clicks on '(.*)' with value '(.*)'")]
        public void WhenTheUserClicksWithValue(string elementName, string value)
        {
            value = GetValue(value);
            string[] values = { value };
            Selenium.Click(Selenium.GetAbstractedBy(elementName, values), 30);
        }

        [When(@"the user clicks on element '(.*)' with value '(.*)' and value '(.*)'")]
        public void WhenTheUserClicksWithValueAndValue(string elementName, string value, string value2)
        {
            value = GetValue(value);
            value = GetValue(value2);
            string[] values = { value, value2 };
            Selenium.Click(Selenium.GetAbstractedBy(elementName, values), 30);
        }

        [When(@"the user double clicks on '(.*)' with value '(.*)'")]
        public void WhenTheUserDoubleClicksOnWithValue(string elementName, string args)
        {
            Selenium.DoubleClickElement(Selenium.GetAbstractedBy(elementName, new string[] { args }));
        }

        [When(@"the user double clicks on '(.*)' with value '(.*)' until element '(.*)' is present")]
        public void WhenTheUserDoubleClicksOnWithValueUntilElementIsPresent(string elementName, string args, string elementToValidate)
        {
            Selenium.DoubleClickElement(Selenium.GetAbstractedBy(elementName, new string[] { args }));
            int count = 0;
            while (!Selenium.ValidateElementOnPage(Selenium.GetAbstractedBy(elementToValidate)) && count < 5)
            {
                count++;
                Thread.Sleep(1000);
                Selenium.DoubleClickElement(Selenium.GetAbstractedBy(elementName, new string[] { args }));
            }
            Assert.IsTrue(Selenium.ValidateElementOnPage(Selenium.GetAbstractedBy(elementToValidate)), $"{elementToValidate} not found after double clicking");
        }

        [Then(@"the user enters '(.*)' in field '(.*)' with value '(.*)'")]
        [When(@"the user enters '(.*)' in field '(.*)' with value '(.*)'")]
        public void WhenTheUserEntersTextInFieldWithValue(string text, string elementName, string value)
        {
            text = GetValue(text);
            value = GetValue(value);

            string[] values = { value };
            AbstractedBy element = Selenium.GetAbstractedBy(elementName, values);
            IWebElement elementVisible = Selenium.GetVisibleElement(element);
            Assert.IsNotNull(elementVisible, "Automation - There is no interactable element that was returned");
            Selenium.ClearByKeys(elementVisible);
            Selenium.SendKeys(elementVisible, text);
            Thread.Sleep(1000);
        }

        [When(@"the user enters values '(.*)' plus '(.*)' in field '(.*)' with value '(.*)'")]
        public void WhenTheUserEntersValuesTextInFieldWithValue(string text, string text2, string elementName, string value)
        {
            text = GetValue(text);
            text2 = GetValue(text2);

            string[] values = { value };
            AbstractedBy element = Selenium.GetAbstractedBy(elementName, values);
            IWebElement elementVisible = Selenium.GetVisibleElement(element);
            Assert.IsNotNull(elementVisible, "Automation - There is no interactable element that was returned");
            Selenium.ClearByKeys(elementVisible);
            Selenium.SendKeys(elementVisible, text + text2);
        }

        [When(@"the user clicks on '(.*)' with value containing '(.*)'")]
        [Then(@"the user clicks on '(.*)' with value containing '(.*)'")]
        public void WhenTheUserClicksWithValuecontaining(string elementName, string value)
        {
            string[] values = { value };
            Selenium.Click(Selenium.GetAbstractedBy(elementName, values));
        }

        [Given(@"the user has logged in with division '(.*)'")]
        public void GivenTheUserHasLoggedInWithDivision(string division)
        {
            int counter = 0;
            while (!Selenium.ValidateEnabledAndDisplayed(UserProfile.HomeToolbarUserButton, 120) && counter < 180)
            {
                Thread.Sleep(1000);
                counter++;
            }

            Selenium.Click(UserProfile.HomeToolbarUserButton);
            Selenium.Click(UserProfile.ChangeGroupDivisionButton);
            Selenium.ValidateEnabledAndDisplayed(UserProfile.UserCodeDropDownTrigger, 15);
            Selenium.ClickUntilElementIsDisplayed(UserProfile.UserCodeDropDownTrigger, UserProfile.UserCodeDropDown(division));
            Selenium.ValidateEnabledAndDisplayed(UserProfile.UserCodeDropDown(division), 15);
            Selenium.Click(UserProfile.UserCodeDropDown(division), 15);

            Selenium.Click(UserProfile.OKButton);
            if (Selenium.ValidateEnabledAndDisplayed(UserProfile.AlertDialogYesButton))
                Selenium.Click(UserProfile.AlertDialogYesButton);
        }

        [When(@"the user select value '([^']*)' from dropdown list '([^']*)'")]
        [Then(@"the user select value '([^']*)' from dropdown list '([^']*)'")]
        public void WhenTheUserSelectsDropdownValueByFieldWithValue(string valueToSelect, string fieldName)
        {
            if (valueToSelect.Equals("Retrieved"))
                valueToSelect = RetrievedValue;

            StepHelpers.SelectsDropdownValueByFieldWithValue(valueToSelect, fieldName);
        }

        [When(@"the user select value containing '([^']*)' from dropdown list '([^']*)'")]
        [Then(@"the user select value containing '([^']*)' from dropdown list '([^']*)'")]
        public void WhenTheUserSelectsDropdownValueContainingByFieldWithValue(string valueToSelect, string fieldName)
        {
            if (valueToSelect.Equals("Retrieved"))
                valueToSelect = RetrievedValue;

            var element = GenericElementsPage.GenericDropDownValueContaining(valueToSelect.Replace("\"", string.Empty));
            Selenium.ClickUntilElementIsDisplayed(GenericElementsPage.GenericDropDownTrigger(fieldName), element);
            Selenium.Click(element);
        }

        [When(@"the user enter text '(.*)' on the field with label '(.*)'")]
        public void WhenTheUserEnterTextOnTheFiedWithLabel(string text, string label)
        {
            Selenium.ClearByKeys(GenericElementsPage.InputByLabelName(label));
            Selenium.SendKeys(GenericElementsPage.InputByLabelName(label), text);
        }

        [When(@"the user closes all pages without saving the work done")]
        [Then(@"the user closes all pages without saving the work done")]
        public void ThenTheUserClosesAllPagesWithoutSavingTheWorkDone()
        {
            Selenium.Click(NavigationMenu.CloseTab, 30);
            if (Selenium.ValidateEnabledAndDisplayed(SavePopup.NoButton, 15))
            {
                Selenium.Click(SavePopup.NoButton);
            }
        }

        [Then(@"the user closes all pages without saving the work done where there is no pop up")]
        [When(@"the user closes all pages without saving the work done where there is no pop up")]
        public void ThenTheUserClosesAllPagesWithoutSavingTheWorkDoneWhereThereIsNoPopUp()
        {
            Selenium.Click(NavigationMenu.CloseTab, 30);
        }

        [When(@"the user retrieves the '(.*)' text with value '(.*)'")]
        [Then(@"the user retrieves the '(.*)' text with value '(.*)'")]
        public void ThenTheUserRetrievesElementWithValueText(string element, string value)
        {
            string toSave = "";
            int count = 0;
            while (toSave.Equals(string.Empty) && count < 5)
            {
                toSave = Selenium.GetText(Selenium.GetAbstractedBy(element, new string[] { value }));
                count++;
                Thread.Sleep(500);
            }

            RetrievedValue = toSave;
        }

        [When(@"the user selects validity period '(.*)' '(.*)' on the '(.*)' field")]
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

        [When(@"the user moves the focus to the '(.*)'")]
        [Then(@"the user moves the focus to the '(.*)'")]
        public void WhenTheUserMovesTheFocusToThe(string logicalName)
        {
            Selenium.MoveFocusToElement(Selenium.GetAbstractedBy(logicalName));
        }

        [When(@"the user moves the focus to '(.*)' with value '(.*)'")]
        public void WhenTheUserMovesTheFocusToThe(string logicalName, string value)
        {
            object[] args = { value };
            Selenium.MoveFocusToElement(Selenium.GetAbstractedBy(logicalName, args));
        }

        [When(@"the user moves the focus away from '(.*)' with value '(.*)' by pressing tab key")]
        public void WhenTheUserMovesTheFocusToTheWithValue(string logicalName, string value)
        {
            object[] args = { value };
            Selenium.FindOne(Selenium.GetAbstractedBy(logicalName, args)).SendKeys(Keys.Tab);
        }

        [When(@"the user clears text on the '(.*)'")]
        public void WhenTheUserClearsTheTextFromThe(string logicalName)
        {
            Selenium.ClearByKeys(Selenium.GetAbstractedBy(logicalName));
        }

        [When(@"the user clears the text on the '(.*)' with value '(.*)'")]
        public void WhenTheUserClearsTheTextFromThe(string logicalName, string value)
        {
            object[] values = { value };
            Selenium.ClearByKeys(Selenium.GetAbstractedBy(logicalName, values));
            Selenium.LooseFocusFromAnElement();
        }

        [When(@"the user retrieves the '(.*)' text as '(.*)'")]
        public void WhenTheUserRetrievesTheTextAs(string logicalName, string key)
        {
            string toSave = "not found";

            toSave = Selenium.GetText(Selenium.GetAbstractedBy(logicalName));

            if (logicalName.Equals("Progressive Field"))
            {
                toSave = toSave.Substring(0, toSave.IndexOf("."));
            }

            if (IsKey(key))
            {
                ScenarioContext[key] = toSave;
            }
            else
            {
                ScenarioContext.Add(key, toSave);
            }
        }

        [When(@"the user retrieves text from element '(.*)' with value '(.*)' and saves it as '(.*)'")]
        public void WhenTheUserRetrievesTextFromElementWithValue(string logicalName, string value, string key)
        {
            string toSave = "not found";
            int count = 0;
            value = GetValue(value);
            while (Selenium.GetText(Selenium.GetAbstractedBy(logicalName, new string[] { value })).Equals(string.Empty) && count < 10)
            {
                count++;
                Thread.Sleep(1000);
            }

            toSave = Selenium.GetText(Selenium.GetAbstractedBy(logicalName, new string[] { value }));

            if (logicalName.Equals("Progressive Field"))
            {
                toSave = toSave.Substring(0, toSave.IndexOf("."));
            }

            if (IsKey(key))
            {
                ScenarioContext[key] = toSave;
            }
            else
            {
                ScenarioContext.Add(key, toSave);
            }
        }

        [When(@"the user retrieves count of '(.*)' with value '(.*)' and saves it as '(.*)'")]
        public void WhenTheUserRetrievesCountOfWithValue(string logicalName, string value, string key)
        {
            ScenarioContext[key] = Selenium.Find(Selenium.GetAbstractedBy(logicalName, new string[] { value })).Count.ToString();
        }

        [When(@"the user changes the status to '(.*)'")]
        public void WhenTheUserChangesThePromoStatusTo(string status)
        {
            try
            {
                Selenium.Click(GenericElementsPage.GenericDropDownTrigger("Status"));
            }
            catch (Exception)
            {
                Selenium.Click(GenericElementsPage.GenericDropDownTrigger("Current status"));
            }


            try
            {
                Selenium.Click(GenericElementsPage.RadioButton(status));
            }
            catch (Exception)
            {
                try
                {
                    Selenium.Click(GenericElementsPage.GenericDropDownTrigger("Status"));
                }
                catch (Exception)
                {
                    Selenium.Click(GenericElementsPage.GenericDropDownTrigger("Current status"));
                }
                Selenium.Click(GenericElementsPage.RadioButton(status));
            }
            Selenium.Click(PopupGenericElements.PopupOkButton("Change Status"));
        }

        [When(@"the user moves the focus away from the element")]
        public void WhenTheUserMovesTheFocusAwayFromTheElement()
        {
            Selenium.LooseFocusFromAnElementByClickingAwayFromElement();
        }

        [When(@"the user uploads the file '(.*)' in the '(.*)' with value '(.*)'")]
        public void WhenTheUserUploadsTheFileInThe(string fileName, string logicalName, string fieldLabel)
        {
            Assert.IsTrue(StepHelpers.UploadFile(fileName, Selenium.GetAbstractedBy(logicalName, new string[] { fieldLabel })));
        }

        [When(@"the user press the '(.*)' key on the '(.*)' with value '(.*)'")]
        public void ThenTheUserPressTheKey(string keyLabel, string logicalName, string value)
        {
            object[] values = { value };
            switch (keyLabel.ToLower())
            {
                case "tab":
                    Selenium.FindOne(Selenium.GetAbstractedBy(logicalName, values)).SendKeys(Keys.Tab);
                    break;
                case "enter":
                    Selenium.FindOne(Selenium.GetAbstractedBy(logicalName, values)).SendKeys(Keys.Enter);
                    break;
                case "up arrow":
                    Selenium.FindOne(Selenium.GetAbstractedBy(logicalName, values)).SendKeys(Keys.ArrowUp);
                    break;
                case "down arrow":
                    Selenium.FindOne(Selenium.GetAbstractedBy(logicalName, values)).SendKeys(Keys.ArrowDown);
                    break;
                case "space bar":
                    Selenium.FindOne(Selenium.GetAbstractedBy(logicalName, values)).SendKeys(Keys.Space);
                    break;

            }
        }

        [When(@"the user enters the characters '([^']*)' in field '([^']*)' with value '([^']*)'")]
        [Then(@"the user enters the characters '([^']*)' in field '([^']*)' with value '([^']*)'")]
        public void WhenTheUserEntersTheCharactersInFieldWithValue(string text, string elementName, string value)
        {
            if (text.Contains("/"))
            {
                text = CommonDates.DateParser(text);
            }
            string[] values = { value };
            AbstractedBy element = Selenium.GetAbstractedBy(elementName, values);
            IWebElement elementVisible = Selenium.GetVisibleElement(element);
            Assert.IsNotNull(elementVisible, "Automation - There is no interactable element that was returned");
            Selenium.Click(elementVisible);
            Selenium.ClearByKeys(elementVisible);
            Thread.Sleep(1000);

            foreach (char character in text)
            {
                Selenium.FindOne(element).SendKeys(character.ToString());
                Thread.Sleep(100);
            }
            Selenium.LooseFocusFromAnElement();
        }

        [When(@"the user selects validity period '([^']*)' '([^']*)' on the '([^']*)' element with value '([^']*)'")]
        public void WhenTheUserSelectsValidityPeriodOnTheElementWithValue(string startDate, string endDate, string element, string value)
        {
            startDate = CommonDates.DateParser(startDate);
            endDate = CommonDates.DateParser(endDate);
            int count = 0;
            string[] values = { value };
            AbstractedBy fieldElement = Selenium.GetAbstractedBy(element, values);
            while (!StepHelpers.ValidateDateField(GenericElementsPage.Sm1IdAttributeOfField(fieldElement.ByToString), startDate, endDate) && count < 5)
            {
                count++;
                StepHelpers.SelectDatePeriod(fieldElement, startDate, endDate);
                Thread.Sleep(1000);
            }
        }

        [When(@"the user closes the page and saves the work done")]
        [Then(@"the user closes the page and saves the work done")]
        public void WhenTheUserClosesThePageAndSavesTheWorkDone()
        {
            Selenium.ValidateAllElementsLoaded(NavigationMenu.ToolbarHomeCloseButton);
            Selenium.Click(NavigationMenu.ToolbarHomeCloseButton, 30);
            if (Selenium.ValidateEnabledAndDisplayed(SavePopup.YesButton, 15))
            {
                Selenium.Click(SavePopup.YesButton);
            }
        }

        [When(@"the user adds a filter in the filter maker popup '(.*)' '(.*)' '(.*)'")]
        public void WhenTheUserAddsAFilterInTheFilterMakerPopup(string attribute, string operater, string value)
        {
            Selenium.FluentWaitElementToBePresent(BasicGrid.Rows);
            GridStepHelpers.EnterTextIntoTextCell(BasicGrid.Rows, BasicGrid.Columns, 1, "Attribute", attribute);
            GridStepHelpers.EnterTextIntoTextCell(BasicGrid.Rows, BasicGrid.Columns, 1, "Operator", operater);
            GridStepHelpers.EnterTextIntoTextCell(BasicGrid.Rows, BasicGrid.Columns, 1, "Value", attribute);
        }

        [When(@"the user clicks on '(.*)' with value '(.*)' until '(.*)' with value '(.*)' is present")]
        public void WhenTheUserClicksWithValueUntilIsPresent(string elementName, string value, string elementToValidate, string elementToValidateValue)
        {
            value = GetValue(value);
            string[] values = { value };
            AbstractedBy byElementToValidate = Selenium.GetAbstractedBy(elementToValidate, new string[] { elementToValidateValue });
            AbstractedBy byElementToClick = Selenium.GetAbstractedBy(elementName, new string[] { value });

            Selenium.ClickUntilElementIsDisplayed(byElementToClick, byElementToValidate);
            Assert.IsTrue(Selenium.ValidateElementOnPage(byElementToValidate), $"{elementToValidate} not found after clicking");
        }

        [When(@"the user clicks on '(.*)' with value '(.*)' until '(.*)' is enabled")]
        public void WhenTheUserClicksUntilIsEnabled(string elementName, string value, string elementToValidate)
        {
            value = GetValue(value);
            AbstractedBy byElementToValidate = Selenium.GetAbstractedBy(elementToValidate);
            AbstractedBy byElementToClick = Selenium.GetAbstractedBy(elementName, new string[] { value });
            bool hasAttribute = Selenium.HasAttribute(byElementToValidate, "aria-readonly", "false") || Selenium.Sm1ContainerHasAttribute(byElementToValidate, "aria-disabled", "false") || !Selenium.HasAttribute(byElementToValidate, "class", "disabled");
            int count = 0;
            while (!hasAttribute && count < 5)
            {
                count++;
                Selenium.Click(byElementToClick);
                hasAttribute = Selenium.HasAttribute(byElementToValidate, "aria-readonly", "false") || Selenium.Sm1ContainerHasAttribute(byElementToValidate, "aria-disabled", "false") || !Selenium.HasAttribute(byElementToValidate, "class", "disabled");
                Thread.Sleep(1000);
            }
            Assert.IsTrue(Selenium.HasAttribute(byElementToValidate, "aria-readonly", "false") || Selenium.Sm1ContainerHasAttribute(byElementToValidate, "aria-disabled", "false") || !Selenium.HasAttribute(byElementToValidate, "class", "disabled"), $"{elementToValidate} not enabled after clicking");
        }

        [Given(@"the user changes division to '(.*)'")]
        [When(@"the user changes division to '(.*)'")]
        public void WhenTheUserChangesDivision(string division)
        {
            int counter = 0;
            while (!Selenium.ValidateEnabledAndDisplayed(NavigationMenu.MenuButton, PageLoadTimeout) && counter < 180)
            {
                Thread.Sleep(1000);
                counter++;
            }

            Selenium.Click(GenericElementsPage.ElementBySM1ID("homeToolbarUserBTN"));
            Selenium.WaitForElementToBePresent(GenericElementsPage.ElementBySM1ID("homeToolbarGRPDIVBTN"));
            Selenium.Click(GenericElementsPage.ElementBySM1ID("homeToolbarGRPDIVBTN"));
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("User Code"), division);
            Selenium.Click(PopupGenericElements.PopupOkButton("Change Group/Division"));
            Selenium.WaitForElementToBePresent(SavePopup.YesButton);
            Selenium.Click(SavePopup.YesButton);
        }

        [When(@"the user runs a calculation '(.*)' on reabte '(.*)'")]
        public void WhenTheUserRunsCalculationSession(string liqCalc, string rebate)
        {
            rebate = GetValue(rebate);
            Selenium.WaitForElementToBePresent(GenericElementsPage.AddButton);
            Selenium.Click(GenericElementsPage.AddButton);
            Selenium.Click(GenericElementsPage.GenericDropDownTrigger("CALCULATION TYPE"));
            StepHelpers.FilterGrid("Description", "Like", liqCalc);
            Selenium.Click(BasicGrid.GridCheckBox(liqCalc));
            Selenium.Click(PopupGenericElements.PopupOkButton("Selection"));
            Selenium.Click(Rebates.OptionsCheckBox);
            Selenium.Click(GenericElementsPage.GenericDropDownTrigger("Rebates"));
            Selenium.Click(BasicGrid.GridCheckBox(rebate));
            Selenium.Click(PopupGenericElements.PopupOkButton("Rebates"));
            Selenium.Click(PopupGenericElements.PopupOkButton("New Calculation Session"));
        }

        [When(@"the user clicks on '(.*)' until '(.*)' with value '(.*)' and value '(.*)' is present")]
        public void WhenTheUserClicksOnUntilWithValueAndValueIsPresent(string elementName, string elementToValidate, string elementToValidateValue, string elementToValidateValue2)
        {
            AbstractedBy byElementToValidate = Selenium.GetAbstractedBy(elementToValidate, new string[] { elementToValidateValue, elementToValidateValue2 });
            AbstractedBy byElementToClick = Selenium.GetAbstractedBy(elementName);

            Selenium.ClickUntilElementIsDisplayed(byElementToClick, byElementToValidate, 10);
            Assert.IsTrue(Selenium.ValidateElementOnPage(byElementToValidate), $"{elementToValidate} not found after clicking");
        }

        [When(@"the user selects validity period '([^']*)' '([^']*)' on the '([^']*)' with value '([^']*)'")]
        public void WhenTheUserSelectsValidityPeriodOnTheWithValue(string startDate, string endDate, string elementName, string value)
        {
            startDate = CommonDates.DateParser(startDate);
            endDate = CommonDates.DateParser(endDate);
            int count = 0;
            object[] args = { value };
            AbstractedBy element = Selenium.GetAbstractedBy(elementName, args);
            while (!StepHelpers.ValidateDateField(GenericElementsPage.Sm1IdAttributeOfField(element.ByToString), startDate, endDate) && count < 5)
            {
                count++;
                StepHelpers.SelectDatePeriod(element, startDate, endDate);
                Thread.Sleep(1000);
            }
        }

        
        [When(@"the user selects validity period '([^']*)' '([^']*)' on the '([^']*)' with value '([^']*)' without validation")]
        public void WhenTheUserSelectsValidityPeriodOnTheWithValueWithoutValidation(string startDate, string endDate, string elementName, string value)
        {
            startDate = CommonDates.DateParser(startDate);
            endDate = CommonDates.DateParser(endDate);
            int count = 0;
            object[] args = { value };
            AbstractedBy element = Selenium.GetAbstractedBy(elementName, args);
            StepHelpers.SelectDatePeriod(element, startDate, endDate);
        }

        [When(@"the user clicks on '([^']*)' with value one '([^']*)' and value two '([^']*)'")]
        public void WhenTheUserClicksOnWithValueOneAndValueTwo(string elementName, string value1, string value2)
        {
            value1 = GetValue(value1);
            value2 = GetValue(value2);
            string[] values = { value1, value2 };
            Selenium.Click(Selenium.GetAbstractedBy(elementName, values), 30);
        }

        [Given(@"the user gets the system date")]
        [When(@"the user gets the system date")]
        public void GivenTheUserGetsTheSystemDate()
        {
            string date = System.DateTime.Now.ToString("MM/dd/yyyy");
            ScenarioContext.Add("DateTime", date);
        }

        [When(@"the user hovers over '(.*)' with value '(.*)' until element '(.*)' with '(.*)' value is present")]
        public void WhenTheUserHoversOverWithValueUntilElementWithValueIsPresent(string elementName, string args, string elementToValidateName, string elementToValidateArgs)
        {
            Selenium.Hover(Selenium.GetAbstractedBy(elementName, new string[] { args }));
            int count = 0;
            while (!Selenium.ValidateElementOnPage(Selenium.GetAbstractedBy(elementToValidateName, new string[] { elementToValidateArgs })) && count < 5)
            {
                count++;
                Selenium.Hover(NavigationMenu.KantarLogo);
                Thread.Sleep(1000);
                Selenium.Hover(Selenium.GetAbstractedBy(elementName, new string[] { args }));
                Thread.Sleep(1000);
            }
            Assert.IsTrue(Selenium.ValidateElementOnPage(Selenium.GetAbstractedBy(elementToValidateName, new string[] { elementToValidateArgs })), $"failed to find the element {elementToValidateName} after hover");
        }

        [Then(@"the user retrieves the '([^']*)' text")]
        public void ThenTheUserRetrievesTheText(string element)
        {
            string toSave = "";
            int count = 0;
            while (toSave.Equals(string.Empty) && count < 5)
            {
                toSave = Selenium.GetText(Selenium.GetAbstractedBy(element));
                count++;
                Thread.Sleep(500);
            }

            RetrievedValue = toSave;
        }

        [When(@"the user selects action '(.*)' '(.*)'")]
        public void WhenTheUserSelectsAction(string ActionParent, string ActionToClick)
        {
            int count = 0;
            Selenium.Click(GenericElementsPage.Button(ActionParent));

            while (!Selenium.FindOne(GenericElementsPage.Text(ActionToClick)).Displayed && count < 5)
            {
                Thread.Sleep(500);
                Selenium.Click(GenericElementsPage.Button(ActionParent));
                count++;
            }

            Assert.That(Selenium.FindOne(GenericElementsPage.Text(ActionToClick)).Displayed, "Element " + ActionToClick + " did not qualify as being displayed");

            Selenium.Click(GenericElementsPage.Text(ActionToClick));
        }

        [When(@"the user presses the '([^']*)' key on the '([^']*)' with the value '([^']*)'")]
        public void WhenTheUserEntersTheKeyOnTheWithTheValue(string key, string elementLogicalName, string value)
        {
            Selenium.EnterTextByKeys(Selenium.GetAbstractedBy(elementLogicalName, new object[] { value }), Selenium.GetKeyName(key));
        }

        [When(@"the user presses the '([^']*)' key on the '([^']*)'")]
        public void WhenTheUserEntersTheKeyOnThe(string key, string elementLogicalName)
        {
            Selenium.EnterTextByKeys(Selenium.GetAbstractedBy(elementLogicalName), Selenium.GetKeyName(key));
        }

        [When(@"the user presses the '([^']*)' key")]
        public void WhenTheUserEntersTheKey(string key)
        {
            Selenium.EnterTextByKeys(Selenium.GetKeyName(key));
        }

        [When(@"the user keys in the '([^']*)' key")]
        public void WhenTheUserKeysInTheKey(string key)
        {
            Selenium.KeyIn(Selenium.GetKeyName(key));
        }

        [When(@"the user keys out the '([^']*)' key")]
        public void WhenTheUserKeysOutTheKey(string key)
        {
            Selenium.KeyOut(Selenium.GetKeyName(key));
        }

        [When(@"the user populates the '([^']*)' field with: '([^']*)'")]
        public void WhenTheUserPopulatesTheFieldWith(string fieldName, string fieldValue)
        {
            string textValuu = Selenium.GetText(GenericElementsPage.InputByLabelName(fieldName));
            if (textValuu.Equals(null) || textValuu.Equals(string.Empty))
            {
                Selenium.Click(GenericElementsPage.InputByLabelName(fieldName));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName(fieldName));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName(fieldName), fieldValue);
                Selenium.LooseFocusFromAnElement();
            }
        }

        [When(@"the user checks the '([^']*)' with value '([^']*)'")]
        public void WhenTheUserChecksCheckbox(string element, string elementValue)
        {
            if (elementValue.Contains("/") && (elementValue.Contains("d") || elementValue.Contains("m") || elementValue.Contains("y")))
            {
                elementValue = CommonDates.DateParser(elementValue);
            }

            bool attributeType;
            string[] values = { elementValue };
            if(!Selenium.ValidateCheckbox(Selenium.GetAbstractedBy(element, values)))
            {
                Selenium.Click(Selenium.GetAbstractedBy(element, values));
            }
        }

        [When(@"the user unchecks the '([^']*)' with value '([^']*)'")]
        public void WhenTheUserUnChecksCheckbox(string element, string elementValue)
        {
            if (elementValue.Contains("/") && (elementValue.Contains("d") || elementValue.Contains("m") || elementValue.Contains("y")))
            {
                elementValue = CommonDates.DateParser(elementValue);
            }
            bool attributeType;
            string[] values = { elementValue };
            if (Selenium.ValidateCheckbox(Selenium.GetAbstractedBy(element, values)))
            {
                Selenium.Click(Selenium.GetAbstractedBy(element, values));
            }
        }

        [When(@"the user removes all items by column '(.*)' '(.*)' '(.*)'")]
        public void WhenTheUserRemovesAllItemsByFilter(string column, string filterType, string filterValue)
        {
            Selenium.ValidateEnabledAndDisplayed(BasicGrid.IndexedRow("1"));
            StepHelpers.FilterGrid(column, filterType, filterValue);
 
            int count = 0;
            while (Selenium.ValidateEnabledAndDisplayed(BasicGrid.FirstRow) && count < 10)
            {
                try
                {
                    count++;
                    Selenium.Click(BasicGrid.SelectIndexedRow("1"));
                    Selenium.Click(GenericElementsPage.RemoveButton);
                    if (Selenium.ValidateEnabledAndDisplayed(PopupGenericElements.AlertDialogOkButton))
                        Selenium.Click(PopupGenericElements.AlertDialogOkButton);

                    //locked document
                    if (Selenium.GetText(PopupGenericElements.AlertDialogMessageBox).Contains("Locked"))
                    {
                        Selenium.Click(PopupGenericElements.AlertDialogOkButton);
                        break;
                    }

                    Thread.Sleep(1000);
                }
                catch (Exception) { }
            }
        }

        [When(@"the user scrolls to the '([^']*)' with value '([^']*)'")]
        public void WhenTheUserScrollsToWithValue(string logicalName, string value)
        {
            string[] values = { value };
            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy(logicalName, values));
            Selenium.ScrollJS(Selenium.FindOne(Selenium.GetAbstractedBy(logicalName, values)));
        }

        [When(@"the user switches the configurator '(.*)'")]
        public void ThenTheUserTurnsOffTheConfigurator(string onOrOff)
        {
            StepHelpers.SwitchConfiguratorOnOff(onOrOff);
        }

        [When(@"the user adds an attachment '(.*)' '(.*)' '(.*)' '(.*)'")]
        public void WhenTheUserAddsAnAttachment(string subject, string source, string fileOrUrl, string primaryCheckboxTrueOrFalse)
        {
            StepHelpers.addAnAttachment(subject, source, fileOrUrl, primaryCheckboxTrueOrFalse);
        }
    }
}