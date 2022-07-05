using Kantar_BDD.Pages;
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
using Kantar_BDD.Pages.Toolbar;
using Kantar_BDD.Support.Helpers;

namespace Kantar_BDD.StepDefinitions.Common
{
    [Binding]
    public class ValidationgStepDefinitions : SeleniumStepDefinition
    {
        private int PageLoadTimeout { get; set; } = 300;

        public ValidationgStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [Then(@"the user validates that '(.*)' with value '(.*)' has text '(.*)'")]
        public void ThenTheUserValidatesThatWithValueTextIs(string elementName, string value, string expectedElementText)
        {
            expectedElementText = GetValue(expectedElementText);
            string[] values = { value };
            Selenium.FluentWaitForText(Selenium.GetAbstractedBy(elementName, values), expectedElementText);
            string actualText = Selenium.GetText(Selenium.GetAbstractedBy(elementName, values));
            Assert.AreEqual(expectedElementText, actualText, "The expected text " + expectedElementText + " is not the same as actual text: " + actualText);
        }

        [Then(@"the user validates that the count for '(.*)' with value '(.*)' is '(.*)'")]
        public void ThenTheUserValidatesThatTheCountWithValueIs(string elementName, string value, string expectedElementText)
        {
            expectedElementText = GetValue(expectedElementText);
            string[] values = { value };
            AbstractedBy by = Selenium.GetAbstractedBy(elementName, values);
            Selenium.ValidateAllElementsLoaded(by);
            Assert.AreEqual(expectedElementText, Selenium.Find(by).Count.ToString(), $"The count is not the same as expected for {elementName}");
        }

        [Then(@"the user validates that the count for visible '(.*)' with value '(.*)' is '(.*)'")]
        public void ThenTheUserValidatesThatTheCountForVisibleWithValueIs(string elementName, string value, string expectedElementText)
        {
            expectedElementText = GetValue(expectedElementText);
            string[] values = { value };
            AbstractedBy by = Selenium.GetAbstractedBy(elementName, values);
            Selenium.ValidateAllElementsLoaded(by);
            Assert.AreEqual(expectedElementText, Selenium.Find(by).Where(x => x.Displayed).ToList().Count.ToString(), $"The count is not the same as expected for {elementName}");
        }

        [Then(@"the user validates that the count for visible elements '(.*)' is '(.*)'")]
        public void ThenTheUserValidatesThatTheCountForVisibleElements(string elementName, string expectedElementText)
        {
            expectedElementText = GetValue(expectedElementText);
            AbstractedBy by = Selenium.GetAbstractedBy(elementName, Array.Empty<string>());
            Selenium.ValidateAllElementsLoaded(by);
            Assert.AreEqual(expectedElementText, Selenium.Find(by).Where(x => x.Displayed).ToList().Count.ToString(), $"The count is not the same as expected for {elementName}");
        }

        [Then(@"the user validates that the value '(.*)' is equal to '(.*)'")]
        [Then(@"the user validates that the element '(.*)' is equal to '(.*)'")]
        [Then(@"the user validates that the element '(.*)' has text '(.*)'")]
        public void ThenTheUserValidatesTextIs(string elementName, string expectedElementText)
        {
            expectedElementText = GetValue(expectedElementText).ToString();
            string actualText;
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
            expectedElementText = GetValue(expectedElementText).ToString();
            string actualText;
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
            value = GetValue(value);
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
        public void ThenTheIsVisible(string elementLogicalName)
        {
            Assert.IsTrue(StepHelpers.ValidateElementVisible(Selenium.GetAbstractedBy(elementLogicalName)), "Element " + elementLogicalName + " did not qualify as being displayed");
        }

        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is visible")]
        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is displayed")]
        public void ThenTheWithValueIsVisible(string elementLogicalName, string value)
        {
            value = GetValue(value);
            Assert.IsTrue(StepHelpers.ValidateElementVisible(Selenium.GetAbstractedBy(elementLogicalName, new String[] { value })), "Element " + elementLogicalName + " with value " + value + " did not qualify as being displayed");
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
        public void ThenIsPopulatedWith(string element, string text)
        {
            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy(element));
            Selenium.FluentWaitForText(Selenium.GetAbstractedBy(element), text);
            var elementValue = Selenium.GetText(Selenium.GetAbstractedBy(element));
            Assert.That(elementValue.Equals(text), "Failed to validate that '" + element + "' is populated with the correct value, expected - " + text + ", but found - " + elementValue);

        }

        [Then(@"the user validates the '(.*)' has no text")]
        [Then(@"the user validates the '(.*)' is empty")]
        public void ThenTheUserValidatesTheIsEmpty(string logicalName)
        {
            Selenium.FluentWaitForText(Selenium.GetAbstractedBy(logicalName), string.Empty);
            Assert.IsTrue(StepHelpers.TextboxIsEmpty(Selenium.GetAbstractedBy(logicalName)), "Failed to validate that '" + logicalName + "' has no text. Actual text - " + Selenium.GetText(Selenium.GetAbstractedBy(logicalName)));
        }

        [Then(@"the user validates that the '(.*)' with value '(.*)' has no text")]
        [Then(@"the user validates that the '(.*)' with value '(.*)' is empty")]
        public void ThenTheUserValidatesTheIsEmpty(string logicalName, string value)
        {
            Selenium.FluentWaitForText(Selenium.GetAbstractedBy(logicalName, new string[] { value }), string.Empty);
            Assert.IsTrue(StepHelpers.TextboxIsEmpty(Selenium.GetAbstractedBy(logicalName, new string[] { value })), "Failed to validate that '" + logicalName + "'" + " with value '" + value + "' has no text. Actual text - " + Selenium.GetText(Selenium.GetAbstractedBy(logicalName, new string[] { value })));
        }

        [Then(@"the user validates the '([^']*)' is not empty")]
        public void ThenTheUserValidatesTheIsNotEmpty(string logicalName)
        {
            Assert.IsFalse(StepHelpers.TextboxIsEmpty(Selenium.GetAbstractedBy(logicalName)), "Failed to validate that '" + logicalName + "' has text. Actual text - "+ Selenium.GetText(Selenium.GetAbstractedBy(logicalName)));
        }

        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is not empty")]
        public void ThenTheUserValidatesThatTheWithValueIsNotEmpty(string logicalName, string value)
        {
            AbstractedBy by = Selenium.GetAbstractedBy(logicalName, new String[] { value });
            Assert.IsFalse(StepHelpers.TextboxIsEmpty(by), "Failed to validate that '" + logicalName + "' with value '" + value + "' is not empty. Actual text - " + Selenium.GetText(by));
        }

        [Then(@"the user validates the '([^']*)' is enabled")]
        public void ThenTheUserValidatesTheIsEnabled(string logicalName)
        {
            bool hasAttribute = Selenium.HasAttribute(Selenium.GetAbstractedBy(logicalName), "aria-readonly", "false") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "aria-disabled", "false") || !Selenium.HasAttribute(Selenium.GetAbstractedBy(logicalName), "class", "disabled");
            if (!hasAttribute)
            {
                hasAttribute = Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "aria-readonly", "false") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "aria-disabled", "false") || !Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "class", "disabled");
            }

            Assert.IsTrue(hasAttribute, logicalName + " did not qualify as being Enabled");
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
            Assert.IsTrue(hasAttribute, logicalName + " with value '" + value + "' did not qualify as being Enabled");
        }

        [Then(@"the user validates that the column '([^']*)' is editable")]
        public void ThenTheUserValidatesColumnIsEditable(string columnName)
        {
            AbstractedBy by = BasicGrid.ColumnContainer(columnName);
            Assert.IsTrue(Selenium.HasAttribute(by, "class", "sm1-column-editable"), "Column " + columnName + " did not qualify as being editable");
        }

        [Then(@"the user validates that the column '([^']*)' is not editable")]
        public void ThenTheUserValidatesColumnIsNotEditable(string columnName)
        {
            AbstractedBy by = BasicGrid.ColumnContainer(columnName);
            Assert.IsFalse(Selenium.HasAttribute(by, "class", "sm1-column-editable"), "Column " + columnName + " did not qualify as NOT being editable");
        }

        [Then(@"the user validates the '([^']*)' is disabled")]
        public void ThenTheUserValidatesTheIsDisabled(string logicalName)
        {
            bool hasAttribute = Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "aria-readonly", "true") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "aria-disabled", "true") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "class", "disabled") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "class", "x-item-disabled");
            if (!hasAttribute)
            {
                hasAttribute = Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "aria-readonly", "true") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "aria-disabled", "true") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "class", "disabled") || Selenium.Sm1ContainerHasAttribute(Selenium.GetAbstractedBy(logicalName), "disabled", "true");
            }
            Assert.IsTrue(hasAttribute, "Element " + logicalName + " did not qualify as being Disabled");
        }

        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is disabled")]
        public void ThenTheUserValidatesTheIsDisabledWithParams(string logicalName, string value)
        {
            object[] values = { value };
            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy(logicalName, values));
            bool hasAttribute = StepHelpers.IsDisabled(Selenium.GetAbstractedBy(logicalName, values));
            Assert.IsTrue(hasAttribute, "Element " + logicalName + " with value '" + value + "' did not qualify as being Disabled");
        }

        [Then(@"the user validates that the user is on the '([^']*)' page")]
        public void ThenTheUserIsOnThePage(string pageName)
        {
            Assert.True(StepHelpers.ValidateThatUserIsOnPage(pageName), "'" + pageName + "' Page not loaded");
        }

        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is not displayed")]
        public void ThenTheWithValueIsNotDisplayed(string elementLogicalName, string value)
        {
            if (!value.Contains(";"))
            {
                AbstractedBy element = Selenium.GetAbstractedBy(elementLogicalName, StepHelpers.CheckArguments(ScenarioContext, new string[] { value }));
                Selenium.FluentWaitElementToBeNotVisible(element);
                Assert.False(StepHelpers.ValidateElementVisible(element), "Element " + elementLogicalName + " did not qualify as not being displayed");
            }
            else
            {
                string[] values = value.Split(";");
                foreach (string val in values)
                {
                    AbstractedBy element = Selenium.GetAbstractedBy(elementLogicalName, StepHelpers.CheckArguments(ScenarioContext, new string[] { val }));
                    Selenium.FluentWaitElementToBeNotVisible(element);
                    Assert.False(StepHelpers.ValidateElementVisible(element), $"Element {elementLogicalName} with value {value} did not qualify as not being displayed");
                }
            }
        }

        [Then(@"the user validates that the '([^']*)' is not displayed")]
        public void ThenTheIsNotDisplayed(string logicalName)
        {
            Selenium.FluentWaitElementToBeNotVisible(Selenium.GetAbstractedBy(logicalName), 60);
            Assert.False(StepHelpers.ValidateElementVisible(Selenium.GetAbstractedBy(logicalName)), $"Element {logicalName} did not qualify as not being displayed");
        }

        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is not present")]
        public void ThenTheWithValueIsNotPresent(string elementLogicalName, string value)
        {
            Selenium.FluentWaitElementToBeNotPresentInDOM(Selenium.GetAbstractedBy(elementLogicalName, new string[] { value }), 60);
            Assert.That(Selenium.Find(Selenium.GetAbstractedBy(elementLogicalName, new string[] { value })).Count < 1, "Element " + elementLogicalName + " did not qualify as not being present");
        }

        [Then(@"the user validates that the '([^']*)' is not present")]
        public void ThenTheIsNotPresent(string logicalName)
        {
            Selenium.FluentWaitElementToBeNotPresentInDOM(Selenium.GetAbstractedBy(logicalName, new string[] { }), 60);
            Assert.That(Selenium.Find(Selenium.GetAbstractedBy(logicalName)).Count < 1, "Element " + logicalName + " did not qualify as not being present");
        }

        [Then(@"the user validates that the Loading Mask is not present")]
        public void ThenTheUserValidatesThatTheLoadingMaskIsNotPresent()
        {
            Selenium.FluentWaitElementToBeNotPresentInDOM(Selenium.GetAbstractedBy("Loading Mask", new string[] { }), 300);
            Assert.That(Selenium.Find(GenericElementsPage.LoadingMaskVisible).Count < 1, "Loading Mask did not qualify as not being present");
        }

        [Then(@"the user validates that '(.*)' type is '(.*)'")]
        public void ThenTheUserValidatesThatTypeIs(string element, string elementType)
        {
            AbstractedBy elementBy = Selenium.GetAbstractedBy(element);
            Assert.IsTrue(Selenium.ValidateElementType(elementBy, elementType, 30), "This element '" + element + "' is not of type '" + elementType + "'.");
        }

        [Then(@"the user validates that '(.*)' text contains '(.*)'")]
        public void ThenTheUserValidatesThatTextContains(string element, string text)
        {
            text = GetValue(text);
            var savedValue = string.Empty;
            if (IsKey(element))
            {
                savedValue = GetValue(element);
            }
            else
            {
                int count = 0;
                while (!Selenium.GetText(Selenium.GetAbstractedBy(element)).Contains(text) && count < 60)
                {
                    Thread.Sleep(100);
                    count++;
                }
                savedValue = Selenium.GetText(Selenium.GetAbstractedBy(element));
            }

            Assert.That(savedValue.ToLower().Contains(text.ToLower()), $"Failed to validate populated data, expected - {text.ToLower()}, but found - {savedValue}");
        }

        [Then(@"the user validates that '(.*)' text with value '(.*)' contains '(.*)'")]
        public void ThenTheUserValidatesThatTextWithValueContains(string element, string value, string text)
        {
            text = GetValue(text);
            int count = 0;
            while (!Selenium.GetText(Selenium.GetAbstractedBy(element, new string[] { value })).Contains(text) && count < 5)
            {
                Thread.Sleep(1000);
                count++;
            }
            Assert.That(Selenium.GetText(Selenium.GetAbstractedBy(element, new string[] { value })).ToLower().Contains(text.ToLower()), "Failed to validate data, expected text to contain - " + text.ToLower() + ", but found - " + Selenium.GetText(Selenium.GetAbstractedBy(element, new string[] { value })).ToLower());
        }

        [Then(@"the user validates that '(.*)' with value '(.*)' contains text '(.*)'")]
        public void ThentheUserValidatesThatElementWithValueContains(string element, string value, string text)
        {
            text = GetValue(text);
            Selenium.FluentWaitForText(Selenium.GetAbstractedBy(element, new string[] { value }), text, 15, false);
            var elementValue = Selenium.GetText(Selenium.GetAbstractedBy(element, new string[] { value }));
            Assert.That(elementValue.ToLower().Contains(text.ToLower()), "Failed to validate populated data, expected - " + text.ToLower() + ", but found - " + elementValue.ToLower());
        }

        [Then(@"the user validates that '(.*)' is marked as \(true/false\): '(.*)'")]
        public void ThenTheUserValidatesThatIsMarkedAsTrueFalse(string checkboxElement, string trueOrFalse)
        {
            bool convertArg = trueOrFalse.ToLower().Trim().Equals("true") || trueOrFalse.ToLower().Trim().Equals("yes") || trueOrFalse.ToLower().Trim().Equals("checked");
            bool vaidate = Selenium.ValidateCheckbox(Selenium.GetAbstractedBy(checkboxElement));
            Assert.IsTrue(convertArg == vaidate, "Failed to validate that '" + checkboxElement + "' is marked as '" + trueOrFalse + "'");
        }

        [Then(@"the user validates that '(.*)' with value '(.*)' is marked as: '(.*)'")]
        public void ThenTheUserValidatesThatElemementWithValueIsMarkedAsTrueFalse(string checkboxElement, string value, string trueOrFalse)
        {
            bool convertArg = trueOrFalse.ToLower().Trim().Equals("true") || trueOrFalse.ToLower().Trim().Equals("yes") || trueOrFalse.ToLower().Trim().Equals("checked");
            bool vaidate = Selenium.ValidateCheckbox(Selenium.GetAbstractedBy(checkboxElement, new string[] { value }));
            Assert.IsTrue(convertArg == vaidate, "Failed to validate that '" + checkboxElement + "' with value '" + value + "' is marked as '" + trueOrFalse + "'");
        }

        [Then(@"the user validates that there are '(.*)' element '(.*)' displayed and contains '(.*)'")]
        public void ThenTheUserValidatesThereIsOnlyOneStatus(string elementName, string numberOfElements, string elementText)
        {
            int numberOfElemts;
            IList<IWebElement> listOfElements = Selenium.Find(Selenium.GetAbstractedBy(elementName), 5);
            numberOfElemts = listOfElements.Count;
            Assert.AreEqual(int.Parse(numberOfElements), numberOfElemts, "The number of elements displayed '"+ numberOfElemts + "' in not equal to the expected number '"+ numberOfElements +"'");
            if (numberOfElemts > 0)
            {
                string fieldText = listOfElements[numberOfElemts - 1].Text;
                Assert.IsTrue(fieldText.Equals(elementText), "The retrieved text '" + fieldText + "' is not equal to the expected text '"+ elementText +"'");
            }
        }

        [Then(@"the user validates that the '(.*)' with value '(.*)' has a numeric value")]
        public void ThenTheUserValidatesThatTheElementHasANumericValueWithParams(string logicalName, string value)
        {
            Assert.IsTrue(StepHelpers.NumericValidation(Selenium.GetAbstractedBy(logicalName, new String[] { value })), "Failed to validate that the '" + logicalName + "' with value '" + value + "' has a numeric value");
        }

        [Then(@"the user validates the '(.*)' has a numeric value")]
        public void ThenTheUserValidatesThatTheElementHasANumericValue(string logicalName)
        {
            Assert.IsTrue(StepHelpers.NumericValidation(Selenium.GetAbstractedBy(logicalName)), "Failed to validate that the " + logicalName + " has a numeric value");
        }

        [Then(@"the user validates that the date field '(.*)' has '(.*)'")]
        public void ThenTheUserValidatesThatTheDateFieldHas(string dateType, string dateString)
        {
            string retrievedDate = Selenium.GetText(Selenium.GetAbstractedBy(dateType));
            string convertedDate = CommonDates.DateParser(dateString);
            Assert.AreEqual(retrievedDate, convertedDate, "Failed to validate that the '" + dateType + "' has '" + dateString + "'");
        }

        [Then(@"the user validates that the '(.*)' is selected")]
        public void ThenTheUserValidatesIsSelected(string logicalName)
        {
            Assert.That(StepHelpers.IsSelected(Selenium.GetAbstractedBy(logicalName)), "Failed to validate that element with Logical Name '"+ logicalName + "' is selected");
        }

        [Then(@"the user validates that the element '(.*)' with value '(.*)' is selected")]
        public void ThenTheUserValidatesIsSelectedWithParameters(string logicalName, string value)
        {
            Assert.That(StepHelpers.IsSelected(Selenium.GetAbstractedBy(logicalName, new string[] { value })), "Failed to validate that element with Logical Name '"+ logicalName + "' and Value '"+ value + "' is selected");
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
            bool attributeType;
            string[] values = { elementValue };
            AbstractedBy elementBy = Selenium.GetAbstractedBy(element, values);
            IWebElement checkbox = Selenium.GetVisibleElement(elementBy);
            if (!checkbox.TagName.Equals("input"))
            {
                attributeType = Selenium.Sm1ContainerHasAttribute(elementBy, "class", "x-form-cb-checked");
            }
            else
            {
                attributeType = checkbox.Selected;
            }
            bool state = onOrOff.Trim().ToLower().Equals("on");
            Assert.That(attributeType == state, $"Failed to validate that '{element}' with the value '{elementValue}' is in the correct state. Actual: <{state}>");
        }


        [Then(@"the user validates that the checkbox '([^']*)' is not Checked")]
        public void ThenTheUserValidatesCheckBoxIsNotChecked(string element)
        {
            Assert.False(Selenium.ValidateCheckbox(Selenium.GetAbstractedBy(element)), $"Failed to validate that '{element}' is checked");
        }

        [Then(@"the user validates that the '(.*)' with value '(.*)' has a number of characters less than '(.*)'")]
        public void ThenValidatesThatTheWithValueHasNumberOfCharacters(string logicalName, string value, string expectedNumberOfCharacters)
        {
            object[] values = { value };
            int.TryParse(expectedNumberOfCharacters, out int numberOfCharsInt);
            Assert.That(Selenium.GetText(Selenium.GetAbstractedBy(logicalName, values)).Length < numberOfCharsInt, "Failed to validate that the number of characters in the '" + value + "' field is less than " + expectedNumberOfCharacters + ". Actual number of characters is : " + Selenium.GetText(Selenium.GetAbstractedBy(logicalName, values)).Length);
        }

        [Then(@"the user validates that the '(.*)' has a number of characters less than '(.*)'")]
        public void ThenValidatesThatTheHasNumberOfCharacters(string logicalName, string expectedNumberOfCharacters)
        {
            int.TryParse(expectedNumberOfCharacters, out int numberOfCharsInt);
            Assert.That(Selenium.GetText(Selenium.GetAbstractedBy(logicalName)).Length < numberOfCharsInt, "Failed to validate that the number of characters in the '" + logicalName + "' field is less than " + expectedNumberOfCharacters + ". Actual number of characters is : " + Selenium.GetText(Selenium.GetAbstractedBy(logicalName)).Length);
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
            Assert.That(StepHelpers.ValidateSelectedDateInCalendar(date), "Failed to Validate that date '"+ date +"' is selected in the calendar");
        }

        [Then(@"the user validates that the '([^']*)' with value '([^']*)' is not shown")]
        public void ThenTheUserValidatesThatTheWithValueIsNotShown(string element, string value)
        {
            string[] values = { value };
            AbstractedBy elementBy = Selenium.GetAbstractedBy(element, values);
            Assert.IsFalse(Selenium.ValidateElementOnPage(elementBy), "Failed to validate that '" + element + "' with the value '" + value + "' is shown.");
        }

        [Then(@"the user validates that a browser alert is displayed")]
        public void ThenValidatesThatABrowserAlertIsDisplayed()
        {
            Assert.That(Selenium.IsAlertDisplayed(), "Failed to validate that a browser alert is displayed");
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
            Assert.True(StepHelpers.ValidateElementVisible(Selenium.GetAbstractedBy(elementLogicalName, StepHelpers.CheckArguments(ScenarioContext, new String[] { value }, StepHelpers.IsLogicalNameForColumnName(elementLogicalName)))), "Element " + elementLogicalName + " with value " + value + " did not qualify as visible");
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

        [Then(@"the user validates that the File: '(.*)' is downloaded successfully")]
        public void ThenTheUserValidatesThatTheIsDownloadedSuccessfully(string fileName)
        {
            Assert.That(StepHelpers.IsFileDownloaded(fileName), "Failed to validate that the '" + fileName + "' file is downloaded");
            StepHelpers.DeletedFile(fileName);
        }

        [Then(@"the user validates that '([^']*)' with value '([^']*)' is read-only")]
        public void ThenTheUserValidatesThatFieldIsRead_Only(string elementName, string value)
        {
            string[] values = { value };
            AbstractedBy abstractedValue = Selenium.GetAbstractedBy(elementName, values);
            IWebElement element = Selenium.FindOne(abstractedValue);

            int count = 0;
            while ((!element.Displayed && count < 5))
            {
                count++;
                Thread.Sleep(1000);
            }

            Assert.IsTrue(Selenium.HasAttribute(abstractedValue, "class", "x-form-readonly") || Selenium.HasAttribute(abstractedValue, "aria-readonly", "true"), "Element " + element + " with value " + elementName + " did not qualify as a read-only");
        }

        [Then(@"the user validates that '([^']*)' with value '([^']*)' is editable")]
        public void ThenTheUserValidatesThatFieldIsEditable(string elementName, string value)
        {
            string[] values = { value };
            AbstractedBy elementBy = Selenium.GetAbstractedBy(elementName, values);
            IWebElement element = Selenium.FindOne(elementBy);

            int count = 0;
            while (!element.Displayed && count < 5)
            {
                count++;
                Thread.Sleep(1000);
            }

            Assert.IsTrue(Selenium.HasAttribute(elementBy, "aria-readonly", "false") || Selenium.HasAttribute(elementBy, "aria-disabled", "false"), "Element " + element + " with value " + elementName + " is not editable.");
        }


        [Then(@"user validates that '(.*)' is a result of value 1: '(.*)' operator: '(.*)' value 2: '(.*)'")]
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
                case "multiply":
                    calculatedResult = intValue1 * intValue2;
                    break;
                case "minus":
                    calculatedResult = intValue1 - intValue2;
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
            int count = 1;
            while(StepHelpers.ValidateElementVisible(Selenium.GetAbstractedBy(elementName)) && count < 15)
            {
                Thread.Sleep(500);
                count++;
            }

            Assert.IsFalse(StepHelpers.ValidateElementVisible(Selenium.GetAbstractedBy(elementName),5), "Element " + elementName + " did not qualify as being hidden");
        }

        [Then(@"the user validates that element: '(.*)' with attribute: '(.*)' is in state: '(.*)'")]
        public void ThenTheUserWaitsForElementToBeEnabled(string logicalName, string attributeName, string state)
        {
            AbstractedBy element = Selenium.GetAbstractedBy(logicalName);
            Assert.IsTrue(Selenium.WaitForAttributeToBeInState(element, attributeName, state, PageLoadTimeout), $"{logicalName} {attributeName} is not {state}");
        }

        [Then(@"the user validates that element: '(.*)' with value: '(.*)' and attribute: '(.*)' is in state: '(.*)'")]
        public void ThenTheUserWaitsForToBeEnabled(string logicalName, string value, string attributeName, string state)
        {
            AbstractedBy element = Selenium.GetAbstractedBy(logicalName, new string[] { value });
            bool result = Selenium.WaitForAttributeToBeInState(element, attributeName, state);
            Assert.IsTrue(result, "The " + attributeName + " for " + logicalName + " did not change to " + state);
        }

        [Then(@"the user validates that the '([^']*)' property for '([^']*)' with value '([^']*)' has a colour of '([^']*)'")]
        public void ThenTheUserValidatesThatTheHasAColourOf(string propertyName, string logicalName, string value, string expectedColorHexValue)
        {
            string[] values = { value };
            Selenium.FluentWaitElementToBeNotPresentInDOM(Selenium.GetAbstractedBy("Loading Mask", null), 5);
            string actualColor = Selenium.GetCSSProperty(Selenium.GetAbstractedBy(logicalName, values), propertyName);
            Assert.That(StepHelpers.ValidateRGBColour(expectedColorHexValue, actualColor), "Failed to validate that the '" + logicalName + "' with value '" + value + "' has color. Expected : " + expectedColorHexValue);
        }



        [Then(@"the user validates that the date '([^']*)' is disabled in field '([^']*)'")]
        public void ThenTheUserValidatesThatTheDateIsDisabledInField(string date, string dateField)
        {
            date = GetValue(date);
            Assert.IsFalse(StepHelpers.IsDateEnabled(Selenium.GetAbstractedBy(dateField), date), $"The date {date} is not disabled for field {dateField}");
        }

        [Then(@"the user validates that '([^']*)' with value one '([^']*)' and value two '([^']*)' is visible")]
        public void ThenTheUserValidatesThatWithValueOneAndValueTwoIsVisible(string elementLogicalName, string value1, string value2)
        {
            value1 = GetValue(value1);
            value2 = GetValue(value2);
            Assert.True(StepHelpers.ValidateElementVisible(Selenium.GetAbstractedBy(elementLogicalName, new String[] { value1, value2 })), "Element " + elementLogicalName + " with value " + value1 + " and value 2 " + value2 + " did not qualify as being displayed");
        }

        [Then(@"the user validates that the '([^']*)' with value one '([^']*)' and value two '([^']*)' is not visible")]
        public void ThenTheUserValidatesThatTheWithValueOneAndValueTwoIsNotShown(string element, string value1, string value2)
        {
            string[] values = { value1, value2 };
            AbstractedBy elementBy = Selenium.GetAbstractedBy(element, values);
            Assert.IsFalse(Selenium.ValidateElementOnPage(elementBy), "Failed to validate that '" + element + "' with the value 1 '" + value1 + "' and value 2 '" + value2 + "' is visible.");
        }

        [Then(@"the user validates that the expanded dropdown has the options '([^']*)'")]
        public void ThenTheUserValidatesThatTheWithValueHasTheOptions(string dropdownOptions)
        {
            Assert.True(StepHelpers.ValidateGetDropdownOptions(dropdownOptions.Split(';').ToList()), "Failed to validate that dropdown has options '"+ dropdownOptions + "'");
        }

        [Then(@"the user validates that the grid on Column: '([^']*)' is filtered by Filter Type: '([^']*)' for Value: '([^']*)'")]
        public void ThenTheUserValidatesThatTheGridOnColumnIsFilteredByFilterTypeForValue(string columnToValidate, string filterCondition, string filterValue)
        {
            Assert.That(GridStepHelpers.IsFilteredByCondition(columnToValidate, filterCondition, filterValue), "Failed to validate that the column '" + columnToValidate + "' is filtered correctly for the condition '" + filterCondition + "' for value '" + filterValue + "'");
        }

        [Given(@"the user is on the home page")]
        [Then(@"the user is on the home page")]
        public void GivenTheUserIsLoggedIn()
        {
            Assert.IsTrue(Selenium.ValidateElementDisplayed(TopToolbar.MenuButton, PageLoadTimeout), "Failed to login");
        }
    }
}