using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.Toolbar;
using Kantar_BDD.Support.Helpers.SFA;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using System.Collections.Generic;
using System.Linq;
using TechTalk.SpecFlow;

namespace Kantar_BDD.StepDefinitions
{
    public class SFABudgetGroupStepDefinitions : SeleniumStepDefinition
    {
        public SFABudgetGroupStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user adds a new budget group where Budget Group Code is retrieved, Topology: '([^']*)', Description: '([^']*)', Default Initial Value: '([^']*)'")]
        public void WhenTheUserAddsANewBudgetGroupWhereBudgetGroupCodeIsRetrievedTopologyDescriptionDefaultInitialValue(string topology, string Description, string defaultInitailValue)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            BudgetGroupStepHelpersClass.PopulateBudgetGroupPopUp(null, topology);
            Selenium.Click(PopupGenericElements.PopupButton("OK"));
            BudgetGroupStepHelpersClass.PopulateGeneralInfoTab(Description);
            BudgetGroupStepHelpersClass.PopulateOwnersTab(defaultInitailValue);
            RetrievedValue = BudgetGroupStepHelpersClass.Code;
        }

        [When(@"the user selects Budget Group Owners and retrieves the usernames: '([^']*)'")]
        public void WhenTheUserSelectsBudgetGroupOwners(string commaSeparatedUsersOrUserCodes)
        {
            BudgetGroupStepHelpersClass.PopulateOwnersTab(null, commaSeparatedUsersOrUserCodes.Split(","));
            List<string> usercodes = BudgetGroupStepHelpersClass.SelectedOwners;
            for(int i = 0; i < usercodes.Count; i++)
            {
                SaveValue("User"+i, usercodes[i]);
            }
        }

        [When(@"the user adds a new budget group where Budget Group Code is retrieved, Topology: '([^']*)', Owner Level: '([^']*)',Description: '([^']*)', Measure Unit: '([^']*)'")]
        public void WhenTheUserAddsANewBudgetGroupWhereBudgetGroupCodeIsRetrievedTopologyOwnerLevelDescriptionMeasureUnit(string topology, string ownerLevel, string description, string measureUnit)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            BudgetGroupStepHelpersClass.PopulateBudgetGroupPopUp(null, topology, ownerLevel);
            Selenium.Click(PopupGenericElements.PopupButton("OK"));
            BudgetGroupStepHelpersClass.PopulateGeneralInfoTab(description, measureUnit);
            RetrievedValue = BudgetGroupStepHelpersClass.Code;
        }

        [When(@"the user adds a new budget group where Budget Group Code is retrieved, Topology: '([^']*)', Description: '([^']*)', Measure Unit: '([^']*)', Default Initial Value: '([^']*)'")]
        public void WhenTheUserAddsANewBudgetGroupWhereBudgetGroupCodeIsRetrievedTopologyDescriptionMeasureUnitDefaultInitialValue(string topology, string description, string measureUnit, string defaultInitialUnit)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            BudgetGroupStepHelpersClass.PopulateBudgetGroupPopUp(null, topology);
            Selenium.Click(PopupGenericElements.PopupButton("OK"));
            BudgetGroupStepHelpersClass.PopulateGeneralInfoTab(description, measureUnit);
            BudgetGroupStepHelpersClass.PopulateOwnersTab(defaultInitialUnit);
            RetrievedValue = BudgetGroupStepHelpersClass.Code;
        }

        [When(@"the user selects Owner tab User row number '([^']*)'")]
        public void WhenTheUserSelectsOwnerTabUserRowNumber(string rowNumber)
        {
            BudgetGroupStepHelpersClass.SelectOwnerTabUserByRowNumber(int.Parse(rowNumber));
        }

        [Then(@"the user validates that the checkbox cell in the Owner Tab in row number '([^']*)' is selected")]
        public void ThenTheUserValidatesThatTheCheckboxCellInTheOwnerTabInRowNumberIsSelected(string rowNumber)
        {
            string toRetrieve = BudgetGroupStepHelpers.SingleCodeUserSelected.Where(iterate => iterate.Key == int.Parse(rowNumber)).FirstOrDefault().Value;
            Assert.True(BudgetGroupStepHelpersClass.RetrieveCheckboxState(toRetrieve.Trim()), $"Failed to validate that row number '{rowNumber}' is selected in the Owners Tab row");
        }

        [Then(@"the user validates that the checkbox cell in the Owner Tab in row number '([^']*)' is editable")]
        public void ThenTheUserValidatesThatTheCheckboxCellInTheOwnerTabInRowNumberIsEditable(string rowNumber)
        {
            string toRetrieve = BudgetGroupStepHelpers.SingleCodeUserSelected.Where(iterate => iterate.Key == int.Parse(rowNumber)).FirstOrDefault().Value;
            Assert.False(BudgetGroupStepHelpersClass.RetrieveCheckboxDisabledState(toRetrieve.Trim()), $"Failed to validate that row number '{rowNumber}' is editable in the Owners Tab row");
        }

        [Then(@"the user validates that the Owners Tab Column: '([^']*)' has a value of '([^']*)' in row number: '([^']*)'")]
        public void ThenTheUserValidatesThatTheOwnersTabColumnHasAValueOfInRowNumber(string columnName, string rowText, string rowNumber)
        {
            Assert.True(BudgetGroupStepHelpersClass.GetOwnersTabColumnText(columnName, rowNumber).Contains(rowText), $"Failed to validate that Owners Tab contains '{rowText}' in the '{columnName}' column in row number '{rowNumber}'.");
        }

        [Then(@"the user validates that the Owners Tab Column: '([^']*)' in row number: '([^']*)' is editable")]
        public void ThenTheUserValidatesThatTheOwnersTabColumnInRowNumberIsEditable(string columnName, string rowNumber)
        {
            Assert.True(BudgetGroupStepHelpersClass.IsOwnersTabCellEditable(columnName, rowNumber), $"Failed to validate that Owners Tab {columnName} column cell at row number {rowNumber} is editable.");
            Selenium.EnterTextByKeys(Keys.Tab);
        }

        [Then(@"the user validates that the Owners Tab Column: '([^']*)' in row number: '([^']*)' is readonly")]
        public void ThenTheUserValidatesThatTheOwnersTabColumnInRowNumberIsReadonly(string columnName, string rowNumber)
        {
            Assert.False(BudgetGroupStepHelpersClass.IsOwnersTabCellEditable(columnName, rowNumber), $"Failed to validate that Owners Tab {columnName} column cell at row number {rowNumber} is read-only.");
            Selenium.EnterTextByKeys(Keys.Tab);
        }

        [When(@"the user clicks and enters '([^']*)' into the '([^']*)' column in the Owners Tab in row numbwr '([^']*)'")]
        public void WhenTheUserClicksAndEntersIntpTheColumnInTheOwnersTabInRowNumbwr(string textToEnter, string columnName, string rowNumber)
        {
            if (textToEnter.Contains("d") && textToEnter.Contains("m") && textToEnter.Contains("y") && textToEnter.Contains("/"))
            {
                textToEnter = CommonDates.DateParser(textToEnter);
            }
            BudgetGroupStepHelpersClass.ClickAndEnterTextIntoOwnersTabCell(columnName, rowNumber, textToEnter);
        }

        [Then(@"the user validates that the the Owners Tab Total Balance in the '([^']*)' column is '([^']*)'")]
        public void ThenTheUserValidatesThatTheTheOwnersTabTotalBalanceInTheColumnIs(string columnName, string total)
        {
            Assert.True(BudgetGroupStepHelpersClass.GetOwnersTabTotalValueInColumn(columnName).Trim().Contains(total), $"Failed to validate that {columnName} has the total value {total}.");
        }

        [Then(@"the user validates that the Owners Tab Column: '([^']*)' has a date value of '([^']*)' in row number: '([^']*)'")]
        public void ThenTheUserValidatesThatTheOwnersTabColumnHasADateValueOfInRowNumber(string columnName, string dateFormat, string rowNumber)
        {
            dateFormat = CommonDates.DateParser(dateFormat);
            Assert.True(BudgetGroupStepHelpersClass.GetOwnersTabColumnText(columnName, rowNumber).Contains(dateFormat), $"Failed to validate that Owners Tab contains '{dateFormat}' in the '{columnName}' column in row number '{rowNumber}'.");
        }

        [When(@"the user saves all selected users on the Budget Group Owners tab")]
        public void WhenTheUserSavesAllSelectedUsersOnTheBudgetGroupOwnersTab()
        {
            int userCount = 1;
            BudgetGroupStepHelpers.SingleCodeUserSelected = BudgetGroupStepHelpers.SingleCodeUserSelected.OrderBy(order => order.Key).ToList();
            foreach (KeyValuePair<int, string> user in BudgetGroupStepHelpers.SingleCodeUserSelected)
            {
                SaveValue("User" + userCount, user.Value);
                userCount++;
            }
        }

        [Then(@"the user validates that the checkbox cell in the Owner Tab in row number '([^']*)' is not selected")]
        public void ThenTheUserValidatesThatTheCheckboxCellInTheOwnerTabInRowNumberIsNotSelected(string rowNumber)
        {
            string toRetrieve = BudgetGroupStepHelpers.SingleCodeUserSelected.Where(iterate => iterate.Key == int.Parse(rowNumber)).FirstOrDefault().Value;
            Assert.False(BudgetGroupStepHelpersClass.RetrieveCheckboxState(toRetrieve.Trim()), $"Failed to validate that row number '{rowNumber}' is selected in the Owners Tab row");
        }

        [When(@"the user adds a new budget group where Budget Group Code is retrieved, Topology: '([^']*)', Description: '([^']*)', Budget Measures: '([^']*)', Default Initial Value: '([^']*)'")]
        public void WhenTheUserAddsANewBudgetGroupWhereBudgetGroupCodeIsRetrievedTopologyDescriptionBudgetMeasuresDefaultInitialValue(string topology, string description, string budgetMeasures, string defaultInitialUnit)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            BudgetGroupStepHelpersClass.PopulateBudgetGroupPopUp(null, topology);
            Selenium.Click(PopupGenericElements.PopupButton("OK"));
            BudgetGroupStepHelpersClass.PopulateGeneralInfoTab(description, null, budgetMeasures);
            BudgetGroupStepHelpersClass.PopulateOwnersTab(defaultInitialUnit);
            RetrievedValue = BudgetGroupStepHelpersClass.Code;
        }

        [When(@"the user adds a new budget group where Budget Group Code is retrieved, Topology: '([^']*)', Description: '([^']*)'")]
        public void WhenTheUserAddsANewBudgetGroupWhereBudgetGroupCodeIsRetrievedTopologyDescription(string topology, string description)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            BudgetGroupStepHelpersClass.PopulateBudgetGroupPopUp(null, topology);
            Selenium.Click(PopupGenericElements.PopupButton("OK"));
            BudgetGroupStepHelpersClass.PopulateGeneralInfoTab(description);
            RetrievedValue = BudgetGroupStepHelpersClass.Code;
        }

        [When(@"the user enters a Default Initial Value: '([^']*)' on the Budget Group Owners Tab")]
        public void WhenTheUserEntersADefaultInitialValueOnTheBudgetGroupOwnersTab(string defaultInitialUnit)
        {
            BudgetGroupStepHelpersClass.PopulateOwnersTab(defaultInitialUnit);
        }

        [Then(@"the user validates that the Owners Tab Column: '([^']*)' has no value in row number: '([^']*)'")]
        public void ThenTheUserValidatesThatTheOwnersTabColumnHasNoValueInRowNumber(string columnName, string rowNumber)
        {
            Assert.IsEmpty(BudgetGroupStepHelpersClass.GetOwnersTabColumnText(columnName, rowNumber), $"Failed to validate that Owners Tab is not empty in the '{columnName}' column in row number '{rowNumber}'.");
        }
    }
}
