using Kantar_BDD.Pages;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace Kantar_BDD.Support.Helpers.Selenium
{
    public class SeleniumStepHeplers
    {
        public SeleniumFunctions Selenium { get; set; }
        public IWebDriver Driver { get; set; }

        int counter = 0;
        public SeleniumStepHeplers(IWebDriver driver)
        {
            Selenium = new SeleniumFunctions(driver);
            Driver = driver;
        }

        /// <summary>
        /// Validates that an element is visible
        /// </summary>
        /// <param name="element">Element Abstracted By to validate</param>
        /// <param name="timeout">Maximum timeout value</param>
        /// <returns>True/False</returns>
        public bool ValidateElementVisible(AbstractedBy element, int timeout = 10)
        {
            try
            {
                Selenium.ValidateAllElementsLoaded(element);
                //1. check the element is present
                if (Selenium.Find(element).Count < 1)
                {
                    return false;
                }

                //2. get the element
                IWebElement webElement = Selenium.FindOne(element, timeout);

                Selenium.ScrollJS(webElement);
                //3. if the element doesnt have Displayed as true 

                if (Selenium.HasAttribute(element, "style", "hidden"))
                    return false;

                if (Selenium.HasAttribute(element, "style", "none"))
                    return false;

                if (Selenium.HasAttribute(element, "aria-hidden", "true"))
                    return false;


                return true;
            }
            catch (WebDriverTimeoutException)
            {
                return false;
            }
        }


        /// <summary>
        /// Checks if a variable is a key stored in the scenario context object
        /// </summary>
        /// <param name="scenarionContext"></param>
        /// <param name="possibleKey">Variable to check</param>
        /// <returns>True/False</returns>
        private bool IsKey(ScenarioContext scenarionContext, string possibleKey)
        {
            return scenarionContext.ContainsKey(possibleKey);
        }

        /// <summary>
        /// Gets a value based on the Key value
        /// </summary>
        /// <param name="scenarionContext"></param>
        /// <param name="key">Variable/Name used as a key to store a value</param>
        /// <returns>The value corresponding to the Key value</returns>
        private string GetValue(ScenarioContext scenarionContext, string key)
        {
            var search = scenarionContext.Where(value => value.Key.Equals(key));
            return (string)search.FirstOrDefault().Value;
        }

        /// <summary>
        /// Converts the string argoment array to the object array
        /// if a parsed argument is a date format, the date parser parses the argument to the required date format
        /// if date flag is true for column name, then the argument is conveerted to the appropriste format
        /// </summary>
        /// <param name="scenarioContext">the dictionary that the extracted values are stored in</param>
        /// <param name="arguments">arguments that are to be checked and parsed</param>
        /// <param name="isDateFlag">if true, for column name, then the argument is conveerted to the appropriste format</param>
        /// <returns></returns>
        public object[] CheckArguments(ScenarioContext scenarioContext, string[] arguments, bool isDateFlag = false)
        {
            List<object> result = new List<object>();
            foreach (string arg in arguments)
            {
                string newArgument = arg;
                if (IsKey(scenarioContext, newArgument))
                {
                    newArgument = GetValue(scenarioContext, newArgument);
                }

                if (newArgument.Contains("/"))
                {
                    newArgument = CommonDates.DateParser(newArgument);
                }

                if (isDateFlag)
                {
                    if (Selenium.IsDateTime(newArgument))
                    {
                        string[] dateFormat = newArgument.Split('/');
                        newArgument = dateFormat[0] + "/" + dateFormat[1];
                    }
                }
                result.Add(newArgument);
            }
            return result.ToArray();
        }

        /// <summary>
        /// Validates that the page displayed is the expected page
        /// </summary>
        /// <param name="pageName">Page name to validate</param>
        /// <param name="timeout">Maximum timeout value</param>
        /// <returns>True/False</returns>
        public bool ValidateThatUserIsOnPage(string pageName, int timeout = 30)
        {
            AbstractedBy pageMapped;
            try
            {
                pageMapped = Selenium.GetAbstractedBy(pageName);
                Selenium.FluentWaitElementToBePresent(pageMapped);
            }
            catch (Exception)
            {
                pageMapped = NavigationMenu.HomeToolbarPageName(pageName);
                Selenium.FluentWaitForText(pageMapped, pageName, 15, false);
            }
            return Selenium.ValidateElementDisplayed(pageMapped, timeout);
        }

        /// <summary>
        /// Checks if the logical name is a column logical name
        /// </summary>
        /// <param name="elementLogicalName">The Element Logocal Name</param>
        /// <returns>True/False</returns>
        public bool IsLogicalNameForColumnName(string elementLogicalName)
        {
            return elementLogicalName.Equals("Grid Filter") ||
                elementLogicalName.Equals("Column") ||
                elementLogicalName.Equals("Column Name") ||
                elementLogicalName.Equals("Column Data Name") ||
                elementLogicalName.Equals("Column Heading");
        }
    }
}
