using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.SFA.Containers;
using Kantar_BDD.Support.Utils;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using TechTalk.SpecFlow;

namespace Kantar_BDD.Support.Helpers.SFA
{
    public class BudgetGroupStepHelpers : StepHelpers
    {
        public string Code { get; set; }
        public List<string> SelectedOwners { get; set; }
        
        [ThreadStatic]
        public static List<KeyValuePair<int,string>> SingleCodeUserSelected = new List<KeyValuePair<int, string>>();
        public GridStepHelpers GridStepHelpers { get; set; }
        public BudgetGroupStepHelpers(IWebDriver driver) : base(driver)
        {
            GridStepHelpers = new GridStepHelpers(driver);
            Code = "";
        }
        /// <summary>
        /// Prerequisite: the new Budget Group pop up is open
        /// This populates the new Budget Group pop up grid
        /// </summary>
        /// <param name="code">The Budget Group Code, if null, the generate button is clicked</param>
        /// <param name="typology">The topology is selected</param>
        /// <param name="ownerLevel">The owner level for the new Budget Group is selected</param>
        /// <param name="startDate">The Start Date of the new budget group is set</param>
        /// <param name="endDate">The End Date of the new budget group is set</param>
        public void PopulateBudgetGroupPopUp(string code = null, string typology = null, string ownerLevel = null, string startDate = null, string endDate = null)
        {
            int counter = 0;
            Selenium.ValidateElementDisplayed(GenericElementsPage.GenericGenerateCodeButton("Code"));
            if (code == null)
            {
                Selenium.Click(GenericElementsPage.GenericGenerateCodeButton("Code"));
                Code = Selenium.GetText(GenericElementsPage.InputByLabelName("Code"));
            }
            else
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Code"));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("Code"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Code"), code);
                Selenium.LooseFocusFromAnElement();
                Code = code;
            }
            if (typology != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Typology"));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("Typology"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Typology"), typology);
                Selenium.LooseFocusFromAnElement();
            }
            if (ownerLevel != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Owner Level"));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("Owner Level"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Owner Level"), ownerLevel);
                Selenium.LooseFocusFromAnElement();
            }
            if (startDate != null && endDate != null)
            {
                startDate = CommonDates.DateParser(startDate);
                endDate = CommonDates.DateParser(endDate);
                while (!ValidateDateField(GenericElementsPage.Sm1IdAttributeOfField(GenericElementsPage.GenericDropDownTrigger("Validity period").ByToString), startDate, endDate) || counter < 10)
                {
                    SelectDatePeriod(GenericElementsPage.GenericDropDownTrigger("Validity period"), startDate, endDate);
                    bool breakLoop = ValidateDateField(GenericElementsPage.Sm1IdAttributeOfField(GenericElementsPage.GenericDropDownTrigger("Validity period").ByToString), startDate, endDate);
                    if (breakLoop) { break; }
                    counter++;
                }
            }
        }

        public void PopulateGeneralInfoTab(string description = null, string measureUnit = null, string budgetMeasures = null)
        {
            Selenium.ValidateElementDisplayed(GenericElementsPage.SidePanelTab("General Info"));
            Selenium.Click(GenericElementsPage.SidePanelTab("General Info"));
            Selenium.ValidateAllElementsLoaded(GenericElementsPage.InputByLabelName("Description"));
            Selenium.ValidateElementDisplayed(GenericElementsPage.InputByLabelName("Description"));

            if (description != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Description"));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("Description"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Description"), description);
                Selenium.LooseFocusFromAnElement();
            }

            if (measureUnit != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Measure unit"));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("Measure unit"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Measure unit"), measureUnit);
                Selenium.LooseFocusFromAnElement();
            }


            if (budgetMeasures != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Budget measures"));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("Budget measures"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Budget measures"), budgetMeasures);
                Selenium.LooseFocusFromAnElement();
            }
        }

        /// <summary>
        /// Prerequisite: Budget Group Owners Tab page must be open and visible
        /// Populates the Budget Group Owners Tab by entering the Default Initial Value and  selectomg a user(s) by username or user code
        /// </summary>
        /// <param name="defaultInitioalValue">Default Initail Value to be set</param>
        /// <param name="userOrCode">users to select</param>
        public void PopulateOwnersTab(string defaultInitioalValue = null, string [] userOrCode = null)
        {
            Selenium.ValidateElementDisplayed(GenericElementsPage.SidePanelTab("Owners"));
            Selenium.Click(GenericElementsPage.SidePanelTab("Owners"));
            Selenium.ValidateAllElementsLoaded(OwnersTab.TableRows, 30);
            Selenium.ValidateElementDisplayed(GenericElementsPage.InputByPartialLabelName("Default initial value"));

            if (defaultInitioalValue != null)
            {
                Selenium.Click(GenericElementsPage.InputByPartialLabelName("Default initial value"));
                Selenium.ClearByKeys(GenericElementsPage.InputByPartialLabelName("Default initial value"));
                Selenium.SendKeys(GenericElementsPage.InputByPartialLabelName("Default initial value"), defaultInitioalValue);
                Selenium.LooseFocusFromAnElement();
            }

            if (userOrCode != null)
            {
                List<int> rowsSelected = new List<int>();
                int codeColumnIndex = 0;
                int userColumnIndex = 0;
                List<IWebElement> columns =  Selenium.Find(BasicGrid.Columns);
                List<IWebElement> columnsVisible = columns.Where(columnVisible => columnVisible.Displayed).ToList();
                foreach (IWebElement element in columnsVisible)
                {
                    if (element.Text.Trim().Equals("Code"))
                    {
                        codeColumnIndex = columnsVisible.IndexOf(element) + 1;
                    }
                    if (element.Text.Trim().Equals("User"))
                    {
                        userColumnIndex = columnsVisible.IndexOf(element) + 1;
                    }

                    if(userColumnIndex != 0 && codeColumnIndex != 0)
                    {
                        break;
                    }
                }

                SelectedOwners = new List<string>();
                foreach (string selectRow in userOrCode)
                {
                    Selenium.Click(BasicGrid.GridCheckBoxContaining(selectRow.Trim()));
                }

                List<IWebElement> checkboxesInTable = Selenium.Find(BasicGrid.Checkboxes);
                List<IWebElement> checkboxesVisible = checkboxesInTable.Where(checkbox => checkbox.Displayed).ToList();
                List<IWebElement> checkboxesSelected = checkboxesVisible.Where(selected => selected.GetAttribute("chkvalue").Trim().Contains("true")).ToList();
                foreach (IWebElement element in checkboxesSelected)
                {
                    rowsSelected.Add(checkboxesVisible.IndexOf(element)+1);
                }

                foreach(int row in rowsSelected)
                {
                    string code = Selenium.GetText(BasicGrid.TextInCell(OwnersTab.TableRows.ByToString, row.ToString(), codeColumnIndex.ToString())).Trim();
                    string user = Selenium.GetText(BasicGrid.TextInCell(OwnersTab.TableRows.ByToString, row.ToString(), userColumnIndex.ToString())).Trim();
                    SelectedOwners.Add(code + " - " + user);
                }
            }
        }

        /// <summary>
        /// Prerequisite: Budget Group Owners Tab page must be open and visible
        /// Selects a user on the Budget Group Owners Tab by the row number specified
        /// </summary>
        /// <param name="rowNumber">The row number specified</param>
        public void SelectOwnerTabUserByRowNumber(int rowNumber)
        {
            Selenium.ValidateAllElementsLoaded(BasicGrid.Columns);
            int codeColumnIndex = 0;
            int userColumnIndex = 0;
            List<IWebElement> columns = Selenium.Find(BasicGrid.Columns);
            List<IWebElement> columnsVisible = columns.Where(columnVisible => columnVisible.Displayed).ToList();
            foreach (IWebElement element in columnsVisible)
            {
                if (element.Text.Trim().Equals("Code"))
                {
                    codeColumnIndex = columnsVisible.IndexOf(element) + 1;
                }
                if (element.Text.Trim().Equals("User"))
                {
                    userColumnIndex = columnsVisible.IndexOf(element) + 1;
                }

                if (userColumnIndex != 0 && codeColumnIndex != 0)
                {
                    break;
                }
            }

            List<IWebElement> checkboxesInTable = Selenium.Find(BasicGrid.Checkboxes);
            List<IWebElement> checkboxesVisible = checkboxesInTable.Where(checkbox => checkbox.Displayed).ToList();
            checkboxesVisible[rowNumber -1].Click();

            string code = Selenium.GetText(BasicGrid.TextInCell(OwnersTab.TableRows.ByToString, rowNumber.ToString(), codeColumnIndex.ToString())).Trim();
            string user = Selenium.GetText(BasicGrid.TextInCell(OwnersTab.TableRows.ByToString, rowNumber.ToString(), userColumnIndex.ToString())).Trim();
            string codusr = code + " - " + user;
            if (RetrieveCheckboxState(codusr))
            {
                KeyValuePair<int, string> toAdd = new KeyValuePair<int, string>(rowNumber, codusr);
                if (!SingleCodeUserSelected.Contains(toAdd))
                {
                    SingleCodeUserSelected.Add(toAdd);
                }
            }
            else
            {
                KeyValuePair<int, string> toRemove = new KeyValuePair<int, string>(rowNumber, codusr);
                if (SingleCodeUserSelected.Contains(toRemove))
                {
                    SingleCodeUserSelected.Remove(toRemove);
                }
            }
        }

        /// <summary>
        /// Prerequisite: Budget Group Owners Tab page must be open and visible
        /// Retrives all users selected and saves it in the scenarioContext dictionary in the form that can be referenced in nav grids for future use
        /// </summary>
        public void RetrieveCodeUserTab()
        {
            SelectedOwners = new List<string>();
            List<int> rowsSelected = new List<int>();
            int codeColumnIndex = 0;
            int userColumnIndex = 0;
            List<IWebElement> columns = Selenium.Find(BasicGrid.Columns);
            List<IWebElement> columnsVisible = columns.Where(columnVisible => columnVisible.Displayed).ToList();
            foreach (IWebElement element in columnsVisible)
            {
                if (element.Text.Trim().Equals("Code"))
                {
                    codeColumnIndex = columnsVisible.IndexOf(element) + 1;
                }
                if (element.Text.Trim().Equals("User"))
                {
                    userColumnIndex = columnsVisible.IndexOf(element) + 1;
                }

                if (userColumnIndex != 0 && codeColumnIndex != 0)
                {
                    break;
                }
            }

            List<IWebElement> checkboxesInTable = Selenium.Find(BasicGrid.Checkboxes);
            List<IWebElement> checkboxesVisible = checkboxesInTable.Where(checkbox => checkbox.Displayed).ToList();
            List<IWebElement> checkboxesSelected = checkboxesVisible.Where(selected => selected.GetAttribute("chkvalue").Trim().Contains("true")).ToList();
            foreach (IWebElement element in checkboxesSelected)
            {
                rowsSelected.Add(checkboxesVisible.IndexOf(element) + 1);
            }

            foreach (int row in rowsSelected)
            {
                string code = Selenium.GetText(BasicGrid.TextInCell(OwnersTab.TableRows.ByToString, row.ToString(), codeColumnIndex.ToString())).Trim();
                string user = Selenium.GetText(BasicGrid.TextInCell(OwnersTab.TableRows.ByToString, row.ToString(), userColumnIndex.ToString())).Trim();
                SelectedOwners.Add(code + " - " + user);
            }
        }

        /// <summary>
        /// Validates that a user is selected or not
        /// </summary>
        /// <param name="codeOrUser">User code or user name</param>
        /// <returns></returns>
        public bool RetrieveCheckboxState(string codeOrUser)
        {
            string[] codeUser = codeOrUser.Split('-');
            return Selenium.ValidateCheckbox(BasicGrid.GridCheckBoxContaining2Values(codeUser[0].Trim(), codeUser[1].Trim()));     
        }

        /// <summary>
        /// Validates that a user is disabled or not
        /// </summary>
        /// <param name="codeOrUser">User code or user name</param>
        /// <returns></returns>
        public bool RetrieveCheckboxDisabledState(string codeOrUser)
        {
            string[] codeUser = codeOrUser.Split('-');
            return Selenium.RetrieveCheckboxDisabledState(BasicGrid.GridCheckBoxContaining2ValuesDisabled(codeUser[0].Trim(), codeUser[1].Trim()));
        }

        /// <summary>
        /// Retrieves a text in the Budget Group Owners Tab
        /// </summary>
        /// <param name="columnName">Thc Column Name</param>
        /// <param name="rowNumber">The rown number</param>
        /// <returns></returns>
        public string GetOwnersTabColumnText(string columnName, string rowNumber)
        {
            Selenium.ValidateAllElementsLoaded(OwnersTab.TableRows);
            return GridStepHelpers.GetColumnText(BasicGrid.Columns, OwnersTab.TableRows, columnName, rowNumber);
        }

        /// <summary>
        /// Validates whether a cell in the Budget Group Owners Tab table is editable
        /// </summary>
        /// <param name="columnName">Thc Column Name</param>
        /// <param name="rowNumber">The rown number</param>
        /// <returns></returns>
        public bool IsOwnersTabCellEditable(string columnName, string rowNumber)
        {
            int columnIndex = 0;
            List<IWebElement> columns = Selenium.Find(BasicGrid.Columns);
            List<IWebElement> columnsVisible = columns.Where(columnVisible => columnVisible.Displayed).ToList();
            foreach (IWebElement element in columnsVisible)
            {
                if (element.Text.Trim().Equals(columnName))
                {
                    columnIndex = columnsVisible.IndexOf(element) + 1;
                    break;
                }
            }
            Selenium.ClickJavaScript(BasicGrid.Cell(OwnersTab.TableRows.ByToString, rowNumber, columnIndex.ToString()));
            return Selenium.HasAttribute(BasicGrid.Cell(OwnersTab.TableRows.ByToString, rowNumber, columnIndex.ToString()), "class", "sm1-cell-editable") && Selenium.ValidateElementDisplayed(BasicGrid.VisibleInputField);
        }

        /// <summary>
        /// Enters a Text into the Budget Group Owners Tab gris
        /// </summary>
        /// <param name="columnName">The Column Name</param>
        /// <param name="rowNumber">The Row Number</param>
        /// <param name="textToEnter">The text to enter into the cell</param>
        public void ClickAndEnterTextIntoOwnersTabCell(string columnName, string rowNumber, string textToEnter)
        {
            int columnIndex = 0;
            List<IWebElement> columns = Selenium.Find(BasicGrid.Columns);
            List<IWebElement> columnsVisible = columns.Where(columnVisible => columnVisible.Displayed).ToList();
            foreach (IWebElement element in columnsVisible)
            {
                if (element.Text.Trim().Equals(columnName))
                {
                    columnIndex = columnsVisible.IndexOf(element) + 1;
                    break;
                }
            }

            Selenium.JavaScriptClickUntilElementIsDisplayed(BasicGrid.TextInCell(OwnersTab.TableRows.ByToString, rowNumber, columnIndex.ToString()), BasicGrid.VisibleInputField);
            Selenium.EnterTextByKeys(Keys.Backspace);
            Selenium.EnterTextByKeys(textToEnter, true);
            Selenium.EnterTextByKeys(Keys.Tab);
            Selenium.LooseFocusFromAnElement();
        }

        /// <summary>
        /// Retrieves the Total Value displayed in the table by the column name
        /// </summary>
        /// <param name="columnName">The Column Namse</param>
        /// <returns></returns>
        public string GetOwnersTabTotalValueInColumn(string columnName)
        {
            int columnIndex = 0;
            List<IWebElement> columns = Selenium.Find(BasicGrid.Columns);
            List<IWebElement> columnsVisible = columns.Where(columnVisible => columnVisible.Displayed).ToList();
            foreach (IWebElement element in columnsVisible)
            {
                if (element.Text.Trim().Equals(columnName))
                {
                    columnIndex = columnsVisible.IndexOf(element) + 1;
                    break;
                }
            }

            string returnValue = Selenium.GetText(BasicGrid.TextInCell(OwnersTab.TotalTableRowBar.ByToString, 1.ToString(), columnIndex.ToString())).Trim();
            if (returnValue.Contains(','))
            {
                returnValue = returnValue.Replace(",", string.Empty);
            }
            return returnValue;
        }
    }
}
