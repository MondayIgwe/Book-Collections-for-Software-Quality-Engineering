using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Support.Helpers;
using Kantar_BDD.Support.Selenium;
using NUnit.Framework;
using OpenQA.Selenium;
using System.Collections.Generic;
using System.Linq;
using TechTalk.SpecFlow;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class GridsValidationStepDefinitions : SeleniumStepDefinition
    {
        public GridsValidationStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [Then(@"the user validates on the Aggrid Grid Table Name: '([^']*)' at Row: '([^']*)' and Column: '([^']*)' and has the Text: '([^']*)'")]
        public void ThenTheUserValidatesOnTheAggridGridTableNameAtRowAndColumnAndHasTheText(string aggridTableName, string aggridRowID, string aggridColumnID, string text)
        {
            if (aggridTableName != null)
            {
                Selenium.ValidateElementDisplayed(AGGrid.ColumnSelect(aggridRowID, aggridColumnID), 60);
                Assert.That(Selenium.GetText(Selenium.FindOne(AGGrid.ColumnSelect(aggridRowID, aggridColumnID))).Contains(text), $"Failed to validate that the expected value is in the Aggrid. Expected: <{text}>");
            }
        }

        [Then(@"the user validates on the Rebates Grid row: '([^']*)' and column: '([^']*)' has the text '([^']*)'")]
        public void ThenTheUserValidatesOnTheRebatesTableAtRowAndColumnAndHasTheText(string row, string column, string value)
        {
            value = GetValue(value);

            var element = Selenium.FindOne(BasicGrid.DivByColumnAndRow(row, column));
            Assert.That(element.Text.Contains(value), "Failed to validate that test was entered succesfully");
        }

        [Then(@"the user validates that column '(.*)' has '(.*)' with row text '(.*)'")]
        public void TheTheUserValidatesColumnValue(string columnName, string value, string rowText)
        {
            value = GetValue(value);
            rowText = GetValue(rowText);
            Selenium.FluentWaitForText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText), value);
            string retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText));

            Assert.AreEqual(value.Trim(), retrievedValue.Trim(), "Failed to validate that column '" + columnName + "' has value '" + value + "' where row text is '" + rowText + "'");
        }

        [Then(@"the user validates that from table with unique column '(.*)' column '(.*)' has '(.*)' with row text '(.*)'")]
        public void TheUserValidatesFromTableWithUniqueColumnColumnValue(string uniqueColumn, string columnName, string value, string rowText)
        {
            value = GetValue(value);
            rowText = GetValue(rowText);
            AbstractedBy by = GridStepHelpers.GetAbstractedByFromTableWithUniqueColumn(uniqueColumn, columnName, rowText);
            Selenium.FluentWaitForText(by, value);
            string retrievedValue = Selenium.GetText(by);
            Assert.AreEqual(value.Trim(), retrievedValue.Trim(), "Failed to validate that column '" + columnName + "' has value '" + value + "' where row text is '" + rowText + "'");
        }

        [Then(@"the user validates that from table with unique column '(.*)' column '(.*)' contains '(.*)' with row text '(.*)'")]
        public void TheUserValidatesFromTableWithUniqueColumnColumnValueContains(string uniqueColumn, string columnName, string value, string rowText)
        {
            value = GetValue(value);
            rowText = GetValue(rowText);
            AbstractedBy by = GridStepHelpers.GetAbstractedByFromTableWithUniqueColumn(uniqueColumn, columnName, rowText);
            Selenium.FluentWaitForText(by, value, 15, false);
            string retrievedValue = Selenium.GetText(by);
            Assert.IsTrue(retrievedValue.Trim().Contains(value.Trim()), "Failed to validate that column '" + columnName + "' contains value '" + value + "' where row text is '" + rowText + "'");
        }

        [Then(@"the user validates that from table with unique column '(.*)' column '(.*)' does not contain '(.*)' with row text '(.*)'")]
        public void TheUserValidatesFromTableWithUniqueColumnColumnValueDoesNotContain(string uniqueColumn, string columnName, string value, string rowText)
        {
            value = GetValue(value);
            rowText = GetValue(rowText);
            AbstractedBy by = GridStepHelpers.GetAbstractedByFromTableWithUniqueColumn(uniqueColumn, columnName, rowText);
            string retrievedValue = Selenium.GetText(by);
            Assert.IsFalse(retrievedValue.Trim().Contains(value.Trim()), "Failed to validate that column '" + columnName + "' does not contain value '" + value + "' where row text is '" + rowText + "'");
        }

        [Then(@"the user validates that column '(.*)' has '(.*)' with row number '(.*)'")]
        public void TheTheUserValidatesColumnValueByRowNumber(string columnName, string value, string rowNumber)
        {
            value = GetValue(value);
            Selenium.FluentWaitForText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowNumber(columnName, rowNumber), value);
            string retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowNumber(columnName, rowNumber));
            Assert.AreEqual(value.Trim(), retrievedValue.Trim(), "Failed to validate that column '" + columnName + "' has value '" + value + "' at row number '" + rowNumber + "'");
        }

        [Then(@"the user validates that column '(.*)' contains '(.*)' with row text '(.*)'")]
        public void TheTheUserValidatesColumnContainsValue(string columnName, string value, string rowText)
        {
            value = GetValue(value);
            rowText = GetValue(rowText);
            string retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText));
            Assert.True(retrievedValue.Trim().Contains(value.Trim()), "Failed to validate that column '" + columnName + "' contains value '" + value + "' where row text is '" + rowText + "'");
        }

        [Then(@"the user validates that column '(.*)' does not contain '(.*)' with row text '(.*)'")]
        public void TheTheUserValidatesColumnValueDoesNotContain(string columnName, string value, string rowText)
        {
            value = GetValue(value);
            rowText = GetValue(rowText);
            string retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText));
            Assert.True(retrievedValue.Trim().Contains(value.Trim()), "Failed to validate that column '" + columnName + "' does not contain value '" + value + "' where row text is '" + rowText + "'");
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
                }
                else
                {
                    bool hasAttribute = Selenium.Sm1ContainerHasAttribute(AGGrid.ContextMenuItem(path[i]), "class", "ag-menu ag-ltr")
                    || Selenium.Sm1ContainerHasAttribute(AGGrid.ContextMenuItem(path[i]), "class", "ag-menu-option-text")
                    || Selenium.Sm1ContainerHasAttribute(AGGrid.ContextMenuItem(path[i]), "class", "x-container-default")
                    || Selenium.Sm1ContainerHasAttribute(AGGrid.ContextMenuItemDisabled(path[i]), "class", "disabled");

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
            Assert.That(Selenium.ValidateElementDisplayed(BasicGrid.SortedColumn(columnName, sortOrder.ToLower()), 5), "Failed to validate that the '" + columnName + "' column '" + sortOrder + "' arrow is displayed");
            Assert.That(GridStepHelpers.CheckListAscDec(columnName, sortOrder), "Failed to validate that the data in '" + columnName +  "' is sorted in '" + sortOrder + "' order");
        }

        [Then(@"the user validates that the grid has no text with value '(.*)' on column '(.*)'")]
        public void ThenTheUserValidatesThatTheGridHasNoTextWithValueOnColumn(string validationValue, string columnName)
        {
            Assert.IsFalse(GridStepHelpers.ValidateTextValueIsInColumn(columnName, validationValue), "Failed to validate that the column '" + columnName + "' does not have the value '"+ validationValue + "'." );
        }

        [Then(@"the user validates that the '(.*)' column is not sorted")]
        public void ThenTheUserValidatesThatTheColumnIsNotSorted(string columnName)
        {
            string att = Selenium.GetAttribute(BasicGrid.ColumnContainer(columnName), "aria-sort");
            Assert.That(string.IsNullOrEmpty(att), "Failed to validate that "+ columnName +" is not sorted");
        }

        [Then(@"user validates that table '(.*)' with value '(.*)' contain '(.*)'")]
        public void ThenUserValidatesThatTableWithValueContain(string logivalName, string value, string elementsToFind)
        {
            int count = 0;
            List<string> elementsList = elementsToFind.Split(',').ToList();
            List<IWebElement> elements = Selenium.Find(Selenium.GetAbstractedBy(logivalName, new string[] { value }));
            foreach (IWebElement elm in elements)
            {
                string retrievedText = elm.Text;
                Assert.IsTrue(retrievedText.Contains( elementsList[count]), "Failed to validate that table '" + logivalName + "' with value '" + value + "' contains '" + elementsToFind + "'");
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

            string att = GridStepHelpers.GetCheckBoxState(GridStepHelpers.GetCellAbstractedBy(columnName, rowData));

            Assert.True(att.ToString().ToLower().Contains(trueOrFalse.ToLower()), $"Failed to validate that the checkbox cell is '{trueOrFalse}'. Expected: <{trueOrFalse}> Actual: <{att}>");
        }

        [Then(@"the user validates that from table with unique column '(.*)' column '(.*)' has '(.*)' in row number '(.*)'")]
        public void TheUserValidatesFromTableWithUniqueColumnColumnValueInRowNumber(string uniqueColumn, string columnName, string value, string rowNumber)
        {
            value = GetValue(value);
            AbstractedBy by = GridStepHelpers.GetAbstractedByFromTableWithUniqueColumn(uniqueColumn, columnName, int.Parse(rowNumber));
            Selenium.FluentWaitForText(by, value);
            string retrievedValue = Selenium.GetText(by);
            Assert.AreEqual(value.Trim(), retrievedValue.Trim());
        }
    }
}
