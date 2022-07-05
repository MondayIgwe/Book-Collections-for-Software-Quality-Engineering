using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Support.Selenium;
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
    public class SingleGridStepDefinitions : SeleniumStepDefinition
    {
        public SingleGridStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [Then(@"the user validates that the '([^']*)' singlegrid contains the value '([^']*)' in the '([^']*)' column in the row number '([^']*)'")]
        public void ThenTheUserValidatesInTheSingle_GridThatTheCellInRowNumberInTheColumnHasTheText(string tableName, string textToValidate, string columnName, string rowNumber)
        {
            AbstractedBy columns = Selenium.GetAbstractedBy(tableName + " Columns");
            AbstractedBy rows = Selenium.GetAbstractedBy(tableName + " Rows");
            int referenceColumnData = GridStepHelpers.GetColumnPosition(columns, columnName);
            string gridText = Selenium.GetText(BasicGrid.TextInCell(rows.ByToString, rowNumber.ToString(), referenceColumnData.ToString()));
            Assert.That(gridText.Trim().Contains(textToValidate.Trim()), $"Failed to validate that the text '{textToValidate}' is in {tableName} grid. Actual <{gridText}>");
            Selenium.LooseFocusFromAnElement();
        }

        [Then(@"the user validates that the '([^']*)' singlegrid contains the link value '([^']*)' in the '([^']*)' column in the row number '([^']*)'")]
        public void ThenTheUserValidatesThatTheSinglegridHasTheLinkValueInTheColumnInTheRowNumber(string tableName, string textToValidate, string columnName, string rowNumber)
        {
            AbstractedBy columns = Selenium.GetAbstractedBy(tableName + " Columns");
            AbstractedBy rows = Selenium.GetAbstractedBy(tableName + " Rows");
            int referenceColumnData = GridStepHelpers.GetColumnPosition(columns, columnName);
            string gridText = Selenium.GetText(BasicGrid.LinkTextInCell(rows.ByToString, rowNumber.ToString(), referenceColumnData.ToString()));
            Assert.That(gridText.Trim().Equals(textToValidate.Trim()), $"Failed to validate that the link text '{textToValidate}' is in {tableName} grid. Actual <{gridText}>");
            Selenium.LooseFocusFromAnElement();
        }

        [Then(@"the user validates that the '([^']*)' singlegrid has the checkbox cell is marked as '([^']*)' in the '([^']*)' column in the row where the '([^']*)' column is '([^']*)'")]
        public void ThenTheUserValidatesThatTheSingleGridHasTheCheckboxCellIsMarkedAsInTheColumnInTheRowWhereTheColumnIs(string tableName, string onOrOff, string columnName, string rowReferenceColumn, string rowData)
        {
            AbstractedBy columns = Selenium.GetAbstractedBy(tableName + " Columns");
            AbstractedBy rows = Selenium.GetAbstractedBy(tableName + " Rows");
            bool checkbox = GridStepHelpers.GetCheckboxCellStatus(rows, columns, rowReferenceColumn, rowData, columnName, 1);
            bool expected = onOrOff.Trim().Equals("on");
            Assert.That(checkbox == expected, $"Failed to validate that the checkbox cell is '{onOrOff}'. Expected: <{expected}> Actual: <{checkbox}>");
        }

        [Then(@"the user validates that the '([^']*)' singlegrid contains the span value '([^']*)' in the '([^']*)' column in the row number '([^']*)'")]
        public void ThenTheUserValidatesThatTheSinglegridContainsTheSpanValueInTheColumnInTheRowNumber(string tableName, string textToValidate, string columnName, string rowNumber)
        {
            AbstractedBy columns = Selenium.GetAbstractedBy(tableName + " Columns");
            AbstractedBy rows = Selenium.GetAbstractedBy(tableName + " Rows");
            int referenceColumnData = GridStepHelpers.GetColumnPosition(columns, columnName);
            string gridText = Selenium.GetText(BasicGrid.SpanTextInCell(rows.ByToString, rowNumber.ToString(), referenceColumnData.ToString()));
            Assert.That(gridText.Trim().Contains(textToValidate.Trim()), $"Failed to validate that the text '{textToValidate}' is in {tableName} grid. Actual <{gridText}>");
            Selenium.LooseFocusFromAnElement();
        }

        [Then(@"the user validates that the '([^']*)' singlegrid has the checkbox cell is marked as '([^']*)' in the '([^']*)' column in the row number '([^']*)'")]
        public void ThenTheUserValidatesThatTheSinglegridHasTheCheckboxCellIsMarkedAsInTheColumnInTheRowNumber(string tableName, string onOrOff, string columnName, string rowNumber)
        {
            AbstractedBy columns = Selenium.GetAbstractedBy(tableName + " Columns");
            AbstractedBy rows = Selenium.GetAbstractedBy(tableName + " Rows");
            bool checkbox = GridStepHelpers.GetCheckboxCellStatus(columns, rows, int.Parse(rowNumber), columnName);
            bool expected = onOrOff.Trim().Equals("on");
            Assert.That(checkbox == expected, $"Failed to validate that the checkbox cell is '{onOrOff}'. Expected: <{expected}> Actual: <{checkbox}>");
        }


        [Then(@"the user validates that the '([^']*)' singlegrid contains the retrieved value in the '([^']*)' column in the row number '([^']*)'")]
        public void ThenTheUserValidatesThatTheSinglegridContainsTheSpanRetirvedValueInTheColumnInTheRowNumber(string tableName, string columnName, string rowNumber)
        {
            AbstractedBy columns = Selenium.GetAbstractedBy(tableName + " Columns");
            AbstractedBy rows = Selenium.GetAbstractedBy(tableName + " Rows");
            int referenceColumnData = GridStepHelpers.GetColumnPosition(columns, columnName);
            string gridText = Selenium.GetText(BasicGrid.TextInCell(rows.ByToString, rowNumber.ToString(), referenceColumnData.ToString()));
            Assert.That(gridText.Trim().Contains(RetrievedValue.Trim()), $"Failed to validate that the text '{RetrievedValue}' is in {tableName} grid. Actual <{gridText}>");
            Selenium.LooseFocusFromAnElement();
        }

        [Then(@"the user validates that the '([^']*)' singlegrid contains '([^']*)' in the '([^']*)' column in the row number '([^']*)'")]
        public void ThenTheUserValidatesThatTheSinglegridContainsTheInTheColumnInTheRowNumber(string tableName, string text, string columnName, string rowNumber)
        {
            AbstractedBy columns = Selenium.GetAbstractedBy(tableName + " Columns");
            AbstractedBy rows = Selenium.GetAbstractedBy(tableName + " Rows");
            int referenceColumnData = GridStepHelpers.GetColumnPosition(columns, columnName);
            string gridText = Selenium.GetText(BasicGrid.TextInCell(rows.ByToString, rowNumber.ToString(), referenceColumnData.ToString()));
            Assert.That(gridText.Trim().Contains(text.Trim()), $"Failed to validate that the text '{text}' is in {tableName} grid. Actual <{gridText}>");
            Selenium.LooseFocusFromAnElement();
        }

        [Then(@"the user validates that the '([^']*)' singlegrid contains '([^']*)' in the '([^']*)' column in the row number '([^']*)' with an offset of '([^']*)'")]
        public void ThenTheUserValidatesThatTheSinglegridContainsInTheColumnInTheRowNumberWithAnOffsetOf(string tableName, string text, string columnName, string rowNumber, string offset)
        {
            AbstractedBy columns = Selenium.GetAbstractedBy(tableName + " Columns");
            AbstractedBy rows = Selenium.GetAbstractedBy(tableName + " Rows");
            int referenceColumnData = GridStepHelpers.GetColumnPosition(columns, columnName, int.Parse(offset));
            string gridText = Selenium.GetText(BasicGrid.TextInCell(rows.ByToString, rowNumber.ToString(), referenceColumnData.ToString()));
            Assert.That(gridText.Trim().Contains(text.Trim()), $"Failed to validate that the text '{text}' is in {tableName} grid. Actual <{gridText}>");
            Selenium.LooseFocusFromAnElement();
        }
    }
}
