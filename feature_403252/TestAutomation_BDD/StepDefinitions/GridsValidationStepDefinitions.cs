using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.SFA.Containers;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Support.Helpers;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Interactions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using TechTalk.SpecFlow;
using System.Globalization;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class GridsValidationStepDefinitions : SeleniumStepDefinition
    {
        int counter = 0;
        public GridsValidationStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [Then(@"the user validates that the cell by smOne ID in the row where '([^']*)','([^']*)' has text '([^']*)'")]
        public void ThenTheUserValidatesThatTheCellBySmOneIDInTheRowWhereHasText(string column, string row, string text)
        {
            var colName = Selenium.FindOne(AGGrid.GetColumnID(column));
            var rowID = Selenium.FindOne(AGGrid.GetRowID(row));

            if (colName.Text.Equals(column) || rowID.Text.Equals(row))
            {
                var element = Selenium.FindOne(AGGrid.GetRowText(text));
                string eleText = element.Text;
                Assert.That(eleText.Contains(text), $"Failed to validate that the expected value is in the Aggrid. Actual: <{eleText}> Expected: <{text}>");
            }

        }

        [Then(@"the user validates on the Aggrid Grid table '([^']*)' at row: '([^']*)' and column: '([^']*)' and has the text '([^']*)'")]
        public void ThenTheUserValidatesOnTheAggridGridTableAtRowAndColumnAndHasTheText(string aggridTableName, string aggridRowID, string aggridColumnID, string text)
        {  
            Selenium.ValidateEnabledAndDisplayed(AGGrid.ColumnSelect(aggridRowID, aggridColumnID), 60);
            var element = Selenium.FindOne(AGGrid.ColumnSelect(aggridRowID, aggridColumnID));
            string eleText = element.Text;
            Assert.That(eleText.Contains(text), $"Failed to validate that the exopected value is in the Aggrid. Actual: <{eleText}> Expected: <{text}>");
        }

        [Then(@"the user validates on the Rebates Grid row: '([^']*)' and column: '([^']*)' has the text '([^']*)'")]
        public void ThenTheUserValidatesOnTheRebatesTableAtRowAndColumnAndHasTheText(string row, string column, string value)
        {
            value = GetValue(value);

            var element = Selenium.FindOne(RebatesGrid.DivByColumnAndRow(row, column));
            Assert.That(element.Text.Contains(value), "Failed to validate that test was entered succesfully");
        }

        [Then(@"the user validates that column '(.*)' has '(.*)' with row text '(.*)'")]
        public void TheTheUserValidatesColumnValue(string columnName, string value, string rowText)
        {
            string retrievedValue = string.Empty;
                       
            value = GetValue(value);
            rowText = GetValue(rowText);
            Selenium.FluentWaitForText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText), value);
            retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText));

            Assert.AreEqual(value.Trim(), retrievedValue.Trim());
        }

        [Then(@"the user validates that column '(.*)' has '(.*)' with row number '(.*)'")]
        public void TheTheUserValidatesColumnValueByRowNumber(string columnName, string value, string rowNumber)
        {
            string retrievedValue = string.Empty;
            value = GetValue(value);
            Selenium.FluentWaitForText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowNumber(columnName, rowNumber), value);
            retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowNumber(columnName, rowNumber));
            Assert.AreEqual(value.Trim(), retrievedValue.Trim());
        }

        [Then(@"the user validates that column '(.*)' contains '(.*)' with row text '(.*)'")]
        public void TheTheUserValidatesColumnContainsValue(string columnName, string value, string rowText)
        {
            string retrievedValue = string.Empty;
            value = GetValue(value);
            rowText = GetValue(rowText);
            retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText));
            Assert.True(retrievedValue.Trim().Contains(value.Trim()));
        }

        [Then(@"the user validates that the '([^']*)' on the Aggrid Grid table at row: '([^']*)' and column: '(.*)' is disabled")]
        public void ThenTheUserValidatesThatTheOnTheAggridGridTableAtRowAndColumnIsDisabled(string aggridContextMenu, string aggridRowID, string aggridColumnID)
        {
            aggridRowID = aggridRowID.ToUpper().Replace(" ", "_");
            Selenium.RightClick(Selenium.GetAbstractedBy("Column Identifier " + aggridRowID + " " + aggridColumnID, new object[] { aggridRowID, aggridColumnID }));
            Selenium.RightClick(AGGrid.ColumnSelect(aggridRowID, aggridColumnID));
            var path = aggridContextMenu.Split(" > ");

            //Context Menu must be opened without crashing - hover until last part of path
            for (int i = 0; i < path.Length; i++)
            {
                if (i != (path.Length - 1))
                {
                    Selenium.Hover(AGGrid.ContextMenuItem(path[i]));
                    bool hasAttribute = Selenium.Sm1ContainerHasAttribute(AGGrid.ContextMenuItem(path[i]), "class", "ag-menu-option-text") || Selenium.Sm1ContainerHasAttribute(AGGrid.ContextMenuItem(path[i]), "class", "ag-menu ag-ltr");
                    Assert.IsTrue(hasAttribute, "Element " + aggridContextMenu + " did not qualify as being Disabled");
                }


            }
        }

        [Then(@"the user validates that elements '(.*)' have loaded")]
        public void ThenTheUserValidateThatTableElementsHaveLoaded(string elementName)
        {
            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy(elementName));
        }

        [Then(@"the user validates that the '([^']*)' column is sorted in '([^']*)' order")]
        public void ThenTheUserValidatesThatTheColumnIsSortedInOrder(string columnName, string sortOrder)
        {
            if (sortOrder.ToLower().Trim().Contains("asc")) { sortOrder = "ascending"; }
            else if (sortOrder.ToLower().Trim().Contains("desc")) { sortOrder = "descending"; }
            Assert.That(Selenium.ValidateEnabledAndDisplayed(BasicGrid.SortedColumn(columnName, sortOrder.ToLower()), 5), "Failed to validate that the '" + columnName + "' column '" + sortOrder + "' arrow is displayed");
            Assert.That(GridStepHelpers.CheckListAscDec(columnName, sortOrder), "Failed to validate that the data in '" + columnName +  "' is sorted in '" + sortOrder + "' order");
        }

        [Then(@"the user validates that the grid has no text with value '(.*)' on column '(.*)'")]
        public void ThenTheUserValidatesThatTheGridHasNoTextWithValueOnColumn(string valueValidate, string columnName)
        {
            Assert.IsFalse(GridStepHelpers.ValidateTextValueIsInColumn(columnName, valueValidate));
        }

        [Then(@"the user validates that the '(.*)' column is not sorted")]
        public void ThenTheUserValidatesThatTheColumnIsNotSorted(string columnName)
        {
            Assert.That(Selenium.GetAttribute(BasicGrid.ColumnContainer(columnName), "aria-sort") == null, "Failed to validate that "+ columnName +" is not sorted");
        }

        [Then(@"user validates that the columns for '(.*)' do not start with '(.*)' and end with '(.*)'")]
        public void ThenUserValidatesThatTheColumnsForDoNotStartWithAndEndWith(string column, string startWith, string endWith)
        {
            List<IWebElement> columns = Selenium.Find(BasicGrid.Columns);
            foreach (IWebElement elementColumn in columns)
            {
                Assert.IsFalse(Selenium.GetText(elementColumn).StartsWith(startWith));
                Assert.IsFalse(Selenium.GetText(elementColumn).EndsWith(endWith));
            }
        }

        [Then(@"user validates that table '(.*)' with value '(.*)' contain '(.*)'")]
        public void ThenUserValidatesThatElementAreDisplayed(string logivalName, string value, string elementsToFind)
        {
            int count = 0;
            string retrievedText = string.Empty;

            List<string> elementsList = elementsToFind.Split(',').ToList();

            List<IWebElement> elements = Selenium.Find(Selenium.GetAbstractedBy(logivalName, new string[] { value }));
            foreach (IWebElement elm in elements)
            {
                retrievedText = elm.Text;
                Assert.IsTrue(retrievedText.Contains( elementsList[count]));
                count++;
            }
        }

        [Then(@"the user validates that the checkbox cell in the grid at row number '([^']*)' is selected")]
        public void ThenTheUserValidatesThatTheCheckboxCellInTheGridAtRowNumberIsSelected(string rowNumber)
        {
            Assert.True(Selenium.ValidateCheckbox(BasicGrid.RowNumberGridCheckbox(rowNumber.Trim())), $"Failed to validate that the checkbox at row number {rowNumber} is selected.");
        }

        [Then(@"the user validates that the grid has the checkbox cell marked as '([^']*)' in the '([^']*)' column with row value of '([^']*)'")]
        public void ThenTheUserValidatesThatTheSingleGridHasTheCheckboxCellIsMarkedAsInTheColumnInTheRowWhereTheColumnHasValue(string trueOrFalse, string columnName, string rowData)
        {
            rowData = GetValue(rowData);

            string att = GridStepHelpers.GetCheckBoxState(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowData));

            Assert.True(att.ToString().ToLower().Contains(trueOrFalse.ToLower()), $"Failed to validate that the checkbox cell is '{trueOrFalse}'. Expected: <{trueOrFalse}> Actual: <{att}>");
        }
    }
}
