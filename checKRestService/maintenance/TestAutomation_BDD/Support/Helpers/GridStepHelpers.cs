using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;

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
        /// <param name="Rows">Grid Rows xpath</param>
        /// <param name="columnNumber">Column number for the column to validate</param>
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
        /// Enters text into a grid cell
        /// </summary>
        /// <param name="rows">Grid rows xpath</param>
        /// <param name="rowNumber">Row number of the cell</param>
        /// <param name="columnToClick">Column number for the column to enter text into</param>
        /// <param name="textToEnter">Text to enter</param>
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
        /// <param name="columnHeadersBy">Column headings xpath</param>
        /// <param name="rows">Grid rows xpath</param>
        /// <param name="columnNameToValidate">Column name where the checkbox is located</param>
        /// <param name="rowNumber">Row number where checkbox is located</param>
        /// <param name="columnToValidate">Row number where checkbox is located</param>
        /// <returns>boolean true if checked, false if unchecked</returns>
        private bool ReturnCheckboxImgStatus(AbstractedBy columnHeadersBy, AbstractedBy rows, string columnNameToValidate, int rowNumber, int columnToValidate)
        {
            Selenium.ScrollJS(GetElement(columnHeadersBy, columnNameToValidate));
            IWebElement element = Selenium.FindOne(BasicGrid.CellCheckboxImg(rows.ByToString, rowNumber.ToString(), columnToValidate.ToString()));
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
        /// <param name="rows">Rows xpath to validate</param>
        /// <param name="columnHeadersBy">Column headings xpath</param>
        /// <param name="referenceColumnName">Name of column to validate</param>
        /// <param name="rowData">Row data to validate</param>
        /// <param name="columnNameTovalidateOn">Name of the column to validate on</param>
        /// <param name="trueOrFalse">True to check the checkbox, otherwise false to uncheck</param>
        /// <param name="offset">Off set value</param>
        public void ClickOnCheckboxImgCell(AbstractedBy rows, AbstractedBy columnHeadersBy, string referenceColumnName, string rowData, string columnNameTovalidateOn, bool? trueOrFalse = null, int offset = 0)
        {
            // Find Column Name Position
            int referenceColumnData = GetColumnPosition(columnHeadersBy, referenceColumnName, offset);
            int columnToClick = GetColumnPosition(columnHeadersBy, columnNameTovalidateOn, offset);

            // Get the row number of the data in the column position
            int rowNumber = GetRowNumber(rows, referenceColumnData, rowData, offset);

            Selenium.ScrollJS(GetElement(columnHeadersBy, columnNameTovalidateOn));

            // Click on the cell
            if (trueOrFalse == null)
            {
                Selenium.ScrollJS(Selenium.FindOne(BasicGrid.CellCheckboxImg(rows.ByToString, rowNumber.ToString(), columnToClick.ToString())));
                Selenium.Click(BasicGrid.CellCheckboxImg(rows.ByToString, rowNumber.ToString(), columnToClick.ToString()));
            }
            else if (trueOrFalse == true)
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
        /// <param name="leftRow">Left rows xpath of a multi-grid</param>
        /// <param name="rightRow">Right rows xpath of a multi-grid</param>
        /// <param name="columnHeadersBy">Column headings xpath</param>
        /// <param name="referenceColumnName">Column name to use as reference with unique values</param>
        /// <param name="rowDataRowData">Value to use from the reference column</param>
        /// <param name="columnNameToSendTextTo">Column name to enter text into</param>
        /// <param name="textToEnter">Text/Value to enter</param>
        /// <param name="offset"></param>
        /// <param name="rowOffset"></param>
        public void EnterTextIntoTextCell(AbstractedBy leftRow, AbstractedBy rightRow, AbstractedBy columnHeadersBy, string referenceColumnName, string rowDataRowData, string columnNameToSendTextTo, string textToEnter, int offset = 0, int rowOffset = 0)
        {
            AbstractedBy rows = GetCorrectRowGroup(columnHeadersBy, leftRow, rightRow, columnNameToSendTextTo);
            // Find Column Name Position
            int referenceColumnData = GetColumnPosition(columnHeadersBy, referenceColumnName, offset);
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
        /// <param name="rows">Rows xpath of a grid</param>
        /// <param name="columnHeadersBy">Column headings xpath</param>
        /// <param name="rowNumber">Row number to enter text into</param>
        /// <param name="columnNameToSendTextTo">Column name to enter text into</param>
        /// <param name="textToEnter">Text/Value to enter</param>
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
        /// <param name="columnHeadersBy">Column headings xpath</param>
        /// <param name="rowBy">Rows xpath of a grid</param>
        /// <param name="columnName">Column name to get text from</param>
        /// <param name="rowNumber">Row number to get text from</param>
        /// <param name="offset"></param>
        /// <returns>Text entracted from the cell</returns>
        public string ExtractTextFromTable(AbstractedBy columnHeadersBy, AbstractedBy rowBy, string columnName, int rowNumber, int offset = 0)
        {
            int referenceColumnData = GetColumnPosition(columnHeadersBy, columnName, offset);
            return Selenium.GetText(BasicGrid.TextInCell(rowBy.ByToString, rowNumber.ToString(), referenceColumnData.ToString()));
        }

        /// <summary>
        /// Get table cell by column name and unique row text
        /// </summary>
        /// <param name="columnName">Column name to get abstracted by from</param>
        /// <param name="rowText">Unique text from any column</param>
        /// <param name="gridName">Grid label</param>
        /// <param name="smOneId">Sm1-id for the column</param>
        /// <param name="strictValidation">If strictValidation is false, the validation checks whether a column row contains a text. If strictValidation is true, the validation checks whether a column row text equals the text</param>
        /// <returns>Abstracted By</returns>
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

            int rowIndex = 0;
            if (rowText.StartsWith("#") && rowText.Count(f => f == '#') == 1)
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
                        try
                        {
                            Selenium.MoveFocusToElement(row);
                        }
                        catch (MoveTargetOutOfBoundsException) { }
                        
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
        /// <param name="columnName">Column name to get table cell from</param>
        /// <param name="rowNumber">Row number to get table cell from</param>
        /// <param name="gridName">Grid label</param>
        /// <param name="smOneId">Sm1-id for the column</param>
        /// <param name="strictValidation">If strictValidation is false, the validation checks whether a column row contains a text. If strictValidation is true, the validation checks whether a column row text equals the text</param>
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
        /// <param name="rows">Rows xpath</param>
        /// <param name="columnHeadersBy">Column headings xpath</param>
        /// <param name="referenceColumnName">Name of a column with unique values in the grid</param>
        /// <param name="rowData">Unique value from the reference column</param>
        /// <param name="columnNameToValidate">Column name to validate</param>
        /// <param name="offset">The number added to the index in order to get the correct cell in the grid (grid dependent)</param>
        /// <returns>True for checked, False for unchecked</returns>
        public bool GetCheckboxCellStatus(AbstractedBy rows, AbstractedBy columnHeadersBy, string referenceColumnName, string rowData, string columnNameToValidate, int offset = 0)
        {
            // Find Column Name Position
            int referenceColumnData = GetColumnPosition(columnHeadersBy, referenceColumnName, offset);
            int columnToClick = GetColumnPosition(columnHeadersBy, columnNameToValidate, offset);

            // Get the row number of the data in the column position
            int rowNumber = GetRowNumber(rows, referenceColumnData, rowData, offset);

            return ReturnCheckboxImgStatus(columnHeadersBy, rows, columnNameToValidate, rowNumber, columnToClick);
        }

        /// <summary>
        /// Gets text from a multi-grid table cell
        /// </summary>
        /// <param name="columnHeadersBy">Column headings xpath</param>
        /// <param name="leftRow">Left rows xpath</param>
        /// <param name="rightRow">Right rows xpath</param>
        /// <param name="dataColumnName">Name of the column with unique values</param>
        /// <param name="referenceRowColumnName">Name of the column to get the text from</param>
        /// <param name="referenceRowData">Unique value from the reference column</param>
        /// <param name="offset">The number added to the index in order to get the correct cell in the grid (grid dependent)</param>
        /// <returns>String text extracted from the cell</returns>
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


        /// <summary>
        /// Gets the checkbox status
        /// </summary>
        /// <param name="columnHeadersBy">Column headings xpath</param>
        /// <param name="leftRow">Left row headings xpath</param>
        /// <param name="rightRow">Right row headings xpath</param>
        /// <param name="referenceColumnName">Name of the column with unique values</param>
        /// <param name="referenceColumnRowData">Unique value from the reference column</param>
        /// <param name="columnNameToValidate">Column name to get checkbox status from</param>
        /// <param name="offset">The number added to the index in order to get the correct cell in the grid (grid dependent)</param>
        /// <returns>True/False</returns>
        public bool GetCheckboxCellStatus(AbstractedBy columnHeadersBy, AbstractedBy leftRow, AbstractedBy rightRow, string referenceColumnName, string referenceColumnRowData, string columnNameToValidate, int offset = 0)
        {
            AbstractedBy rowBy = GetCorrectRowGroup(columnHeadersBy, leftRow, rightRow, columnNameToValidate);
            // Find Column Name Position
            int referenceColumnData = GetColumnPosition(columnHeadersBy, referenceColumnName, offset);
            int columnToClick = GetColumnPosition(columnHeadersBy, columnNameToValidate, offset);

            if (rowBy == rightRow)
            {
                columnToClick = columnToClick - Selenium.Find(BasicGrid.Cells(leftRow.ByToString, 1.ToString())).Count;
            }

            // Get the row number of the data in the column position
            int rowNumber = GetRowNumber(rowBy, referenceColumnData, referenceColumnRowData, offset);
            return ReturnCheckboxImgStatus(columnHeadersBy, rowBy, columnNameToValidate, rowNumber, columnToClick);
        }

        /// <summary>
        /// Gets text from a cell in a grid
        /// </summary>
        /// <param name="columnHeadersBy">Column headings</param>
        /// <param name="leftRow">Left row headings xpath</param>
        /// <param name="rightRow">Right row headings xpath</param>
        /// <param name="columnName">Name of the column to get text from</param>
        /// <param name="rowNumber">Row number to get text from</param>
        /// <param name="offset">The number added to the index in order to get the correct cell in the grid (grid dependent)</param>
        /// <returns>String text extracted from the cell</returns>
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

        /// <summary>
        /// Gets a checkbox status in a grid
        /// </summary>
        /// <param name="columnHeadersBy">Column headings xpath</param>
        /// <param name="leftRow">Left row headings xpath</param>
        /// <param name="rightRow">Right row headings xpath</param>
        /// <param name="rowNumber">Row number to get text from</param>
        /// <param name="columnNameToValidate">Name of the column to get checkbox status on</param>
        /// <param name="offset">The number added to the index in order to get the correct cell in the grid (grid dependent)</param>
        /// <returns>True if the checkbox is checked otherwise, false</returns>
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
        /// <param name="columnHeadersBy">Column headings xpath</param>
        /// <param name="columnName">Column name to interact with</param>
        /// <param name="rowsBy">Rows xpath</param>
        /// <param name="uniqueRowValue">Value from a unique column in the grid</param>
        /// <param name="divLogicalName">Logical name for the Div xpath</param>
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
        /// <param name="columnName">Name of the column to validate text on</param>
        /// <param name="textToValidate">Text to validate on the column</param>
        /// <param name="gridName">Grid name/label</param>
        /// <returns>True/False</returns>
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
        /// <param name="columnHeadersBy">Column headings xpath</param>
        /// <param name="rows">Rows xpath</param>
        /// <param name="rowNumber">Row number to interact with</param>
        /// <param name="columnNameToValidate">Name of the column to validate</param>
        /// <param name="offset">The number added to the index in order to get the correct cell in the grid (grid dependent)</param>
        /// <returns></returns>
        public bool GetCheckboxCellStatus(AbstractedBy columnHeadersBy, AbstractedBy rows, int rowNumber, string columnNameToValidate, int offset = 0)
        {
            int columnToClick = GetColumnPosition(columnHeadersBy, columnNameToValidate, offset);

            return ReturnCheckboxImgStatus(columnHeadersBy, rows, columnNameToValidate, rowNumber, columnToClick);
        }

        /// <summary>
        /// Filters a grid by column checkbox
        /// </summary>
        /// <param name="popUpName">Popup label</param>
        /// <param name="columnName">Column name to filter on</param>
        /// <param name="checkboxToClick">Checkbox label to click on</param>
        public void FilterGridOnCheckboxColumn(string popUpName, string columnName, string checkboxToClick)
        {
            try
            {
                while (!Selenium.ValidateElementDisplayed(GenericElementsPage.CheckboxInputByLabel(checkboxToClick)) && counter < 10)
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
                return;
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
        /// <param name="dropDownMenu">Dropdown label name</param>
        /// <param name="gridDropDownOption">Dropdown option to select from the menu</param>
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
        /// <param name="columnName">Column name of the column to sort</param>
        /// <param name="orderOfSort">Order to sort the column into</param>
        /// <returns>True/False</returns>
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
        /// Sorts a column by column name and orderOfSort
        /// </summary>
        /// <param name="columnName">Column name of the column to sort</param>
        /// <param name="orderOfSort">Order to sort the column into</param>
        /// <param name="timeout">Maximum timeout value</param>
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
                Selenium.ScrollJS(Selenium.FindOne(BasicGrid.Column(columnName)));
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
        /// <param name="gridSettingOption">Grid setting option</param>
        public void OpensTheGridSettingsMenuOption(string gridSettingOption)
        {
            Selenium.ClickUntilElementIsDisplayed(BasicGrid.GridSettings, BasicGrid.GridSettingsOption(gridSettingOption));
            Selenium.Click(BasicGrid.GridSettingsOption(gridSettingOption), 30);
        }

        /// <summary>
        /// Enters text into multi-grid table
        /// </summary>
        /// <param name="tableName">Grid label</param>
        /// <param name="upperOrLower">Grid name case</param>
        /// <param name="columnName">Column name to enter text into</param>
        /// <param name="rowNumber">Row number to enter text into</param>
        /// <param name="textToEnter">Text/Value to enter</param>
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

        /// <summary>
        /// Enters text into multi-grid table
        /// </summary>
        /// <param name="tableName">Grid label</param>
        /// <param name="upperOrLower">Grid name case</param>
        /// <param name="columnName">Column name to enter text into</param>
        /// <param name="rowNumber">Row number to enter text into</param>
        /// <param name="textToEnter">Text/Value to enter</param>
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
        /// <param name="popUpTableName">Table name/label on popup</param>
        /// <param name="interactionColumn">Column to enter text into</param>
        /// <param name="referenceColumnName">Column with unique values</param>
        /// <param name="referenceRowData">Unique value in the reference column</param>
        /// <param name="textToEnter">Text/value to enter</param>
        /// <param name="offsetColumn">The column name to move/offset from</param>
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

        /// <summary>
        /// Retrieves the checkbox state
        /// </summary>
        /// <param name="checkbox">Checkbox xpath</param>
        /// <returns>True if checked, otherwise False</returns>
        public bool RetrieveCheckboxState(AbstractedBy checkbox)
        {
            string cellAttribute = Selenium.GetAttribute(checkbox, "chkvalue");
            return cellAttribute.Trim().ToLower().Contains("true");
        }

        /// <summary>
        /// Retrieves the checkbox state
        /// </summary>
        /// <param name="checkbox">Checkbox xpath</param>
        /// <returns>True if checked, otherwise False</returns>
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
        /// <param name="columnsAbstractedBy">Column headings xapth</param>
        /// <param name="rows">Rows xpath</param>
        /// <param name="columnName">Column name to get text from</param>
        /// <param name="rowNumber">Row number to get text from</param>
        /// <returns>String text of the value extracted from the cell</returns>
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

        /// <summary>
        /// Gets the AbstractedBy of cell
        /// </summary>
        /// <param name="referenceColumn">Column name with unique values</param>
        /// <param name="columnName">Column name to get AbstractedBy from</param>
        /// <param name="rowText">Unique text from the reference column</param>
        /// <returns>AbstractedBy</returns>
        public AbstractedBy GetAbstractedByFromTableWithUniqueColumn(string referenceColumn, string columnName, string rowText)
        {
            int columnumnIndex = GetColumnPosition(GridWithUniqueColumn.AllColumns(referenceColumn), columnName);
            int rowIndex = GetElementContainingTextIndex(GridWithUniqueColumn.AllRows(referenceColumn), rowText);
            return GridWithUniqueColumn.DivByColumnAndRow(referenceColumn, rowIndex.ToString(), columnumnIndex.ToString());
        }

        /// <summary>
        /// Gets the AbstractedBy of cell
        /// </summary>
        /// <param name="referenceColumn">Column name with unique values</param>
        /// <param name="columnName">Column name to get AbstractedBy from</param>
        /// <param name="rowIndex">row index as number</param>
        /// <returns>AbstractedBy</returns>
        public AbstractedBy GetAbstractedByFromTableWithUniqueColumn(string referenceColumn, string columnName, int rowIndex)
        {
            int columnumnIndex = GetColumnPosition(GridWithUniqueColumn.AllColumns(referenceColumn), columnName);
            return GridWithUniqueColumn.DivByColumnAndRow(referenceColumn, rowIndex.ToString(), columnumnIndex.ToString());
        }

        /// <summary>
        /// Selects the navigation row based on the provided row number
        /// </summary>
        /// <param name="rowNumber">row number to select</param>
        public void SelectNavGridRow(string rowNumber)
        {
            Selenium.ValidateAllElementsLoaded(NavGrid.Checkbox);
            List<IWebElement> checkboxesInTable = Selenium.Find(NavGrid.Checkbox);
            List<IWebElement> checkboxesVisible = checkboxesInTable.Where(checkbox => checkbox.Displayed).ToList();
            checkboxesVisible[int.Parse(rowNumber) - 1].Click();
        }

        /// <summary>
        /// Select row and click on a Web Element
        /// </summary>
        /// <param name="value">Select row and click</param>
        public void SelectRowAndClick(string value)
        {
            Selenium.MoveFocusToElement(BasicGrid.TextInGrid(value));
            Selenium.Click(BasicGrid.TextInGrid(value));
            Selenium.MoveFocusToElement(BasicGrid.TextInGrid(value));
            Selenium.Click(BasicGrid.TextInGrid(value));
        }

        /// <summary>
        /// Refreshes the UI Grid page until a data chnage occures or refreshes 10 times
        /// </summary>
        public void RefreshPageUntilDataIsAddedToTheUIGrid()
        {
            string referenceText = Selenium.GetText(GridToolbar.NumberOfRows);
            string compareText = Selenium.GetText(GridToolbar.NumberOfRows);
            int counter = 0;

            while (referenceText.Equals(compareText) && counter < 10)
            {
                Selenium.Click(GenericElementsPage.RefreshButtonGrid);
                Thread.Sleep(500);
                compareText = Selenium.GetText(GridToolbar.NumberOfRows);
                counter++;
            }
        }

        /// <summary>
        /// Validates if a column is filtered correctly on the condition and value
        /// </summary>
        /// <param name="columnName">Name of a column to validate</param>
        /// <param name="filterCondition">Condition to filter by</param>
        /// <param name="filterValue">Value to filter by</param>
        /// <returns>True if all values in a column are filtered as expected, otherwise False</returns>
        public bool IsFilteredByCondition(string columnName, string filterCondition, string filterValue)
        {
            Selenium.ValidateAllElementsLoaded(BasicGrid.Rows);
            List<IWebElement> elements = Selenium.Find(BasicGrid.ColumnElements(GetColumnPosition(BasicGrid.ColumnHeadings, columnName).ToString()));
            List<string> textOfElements = elements.Select(x => x.Text).ToList();
            switch (filterCondition.ToLower())
            {
                case "like":
                    foreach (string cellText in textOfElements)
                    {
                        if (!cellText.Contains(filterValue))
                        {
                            return false;
                        }
                    }
                    break;
                case "not like":
                    foreach (string cellText in textOfElements)
                    {
                        if (cellText.Contains(filterValue))
                        {
                            return false;
                        }
                    }
                    break;
                case "in":
                    string[] filterValues = filterValue.Split(';');
                    foreach (string cellText in textOfElements)
                    {
                        bool isIn = false;
                        foreach (string value in filterValues)
                        {
                            if (cellText.Contains(value))
                            {
                                isIn = true;
                                break;
                            }
                        }

                        if (!isIn)
                        {
                            return false;
                        }
                    }
                    break;
                default:
                    return false;
            }

            return true;
        }


        /// <summary>
        /// Get table cell by column name and unique row text
        /// </summary>
        /// <param name="columnName">Column name to get abstracted by from</param>
        /// <param name="rowText">Unique text from any column</param>
        /// <param name="strictValidation">If strictValidation is false, the validation checks whether a column row contains a text. If strictValidation is true, the validation checks whether a column row text equals the text</param>
        /// <returns>Abstracted By of the cell</returns>
        public AbstractedBy GetCellAbstractedBy(string columnName, string rowText,bool strictValidation = false)
        {
            // Get column headings
            List<IWebElement> ColumnElements = Selenium.Find(BasicGrid.ColumnHeadings);
            List<IWebElement> RowElements = null;
            int columnIndex = 0;
            int rowIndex = 0;
            // Get column index
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

            Selenium.ValidateAllElementsLoaded(BasicGrid.RowCells("1"));
            bool isInRow = false;
            for (int row = 1; row < 100; row++)
            {
                RowElements = Selenium.Find(BasicGrid.RowCells(row.ToString()));
                rowIndex = row;
                try
                {
                    try
                    {
                        Selenium.MoveFocusToElement(RowElements[row]);
                    }
                    catch (MoveTargetOutOfBoundsException) { }

                    if (!strictValidation)
                    {
                        isInRow = RowElements.Any(x => x.Text.Contains(rowText));
                        if (isInRow)
                            break;
                    }
                    else
                    {
                        isInRow = RowElements.Any(x => x.Text.Equals(rowText));
                        if (isInRow)
                            break;
                    }
                }
                catch (StaleElementReferenceException)
                { break; }
            }

            // For when grids are on different tabs and the one of the grids has no data
            if (Selenium.Find(BasicGrid.RowCells(rowIndex.ToString())).Count() != ColumnElements.Count)
            {
                  columnIndex = columnIndex - (RowElements.Count - columnIndex);
            } 

            AbstractedBy abstractedBy = RebatesGrid.DivByColumnAndRow(rowIndex.ToString(), columnIndex.ToString());
            
            return abstractedBy;
        }
    }
}
