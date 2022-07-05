using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.SFA.Containers;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Support.Helpers.SFA
{
    public class UsersStepHelpers : CommonStepHelpers
    {
        public UsersStepHelpers(IWebDriver driver) : base(driver)
        {
        }

        /// <summary>
        /// Prerequisite: the Users nav gird is open and the add button is clicked
        /// Populates a new User pop up
        /// </summary>
        /// <param name="userCode">The user code</param>
        /// <param name="userId">The user ID</param>
        /// <param name="username">The User Name</param>
        /// <param name="predefinedDivision">A Predefined Division</param>
        /// <param name="group">The Group</param>
        /// <param name="languageCode">The Language Code</param>
        /// <param name="connectionCode">The Connection Code</param>
        public void PopulateNewUserPoUp(string userCode = null, string userId = null, string username = null, string predefinedDivision = null, string group = null, string languageCode = null, string connectionCode = null)
        {
            if (userCode != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("User Code"));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("User Code"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("User Code"), userCode + Keys.Enter);
                Selenium.LooseFocusFromAnElement();
            }
            if (userId != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("USER ID"));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("USER ID"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("USER ID"), userId + Keys.Enter);
                Selenium.LooseFocusFromAnElement();
            }
            if (username != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("User Name"));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("User Name"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("User Name"), username + Keys.Enter);
                Selenium.LooseFocusFromAnElement();
            }
            if (predefinedDivision != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Predefined Division"));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("Predefined Division"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Predefined Division"), predefinedDivision + Keys.Enter);
                Selenium.LooseFocusFromAnElement();
            }
            if (group != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Group"));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("Group"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Group"), group + Keys.Enter);
                Selenium.LooseFocusFromAnElement();
            }
            if (languageCode != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Language Code"));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("Language Code"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Language Code"), languageCode + Keys.Enter);
                Selenium.LooseFocusFromAnElement();
            }
            if (connectionCode != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Connection type"));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("Connection type"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Connection type"), connectionCode + Keys.Enter);
                Selenium.LooseFocusFromAnElement();
            }

            Selenium.Click(PopupGenericElements.PopupOkButton("NEW USER POPUP"));
        }

        /// <summary>
        /// Prerequisite: A new user was created and the new user configurator is open
        /// Adds a new Division to a newly created User
        /// </summary>
        /// <param name="division">The Division to add a group to</param>
        /// <param name="groupToAdd">The group to add to the division</param>
        /// <param name="connectionType">The Connection Type of the group to be added</param>
        public void AddGroupToDivision(string division, string groupToAdd, string connectionType)
        {
            Selenium.ValidateElementDisplayed(GenericElementsPage.SidePanelTab("Divisions"));
            Selenium.Click(GenericElementsPage.SidePanelTab("Divisions"));

            Selenium.JavaScriptClickUntilElementIsDisplayed(Selenium.GetVisibleElement(NavGrid.ContainsTextInNavGrid(division)), PopupGenericElements.GenericPopUpContainsHeader("Groups: Division"), 5);
            Selenium.Click(SectionGrid.SectionPopUpAddButton("Groups: Division"));

            Selenium.Click(GenericElementsPage.InputByLabelName("Group"));
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Group"), groupToAdd + Keys.Enter);

            Selenium.Click(GenericElementsPage.InputByLabelName("Connection type"));
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Connection type"), connectionType + Keys.Enter);

            Selenium.LooseFocusFromAnElement();
            Selenium.Click(PopupGenericElements.PopupOkButton("Add the user connection type"));
        }

        /// <summary>
        /// Prerequisite: A new user was created and the new user configurator is open
        /// Removes a group from the specified division
        /// </summary>
        /// <param name="division">The Division to remove a group from</param>
        /// <param name="groupToRemoveOrConnectionType">the Group/Connection Type to remove from the selected Division</param>
        public void RemoveGroupFromDivision(string division, string groupToRemoveOrConnectionType)
        {
            Selenium.ValidateElementDisplayed(GenericElementsPage.SidePanelTab("Divisions"));
            Selenium.Click(GenericElementsPage.SidePanelTab("Divisions"));

            Selenium.JavaScriptClickUntilElementIsDisplayed(Selenium.GetVisibleElement(NavGrid.ContainsTextInNavGrid(division)), PopupGenericElements.GenericPopUpContainsHeader("Groups: Division"), 5);
            Selenium.Click(SectionGrid.SectionContainsTextInGrid("Groups: Division", groupToRemoveOrConnectionType));

            Selenium.ClickUntilElementIsDisplayed(SectionGrid.SectionPopUpRemoveButton("Groups: Division"), SavePopup.OKButton);
            Selenium.ValidateElementDisplayed(SavePopup.OKButton);
            Selenium.Click(SavePopup.OKButton);
        }
    }
}
