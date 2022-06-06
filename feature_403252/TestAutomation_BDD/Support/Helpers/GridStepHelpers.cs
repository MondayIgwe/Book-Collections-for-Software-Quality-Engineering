using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Interactions;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Kantar_BDD.Support.Helpers
{
    public class GridStepHelpers
    {
        public SeleniumFunctions Selenium { get; set; }
        public IWebDriver Driver { get; set; }
        public StepHelpers StepHelpers { get; set; }
        int counter = 0;

        public GridStepHelpers(IWebDriver driver)
        {
            Selenium = new SeleniumFunctions(driver);
            Driver = driver;
            StepHelpers = new StepHelpers(driver);
        }

        /// <summary>
        /// Finds an element from a list of elements by element text
        /// </summary>
        /// <param name="by"></param>
        /// <param name="valueToSearch"></param>
        /// <returns>element</returns>
        private IWebElement GetElement(AbstractedBy by, string valueToSearch)
        {
            Selenium.ValidateAllElementsLoaded(by);
            IList<IWebElement> columns = Selenium.Find(by);
            List<string> columnNames = new List<string>();

            foreach (IWebElement element in columns)
            {
                Selenium.ScrollJS(element);
                columnNames.Add(element.Text);
            }

            int columnPosition = columnNames.IndexOf(valueToSearch);
            return columns[columnPosition];
        }

        /// <summary>
        /// Gets the index position of the column by column name
        /// </summary>
        /// <param name="ColumnHeaders"></param>
        /// <param name="columnName"></param>
        /// <param name="offset"></param>
        /// <returns>Integer column position</returns>
        public int GetColumnPosition(AbstractedBy ColumnHeaders, string columnName, int offset = 0)
        {
            int columnPosition = 0;
            if (counter == 5) { counter = 0; }
            List<string> columnNames = new List<string>();
            try
            {
                Selenium.ValidateAllElementsLoaded(ColumnHeaders);
                List<IWebElement> columns = Selenium.Find(ColumnHeaders);

                IWebElement firstEle = null;
                foreach (IWebElement element in columns)
                {
                    if (firstEle == null)
                    {
                        firstEle = element;
                    }
                    Selenium.ScrollJS(element);
                    if (element.Displayed)
                    {
                        // Thread.Sleep used to slow down scroll as this will allow selenuim to retrieve the text and it 
                        // Also mitigates a StaleElementReferenceException that occures here
                        Thread.Sleep(250);
                        Selenium.FluentWaitNotToEmpty(element);
                        string column = element.Text;
                        columnNames.Add(column);
                        if (column.Trim().Equals(columnName.Trim())) { break; }
                    }
                }
                columnPosition = columnNames.IndexOf(columnName) + 1;
            }
            catch (StackOverflowException)
            {
                counter++;
                while (counter < 5)
                {
                    Thread.Sleep(1000);
                    GetColumnPosition(ColumnHeaders, columnName, offset);
                }
            }
            catch (StaleElementReferenceException)
            {
                counter++;
                while (counter < 5)
                {
                    Thread.Sleep(1000);
                    GetColumnPosition(ColumnHeaders, columnName, offset);
                }

            }
            finally
            {
                counter = 0;
            }

            return columnPosition + offset;
        }

        /// <summary>
        /// Gets the row position by row text
        /// </summary>
        /// <param name="Rows"></param>
        /// <param name="columnNumber"></param>
        /// <param name="dataInCellRow"></param>
        /// <param name="offset"></param>
        /// <param name="strict"></param>
        /// <returns>Integer row position</returns>
        public int GetRowNumber(AbstractedBy Rows, int columnNumber, string dataInCellRow, int offset = 0, bool strict = false)
        {
            Selenium.ValidateAllElementsLoaded(Rows);
            int rowPosition = 0;
            List<IWebElement> rows = Selenium.Find(Rows);
            for (int i = 0; i < rows.Count; i++)    
            {
                string rowNumber = (i + 1).ToString();
                string text = Selenium.FindOne(BasicGrid.IterateCell(Rows.ByToString, rowNumber, columnNumber.ToString())).Text;
                if (strict)
                {
                    if (text.Equals(dataInCellRow))
                    {
                        rowPosition = i + 1;
                        break;
                    }
                }
                else
                {
                    if (text.Contains(dataInCellRow))
                    {
                        rowPosition = i + 1;
                        break;
                    }
                }
                
            }
            return rowPosition + offset;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="rows"></param>
        /// <param name="rowNumber"></param>
        /// <param name="columnToClick"></param>
        /// <param name="textToEnter"></param>
        public void EnterTextIntoCell(AbstractedBy rows, int rowNumber, int columnToClick, string textToEnter)
        {
            Selenium.ScrollToElement(BasicGrid.TableCell(rows.ByToString, rowNumber.ToString(), columnToClick.ToString()));
            Selenium.Click(BasicGrid.TableCell(rows.ByToString, rowNumber.ToString(), columnToClick.ToString()));
            Selenium.SendKeys(BasicGrid.CellInput(rows.ByToString, rowNumber.ToString(), columnToClick.ToString()), textToEnter);
            Selenium.LooseFocusFromAnElement();
        }

        /// <summary>
        /// Checks the state of a grid checkbox img
        /// </summary>
        /// <param name="columnHeadersBy"></param>
        /// <param name="rows"></param>
        /// <param name="columnNameToValidate"></param>
        /// <param name="rowNumber"></param>
        /// <param name="columnToClick"></param>
        /// <returns>boolean true if checked, false if unchecked</returns>
        private bool ReturnCheckboxImgStatus(AbstractedBy columnHeadersBy, AbstractedBy rows, string columnNameToValidate, int rowNumber, int columnToClick)
        {
            Selenium.ScrollJS(GetElement(columnHeadersBy, columnNameToValidate));
            IWebElement element = Selenium.FindOne(BasicGrid.CellCheckboxImg(rows.ByToString, rowNumber.ToString(), columnToClick.ToString()));
            Selenium.ScrollJS(element);
            string state = element.GetAttribute("chkvalue");
            Assert.IsNotNull(state, "This checkbox element does not have the 'chkvalue' attribute");
            return state.Contains("true");
        }

        /// <summary>
        /// Checks the state of a grid checkbox with attributes on TD tag
        /// </summary>
        /// <param name="cell"></param>
        /// <returns>string of chkvalue value</returns>
        public string GetCheckBoxState(AbstractedBy cell)
        {
            IWebElement element = Selenium.FindOne(BasicGrid.TableCellCheckbox(cell.ByToString));
            Selenium.ScrollJS(element);
            string state = element.GetAttribute("chkvalue");
            Assert.IsNotNull(state, "This checkbox element does not have the 'chkvalue' attribute");
            return state;
        }

        /// <summary>
        /// Clicks on a grid checkbox (Img) by row Data and column name
        /// </summary>
        /// <param name="rows"></param>
        /// <param name="columnHeadersBy"></param>
        /// <param name="refeerenceColumnName"></param>
        /// <param name="rowData"></param>
        /// <param name="columnNameToClick"></param>
        /// <param name="on"></param>
        /// <param name="offset"></param>
        public void ClickOnCheckboxImgCell(AbstractedBy rows, AbstractedBy columnHeadersBy, string refeerenceColumnName, string rowData, string columnNameToClick, bool? on = null, int offset = 0)
        {
            // Find Column Name Position
            int referenceColumnData = GetColumnPosition(columnHeadersBy, refeerenceColumnName, offset);
            int columnToClick = GetColumnPosition(columnHeadersBy, columnNameToClick, offset);

            // Get the row number of the data in the column position
            int rowNumber = GetRowNumber(rows, referenceColumnData, rowData, offset);

            Selenium.ScrollJS(GetElement(columnHeadersBy, columnNameToClick));

            // Click on the cell
            if (on == null)
            {
                Selenium.ScrollJS(Selenium.FindOne(BasicGrid.CellCheckboxImg(rows.ByToString, rowNumber.ToString(), columnToClick.ToString())));
                Selenium.Click(BasicGrid.CellCheckboxImg(rows.ByToString, rowNumber.ToString(), columnToClick.ToString()));
            }
            else if (on == true)
            {
                IWebElement element = Selenium.FindOne(BasicGrid.CellCheckboxImg(rows.ByToString, rowNumber.ToString(), columnToClick.ToString()));
                Selenium.ScrollJS(element);
                string state = element.GetAttribute("chkvalue");
                if (!state.Equals("true"))
                {
                    Selenium.ScrollToElement(BasicGrid.CellCheckboxImg(rows.ByToString, rowNumber.ToString(), columnToClick.ToString()));
                    Selenium.Click(BasicGrid.CellCheckboxImg(rows.ByToString, rowNumber.ToString(), columnToClick.ToString()));
                }
            }
            else
            {
                IWebElement element = Selenium.FindOne(BasicGrid.CellCheckboxImg(rows.ByToString, rowNumber.ToString(), columnToClick.ToString()));
                Selenium.ScrollJS(element);
                string state = element.GetAttribute("chkvalue");
                if (!state.Equals("false"))
                {
                    Selenium.ScrollToElement(BasicGrid.CellCheckboxImg(rows.ByToString, rowNumber.ToString(), columnToClick.ToString()));
                    Selenium.Click(BasicGrid.CellCheckboxImg(rows.ByToString, rowNumber.ToString(), columnToClick.ToString()));
                }
            }
        }

        /// <summary>
        /// Enters text into a table cell 
        /// </summary>
        /// <param name="leftRow"></param>
        /// <param name="rightRow"></param>
        /// <param name="columnHeadersBy"></param>
        /// <param name="refeerenceColumnName"></param>
        /// <param name="rowDataRowData"></param>
        /// <param name="columnNameToSendTextTo"></param>
        /// <param name="textToEnter"></param>
        /// <param name="offset"></param>
        /// <param name="rowOffset"></param>
        public void EnterTextIntoTextCell(AbstractedBy leftRow, AbstractedBy rightRow, AbstractedBy columnHeadersBy, string refeerenceColumnName, string rowDataRowData, string columnNameToSendTextTo, string textToEnter, int offset = 0, int rowOffset = 0)
        {
            AbstractedBy rows = GetCorrectRowGroup(columnHeadersBy, leftRow, rightRow, columnNameToSendTextTo);
            // Find Column Name Position
            int referenceColumnData = GetColumnPosition(columnHeadersBy, refeerenceColumnName, offset);
            int columnToClick = GetColumnPosition(columnHeadersBy, columnNameToSendTextTo, offset);
            if (rows == rightRow)
            {
                columnToClick = columnToClick - Selenium.Find(BasicGrid.Cells(leftRow.ByToString, 1.ToString())).Count;
            }
            int rowNumber = GetRowNumber(rows, referenceColumnData, rowDataRowData, rowOffset);
            EnterTextIntoCell(rows, rowNumber, columnToClick, Keys.Backspace + textToEnter);
        }

        /// <summary>
        /// Enters text into a table cell 
        /// </summary>
        /// <param name="rows"></param>
        /// <param name="columnHeadersBy"></param>
        /// <param name="rowNumber"></param>
        /// <param name="columnNameToSendTextTo"></param>
        /// <param name="textToEnter"></param>
        /// <param name="offset"></param>
        public void EnterTextIntoTextCell(AbstractedBy rows, AbstractedBy columnHeadersBy, int rowNumber, string columnNameToSendTextTo, string textToEnter, int offset = 0)
        {
            // Find Column Name Position
            int columnToClick = GetColumnPosition(columnHeadersBy, columnNameToSendTextTo, offset);
            EnterTextIntoCell(rows, rowNumber, columnToClick, Keys.Backspace + textToEnter);
        }

        public AbstractedBy GetCorrectRowGroup(AbstractedBy columnHeadersBy, AbstractedBy leftRow, AbstractedBy rightRow, string columnNameInMultiGridTable)
        {
            if (counter == 5) { counter = 0; }
            int index = 0;
            AbstractedBy LeftTableColumns(int row) => AbstractedBy.Xpath("", leftRow.ByToString + "[" + row + "]//tbody//tr//td");
            Selenium.ValidateAllElementsLoaded(LeftTableColumns(1));
            List<IWebElement> leftRowColmns = Selenium.Find(LeftTableColumns(1));
            try
            {
                index = GetColumnPosition(columnHeadersBy, columnNameInMultiGridTable);
            }
            catch (StaleElementReferenceException)
            {
                counter++;
                Thread.Sleep(100);
                while (counter < 5)
                {
                    GetCorrectRowGroup(columnHeadersBy, leftRow, rightRow, columnNameInMultiGridTable);
                }
            }

            if (index > leftRowColmns.Count)
            {
                return rightRow;
            }
            else
            {
                return leftRow;
            }
        }

        /// <summary>
        /// Extract Text From Table
        /// </summary>
        /// <param name="columnHeadersBy"></param>
        /// <param name="rowBy"></param>
        /// <param name="columnName"></param>
        /// <param name="rowNumber"></param>
        /// <param name="offset"></param>
        /// <returns></returns>
        public string ExtractTextFromTable(AbstractedBy columnHeadersBy, AbstractedBy rowBy, string columnName, int rowNumber, int offset = 0)
        {
            int referenceColumnData = GetColumnPosition(columnHeadersBy, columnName, offset);
            return Selenium.GetText(BasicGrid.TextInCell(rowBy.ByToString, rowNumber.ToString(), referenceColumnData.ToString()));
        }

        /// <summary>
        /// Get table cell by column name and unique row text
        /// </summary>
        /// <param name="columnName"></param>
        /// <param name="rowText"></param>
        /// <param name="gridName"></param>
        /// <param name="smOneId"></param>
        /// <param name="strictValidation">If strictValidation is false, the validation checks whether a column row contains a text. If strictValidation is true, the validation checks whether a column row text equals the text</param>
        /// <returns>AbstractedBy</returns>
        public AbstractedBy GetGridAbstractedByByColumnNameAndRowText(string columnName, string rowText, string gridName = null, string smOneId = "", bool strictValidation = false)
        {
            AbstractedBy columnsLocator = null;
            AbstractedBy rowsLocator = null;
            AbstractedBy abstractedBy = null;
            object[] args = null;

            if (gridName == null)
            {
                columnsLocator = RebatesGrid.columns;
                rowsLocator = RebatesGrid.Rebatesrows;
            }
            else if (gridName == string.Empty)
            {
                columnsLocator = GridPopups.ColumnHeadersBySm1Id(smOneId);
                rowsLocator = GridPopups.RowsBySm1Id(smOneId);
                args = new string[] {smOneId };
            }
            else
            {
                columnsLocator = GridPopups.ColumnHeaders(gridName, smOneId);
                rowsLocator = GridPopups.Rows(gridName, smOneId);
                args = new string[] { gridName, smOneId };
            }

            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy(columnsLocator.LogicalName, args));
            List<IWebElement> ColumnElements = Selenium.Find(Selenium.GetAbstractedBy(columnsLocator.LogicalName, args));

            List<IWebElement> DisplayedColumnElements;
            DisplayedColumnElements = ColumnElements.Where(iterate => iterate.Displayed).ToList();

            int columnIndex = 0;
            foreach (var column in DisplayedColumnElements)
            {
                columnIndex++;
                try
                {
                    Selenium.ScrollJS(column);
                    if (column.Text.Equals(columnName))
                        break;
                }
                catch (StaleElementReferenceException)
                { break; }
            }
            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy(rowsLocator.LogicalName, args));
            List<IWebElement> rowElements = Selenium.Find(Selenium.GetAbstractedBy(rowsLocator.LogicalName, args));

            int rowIndex = 0;
            if (rowText.StartsWith("#"))
            {
                rowIndex = Int32.Parse(rowText[1..]);
            }
            else
            {
                foreach (var row in rowElements)
                {
                    rowIndex++;
                    try
                    {
                        Selenium.MoveFocusToElement(row);
                        if (!strictValidation)
                        {
                            if (row.Text.Contains(rowText))
                                break;
                        }
                        else if (strictValidation)
                        {
                            if (row.Text.Equals(rowText))
                                break;
                        }
                    }
                    catch (StaleElementReferenceException)
                    { break; }
                }
            }

            if (gridName == null)
            {
                abstractedBy = RebatesGrid.DivByColumnAndRow(rowIndex.ToString(), columnIndex.ToString());
            }
            else if (gridName == "")
            {
                abstractedBy = GridPopups.PopupGridCell(rowIndex.ToString(), columnIndex.ToString(), smOneId);
            }
            else
            {
                abstractedBy = GridPopups.PopupGridCell(gridName, rowIndex.ToString(), columnIndex.ToString(), smOneId);
            }

            return abstractedBy;
        }

        /// <summary>
        /// Get table cell by column name and row number
        /// </summary>
        /// <param name="columnName"></param>
        /// <param name="rowNumber"></param>
        /// <param name="gridName"></param>
        /// <param name="smOneId"></param>
        /// <param name="strictValidation"></param>
        /// <returns>AbstractedBy</returns>
        public AbstractedBy GetGridAbstractedByByColumnNameAndRowNumber(string columnName, string rowNumber, string gridName = null, string smOneId = "", bool strictValidation = false)
        {
            AbstractedBy columnsLocator = null;
            AbstractedBy rowsLocator = null;
            AbstractedBy abstractedBy = null;
            object[] args = null;

            if (gridName == null)
            {
                columnsLocator = RebatesGrid.columns;
                rowsLocator = RebatesGrid.Rebatesrows;
            }
            else if (gridName == string.Empty)
            {
                columnsLocator = GridPopups.ColumnHeadersBySm1Id(smOneId);
                rowsLocator = GridPopups.RowsBySm1Id(smOneId);
                args = new string[] { smOneId };
            }
            else
            {
                columnsLocator = GridPopups.ColumnHeaders(gridName, smOneId);
                rowsLocator = GridPopups.Rows(gridName, smOneId);
                args = new string[] { gridName, smOneId };
            }

            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy(columnsLocator.LogicalName, args));
            List<IWebElement> ColumnElements = Selenium.Find(Selenium.GetAbstractedBy(columnsLocator.LogicalName, args));
            int columnIndex = 0;
            foreach (var column in ColumnElements)
            {
                columnIndex++;
                try
                {
                    Selenium.ScrollJS(column);
                    if (column.Text.Equals(columnName))
                        break;
                }
                catch (StaleElementReferenceException)
                { break; }
            }
            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy(rowsLocator.LogicalName, args));
            List<IWebElement> rowElements = Selenium.Find(Selenium.GetAbstractedBy(rowsLocator.LogicalName, args));

            if (gridName == null)
            {
                abstractedBy = RebatesGrid.DivByColumnAndRow(rowNumber.ToString(), columnIndex.ToString());
            }
            else if (gridName == "")
            {
                abstractedBy = GridPopups.PopupGridCell(rowNumber.ToString(), columnIndex.ToString(), smOneId);
            }
            else
            {
                abstractedBy = GridPopups.PopupGridCell(gridName, rowNumber.ToString(), columnIndex.ToString(), smOneId);
            }

            return abstractedBy;
        }

        /// <summary>
        /// Retrieved the status of a grid checkbox
        /// </summary>
        /// <param name="rows"></param>
        /// <param name="columnHeadersBy"></param>
        /// <param name="refeerenceColumnName"></param>
        /// <param name="rowDataRowData"></param>
        /// <param name="columnNameToValidate"></param>
        /// <param name="offset"></param>
        /// <returns>true for checked, false for unchecked</returns>
        public bool GetCheckboxCellStatus(AbstractedBy rows, AbstractedBy columnHeadersBy, string refeerenceColumnName, string rowDataRowData, string columnNameToValidate, int offset = 0)
        {
            // Find Column Name Position
            int referenceColumnData = GetColumnPosition(columnHeadersBy, refeerenceColumnName, offset);
            int columnToClick = GetColumnPosition(columnHeadersBy, columnNameToValidate, offset);

            // Get the row number of the data in the column position
            int rowNumber = GetRowNumber(rows, referenceColumnData, rowDataRowData, offset);

            return ReturnCheckboxImgStatus(columnHeadersBy, rows, columnNameToValidate, rowNumber, columnToClick);
        }

        public string GetTextFromTable(AbstractedBy columnHeadersBy, AbstractedBy leftRow, AbstractedBy rightRow, string dataColumnName, string referenceRowColumnName, string referenceRowData, int offset = 0)
        {
            AbstractedBy rowBy = GetCorrectRowGroup(columnHeadersBy, leftRow, rightRow, dataColumnName);
            int referenceRowColumnNumber = GetColumnPosition(columnHeadersBy, referenceRowColumnName, offset);
            int rowNumber = GetRowNumber(rowBy, referenceRowColumnNumber, referenceRowData, offset);
            int dataColumnNumber = GetColumnPosition(columnHeadersBy, dataColumnName, offset);
            if (rowBy == rightRow)
            {
                dataColumnNumber = dataColumnNumber - Selenium.Find(BasicGrid.Cells(leftRow.ByToString, 1.ToString())).Count;
            }
            Selenium.Find(BasicGrid.TextInCell(rowBy.ByToString, rowNumber.ToString(), dataColumnNumber.ToString()));
            return Selenium.GetText(BasicGrid.TextInCell(rowBy.ByToString, rowNumber.ToString(), dataColumnNumber.ToString()));
        }

        public bool GetCheckboxCellStatus(AbstractedBy columnHeadersBy, AbstractedBy leftRow, AbstractedBy rightRow, string refeerenceColumnName, string rowDataRowData, string columnNameToValidate, int offset = 0)
        {
            AbstractedBy rowBy = GetCorrectRowGroup(columnHeadersBy, leftRow, rightRow, columnNameToValidate);
            // Find Column Name Position
            int referenceColumnData = GetColumnPosition(columnHeadersBy, refeerenceColumnName, offset);
            int columnToClick = GetColumnPosition(columnHeadersBy, columnNameToValidate, offset);

            if (rowBy == rightRow)
            {
                columnToClick = columnToClick - Selenium.Find(BasicGrid.Cells(leftRow.ByToString, 1.ToString())).Count;
            }

            // Get the row number of the data in the column position
            int rowNumber = GetRowNumber(rowBy, referenceColumnData, rowDataRowData, offset);
            return ReturnCheckboxImgStatus(columnHeadersBy, rowBy, columnNameToValidate, rowNumber, columnToClick);
        }

        public string GetTextFromTable(AbstractedBy columnHeadersBy, AbstractedBy leftRow, AbstractedBy rightRow, string columnName, int rowNumber, int offset = 0)
        {
            AbstractedBy rowBy = GetCorrectRowGroup(columnHeadersBy, leftRow, rightRow, columnName);
            int referenceColumnData = GetColumnPosition(columnHeadersBy, columnName, offset);
            if (rowBy == rightRow)
            {
                referenceColumnData = referenceColumnData - Selenium.Find(BasicGrid.Cells(leftRow.ByToString, 1.ToString())).Count;
            }
            return Selenium.Driver.FindElement(BasicGrid.TextInCell(rowBy.ByToString, rowNumber.ToString(), referenceColumnData.ToString()).SeleniumBy).Text;
        }

        public bool GetCheckboxCellStatus(AbstractedBy columnHeadersBy, AbstractedBy leftRow, AbstractedBy rightRow, int rowNumber, string columnNameToValidate, int offset = 0)
        {
            AbstractedBy rowBy = GetCorrectRowGroup(columnHeadersBy, leftRow, rightRow, columnNameToValidate);

            int columnToClick = GetColumnPosition(columnHeadersBy, columnNameToValidate, offset);

            if (rowBy == rightRow)
            {
                columnToClick = columnToClick - Selenium.Find(BasicGrid.Cells(leftRow.ByToString, 1.ToString())).Count;
            }
            return ReturnCheckboxImgStatus(columnHeadersBy, rowBy, columnNameToValidate, rowNumber, columnToClick);
        }

        /// <summary>
        /// Clicks a trigger (dropdown or other popup triggers) on a table cell by column name and unique row value
        /// </summary>
        /// <param name="columnHeadersBy"></param>
        /// <param name="columnName"></param>
        /// <param name="rowsBy"></param>
        /// <param name="uniqueRowValue"></param>
        /// <param name="divLogicalName"></param>
        public void ClickTriggerOnCell(AbstractedBy columnHeadersBy, string columnName, AbstractedBy rowsBy, string uniqueRowValue, string divLogicalName)
        {
            int columnPosition = GetElementContainingTextIndex(columnHeadersBy, columnName);
            int rowIndex = GetElementContainingTextIndex(rowsBy, uniqueRowValue);
            var byDiv = Selenium.GetAbstractedBy(divLogicalName, new string[] { rowIndex.ToString(), columnPosition.ToString() });
            Selenium.ClickUntilElementIsDisplayed(byDiv, BasicGrid.VisibleCellTrigger);
            Selenium.Click(BasicGrid.VisibleCellTrigger);
        }

        /// <summary>
        /// retrieves the index of an element containing unique text from a list of elements
        /// </summary>
        /// <param name="by"></param>
        /// <param name="value"></param>
        /// <param name="strict"></param>
        /// <returns>Index</returns>
        public int GetElementContainingTextIndex(AbstractedBy by, string value, bool strict = false)
        {
            Selenium.ValidateAllElementsLoaded(by);
            List<IWebElement> elements = Selenium.Find(by);
            int index = 0;
            foreach (var element in elements)
            {
                index++;
                try
                {
                    Selenium.ScrollJS(element);
                }
                catch (StaleElementReferenceException)
                {
                    counter++;
                    if (counter == 5) throw;
                    GetElementContainingTextIndex(by, value);
                }

                if (strict)
                {
                    if (Selenium.GetText(element).Equals(value))
                        break;
                }
                else
                {
                    if (Selenium.GetText(element).Contains(value))
                        break;
                }
                
            }
            return index;
        }

        /// <summary>
        /// Validates that a column has text value
        /// </summary>
        /// <param name="columnName"></param>
        /// <param name="textToValidate"></param>
        /// <param name="gridName"></param>
        /// <returns>boolean</returns>
        public bool ValidateTextValueIsInColumn(string columnName, string textToValidate, string gridName = null)
        {
            AbstractedBy columnsLocator = null;
            AbstractedBy rowsLocator = null;
            AbstractedBy abstractedBy = null;
            bool valueIsPresent = false;
            object[] args = null;

            if (gridName == null)
            {
                columnsLocator = RebatesGrid.columns;
                rowsLocator = RebatesGrid.Rebatesrows;
            }
            else
            {
                columnsLocator = GridPopups.ColumnHeaders(gridName);
                rowsLocator = GridPopups.Rows(gridName);
                args = new string[] { gridName };
            }

            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy(columnsLocator.LogicalName, args));
            List<IWebElement> ColumnElements = Selenium.Find(Selenium.GetAbstractedBy(columnsLocator.LogicalName, args));
            int columnIndex = 0;
            foreach (var column in ColumnElements)
            {
                columnIndex++;
                try
                {
                    Selenium.ScrollJS(column);
                    if (column.Text.Contains(columnName))
                        break;
                }
                catch (StaleElementReferenceException)
                { break; }
            }

            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy(rowsLocator.LogicalName, args));

            List<IWebElement> rowElements = Selenium.Find(Selenium.GetAbstractedBy(rowsLocator.LogicalName, args));

            int rowIndex = 0;
            foreach (var row in rowElements)
            {
                rowIndex++;
                try
                {
                    Selenium.MoveFocusToElement(row);
                    if (gridName == null)
                    {
                        valueIsPresent = Selenium.GetText(RebatesGrid.DivByColumnAndRow(rowIndex.ToString(), columnIndex.ToString())).Equals(textToValidate);
                        if (valueIsPresent)
                        {
                            break;
                        }
                    }
                    else
                    {
                        valueIsPresent = Selenium.GetText(GridPopups.PopupGridCell(gridName, rowIndex.ToString(), columnIndex.ToString())).Equals(textToValidate);
                        if (valueIsPresent)
                        {
                            break;
                        }
                    }
                }
                catch (StaleElementReferenceException)
                { break; }
            }

            return valueIsPresent;
        }

        /// <summary>
        /// Retrieves checkbox status by column name and row number
        /// </summary>
        /// <param name="columnHeadersBy"></param>
        /// <param name="rows"></param>
        /// <param name="rowNumber"></param>
        /// <param name="columnNameToValidate"></param>
        /// <param name="offset"></param>
        /// <returns></returns>
        public bool GetCheckboxCellStatus(AbstractedBy columnHeadersBy, AbstractedBy rows, int rowNumber, string columnNameToValidate, int offset = 0)
        {
            int columnToClick = GetColumnPosition(columnHeadersBy, columnNameToValidate, offset);

            return ReturnCheckboxImgStatus(columnHeadersBy, rows, columnNameToValidate, rowNumber, columnToClick);
        }

        /// <summary>
        /// Filters a grid by column checkbox
        /// </summary>
        /// <param name="popUpName"></param>
        /// <param name="columnName"></param>
        /// <param name="checkboxToClick"></param>
        public void FilterGridOnCheckboxColumn(string popUpName, string columnName, string checkboxToClick)
        {
            try
            {
                while (!Selenium.ValidateEnabledAndDisplayed(GenericElementsPage.CheckboxInputByLabel(checkboxToClick)) && counter < 10)
                {
                    StepHelpers.ScrollAndGetElement(GridPopups.Filter(popUpName, columnName), 30).Click();
                }
                Selenium.ValidateAllElementsLoaded(GenericElementsPage.CheckboxInputByLabel(checkboxToClick));
                Selenium.Click(GenericElementsPage.CheckboxInputByLabel(checkboxToClick), 30);
                Selenium.Click(PopupGenericElements.PopupOkButton("Column:" + columnName));
                return;
            }
            catch (StaleElementReferenceException)
            {
                Thread.Sleep(1000);
                counter++;
                FilterGridOnCheckboxColumn(popUpName, columnName, checkboxToClick);
            }
            catch (ElementClickInterceptedException)
            {
                Thread.Sleep(1000);
                counter++;
                Selenium.ValidateAllElementsLoaded(GenericElementsPage.CheckboxInputByLabel(checkboxToClick));
                Selenium.Click(GenericElementsPage.CheckboxInputByLabel(checkboxToClick), 30);
                Selenium.Click(PopupGenericElements.PopupOkButton("Column:" + columnName));
                return;
            }
            finally
            {
                counter = 0;
            }
        }

        /// <summary>
        /// Selects a value from a grid dropdown
        /// </summary>
        /// <param name="dropDownMenu"></param>
        /// <param name="gridDropDownOption"></param>
        public void SelectFromDropDownGridOptions(string dropDownMenu, string gridDropDownOption)
        {
            Selenium.Click(GenericElementsPage.GenericDropDownTrigger(dropDownMenu), 30);
            List<IWebElement> elements = Selenium.Find(DropDownGrid.DropDownOptions, 15);
            List<IWebElement> visibleElements = elements.Where(iterator => iterator.Displayed).ToList();
            foreach (IWebElement element in visibleElements)
            {
                Selenium.ScrollJS(element);
            }
            List<IWebElement> checkbox = Selenium.Find(DropDownGrid.DropDownOption(gridDropDownOption));
            if (checkbox.Count <= 1)
            {
                Selenium.ScrollJS(Selenium.FindOne(DropDownGrid.DropDownOption(gridDropDownOption)));
                Selenium.Click(DropDownGrid.DropDownOption(gridDropDownOption));
            }
            else
            {
                IWebElement checkboxElement = checkbox.Where(iterator => iterator.Displayed).FirstOrDefault();
                if (checkboxElement == null)
                {
                    checkboxElement = checkbox[0];
                }
                Selenium.ScrollJS(checkboxElement);
                checkboxElement.Click();
            }

            List<IWebElement> buttons = Selenium.Find(DropDownGrid.DropDownButton("OK"));
            if (buttons.Count <= 1)
            {
                Selenium.ScrollJS(Selenium.FindOne(DropDownGrid.DropDownButton("OK")));
                Selenium.Click(DropDownGrid.DropDownButton("OK"));
            }
            else
            {
                IWebElement buttonElement = buttons.Where(iterator => iterator.Displayed).FirstOrDefault();
                if (buttonElement == null)
                {
                    buttonElement = buttons[0];
                }
                Selenium.ScrollJS(buttonElement);
                buttonElement.Click();
            }
        }

        /// <summary>
        /// Checks if the column is sorted as per the orderOfSort
        /// </summary>
        /// <param name="columnName"></param>
        /// <param name="orderOfSort"></param>
        /// <returns>boolean</returns>
        public bool CheckListAscDec(string columnName, string orderOfSort)
        {
            List<IWebElement> elements = Selenium.Find(BasicGrid.ColumnElements(GetColumnPosition(BasicGrid.Columns, columnName).ToString()));
            List<string> textOfElements = elements.Select(x => x.Text).ToList();
            if (orderOfSort.ToLower().Contains("asc"))
            {
                List<string> ascElements = textOfElements.OrderBy(x => x.CompareTo(x)).ToList();
                textOfElements = elements.Select(x => x.Text).ToList();
                return textOfElements.SequenceEqual(ascElements);
            }
            else
            {
                List<string> descElements = textOfElements.OrderByDescending(x => x.CompareTo(x)).ToList();
                textOfElements = elements.Select(x => x.Text).ToList();
                return textOfElements.SequenceEqual(descElements);
            }  
        }

        /// <summary>
        /// Sort a column by column name and orderOfSort
        /// </summary>
        /// <param name="columnName"></param>
        /// <param name="orderOfSort"></param>
        /// <param name="timeout"></param>
        /// <returns></returns>
        public bool SortColumn(string columnName, string orderOfSort, int timeout = 5)
        {
            if (orderOfSort.ToLower().Contains("asc"))
            {
                orderOfSort = "ascending";
            }
            else
            {
                orderOfSort = "descending";
            }

            int counter = 0;
            Selenium.WaitForElementToBePresent(BasicGrid.ColumnContainer(columnName));
            bool sorted = Selenium.HasAttribute(BasicGrid.ColumnContainer(columnName), "aria-sort", orderOfSort); 
            while (!sorted && counter < timeout)
            {
                Selenium.Click(BasicGrid.Column(columnName));
                Thread.Sleep(500);
                sorted = Selenium.HasAttribute(BasicGrid.ColumnContainer(columnName), "aria-sort", orderOfSort);
                counter++;
            }
            return sorted;
        }

        /// <summary>
        /// Opens the grid settings Menu option
        /// </summary>
        /// <param name="gridSettingOption"></param>
        public void OpensTheGridSettingsMenuOption(string gridSettingOption)
        {
            List<IWebElement> elements = Selenium.Find(BasicGrid.GridSettings);
            foreach (var element in elements)
            {
                if (element.Displayed)
                {
                    Selenium.Click(element);
                }
            }

            Selenium.Click(BasicGrid.GridSettingsOption(gridSettingOption), 30);
        }

        public void ClickOnMultiGridCellAndEnterDateText(string tableName, string upperOrLower, string columnName, string rowNumber, string textToEnter)
        {
            textToEnter = CommonDates.DateParser(textToEnter);
            string fullName = tableName.Trim() + " " + upperOrLower.Trim().ToLower();
            int columnNumber = GetColumnPosition(Selenium.GetAbstractedBy(fullName + " Columns"), columnName);
            AbstractedBy rows = Selenium.GetAbstractedBy(tableName + " Rows");
            IList<IWebElement> webElements = Selenium.Find(BasicGrid.Cells(rows.ByToString, rowNumber));
            Selenium.JavaScriptClickUntilElementIsDisplayed(webElements[columnNumber], BasicGrid.VisibleInputField);
            Selenium.ClearText(BasicGrid.VisibleInputField);
            Selenium.SendKeys(BasicGrid.VisibleInputField, Keys.Backspace);
            Selenium.EnterTextByKeys(BasicGrid.VisibleInputField, textToEnter);
            Selenium.Click(GenericElementsPage.HomeToolbarLabel);
        }

        public void ClickOnMultiGridCellAndEnterText(string tableName, string upperOrLower, string columnName, string rowNumber, string textToEnter)
        {
            string fullName = tableName.Trim() + " " + upperOrLower.Trim().ToLower();
            int columnNumber = GetColumnPosition(Selenium.GetAbstractedBy(fullName.Trim() + " Columns"), columnName);
            AbstractedBy rows = Selenium.GetAbstractedBy(tableName.Trim() + " Rows");
            IList<IWebElement> webElements = Selenium.Find(BasicGrid.Cells(rows.ByToString, rowNumber));
            Selenium.JavaScriptClickUntilElementIsDisplayed(webElements[columnNumber], BasicGrid.VisibleInputField);
            Selenium.EnterTextByKeys(textToEnter + Keys.Tab);
            Selenium.Click(GenericElementsPage.HomeToolbarLabel);
        }

        /// <summary>
        /// Enters text in single popup grid by referenceColumnName and referenceRowData
        /// </summary>
        /// <param name="popUpTableName"></param>
        /// <param name="interactionColumn"></param>
        /// <param name="referenceColumnName"></param>
        /// <param name="referenceRowData"></param>
        /// <param name="textToEnter"></param>
        /// <param name="offsetColumn"></param>
        public void ClickAndEnterTextInSinglePopUpGrid(string popUpTableName, string interactionColumn, string referenceColumnName, string referenceRowData, string textToEnter, string offsetColumn)
        {
            AbstractedBy columns = GridPopups.PopUpColumns(popUpTableName);
            AbstractedBy rows = GridPopups.Rows(popUpTableName);
            int refColumnNumber = GetColumnPosition(columns, referenceColumnName);
            int interactColumnNumber = GetColumnPosition(columns, interactionColumn);
            int interactRowNumber = GetRowNumber(rows, refColumnNumber + int.Parse(offsetColumn), referenceRowData);
            IList<IWebElement> webElements = Selenium.Find(BasicGrid.Cells(rows.ByToString, interactRowNumber.ToString()));
            Selenium.JavaScriptClickUntilElementIsDisplayed(webElements[interactColumnNumber], BasicGrid.VisibleInputField);
            Selenium.EnterTextByKeys(textToEnter + Keys.Tab);
            Selenium.Click(GenericElementsPage.HomeToolbarLabel);
        }

        public bool RetrieveCheckboxState(AbstractedBy checkbox)
        {
            string cellAttribute = Selenium.GetAttribute(checkbox, "chkvalue");
            return cellAttribute.Trim().ToLower().Contains("true");
        }

        public bool RetrieveCheckboxEditableState(AbstractedBy checkbox, int timeout = 15)
        {
            int counter = 0;
            Selenium.FluentWaitElementToBePresent(checkbox);
            string cellAttribute = Selenium.GetAttribute(checkbox, "chkvalue");
            while (cellAttribute.Trim().ToLower().Contains("disabled") && counter < timeout)
            {
                if(!cellAttribute.Trim().ToLower().Contains("disabled"))
                {
                    break;
                }
                counter++;
                Thread.Sleep(500);
                cellAttribute = Selenium.GetAttribute(checkbox, "chkvalue");
            }
            if(!cellAttribute.Trim().ToLower().Contains("disabled"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Retrieves column text by columnName and rowNumber - posible duplicate of ExtractTextFromTable
        /// </summary>
        /// <param name="columnsAbstractedBy"></param>
        /// <param name="rows"></param>
        /// <param name="columnName"></param>
        /// <param name="rowNumber"></param>
        /// <returns></returns>
        public string GetColumnText(AbstractedBy columnsAbstractedBy, AbstractedBy rows, string columnName, string rowNumber)
        {
            int columnIndex = 0;
            List<IWebElement> columns = Selenium.Find(columnsAbstractedBy);
            List<IWebElement> columnsVisible = columns.Where(columnVisible => columnVisible.Displayed).ToList();
            foreach (IWebElement element in columnsVisible)
            {
                if (element.Text.Trim().Equals(columnName))
                {
                    columnIndex = columnsVisible.IndexOf(element) + 1;
                    break;
                }
            }
            Thread.Sleep(1000);
            Selenium.ValidateAllElementsLoaded(columnsAbstractedBy, 30);
            if (columnIndex == 0)
            {
                columns = Selenium.Find(BasicGrid.Columns);
                columnsVisible = columns.Where(columnVisible => columnVisible.Displayed).ToList();
                foreach (IWebElement element in columnsVisible)
                {
                    if (element.Text.Trim().Equals(columnName))
                    {
                        columnIndex = columnsVisible.IndexOf(element) + 1;
                        break;
                    }
                }
            }
            Selenium.ValidateAllElementsLoaded(BasicGrid.TextInCell(rows.ByToString, rowNumber, columnIndex.ToString()), 30);
            Thread.Sleep(2500);
            string returnValue = Selenium.GetText(BasicGrid.TextInCell(rows.ByToString, rowNumber, columnIndex.ToString())).Trim();
            if (returnValue.Contains(','))
            {
                returnValue = returnValue.Replace(",", string.Empty);
            }
            return returnValue;
        }
    }
}
