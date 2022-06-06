using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class MultiGridStepDefinitions : SeleniumStepDefinition
    {
        public MultiGridStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }


        [Then(@"the user validates that the '([^']*)' multigrid has the value '([^']*)' in the '([^']*)' column in the row where the '([^']*)' column is '([^']*)'")]
        public void ThenTheUserValidatesThatTheGridHasTheValueInTheColumnInTheRowWhereTheColumnIs(string tableName, string textToValidate, string validationColumn, string rowReferenceColumn, string rowData)
        {
            AbstractedBy columns = Selenium.GetAbstractedBy(tableName + " Column");
            AbstractedBy rowsLeft = Selenium.GetAbstractedBy(tableName + " Left Rows");
            AbstractedBy rowsRight = Selenium.GetAbstractedBy(tableName + " Right Rows");
            string extractedText = GridStepHelpers.GetTextFromTable(columns, rowsLeft, rowsRight, validationColumn, rowReferenceColumn, rowData);
            Assert.That(extractedText.Trim().Equals(textToValidate.Trim()), $"{tableName} grid text validation failed. Expected: <{textToValidate}> Actual: <{extractedText}>");
        }

        [Then(@"the user validates that the '([^']*)' multigrid has the checkbox cell is marked as '([^']*)' in the '([^']*)' column in the row where the '([^']*)' column is '([^']*)'")]
        public void ThenTheUserValidatesThatTheGridHasTheCheckboxCellIsMarkedAsInTheColumnInTheRowWhereTheColumnIs(string tableName, string onOrOff, string validationColumn, string rowReferenceColumn, string rowData)
        {
            AbstractedBy columns = Selenium.GetAbstractedBy(tableName + " Column");
            AbstractedBy rowsLeft = Selenium.GetAbstractedBy(tableName + " Left Rows");
            AbstractedBy rowsRight = Selenium.GetAbstractedBy(tableName + " Right Rows");
            bool checkbox = GridStepHelpers.GetCheckboxCellStatus(columns, rowsLeft, rowsRight, rowReferenceColumn, rowData, validationColumn, 1);
            bool expected = onOrOff.Trim().Equals("on");
            Assert.That(checkbox == expected, $"Failed to validate that the checkbox cell is '{onOrOff}'. Expected: <{expected}> Actual: <{checkbox}>");
        }

        [Then(@"the user validates that the '([^']*)' multigrid has the value '([^']*)' in the '([^']*)' column in the row number '([^']*)'")]
        public void ThenTheUserValidatesThatTheMultigridHasTheValueInTheColumnInTheRowNumber(string tableName, string textToValidate, string columnName, string rowNumber)
        {
            AbstractedBy columns = Selenium.GetAbstractedBy(tableName + " Column");
            AbstractedBy rowsLeft = Selenium.GetAbstractedBy(tableName + " Left Rows");
            AbstractedBy rowsRight = Selenium.GetAbstractedBy(tableName + " Right Rows");
            Selenium.Driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromMilliseconds(250);
            string extractedText = GridStepHelpers.GetTextFromTable(columns, rowsLeft, rowsRight, columnName, int.Parse(rowNumber), 1);
            Assert.That(extractedText.Trim().Equals(textToValidate.Trim()), $"{tableName} grid text validation failed. Expected: <{textToValidate}> Actual: <{extractedText}>");
        }

        [Then(@"the user validates that the '([^']*)' multigrid has the checkbox cell is marked as '([^']*)' in the '([^']*)' column in the row number '([^']*)'")]
        public void ThenTheUserValidatesThatTheMultigridHasTheCheckboxCellIsMarkedAsInTheColumnInTheRowNumber(string tableName, string onOrOff, string columnName, string rowNumber)
        {
            AbstractedBy columns = Selenium.GetAbstractedBy(tableName + " Column");
            AbstractedBy rowsLeft = Selenium.GetAbstractedBy(tableName + " Left Rows");
            AbstractedBy rowsRight = Selenium.GetAbstractedBy(tableName + " Right Rows");
            Selenium.Driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromMilliseconds(250);
            bool checkbox = GridStepHelpers.GetCheckboxCellStatus(columns, rowsLeft, rowsRight, int.Parse(rowNumber), columnName, 1);
            bool expected = onOrOff.Trim().Equals("on");
            Assert.That(checkbox == expected, $"Failed to validate that the checkbox cell is '{onOrOff}'. Expected: <{expected}> Actual: <{checkbox}>");
        }

        [When(@"the user clicks and enters the date '([^']*)' in the '([^']*)' multigrid table in the '([^']*)' column name: '([^']*)' in row number: '([^']*)'")]
        public void WhenTheUserClicksAndEntersTheDateInTheMultigridTableInTheColumnNameInRowNumber(string textToEnter, string tableName, string upperOrLower, string columnName, string rowNumber)
        {
            GridStepHelpers.ClickOnMultiGridCellAndEnterDateText(tableName, upperOrLower, columnName, rowNumber, textToEnter);
        }

        [When(@"the user clicks and enters the text '([^']*)' in the '([^']*)' multigrid table in the '([^']*)' column name: '([^']*)' in row number: '([^']*)'")]
        public void WhenTheUserClicksAndEntersTheTextInTheMultigridTableInTheColumnNameInRowNumber(string textToEnter, string tableName, string upperOrLower, string columnName, string rowNumber)
        {
            GridStepHelpers.ClickOnMultiGridCellAndEnterText(tableName, upperOrLower, columnName, rowNumber, textToEnter);
        }


        [Then(@"the user validates that the '([^']*)' multigrid contains the date value '([^']*)' in the '([^']*)' column in the row number '([^']*)'")]
        public void ThenTheUserValidatesThatTheMultigridContainsTheDateValueInTheColumnInTheRowNumber(string tableName, string textToValidate, string columnName, string rowNumber)
        {
            textToValidate = CommonDates.DateParser(textToValidate);
            AbstractedBy columns = Selenium.GetAbstractedBy(tableName + " Column");
            AbstractedBy rowsLeft = Selenium.GetAbstractedBy(tableName + " Left Rows");
            AbstractedBy rowsRight = Selenium.GetAbstractedBy(tableName + " Right Rows");
            Selenium.Driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromMilliseconds(250);
            string extractedText = GridStepHelpers.GetTextFromTable(columns, rowsLeft, rowsRight, columnName, int.Parse(rowNumber), 1);
            Assert.That(extractedText.Trim().Contains(textToValidate.Trim()), $"{tableName} grid text validation failed. Expected: <{textToValidate}> Actual: <{extractedText}>");
        }

        [Then(@"the user validates that the '([^']*)' multigrid contains the username currently logged in in the '([^']*)' column in the row number '([^']*)'")]
        public void ThenTheUserValidatesThatTheMultigridContainsTheUsernameCurrentlyLoggedInInTheColumnInTheRowNumber(string tableName, string columnName, string rowNumber)
        {
            AbstractedBy columns = Selenium.GetAbstractedBy(tableName + " Column");
            AbstractedBy rowsLeft = Selenium.GetAbstractedBy(tableName + " Left Rows");
            AbstractedBy rowsRight = Selenium.GetAbstractedBy(tableName + " Right Rows");
            Selenium.Driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromMilliseconds(250);
            string username = RetrieveUserName();
            string extractedText = GridStepHelpers.GetTextFromTable(columns, rowsLeft, rowsRight, columnName, int.Parse(rowNumber), 1);
            Assert.That(extractedText.Trim().Contains(username.Trim()), $"{tableName} grid text validation failed. Expected: <{username}> Actual: <{extractedText}>");
        }


    }
}
