using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class PopUpGridStepDefinitions : SeleniumStepDefinition
    {
        public PopUpGridStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [Then(@"the user validates that all popup '(.*)' checkboxes for column '(.*)' are '(.*)'")]
        public void WhenTheUserValidatesAllCheckboxesAreChecked(string popUpName, string columnName, string validation)
        {
            Selenium.ValidateElementOnPage(GridPopups.ColumnHeaders(popUpName, string.Empty));

            int ColumnIndex = GridStepHelpers.GetElementContainingTextIndex(GridPopups.ColumnHeaders(popUpName, string.Empty), columnName) - 1;
            int count = 0;
            List<IWebElement> rows = Selenium.Find(GridPopups.Rows(popUpName));
            foreach (IWebElement row in rows)
            {
                count++;
                Selenium.ScrollJS(row);
                AbstractedBy by = GridPopups.PopupGridCheckboxByRowColumn(popUpName, count.ToString(), ColumnIndex.ToString());
                if (Selenium.ValidateElementOnPage(by, 1))
                {
                    if (validation.Equals("checked"))
                    {
                        Assert.IsTrue(Selenium.ValidateCheckbox(by), $"Checkbox is not checked for {columnName}");
                    }
                    else if (validation.Equals("disabled"))
                    {
                        Assert.IsTrue(Selenium.HasAttribute(by, "chkvalue", "disabled"), $"Checkbox is not disabled for {columnName}");
                    }
                    else
                    {
                        Assert.Fail("Validation provided is invalid");
                    }

                }
            }
        }

        [When(@"the user enters '([^']*)' in the filter grid cell with column '([^']*)' and row text '([^']*)' in popup '([^']*)'")]
        public void WhenTheUserEntersInTheFilterGridCellWithColumnAndRowTextInPopup(string value, string columnName, string rowText, string popupName)
        {
            value = GetValue(value);
            Selenium.Click(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText, popupName, "", true));
            Selenium.EnterTextByKeys(value);
            Selenium.LooseFocusFromAnElement();
        }

        [When(@"the user opens the '([^']*)' pop-up Grid Settongs Menu option: '([^']*)'")]
        public void WhenTheUserOpensThePop_UpGridSettongsMenuOption(string popUpName, string gridSettingOption)
        {
            Selenium.JavaScriptClickUntilElementIsDisplayed(GridPopups.GridSettings(popUpName), BasicGrid.GridSettingsOption(gridSettingOption));
            Selenium.ClickJavaScript(BasicGrid.GridSettingsOption(gridSettingOption), 30);
        }


        [Then(@"the user validates that the '([^']*)' popup singlegrid has the checkbox cell is marked as '([^']*)' in the '([^']*)' column in the row number '([^']*)' with an offset: '([^']*)'")]
        public void ThenTheUserValidatesThatThePopUpSinglegridHasTheCheckboxCellIsMarkedAsInTheColumnInTheRowNumber(string tableName, string onOrOff, string columnName, string rowNumber, string offset)
        {
            AbstractedBy columns = GridPopups.PopUpColumns(tableName);
            AbstractedBy rows = GridPopups.Rows(tableName);
            Selenium.ValidateAllElementsLoaded(columns);
            Selenium.ValidateAllElementsLoaded(rows);
            bool checkbox = GridStepHelpers.GetCheckboxCellStatus(columns, rows, int.Parse(rowNumber), columnName, int.Parse(offset));
            bool expected = onOrOff.Trim().ToLower().Equals("on");
            Assert.That(checkbox == expected, $"Failed to validate that the checkbox cell is '{onOrOff}'. Expected: <{expected}> Actual: <{checkbox}>");
        }

        [When(@"the user clicks and enters the text '([^']*)' in the '([^']*)' single-popup table in the column name: '([^']*)' where '([^']*)' column has the text '([^']*)' with an offset: '([^']*)'")]
        public void WhenTheUserClicksAndEntersTheTextInTheSingle_PopupTableInTheColumnNameWhereColumnHasTheText(string textToEnter, string tableName, string interactionColumnName, string referenceColumnName, string referenceRowText, string offset)
        {
            GridStepHelpers.ClickAndEnterTextInSinglePopUpGrid(tableName, interactionColumnName, referenceColumnName, referenceRowText, textToEnter, offset);
        }

        [When(@"the user clicks on '(.*)' pop up table where '(.*)' column has the value:'(.*)' and the checkbox is in column:'(.*)' is turned:'(.*)'")]
        public void WhenTheUserClicksOnPopUpTableWhereColumnHasTheValueAndTheCheckboxIsInColumn(string TableName, string DataColumn, string RowData, string CheckboxColumn, string onOrOff)
        {
            bool on = onOrOff.ToLower().Equals("on");
            Thread.Sleep(250);
            GridStepHelpers.ClickOnCheckboxCell(GridPopups.Rows(TableName), GridPopups.PopUpColumns(TableName), DataColumn, RowData, CheckboxColumn, on);
        }

        [When(@"the user filter the pop up menu: '([^']*)' by column name '([^']*)', '([^']*)', '([^']*)'")]
        public void WhenTheUserFilterThePopUpMenuByColumnName(string popUpName, string columnName, string fieldName, string fieldValue)
        {
            StepHelpers.FilterGrid(popUpName, columnName, fieldName, fieldValue);
        }


        [When(@"the user filters the pop up menu: '([^']*)' by column name '([^']*)' for the checkbox state: '([^']*)'")]
        public void WhenTheUserFiltersThePopUpMenuByColumnNameForTheCheckboxState(string popUpName, string columnName, string checkboxToClick)
        {
            GridStepHelpers.FilterGridOnCheckboxColumn(popUpName, columnName, checkboxToClick);
        }

        [When(@"the user filters the pop up menu: '([^']*)' by column name '([^']*)', '([^']*)', retieved value")]
        public void WhenTheUserFiltersThePopUpMenuByColumnNameRetievedValue(string popUpName, string columnName, string fieldName)
        {
            StepHelpers.FilterGrid(popUpName, columnName, fieldName, RetrievedValue);
        }

        [When(@"the user opens the Grid Settings Menu option: '([^']*)' in the '([^']*)' pop up table")]
        public void WhenTheUserOpensTheGridSettingsMenuOptionInThePopUpTable(string gridSettingOption, string popUpMenu)
        {
            Selenium.ClickJavaScript(BasicGrid.GridSettingsPopUp(popUpMenu), 30);
            Selenium.ClickJavaScript(BasicGrid.GridSettingsOption(gridSettingOption), 30);
        }

        [When(@"the user selects row '([^']*)' on the '([^']*)' pop up table")]
        public void WhenTheUserSelectsRowOnThePopUpTable(string rowNumber, string popUpName)
        {
            Selenium.ValidateAllElementsLoaded(GridPopups.SelectRowCheckbox(popUpName, rowNumber));
            Selenium.ValidateEnabledAndDisplayed(GridPopups.SelectRowCheckbox(popUpName, rowNumber), 30);
            Selenium.Click(GridPopups.SelectRowCheckbox(popUpName, rowNumber));
        }

        [Then(@"the user validates that popup '(.*)' column '(.*)' has '(.*)' with row text '(.*)'")]
        public void TheTheUserValidatesThatGridColumnValue(string popupName, string columnName, string value, string rowText)
        {
            string retrievedValue = string.Empty;

            value = GetValue(value);
            rowText = GetValue(rowText);

            if (value.Contains("/"))
                value = CommonDates.DateParser(value);

            retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText, popupName));

            Assert.AreEqual(value, retrievedValue);
        }

        [Then(@"the user validates that popup with sm1 ID '(.*)' and name '(.*)' column '(.*)' has '(.*)' with row text '(.*)'")]
        public void TheTheUserValidatesThatGridColumnValueWithSMONEID(string smOneId, string popupName, string columnName, string value, string rowText)
        {
            string retrievedValue = string.Empty;

            value = GetValue(value);
            rowText = GetValue(rowText);

            if (value.Contains("/"))
                value = CommonDates.DateParser(value);
            if (rowText.Contains("/"))
                rowText = CommonDates.DateParser(rowText);

            retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText, popupName, smOneId));

            Assert.AreEqual(value, retrievedValue.Trim());
        }

        [Then(@"the user validates that popup with sm1 ID '(.*)' and name '(.*)' column '(.*)' contains '(.*)' with row text '(.*)'")]
        public void TheTheUserValidatesThatGridColumnContainsValueWithSMONEID(string smOneId, string popupName, string columnName, string value, string rowText)
        {
            string retrievedValue = string.Empty;

            value = GetValue(value);
            rowText = GetValue(rowText);

            if (value.Contains("/"))
                value = CommonDates.DateParser(value);

            retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText, popupName, smOneId));

            Assert.That(retrievedValue.Trim().Contains(value));
        }

        [When(@"the user enters '(.*)' in grid cell with column '(.*)' and row text '(.*)' in popup '(.*)'")]
        public void WhenTheUserEntersValueInGridContainingInSpecificGrid(string value, string columnName, string rowText, string popupName)
        {
            value = GetValue(value);

            Selenium.Click(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText, popupName));
            Selenium.ClearByKeys(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText, popupName));
            try
            {
                Selenium.SendKeys(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText, popupName), value);
            }
            catch (ElementNotInteractableException)
            {
                Selenium.SendKeys(BasicGrid.VisibleInputField, value);
            }
        }

        [When(@"the user in popup '(.*)' enters '(.*)' in cell with column '(.*)' and row text '(.*)'")]
        public void WhenTheUserInPopUpEntersValueInGrid(string popup, string value, string columnName, string rowText)
        {
            value = GetValue(value);

            Selenium.ClickUntilElementIsDisplayed(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText, popup), GridPopups.PopupGridCellInput(popup));
            Selenium.ClearByKeys(GridPopups.PopupGridCellInput(popup));
            Selenium.SendKeys(GridPopups.PopupGridCellInput(popup), value);
            Selenium.LooseFocusFromAnElement();
        }

        [When(@"the user in popup '(.*)' Clicks cell with column '(.*)' and row text '(.*)'")]
        public void WhenTheUserInPopUpClicksValueInGrid(string popup, string columnName, string rowText)
        {

            Selenium.ClickUntilElementIsDisplayed(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText, popup), GridPopups.PopupGridCellInput(popup));
        }

        [Then(@"user validates that '(.*)' has value of sum for popup '(.*)' colum '(.*)'")]
        public void ThenUserValidatesThatHasValueOfSumOfColum(string expectedValue, string popupName, string columnName)
        {
            //get all values from column
            int columnTotal = 0;
            int rowIndex = 1;
            while (true)
            {
                try
                {
                    var retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowNumber(columnName, rowIndex.ToString(), popupName));
                    columnTotal += int.Parse(GetValue(retrievedValue), NumberStyles.AllowThousands | NumberStyles.AllowLeadingSign | NumberStyles.AllowDecimalPoint);
                    rowIndex++;
                }
                catch (Exception) { break; }
            }

            var intExpectedValue = int.Parse(GetValue(expectedValue), NumberStyles.AllowThousands | NumberStyles.AllowLeadingSign | NumberStyles.AllowDecimalPoint);

            Assert.AreEqual(intExpectedValue, columnTotal, $"{expectedValue} does not equal sum of column values {columnTotal}. expected is {expectedValue}");
        }

        [When(@"the user retrieves text from popup '(.*)' column '(.*)' with unique row text '(.*)' and saves it as '(.*)'")]
        public void WhenTheUserRetrievesTextFromColumnWithUniqueRowTextAndSavesItAs(string popup, string columnName, string rowText, string saveAs)
        {
            string retrievedValue = string.Empty;
            if (IsKey(rowText))
            {
                rowText = GetValue(rowText);
            }

            if (rowText.Contains("/"))
                rowText = CommonDates.DateParser(rowText);

            retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText, popup));

            if (IsKey(saveAs))
            {
                ScenarioContext[saveAs] = retrievedValue;
            }
            else
            {
                ScenarioContext.Add(saveAs, retrievedValue);
            }
        }

        [Then(@"the user validates that popup '(.*)' column '(.*)' has opposite value of '(.*)' with row text '(.*)'")]
        public void TheTheUserValidatesThatGridColumnOppositeValue(string popupName, string columnName, string value, string rowText)
        {
            string retrievedValue = string.Empty;
            value = GetValue(value);
            rowText = GetValue(rowText);

            if (value.Contains("/"))
                value = CommonDates.DateParser(value);

            var intExpectValue = -int.Parse(value, NumberStyles.AllowThousands | NumberStyles.AllowLeadingSign | NumberStyles.AllowDecimalPoint);

            retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText, popupName));
            var intActualValue = int.Parse(retrievedValue, NumberStyles.AllowThousands | NumberStyles.AllowLeadingSign | NumberStyles.AllowDecimalPoint);

            Assert.AreEqual(intExpectValue, intActualValue, $"{intActualValue.ToString()} is not The opposite of {columnName} value {intExpectValue}");
        }

        [Then(@"the user validates that popup '(.*)' column '(.*)' with row text '(.*)' has the correct color")]
        public void TheTheUserValidatesThatGridColumnValue(string popupName, string columnName, string rowText)
        {
            string retrievedValue = string.Empty;
            rowText = GetValue(rowText);

            AbstractedBy cell = GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText, popupName);
            AbstractedBy TD = AbstractedBy.Xpath("", cell.ByToString + "/parent::td");
            string value = Selenium.GetText(cell);
            string expectedColor = "rgb(244, 198, 203)";

            var intActualValue = int.Parse(value, NumberStyles.AllowThousands | NumberStyles.AllowLeadingSign | NumberStyles.AllowDecimalPoint);

            if (intActualValue < 0)
            {
                expectedColor = "rgb(196, 229, 204)";
            }
            Assert.IsTrue(Selenium.HasAttribute(TD, "style", expectedColor), $"{columnName} with row text {rowText} does not have color {expectedColor} but has value {value}");
        }

        [Then(@"the user validates that popup '(.*)' column '(.*)' with row text '(.*)' is not editable")]
        public void TheTheUserValidatesThatGridColumnState(string popupName, string columnName, string rowText)
        {
            string retrievedValue = string.Empty;

            if (IsKey(rowText))
            {
                rowText = GetValue(rowText);
            }

            AbstractedBy cell = GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText, popupName);
            AbstractedBy TD = AbstractedBy.Xpath("", cell.ByToString + "/parent::td");

            Assert.IsFalse(Selenium.HasAttribute(TD, "class", "sm1-cell-editable"), $"{columnName} with row text {rowText} is editable");
        }

    }
}
