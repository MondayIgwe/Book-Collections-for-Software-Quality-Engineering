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
    public class UsersStepHelpers : StepHelpers
    {
        public UsersStepHelpers(IWebDriver driver) : base(driver)
        {
        }

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

        public void AddGroupToDivision(string division, string groupToAdd, string connectionType)
        {
            Selenium.ValidateEnabledAndDisplayed(GenericElementsPage.SidePanelTab("Divisions"));
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

        public void RemoveGroupFromDivision(string division, string groupToRemoveOrConnectionType)
        {
            Selenium.ValidateEnabledAndDisplayed(GenericElementsPage.SidePanelTab("Divisions"));
            Selenium.Click(GenericElementsPage.SidePanelTab("Divisions"));

            Selenium.JavaScriptClickUntilElementIsDisplayed(Selenium.GetVisibleElement(NavGrid.ContainsTextInNavGrid(division)), PopupGenericElements.GenericPopUpContainsHeader("Groups: Division"), 5);
            Selenium.Click(SectionGrid.SectionContainsTextInGrid("Groups: Division", groupToRemoveOrConnectionType));

            Selenium.ClickUntilElementIsDisplayed(SectionGrid.SectionPopUpRemoveButton("Groups: Division"), SavePopup.OKButton);
            Selenium.ValidateEnabledAndDisplayed(SavePopup.OKButton);
            Selenium.Click(SavePopup.OKButton);
        }
    }
}
