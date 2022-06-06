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
        int counter = 0;
        public GridStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user filters the column by column name '([^']*)', '([^']*)', '([^']*)'")]
        [Then(@"the user filters the column by column name '([^']*)', '([^']*)', '([^']*)'")]
        public void WhenTheUserFiltersTheColumnByColumnName(string columnName, string filterType, string value)
        {
            string filtervalue = value;
            if (columnName.Equals("Year of Reference"))
                filtervalue = CommonDates.DateParser(value);
            filtervalue = GetValue(filtervalue);

            StepHelpers.FilterGrid(columnName, filterType, filtervalue);
        }

        [Then(@"the user opens the grid item in row '([^']*)' on the Benefit Product Table")]
        public void ThenTheUserOpensTheGridItemInRowOnTheBenefitProductTable(string IndexRow)
        {
            Selenium.ScrollToElement(BenefitsTab.BenefitProductIndexedRow(IndexRow));
            Selenium.Click(BenefitsTab.BenefitProductIndexedRow(IndexRow));
        }


        [When(@"the user opens the grid item in row '([^']*)'")]
        [Then(@"the user opens the grid item in row '(.*)'")]
        public void WhenTheUserOpensTheGridItemInRow(string p0)
        {
            Selenium.ScrollToElement(BasicGrid.IndexedRow(p0));
            Selenium.Click(BasicGrid.IndexedRow(p0));
        }

        [When(@"the user clicks on '([^']*)' text on the grid")]
        public void WhenTheUserClicksOnTextOnTheGrid(string value)
        {
            value = GetValue(value);
            Selenium.MoveFocusToElement(BasicGrid.TextInGrid(value));
            Selenium.Click(BasicGrid.TextInGrid(value));
        }

        [When(@"the user right clicks on the Aggrid Grid table at row: '([^']*)' and column: '([^']*)' and selects '([^']*)'")]
        public void WhenTheUserRightClicksOnTheAggridGridTableAtRowAndColumnAndSelects(string p0, string p1, string p2)
        {
            p0 = p0.ToUpper().Replace(" ", "_");
            Selenium.RightClick(Selenium.GetAbstractedBy("Column Identifier " + p0 + " " + p1, new object[] { p0, p1 }));
            Selenium.RightClick(AGGrid.ColumnSelect(p0, p1));
            var path = p2.Split(" > ");
            //Context Menu must be opened without crashing - hover until last part of path
            for (int i = 0; i < path.Length; i++)
            {
                if (i != (path.Length - 1))
                {
                    Selenium.Hover(AGGrid.ContextMenuItem(path[i]));
                }
                else
                {
                    Selenium.Click(AGGrid.ContextMenuItem(path[i]));
                }
            }

        }

        
        [When(@"the user right clicks on the Aggrid Grid table '([^']*)' at row: '([^']*)' and column: '([^']*)' and selects '([^']*)'")]
        public void WhenTheUserRightClicksOnTheAggridGridTableAtRowAndColumnAndSelects(string p0, string p1, string p2, string p3)
        {
            p0 = p0.ToUpper().Replace(" ", "_");
            Selenium.RightClick(Selenium.GetAbstractedBy("Column Identifier " + p0 + " " + p1, new object[] { p0, p1 }));
            Selenium.RightClick(AGGrid.ColumnSelect(p0, p1));
            var path = p2.Split(" > ");
            //Context Menu must be opened without crashing - hover until last part of path
            for (int i = 0; i < path.Length; i++)
            {
                if (i != (path.Length - 1))
                {
                    Selenium.Hover(AGGrid.ContextMenuItem(path[i]));
                }
                else
                {
                    Selenium.Click(AGGrid.ContextMenuItem(path[i]));
                }
            }
        }

       
        [When(@"the user enters the text '([^']*)' on the Aggrid Grid table '([^']*)' at row: '([^']*)' and column: '([^']*)'")]
        public void ThenTheUserEntersTheTextOnTheAggridGridTableAtRowAndColumn(string value_, string aggridTableName, string aggridRowID, string aggridColumnID)
        {
            Selenium.ValidateEnabledAndDisplayed(AGGrid.AggridGridName(aggridTableName));
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

        [When(@"the user filters the column by column name '(.*)', '(.*)' retrieved value")]
        public void WhenTheUserFiltersTheColumnByColumnNameRetrievedValue(string columnName, string filterCondition)
        {
            StepHelpers.FilterGrid(columnName, filterCondition, RetrievedValue);
        }

        [When(@"the user opens the link menu option:'([^']*)'")]
        [Then(@"the user opens the link menu option:'([^']*)'")]
        public void ThenTheUserOpensTheLinkMenuOption(string linksPageNameOption)
        {
            Selenium.Click(GridToolbar.DropDownMenu("Links"), 30);
            Selenium.Click(GridToolbar.DropDownMenuOption(linksPageNameOption));
        }

        [Then(@"the user clicks on section grid:'([^']*)' in the checkbox column:'([^']*)' where column: '([^']*)' has row data: '([^']*)'")]
        [When(@"the user clicks on section grid:'([^']*)' in the checkbox column:'([^']*)' where column: '([^']*)' has row data: '([^']*)'")]
        public void ThenTheUserClicksOnSectionGridInTheCheckboxColumnWhereColumnHasRowData(string gridLabel, string checkboxColumnName, string dataColumnName, string rowData)
        {
            GridStepHelpers.ClickOnCheckboxImgCell(PopUpSectionGrid.SectionGridRows(gridLabel), PopUpSectionGrid.SectionGridColumnHeaders(gridLabel), dataColumnName, rowData, checkboxColumnName);
        }

        [Then(@"the user selects opens the filter at column '(.*)'")]
        [When(@"the user selects opens the filter at column '(.*)'")]
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

            if (IsKey(saveAs))
            {
                ScenarioContext[saveAs] = retrievedValue;
            }
            else
            {
                ScenarioContext.Add(saveAs, retrievedValue);
            }
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
            string retrievedValue = string.Empty;
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
        [Then(@"the user clears filter at column  '([^']*)'")]
        public void WhenTheUserClearsFilterAtColumnName(string columnName)
        {
            StepHelpers.ClearFilterGrid(columnName);
        }

        [When(@"the user retrieves text in cell with column '(.*)' and row text '(.*)' and saves as '(.*)'")]
        public void WhenTheUserInPopUpRetrievesTextInGrid(string columnName, string rowText, string key)
        {
            string toSave = Selenium.GetText(GridStepHelpers.GetGridAbstractedByByColumnNameAndRowText(columnName, rowText));
            Selenium.LooseFocusFromAnElement();

            if (IsKey(key))
            {
                ScenarioContext[key] = toSave;
            }
            else
            {
                ScenarioContext.Add(key, toSave);
            }
        }
        
        [Then(@"the user scrolls to the '([^']*)' column in the '([^']*)' pop-up table")]
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
            while (!Selenium.ValidateElementOnPage(GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALGRIDCOLUMNSPOPUP"), 3) && counter < 5)
            {
                counter++;
                try
                {
                    GridStepHelpers.OpensTheGridSettingsMenuOption("Columns");
                }
                catch (Exception) { WhenTheUserMakesAllCoumnsVisible(); }
                finally { counter = 0; }
            }

            int ColumnIndex = GridStepHelpers.GetElementContainingTextIndex(GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALGRIDCOLUMNSPOPUP"), "Visible");
            int count = 0;
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
    }
}
