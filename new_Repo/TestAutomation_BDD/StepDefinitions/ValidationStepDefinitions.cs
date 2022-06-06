using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Support.Selenium;
using NUnit.Framework;
using System;
using System.Threading;
using TechTalk.SpecFlow;
using Kantar_BDD.Support.Utils;
using System.Linq;
using OpenQA.Selenium;
using Kantar_BDD.Pages.Grids;
using System.Collections.Generic;
using System.Globalization;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class ValidationgStepDefinitions : SeleniumStepDefinition
    {
        private int PageLoadTimeout { get; set; } = 300;
        ScenarioContext scenarionContext;
        public ValidationgStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
            this.ScenarioContext = scenarionContext;
        }

        [When(@"the user validates that '(.*)' with value '(.*)' has text '(.*)'")]
        [Then(@"the user validates that '(.*)' with value '(.*)' has text '(.*)'")]
        public void ThenTheUserValidatesThatWithValueTextIs(string elementName, string value, string expectedElementText)
        {
            if (IsKey(expectedElementText))
            {
                expectedElementText = GetValue(expectedElementText);
            }

            if (expectedElementText.Contains("/") && (expectedElementText.Contains("d") || expectedElementText.Contains("m") || expectedElementText.Contains("y")))
            {
                expectedElementText = CommonDates.DateParser(expectedElementText);
            }


            string[] values = { value };
            Selenium.FluentWaitForText(Selenium.GetAbstractedBy(elementName, values), expectedElementText);
            string actualText = Selenium.GetText(Selenium.GetAbstractedBy(elementName, values));
            Assert.AreEqual(expectedElementText, actualText, "The expected text " + expectedElementText + " is not the same as actual text: " + actualText);
        }

        [Then(@"the user validates that the count for '(.*)' with value '(.*)' is '(.*)'")]
        public void ThenTheUserValidatesThatTheCountWithValueIs(string elementName, string value, string expectedElementText)
        {
            if (IsKey(expectedElementText))
            {
                expectedElementText = GetValue(expectedElementText);
            }

            string[] values = { value };
            Assert.AreEqual(expectedElementText, Selenium.Find(Selenium.GetAbstractedBy(elementName, values)).Count.ToString(), $"The count is not the same as expected for {elementName}");
        }

        [Then(@"the user validates that the value '(.*)' is equal to '(.*)'")]
        [Then(@"the user validates that the element '(.*)' is equal to '(.*)'")]
        [Then(@"the user validates that the element '(.*)' has text '(.*)'")]
        public void ThenTheUserValidatesTextIs(string elementName, string expectedElementText)
        {
            string actualText = null;

            if (IsKey(expectedElementText))
            {
                expectedElementText = GetValue(expectedElementText).ToString();
            }

            if (IsKey(elementName))
            {
                actualText = GetValue(elementName).ToString();
            }
            else
            {
                Selenium.FluentWaitForText(Selenium.GetAbstractedBy(elementName), expectedElementText);
                actualText = Selenium.GetText(Selenium.GetAbstractedBy(elementName));
            }
            Assert.AreEqual(actualText, expectedElementText, "The expected text " + expectedElementText + " is not the same as actual text: " + actualText);
        }

        [Then(@"the user validates that the value '(.*)' is not equal to '(.*)'")]
        [Then(@"the user validates that the element '(.*)' is not equal to '(.*)'")]
        public void ThenTheUserValidatesTextIsNot(string elementName, string expectedElementText)
        {
            string actualText = null;

            if (IsKey(expectedElementText))
            {
                expectedElementText = GetValue(expectedElementText).ToString();
            }

            if (IsKey(elementName))
            {
                actualText = GetValue(elementName).ToString();
            }
            else
            {
                actualText = Selenium.GetText(Selenium.GetAbstractedBy(elementName));
            }
            Assert.AreNotEqual(actualText, expectedElementText, "The expected text " + expectedElementText + " is the same as actual text: " + actualText);
        }

        [Then(@"the user validates that the '([^']*)' is present")]
        public void ThenTheIsPresent(string elementName)
        {
            Selenium.FluentWaitElementToBePresent(Selenium.GetAbstractedBy(elementName, new string[] { }), 60);
            Assert.That(Selenium.Find(Selenium.GetAbstractedBy(elementName)).Count > 0, "Element " + elementName + " did not qualify as being present");
        }

        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is present")]
        [Then(@"the user validates that the '([^']*)' with value ""([^""]*)"" is present")]
        public void ThenTheWithValueIsPresent(string elementLogicalName, string value)
        {
            if (IsKey(value))
            {
                value = GetValue(value);
            }

            if (value.Contains("/"))
            {
                value = CommonDates.DateParser(value);
            }
            string[] values = value.Split(';');

            foreach (var subValue in values)
            {
                object[] args = { subValue };
                Selenium.FluentWaitElementToBePresent(Selenium.GetAbstractedBy(elementLogicalName, args), 60);
                Assert.That(Selenium.Find(Selenium.GetAbstractedBy(elementLogicalName, args)).Count > 0, "Element " + elementLogicalName + " with value " + value + " did not qualify as not being present");
            }
        }

        [Then(@"the user validates that the '([^']*)' is visible")]
        [Then(@"the user validates that the '([^']*)' is displayed")]
        public void ThenTheIsVisible(string elementName)
        {
            object[] args = { };
            var element = Selenium.FindOne(Selenium.GetAbstractedBy(elementName, args), 30);
            Assert.That(element.Displayed, "Element " + elementName + " did not qualify as being displayed");
        }

        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is visible")]
        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is displayed")]
        public void ThenTheWithValueIsVisible(string elementLogicalName, string value)
        {
            Assert.That(StepHelpers.ValidateElementWithValueVisible(ScenarioContext, elementLogicalName, value), "Element " + elementLogicalName + " with value " + value + " did not qualify as not being displayed");
        }

        [Then(@"the user validates that '([^']*)' is read-only")]
        public void ThenTheUserValidatesThatIsRead_Only(string elementName)
        {

            IWebElement element = Selenium.FindOne(GenericElementsPage.InputByLabelName(elementName));

            int count = 0;
            while ((!element.Displayed && count < 5))
            {
                count++;
                Thread.Sleep(1000);
            }

            Assert.IsTrue(element.GetAttribute("aria-readonly").Contains("true"), "Element " + element + " with value " + elementName + " did not qualify as a read-only");
        }

        [Then(@"the user validates that '([^']*)' is populated with '([^']*)'")]
        [Then(@"'([^']*)' is populated with '([^']*)'")]
        [When(@"'([^']*)' is populated with '([^']*)'")]
        public void ThenIsPopulatedWith(string element, string text)
        {
            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy(element));
            Selenium.FluentWaitForText(Selenium.GetAbstractedBy(element), text);
            var elementValue = Selenium.GetText(Selenium.GetAbstractedBy(element));
            Assert.That(elementValue.Equals(text), "Failed to validate populated data, expected - " + text + ", but found - " + elementValue);

        }

        [Then(@"the user validates the '(.*)' has no text")]
        [Then(@"the user validates the '(.*)' is empty")]
        public void ThenTheUserValidatesTheIsEmpty(string logicalName)
        {
            Assert.IsTrue(StepHelpers.TextboxIsEmpty(logicalName), "Element appears to have text " + Selenium.GetText(Selenium.GetAbstractedBy(logicalName)));
        }

        [Then(@"the user validates that the '(.*)' with value '(.*)' has no text")]
        [Then(@"the user validates that the '(.*)' with value '(.*)' is empty")]
        public void ThenTheUserValidatesTheIsEmpty(string logicalName, string value)
        {
            Assert.IsTrue(StepHelpers.TextboxIsEmpty(logicalName, value), "Element appears to have text " + Selenium.GetText(Selenium.GetAbstractedBy(logicalName, new string[] { value })));
        }

        [Then(@"the user validates the '([^']*)' is not empty")]
        public void ThenTheUserValidatesTheIsNotEmpty(string elementName)
        {
            Assert.IsFalse(StepHelpers.TextboxIsEmpty(elementName), "Element appears to be empty, no data found in the value property");
        }

        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is not empty")]
        public void ThenTheUserValidatesThatTheWithValueIsNotEmpty(string elementName, string value)
        {
            Assert.IsFalse(StepHelpers.TextboxIsEmpty(elementName, value), "Element appears to be empty, no data found in the value property");
        }

        [Then(@"the user validates the '([^']*)' is enabled")]
        public void ThenTheUserValidatesTheIsEnabled(string elementName)
        {
            var element = Selenium.FindOne(Selenium.GetAbstractedBy(elementName));
            Assert.That(element.Enabled, "Element " + elementName + " did not qualify as being Enabled");
        }

        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is enabled")]
        public void ThenTheUserValidatesTheIsEnabledWithParams(string logicalName, string value)
        {
            object[] values = { value };
            bool hasAttribute = Selenium.HasAttribute(Selenium.GetAbstractedBy(logicalName, values), "aria-readonly", "false") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName, values), "aria-disabled", "false") || !Selenium.HasAttribute(Selenium.GetAbstractedBy(logicalName, values), "class", "disabled");
            if (!hasAttribute)
            {
                hasAttribute = Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName, values), "aria-readonly", "false") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName, values), "aria-disabled", "false") || !Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName, values), "class", "disabled");
            }
            Assert.IsTrue(hasAttribute, "Element " + logicalName + " did not qualify as being Enabled");
        }

        [Then(@"the user validates the '([^']*)' is disabled")]
        public void ThenTheUserValidatesTheIsDisabled(string logicalName)
        {
            bool hasAttribute = Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "aria-readonly", "true") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "aria-disabled", "true") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "class", "disabled") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "class", "x-item-disabled");
            Assert.IsTrue(hasAttribute, "Element " + logicalName + " did not qualify as being Disabled");
        }

        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is disabled")]
        public void ThenTheUserValidatesTheIsDisabledWithParams(string logicalName, string value)
        {
            object[] values = { value };
            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy(logicalName, values));
            bool hasAttribute = Selenium.HasAttribute(Selenium.GetAbstractedBy(logicalName, values), "aria-readonly", "true") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName, values), "aria-disabled", "true") || Selenium.HasAttribute(Selenium.GetAbstractedBy(logicalName, values), "class", "disabled") || Selenium.HasAttribute(Selenium.GetAbstractedBy(logicalName, values), "disabled", "true");
            if (!hasAttribute)
            {
                hasAttribute = Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName, values), "aria-readonly", "true") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName, values), "aria-disabled", "true") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName, values), "class", "disabled") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName, values), "disabled", "true");
            }

            Assert.IsTrue(hasAttribute, "Element " + logicalName + " with value '" + value + "' did not qualify as being Disabled");
        }

        [Then(@"the user validates that the user is on the '([^']*)' page")]
        [Then(@"the user is on the '([^']*)' page")]
        [When(@"the user is on the '([^']*)' page")]
        public void ThenTheUserIsOnThePage(string pageName)
        {
            Assert.True(Selenium.ValidateEnabledAndDisplayed(Selenium.GetAbstractedBy(pageName), 30) || Selenium.ValidateEnabledAndDisplayed(NavigationMenu.HomeToolbarPageName(pageName), 30), "'" + pageName + "' Page not loaded");
        }

        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is not displayed")]
        public void ThenTheWithValueIsNotDisplayed(string elementLogicalName, string value)
        {
            object[] args = { value };
            Selenium.FluentWaitElementToBePresent(Selenium.GetAbstractedBy(elementLogicalName, args));
            Assert.That(Selenium.IsHidden(Selenium.GetAbstractedBy(elementLogicalName, args)), "Element " + elementLogicalName + " did not qualify as not being displayed");
        }

        [Then(@"the user validates that the '([^']*)' is not displayed")]
        public void ThenTheIsNotDisplayed(string logicalName)
        {
            Selenium.FluentWaitElementToBePresent(Selenium.GetAbstractedBy(logicalName));
            Assert.That(Selenium.FindOne(Selenium.GetAbstractedBy(logicalName)).GetAttribute("style").Contains("none") || Selenium.FindOne(Selenium.GetAbstractedBy(logicalName)).GetAttribute("style").Contains("hidden"), "Element " + logicalName + " did not qualify as not being displayed");
        }

        [Then(@"the '([^']*)' with value '([^']*)'  is not present")]
        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is not present")]
        public void ThenTheWithValueIsNotPresent(string elementLogicalName, string value)
        {
            object[] args = { value };
            Selenium.FluentWaitElementToBeNotPresent(Selenium.GetAbstractedBy(elementLogicalName, args));
            Assert.That(Selenium.Find(Selenium.GetAbstractedBy(elementLogicalName, args)).Count < 1, "Element " + elementLogicalName + " with value " + value + " did not qualify as not being displayed");
        }

        [Then(@"the '([^']*)' is not present")]
        [Then(@"the user validates that the '([^']*)' is not present")]
        public void ThenTheIsNotPresent(string logicalName)
        {
            Selenium.FluentWaitElementToBeNotPresent(Selenium.GetAbstractedBy(logicalName, new string[] { }), 60);
            Assert.That(Selenium.Find(Selenium.GetAbstractedBy(logicalName)).Count < 1, "Element " + logicalName + " did not qualify as not being present");
        }

        [Then(@"the user validates that the Loading Mask is not present")]
        public void ThenTheUserValidatesThatTheLoadingMaskIsNotPresent()
        {
            Selenium.FluentWaitElementToBeNotPresent(Selenium.GetAbstractedBy("Loading Mask", new string[] { }), 300);
            Assert.That(Selenium.Find(Selenium.GetAbstractedBy("Loading Mask")).Count < 1, "Loading Mask did not qualify as not being present");
        }

        [When(@"the user validates retrieved text is '(.*)'")]
        public void WhenTheUserValidatesRetrievedTextIs(string value)
        {
            Assert.That(value.Equals(RetrievedValue));
        }

        [Then(@"the user validates that '(.*)' type is '(.*)'")]
        [When(@"the user validates that '(.*)' type is '(.*)'")]
        public void ThenTheUserValidatesThatTypeIs(string element, string elementType)
        {
            AbstractedBy elementBy = Selenium.GetAbstractedBy(element);
            Assert.IsTrue(Selenium.ValidateElementType(elementBy, elementType, 30), "This element '" + element + "' is not of type '" + elementType + "'.");
        }

        [Then(@"the user validates that '(.*)' text contains '(.*)'")]
        [Then(@"'(.*)' text contains '(.*)'")]
        public void WhenTextContains(string element, string text)
        {
            text = StepHelpers.ReplaceSavedValuesInString(ScenarioContext, text);
            int count = 0;
            while (!Selenium.GetText(Selenium.GetAbstractedBy(element)).Contains(text) && count < 5)
            {
                Thread.Sleep(1000);
                count++;
            }
            Assert.That(Selenium.GetText(Selenium.GetAbstractedBy(element)).ToLower().Contains(text.ToLower()), "Failed to validate populated data, expected - " + text.ToLower() + ", but found - " + Selenium.GetText(Selenium.GetAbstractedBy(element)).ToLower());
        }

        [Then(@"the user validates that '(.*)' text with value '(.*)' contains '(.*)'")]
        [Then(@"'(.*)' text with value '(.*)' contains '(.*)'")]
        [When(@"'(.*)' text with value '(.*)' contains '(.*)'")]
        public void WhenTextWithValueContains(string element, string value, string text)
        {
            if (IsKey(text))
            {
                text = GetValue(text);
            }

            int count = 0;
            while (!Selenium.GetText(Selenium.GetAbstractedBy(element, new string[] { value })).Contains(text) && count < 5)
            {
                Thread.Sleep(1000);
                count++;
            }
            Assert.That(Selenium.GetText(Selenium.GetAbstractedBy(element, new string[] { value })).ToLower().Contains(text.ToLower()), "Failed to validate data, expected text to contain - " + text.ToLower() + ", but found - " + Selenium.GetText(Selenium.GetAbstractedBy(element, new string[] { value })).ToLower());
        }

        [Then(@"the user validates that '(.*)' with value '(.*)' contains text '(.*)'")]
        [When(@"the user validates that '(.*)' with value '(.*)' contains text '(.*)'")]
        public void WhenElementWithValueContains(string element, string value, string text)
        {
            if (IsKey(text))
            {
                text = GetValue(text);
            }
            if (text.Contains("/"))
                text = CommonDates.DateParser(text);
            var elementValue = Selenium.GetAttribute(Selenium.GetAbstractedBy(element, new string[] { value }), "value");
            if (elementValue != null)
            {
                Assert.That(elementValue.Contains(text), "Failed to validate populated data, expected - " + text + ", but found - " + elementValue);
            }
            else
            {
                elementValue = Selenium.GetText(Selenium.GetAbstractedBy(element, new string[] { value }));
                Assert.That(elementValue.ToLower().Contains(text.ToLower()), "Failed to validate populated data, expected - " + text.ToLower() + ", but found - " + elementValue.ToLower());
            }
        }

        [When(@"the user validates that '(.*)' is marked as \(true/false\): '(.*)'")]
        [Then(@"the user validates that '(.*)' is marked as \(true/false\): '(.*)'")]
        public void WhenTheUserValidatesThatIsMarkedAsTrueFalse(string checkboxElement, string trueOrFalse)
        {
            bool convertArg = trueOrFalse.ToLower().Trim().Equals("true");
            bool vaidate = Selenium.ValidateCheckbox(Selenium.GetAbstractedBy(checkboxElement));
            Assert.IsTrue(convertArg == vaidate, "Failed to validate that '" + checkboxElement + "' is marked as '" + trueOrFalse + "'");
        }

        [When(@"the user validates that '(.*)' with value '(.*)' is marked as: '(.*)'")]
        [Then(@"the user validates that '(.*)' with value '(.*)' is marked as: '(.*)'")]
        public void WhenTheUserValidatesThatElemementWithValueIsMarkedAsTrueFalse(string checkboxElement, string value, string trueOrFalse)
        {
            bool convertArg = trueOrFalse.ToLower().Trim().Equals("true") || trueOrFalse.ToLower().Trim().Equals("yes");
            bool vaidate = Selenium.ValidateCheckbox(Selenium.GetAbstractedBy(checkboxElement, new string[] { value }), 30);
            Assert.IsTrue(convertArg == vaidate, "Failed to validate that '" + checkboxElement + "' is marked as '" + trueOrFalse + "'");
        }

        [Then(@"the user validates that there are '(.*)' element '(.*)' displayed and contains '(.*)'")]
        public void ThenTheUserValidatesThereIsOnlyOneStatus(string elementName, string numberOfElements, string elementText)
        {
            Selenium.ValidateNumberOfElementsAndText(Selenium.GetAbstractedBy(elementName), numberOfElements, elementText);
        }

        [Then(@"the user validates that the '(.*)' with value '(.*)' has a numeric value")]
        public void ThenTheUserValidatesThatTheElementHasANumericValueWithParams(string logicalName, string value)
        {
            Assert.IsTrue(StepHelpers.NumericValidation(logicalName, value), "Failed to validate that the " + value + " is numeric");
        }

        [Then(@"the user validates the '(.*)' has a numeric value")]
        public void ThenTheUserValidatesThatTheElementHasANumericValue(string logicalName)
        {
            Assert.IsTrue(StepHelpers.NumericValidation(logicalName), "Failed to validate that the " + logicalName + " is numeric");
        }

        [Then(@"the user validates that the date field '(.*)' has '(.*)'")]
        public void ThenTheUserValidatesThatTheDateFieldHas(string dateType, string dateString)
        {
            string retrievedDate = Selenium.GetText(Selenium.GetAbstractedBy(dateType));
            string convertedDate = CommonDates.DateParser(dateString);
            Assert.AreEqual(retrievedDate, convertedDate);
        }

        [Then(@"the user validates that the '(.*)' is selected")]
        public void ThenTheUserValidatesIsSelected(string logicalName)
        {
            Assert.That(StepHelpers.IsSelected(logicalName));
        }

        [Then(@"the user validates that the element '(.*)' with value '(.*)' is selected")]
        public void ThenTheUserValidatesIsSelectedWithParameters(string logicalName, string value)
        {
            Assert.That(StepHelpers.IsSelected(logicalName, value));
        }

        [Then(@"the user validates that the element '([^']*)' with value '([^']*)' is of type '([^']*)'")]
        public void ThenTheUserValidatesThetTheWithValueTypeIs(string element, string elementValue, string elementType)
        {
            string[] values = { elementValue };
            AbstractedBy elementBy = Selenium.GetAbstractedBy(element, values);
            Selenium.ValidateAllElementsLoaded(elementBy);
            Assert.IsTrue(Selenium.ValidateElementType(elementBy, elementType, 30), "This element '" + element + "' is not of type '" + elementType + "'.");
        }

        [Then(@"the user validates that the checkbox container '([^']*)' with value '([^']*)' is set to the state: '([^']*)'")]
        public void ThenTheUserThatTheWithValueIs(string element, string elementValue, string onOrOff)
        {
            bool attributeType = false;
            string[] values = { elementValue };
            AbstractedBy elementBy = Selenium.GetAbstractedBy(element, values);
            IWebElement checkbox = Selenium.GetVisibleElement(elementBy);
            if (!checkbox.TagName.Equals("input"))
            {
                attributeType = Selenium.Sm1ContainerHasAttribute(elementBy, "class", "x-form-cb-checked", 15);
            }
            else
            {
                attributeType = checkbox.Selected;
            }
            bool state = onOrOff.Trim().ToLower().Equals("on");
            Assert.That(attributeType == state, $"Failed to validate that '{element}' with the value '{elementValue}' is in the correct state. Actual: <{state}>");
        }

        [Then(@"the user validates that the '(.*)' with value '(.*)' has number of characters '(.*)'")]
        public void ThenValidatesThatTheWithValueHasNumberOfCharacters(string logicalName, string value, string expectedNumberOfCharacters)
        {
            object[] values = { value };
            Assert.That(Selenium.GetText(Selenium.GetAbstractedBy(logicalName, values)).Length.ToString().Equals(expectedNumberOfCharacters), "Failed to validate the number of characters in the '" + value + "' field is " + expectedNumberOfCharacters + ". Actual number of characters is : " + Selenium.GetText(Selenium.GetAbstractedBy(logicalName, values)).Length);
        }

        [Then(@"the user validates that the '(.*)' with value '(.*)' is selected")]
        public void ThenValidatesThatTheWithValueIsSelected(string logicalName, string value)
        {
            object[] values = { value };
            bool hasAttribute = Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName, values), "aria-selected", "true");
            Assert.That(hasAttribute, "Failed to validate that the '" + logicalName + "' labelled " + value + " is selected");
        }

        [Then(@"the user validates that the '(.*)' with value '(.*)' is not selected")]
        public void ThenValidatesThatTheWithValueIsNotSelected(string logicalName, string value)
        {
            object[] values = { value };
            bool hasAttribute = Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName, values), "aria-selected", "false") || !Selenium.FindOne(Selenium.GetAbstractedBy(logicalName, values)).GetAttribute("class").Contains("selected") || (Selenium.FindOne(Selenium.GetAbstractedBy(logicalName, values)).Selected == false);
            Assert.That(hasAttribute, "Failed to validate that the '" + logicalName + "' labelled " + value + " is not selected");
        }

        [Then(@"the user validates the '(.*)' is selected")]
        public void ThenValidatesThatTheWithValueIsSelected(string logicalName)
        {
            bool hasAttribute = Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "aria-selected", "true");
            Assert.That(hasAttribute, "Failed to validate that the '" + logicalName + "' is selected");
        }

        [Then(@"the user validates the '(.*)' is not selected")]
        public void ThenValidatesThatTheWithValueIsNotSelected(string logicalName)
        {
            bool hasAttribute = Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "aria-selected", "true");
            Assert.That(hasAttribute, "Failed to validate that the '" + logicalName + "' is selected");
        }

        [Then(@"the user validates the date '(.*)' is selected in the calendar")]
        public void ThenValidatesTheDateWithValueIsSelectedInTheCalendar(string date)
        {
            Assert.That(StepHelpers.ValidateSelectedDateInCalendar(date));
        }

        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is not shown")]
        public void ThenTheUserValidatesThatTheWithValueIsNotShown(string element, string value)
        {
            string[] values = { value };
            AbstractedBy elementBy = Selenium.GetAbstractedBy(element, values);
            Assert.IsFalse(Selenium.ValidateElementOnPage(elementBy), "Failed to validate that '" + element + "' with the value '" + value + "' is shown.");
        }

        [Then(@"the user validates that an alert is displayed")]
        public void ThenValidatesThatAnAlertIsDisplayed()
        {
            Assert.That(StepHelpers.IsAlertDisplayed());
        }

        [Then(@"the user validates that the retrieved value is equal to the username currently logged in")]
        public void ThenTheUserValidatesThatTheRetrievedValueIsEqualToTheUsernameCurrentlyLoggedIn()
        {
            string username = RetrieveUserName();
            Selenium.Click(UserProfile.HomeToolbarUserButton);
            Assert.That(RetrievedValue.Trim().Equals(username.Trim()), "Failed to validate that expected user: '" + RetrievedValue + "' is valid. Actual User: '" + username + "'.");
        }

        [Then(@"the user validates that the number of '([^']*)' with value '([^']*)' is '([^']*)'")]
        public void ThenTheUserValidatesThatTheNumberOfWithValueIs(string element, string value, string rowNumber)
        {
            string[] values = { value };
            AbstractedBy elementBy = Selenium.GetAbstractedBy(element, values);
            List<IWebElement> countElement = Selenium.Find(elementBy, 30);
            Assert.AreEqual(countElement.Count().ToString(), rowNumber.ToString(), "The actual number of elements are " + countElement.Count().ToString());
        }

        [Then(@"the user validates that the '(.*)' with value '(.*)' is hovered over")]
        public void ThenTheUserValidatesThatTheWithValueIsHoveredOver(string logicalName, string arg)
        {
            string[] values = { arg };
            Assert.That(Selenium.FindOne(Selenium.GetAbstractedBy(logicalName, values)).GetAttribute("class").ToLower().Contains("hovered"));
        }

        [Then(@"the user validates that the '([^']*)' with date value '([^']*)' is visible")]
        public void ThenTheUserValidatesThatTheWithDateValueIsVisible(string elementLogicalName, string value)
        {
            Assert.That(StepHelpers.ValidateElementWithValueVisible(ScenarioContext, elementLogicalName, value, true), "Element " + elementLogicalName + " with value " + value + " did not qualify as not being displayed");
        }

        [Then(@"the user validates that '([^']*)' with value one '([^']*)' and value two '([^']*)' has date text '([^']*)'")]
        public void ThenTheUserValidatesThatWithValueOneAndValueTwoHasText(string elementName, string value1, string value2, string expectedElementText)
        {
            expectedElementText = CommonDates.DateParser(expectedElementText);
            string[] values = { value1, value2 };
            Selenium.FluentWaitForText(Selenium.GetAbstractedBy(elementName, values), expectedElementText);
            string actualText = Selenium.GetText(Selenium.GetAbstractedBy(elementName, values));
            Assert.AreEqual(actualText, expectedElementText, "The expected text " + expectedElementText + " is not the same as actual text: " + actualText);
        }

        [Then(@"the user validates that the page with '([^']*)' with value '([^']*)' is loaded")]
        public void ThenTheUserValidatesThatThePageWithWithValueIsLoaded(string elementLogicalName, string value)
        {
            object[] args = { value };
            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy(elementLogicalName, args));
        }

        [Then(@"the user validates that the '(.*)' is downloaded successfully")]
        public void ThenTheUserValidatesThatTheIsDownloadedSuccessfully(string fileName)
        {
            Assert.That(StepHelpers.isFileDownloaded(fileName), "Failed to validate that the '" + fileName + "' file is downloaded");
            StepHelpers.DeletedFile(fileName);
        }

        [Then(@"the user validates that '([^']*)' with value '([^']*)' is read-only")]
        public void ThenTheUserValidatesThatFieldIsRead_Only(string elementName, string value)
        {
            string[] values = { value };
            IWebElement element = Selenium.FindOne(Selenium.GetAbstractedBy(elementName, values));

            int count = 0;
            while ((!element.Displayed && count < 5))
            {
                count++;
                Thread.Sleep(1000);
            }

            Assert.IsTrue(element.GetAttribute("aria-readonly").Contains("true"), "Element " + element + " with value " + elementName + " did not qualify as a read-only");
        }

        [Then(@"the user validates that '([^']*)' with value '([^']*)' is editable")]
        public void ThenTheUserValidatesThatFieldIsEditable(string elementName, string value)
        {
            string[] values = { value };
            IWebElement element = Selenium.FindOne(Selenium.GetAbstractedBy(elementName, values));

            int count = 0;
            while ((!element.Displayed && count < 5))
            {
                count++;
                Thread.Sleep(1000);
            }

            Assert.IsTrue(element.GetAttribute("aria-readonly").Contains("false"), "Element " + element + " with value " + elementName + " did not qualify as a read-only");
        }

        [Then(@"user validates that '(.*)' has value of '(.*)' '(.*)' '(.*)'")]
        public void ThenTheUserValidatesThatHasValueOfPlus(string expectedValue, string value1, string operation, string value2)
        {
            var intValue1 = int.Parse(GetValue(value1), NumberStyles.AllowThousands | NumberStyles.AllowLeadingSign | NumberStyles.AllowDecimalPoint);
            var intValue2 = int.Parse(GetValue(value2), NumberStyles.AllowThousands | NumberStyles.AllowLeadingSign | NumberStyles.AllowDecimalPoint);
            var intExpectedValue = int.Parse(GetValue(expectedValue), NumberStyles.AllowThousands | NumberStyles.AllowLeadingSign | NumberStyles.AllowDecimalPoint);

            int calculatedResult = 0;
            switch (operation)
            {
                case "plus":
                    calculatedResult = intValue1 + intValue2;
                    break;
                case "percent":
                    calculatedResult = intValue1 * (intValue2 / 100);
                    break;
                default:
                    Assert.Fail("Operation not found");
                    break;
            }

            Assert.AreEqual(intExpectedValue, calculatedResult, $"{expectedValue} does not equal calculated result {calculatedResult}. expected is {value1} + {value2}");
        }

        [Then(@"the user validates '(.*)' is not displayed")]
        public void ThenTheIsNotVisible(string elementName)
        {
            object[] args = { };
            var element = Selenium.FindOne(Selenium.GetAbstractedBy(elementName, args), 30);
            Assert.That(!element.Displayed, "Element " + elementName + " did not qualify as being hidden");
        }

        [Then(@"the user validates that the element '(.*)' attribute '(.*)' is '(.*)'")]
        [Then(@"the user waits for the element '(.*)' attribute '(.*)' to be '(.*)'")]
        public void ThenTheUserWaitsForElementToBeEnabled(string logicalName, string attributeName, string state)
        {
            AbstractedBy element = Selenium.GetAbstractedBy(logicalName);
            Selenium.WaitForAttributeToBeInState(element, attributeName, state, PageLoadTimeout);
        }

        [Then(@"the user validates that '(.*)' with value '(.*)' attribute '(.*)' is '(.*)'")]
        [Then(@"the user waits for '(.*)' with value '(.*)' attribute '(.*)' to be '(.*)'")]
        public void ThenTheUserWaitsForToBeEnabled(string logicalName, string value, string attributeName, string state)
        {
            AbstractedBy element = Selenium.GetAbstractedBy(logicalName, new string[] { value });
            bool result = Selenium.WaitForAttributeToBeInState(element, attributeName, state);
            Assert.IsTrue(result, "The " + attributeName + " for " + logicalName + " did not change to " + state);
        }
    }
}