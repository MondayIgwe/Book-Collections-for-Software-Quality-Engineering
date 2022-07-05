using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Toolbar;
using TechTalk.SpecFlow;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class UsersStepDefinitions : SeleniumStepDefinition
    {
        public UsersStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user adds a new User where User Code: '([^']*)', User ID: '([^']*)', User Name: '([^']*)', Predefined Division: '([^']*)', Group: '([^']*)', Language code: '([^']*)', Connection type: '([^']*)'")]
        public void WhenTheAddsANewUserWhereUserCodeUserIDUserNamePredefinedDivisionGroupLanguageCodeConnectionType(string userCode, string userID, string userName, string predefinedDivision, string group, string languageCode, string connectionType)
        {
            Selenium.Click(GuiToolbar.AddButton, 30);
            UsersStepHelpers.PopulateNewUserPoUp(userCode, userID, userName, predefinedDivision, group, languageCode, connectionType);
        }

        [When(@"the user adds a new User Division where Division: '([^']*)', Group: '([^']*)', Connection type: '([^']*)'")]
        public void WhenTheUserAddsANewUserDivisionWhereDivisionGroupConnectionType(string division, string group, string connectionType)
        {
            UsersStepHelpers.AddGroupToDivision(division, group, connectionType);
        }

        [When(@"the user removes the User Division where Division: '([^']*)', Group or Connection type: '([^']*)'")]
        public void WhenTheUserRemovesTheUserDivisionWhereDivisionGroupOrConnectionType(string division, string groupOrConnectionType)
        {
            UsersStepHelpers.RemoveGroupFromDivision(division, groupOrConnectionType);
        }

    }
}
