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
    public class GridStepDefinitions : SeleniumStepDefinition
    {
        public GridStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user filters the column by column name '([^']*)', Filter Type '([^']*)', Value '([^']*)'")]
        public void WhenTheUserFiltersTheColumnByColumnNameFilterTypeValue(string columnName, string filterType, string value)
        {
            value = GetValue(value);
            StepHelpers.FilterGrid(columnName, filterType, value);
        }

        [When(@"the user opens the grid item in row '([^']*)' on the Benefit Product Table")]
        public void ThenTheUserOpensTheGridItemInRowOnTheBenefitProductTable(string IndexRow)
        {
            Selenium.ScrollToElement(BenefitsTab.BenefitProductIndexedRow(IndexRow));
            Selenium.Click(BenefitsTab.BenefitProductIndexedRow(IndexRow));
        }

        [When(@"the user opens the grid item in row '([^']*)'")]
        public void WhenTheUserOpensTheGridItemInRow(string rowNumber)
        {
            Selenium.ScrollToElement(BasicGrid.IndexedRow(rowNumber));
            Selenium.Click(BasicGrid.IndexedRow(rowNumber));
        }

        [When(@"the user clicks on the link with value '([^']*)' on the grid")]
        public void WhenTheUserOpensTheGridItemWithValue(string value)
        {
            value = GetValue(value);
            Selenium.MoveFocusToElement(BasicGrid.TextInGrid(value));
            Selenium.Click(BasicGrid.LinkContainerInGrid(value));
            Selenium.Click(BasicGrid.LinkInGrid(value));
        }

        [When(@"the user clicks on '([^']*)' text on the grid")]
        public void WhenTheUserClicksOnTextOnTheGrid(string value)
        {
            value = GetValue(value);
            Selenium.MoveFocusToElement(BasicGrid.TextInGrid(value));
            Selenium.Click(BasicGrid.TextInGrid(value));
        }

        [When(@"the user right clicks on the Aggrid Grid table at Row: '([^']*)' and Column: '([^']*)' and Selects: '([^']*)'")]
        public void WhenTheUserRightClicksOnTheAggridGridTableAtRowAndColumnAndSelects(string row, string column, string value)
        {
            row = row.ToUpper().Replace(" ", "_");
            Selenium.RightClick(Selenium.GetAbstractedBy("Column Identifier " + row + " " + column, new object[] { row, column }));
            Selenium.RightClick(AGGrid.ColumnSelect(row, column));

                var path = value.Split(" > ");
                //Context Menu must be opened without crashing - hover until last part of path
                for (int i = 0; i < path.Length; i++)
                {
                    if (i != (path.Length - 1))
                    {
                        Selenium.Hover(AGGrid.ContextMenuItem(path[i]));
                    }
                    else
                    {
                        List<IWebElement> elements = Selenium.Find(AGGrid.ContextMenuItem(path[i]));
                        foreach (IWebElement element in elements)
                        {
                            Selenium.Click(element);
                        }
                    }

            }
        }

        [When(@"the user enters the Text: '([^']*)' on the Aggrid Grid Table Name: '([^']*)' at Row: '([^']*)' and Column: '([^']*)'")]
        public void WhenTheUserEntersTheTextOnTheAggridGridTableNameAtRowAndColumn(string value_, string aggridTableName, string aggridRowID, string aggridColumnID)
        {
            Selenium.ValidateElementDisplayed(AGGrid.AggridGridName(aggridTableName));
            Selenium.DoubleClickElement(AGGrid.ColumnSelect(aggridRowID, aggridColumnID));
            Selenium.ClearByKeys(AGGrid.ColumnSelect(aggridRowID, aggridColumnID));
            Selenium.SendKeys(AGGrid.ColumnSelect(aggridRowID, aggridColumnID), value_ + Keys.Enter, 30);
            Selenium.LooseFocusFromAnElement();
        }

        [When(@"the user opens the Grid Settings Menu option: '(.*)'")]
        public void WhenTheUserOpensTheGridSettingsMenuOption(string gridSettingOption)
        {
            Selenium.Click(BasicGrid.GridSettings, 30);
            Selenium.Click(BasicGrid.GridSettingsOption(gridSettingOption), 30);
        }

        [When(@"the user filters the column by column name '(.*)', Filter Type: '(.*)' retrieved value")]
        public void WhenTheUserFiltersTheColumnByColumnNameRetrievedValue(string columnName, string filterCondition)
        {
            StepHelpers.FilterGrid(columnName, filterCondition, RetrievedValue);
        }

        [When(@"the user opens the link menu option:'([^']*)'")]
        public void ThenTheUserOpensTheLinkMenuOption(string linksPageNameOption)
        {
            Selenium.Click(GridToolbar.DropDownMenu("Links"), 30);
            Selenium.Click(GridToolbar.DropDownMenuOption(linksPageNameOption));
        }

        [When(@"the user clicks on section grid:'([^']*)' in the checkbox column:'([^']*)' where column: '([^']*)' has row data: '([^']*)'")]
        public void ThenTheUserClicksOnSectionGridInTheCheckboxColumnWhereColumnHasRowData(string gridLabel, string checkboxColumnName, string dataColumnName, string rowData)
        {
            GridStepHelpers.ClickOnCheckboxImgCell(PopUpSectionGrid.SectionGridRows(gridLabel), PopUpSectionGrid.SectionGridColumnHeaders(gridLabel), dataColumnName, rowData, checkboxColumnName);
        }
                
        [When(@"the user opens the filter at column '(.*)'")]
        public void ThenTheUserSelectsValuesFromFilteredColumn(string columnName)
        {
            Selenium.MoveFocusToElement(BasicGrid.Filter(columnName));
            Selenium.Click(BasicGrid.Filter(columnName));
        }

        
        [When(@"the user retrieves text from column '(.*)' with unique row text '(.*)' and saves it as '(.*)'")]
        public void WhenTheUserRetrievesTextFromColumnWithUniqueRowTextAndSavesItAs(string columnName, string rowText, string saveAs)
        {
            string retrievedValue = string.Empty;
            rowText = GetValue(rowText);
            retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText));
            SaveValue(saveAs, retrievedValue);
        }

        [When(@"the user clicks on link on column '(.*)' with row text '(.*)'")]
        public void TheTheUserValidatesColumnValue(string columnName, string rowText)
        {
            string retrievedValue = string.Empty;
            rowText = GetValue(rowText);
            AbstractedBy by = GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText);
            Selenium.FindOne(by).FindElement(By.XPath("//span[@class='sm1-column-link']")).Click();

        }

        [When(@"the user clicks on column '(.*)' with row text '(.*)'")]
        public void TheTheUserClicksonColumnValue(string columnName, string rowText)
        {
            rowText = GetValue(rowText);
            AbstractedBy by = GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText);
            Selenium.FindOne(by).Click();

        }

        [When(@"the user enters '(.*)' in cell with column '(.*)' and row containing text '(.*)'")]
        public void WhenTheUserEntersValueInGridContaining(string value, string columnName, string rowText)
        {
            value = GetValue(value);

            Selenium.Click(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText));
            if (columnName.Equals("Fixed amount") || columnName.Equals("Threshold") || columnName.Equals("Amount/Qty") || columnName.Equals(" % "))
            {
                Selenium.ClearByKeys(RebatesGrid.FixedAmountCellInputTextfield);
                Selenium.SendKeys(RebatesGrid.FixedAmountCellInputTextfield, value);
            }
            else
            {
                Selenium.ClearByKeys(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText));
                Selenium.SendKeys(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText), value);
            }
        }

        [When(@"the user enters '(.*)' in cell with column '(.*)' and row text '(.*)'")]
        public void WhenTheUserEntersValueInGrid(string value, string columnName, string rowText)
        {
            value = GetValue(value);
            Selenium.Click(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText));
            Selenium.ClearByKeys(RebatesGrid.CellInputTextfield);
            Selenium.SendKeys(RebatesGrid.CellInputTextfield, value);
            Selenium.LooseFocusFromAnElement();
        }

        [When(@"the user opens the trigger on column '(.*)' and Row '(.*)'")]
        public void WhenTheUserOpensTheTriggerOnColumnAndRow(string columnName, string rowValue)
        {
            GridStepHelpers.ClickTriggerOnCell(RebatesGrid.columns, columnName, RebatesGrid.Rebatesrows, rowValue, "Rebates Grid Cell");
        }

        [When(@"the user clears filter at column  '([^']*)'")]
        public void WhenTheUserClearsFilterAtColumnName(string columnName)
        {
            StepHelpers.ClearFilterGrid(columnName);
        }

        [When(@"the user retrieves text in cell with column '(.*)' and row text '(.*)' and saves as '(.*)'")]
        public void WhenTheUserInPopUpRetrievesTextInGrid(string columnName, string rowText, string key)
        {
            string toSave = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText));
            Selenium.LooseFocusFromAnElement();
            SaveValue(key, toSave);
        }
        
        [When(@"the user scrolls to the '([^']*)' column in the '([^']*)' pop-up table")]
        public void ThenTheUserScrollsToTheColumnInThePop_UpTable(string columnName, string tableName)
        {
            Selenium.ValidateAllElementsLoaded(GridPopups.PopUpColumns(tableName));
            List<IWebElement> elements = Selenium.Find(GridPopups.PopUpColumns(tableName));
            foreach (IWebElement element in elements)
            {
                Selenium.ScrollJS(element);
                if (element.Text.Equals(columnName))
                {
                    break;
                }
            }
        }

        [When(@"the user selects from the '([^']*)' drop down grid menu the '([^']*)' option")]
        public void WhenTheUserSelectsFromTheDropDownGridMenuTheOption(string dropDownName, string dropDownOption)
        {
            GridStepHelpers.SelectFromDropDownGridOptions(dropDownName, dropDownOption);
        }

        [When(@"the user clicks on the '([^']*)' section grid and enters the text '([^']*)' in the row")]
        public void WhenTheUserClicksOnTheSectionGridAndEntersTheTextInTheRow(string sectionName, string textToEnter)
        {
            Selenium.ClickJavaScript(SectionGrid.SectionInputCell(sectionName));
            Selenium.Action.SendKeys(textToEnter).Perform();
            Selenium.LooseFocusFromAnElement();
        }

        
        [When(@"the user sorts the '(.*)' column in '(.*)' order")]
        public void WhenTheUserSortsTheColumnInOrder(string columnName, string order)
        {
            Assert.That(GridStepHelpers.SortColumn(columnName, order),"Failed to sort the '" + columnName + "' column into" + order + "order");
        }

        [When(@"the user makes all coumns visible")]
        public void WhenTheUserMakesAllCoumnsVisible()
        {
            int count = 0;
            while (!Selenium.ValidateElementOnPage(GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALGRIDCOLUMNSPOPUP"), 3) && count < 5)
            {
                count++;
                GridStepHelpers.OpensTheGridSettingsMenuOption("Columns");
            }

            int ColumnIndex = GridStepHelpers.GetElementContainingTextIndex(GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALGRIDCOLUMNSPOPUP"), "Visible");
            count = 0;
            List<IWebElement> rows = Selenium.Find(GridPopups.Rows("Columns Settings"));
            foreach (IWebElement row in rows)
            {
                count++;
                Selenium.ScrollJS(row);
                AbstractedBy by = GridPopups.PopupGridCheckboxByRowColumn("Columns Settings", count.ToString(), ColumnIndex.ToString());
                if (!Selenium.ValidateCheckbox(by))
                {
                    Selenium.Click(by);
                }
            }
            Selenium.Click(PopupGenericElements.PopupOkButton("Columns Settings"));
        }

        [When(@"the user selects the nav grid item in row '([^']*)'")]
        public void WhenTheUserSelectsTheNavGridItemInRow(string rowNumber)
        {
            GridStepHelpers.SelectNavGridRow(rowNumber);
        }

        [When(@"the user refreshes the grid for the data to load on the page")]
        public void WhenTheUserRefreshesTheGridForTheDataToLoadOnThePage()
        {
            GridStepHelpers.RefreshPageUntilDataIsAddedToTheUIGrid();
        }

        [When(@"the user retrieves text from table with unique column '(.*)' column '(.*)' with row text '(.*)' and saves it as '(.*)'")]
        public void TheUserValidatesFromTableWithUniqueColumnColumnValue(string uniqueColumn, string columnName, string rowText, string key)
        {
            rowText = GetValue(rowText);
            AbstractedBy by = GridStepHelpers.GetAbstractedByFromTableWithUniqueColumn(uniqueColumn, columnName, rowText);
            string retrievedValue = Selenium.GetText(by);
            SaveValue(key, retrievedValue);
        }

        [When(@"the user retrieves text from table with unique column '(.*)' column '(.*)' with row number '(.*)' and saves it as '(.*)'")]
        public void TheUserValidatesFromTableWithUniqueColumnAndRowNumber(string uniqueColumn, string columnName, string rowNumber, string key)
        {
            AbstractedBy by = GridStepHelpers.GetAbstractedByFromTableWithUniqueColumn(uniqueColumn, columnName, Int32.Parse(rowNumber));
            string retrievedValue = Selenium.GetText(by);
            SaveValue(key, retrievedValue);
        }

        [When(@"the user select row and clicks on '([^']*)' text on the grid")]
        public void WhenTheUserDoubleClicksOnElement(string value)
        {
            value = GetValue(value);
            GridStepHelpers.SelectRowAndClick(value);

        }

        [When(@"the user refreshes the grid for the data to load on the UI grid")]
        public void WhenTheUserRefreshesTheGridForTheDataToLoadOnTheUIGrid()
        {
            GridStepHelpers.RefreshPageUntilDataIsAddedToTheUIGrid();
        }

        [When(@"the user retrieves value from column '(.*)' with row number '(.*)' and saves it as '(.*)'")]
        public void TheTheUserRetrievesValueColumnValueByRowNumber(string columnName, string rowNumber, string key )
        {
            string retrievedValue = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowNumber(columnName, rowNumber));
            SaveValue(key, retrievedValue);
        }
    }
}
