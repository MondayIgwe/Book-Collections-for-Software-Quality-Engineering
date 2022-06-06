using Kantar_BDD.Pages;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

        public bool ValidateElementVisible(AbstractedBy element, int timeout = 10)
        {
            try
            {
                if (Selenium.Find(element).Count < 1)
                {
                    return false;
                }

                if (Selenium.FindOne(element, timeout) == null)
                {
                    return false;
                }

                Selenium.FluentWaitElementToBePresent(element, timeout);
                IWebElement webElement = Selenium.GetVisibleElement(element, timeout);
                
                if(webElement == null)
                {
                    webElement = Selenium.FindOne(element, timeout);
                }

                Selenium.ScrollJS(webElement);
                if (!webElement.Displayed)
                {
                    if (!Selenium.HasAttribute(element, "aria-hidden", "false") && (Selenium.HasAttribute(element, "style", "hidden") || Selenium.HasAttribute(element, "style", "none")))
                    {
                        return false;
                    }

                    if (webElement.GetAttribute("disabled") != null)
                    {
                        return true;
                    }
                    else if (Selenium.HasAttribute(element, "aria-hidden", "false"))
                    {
                        return true;
                    }
                    else if (Selenium.HasAttribute(element, "aria-disabled", "false"))
                    {
                        return true;
                    }
                    // ---- > consult the team
                    else if (webElement.GetAttribute("readonly") != null)
                    {
                        return true;
                    }
                    else if (Selenium.HasAttribute(element, "aria-readonly", "true"))
                    {
                        return true;
                    }                    
                    // ------------------------------------------
                    else
                    {
                        return false;
                    }
                }

                //Selenium.HasAttribute
                string ariaHidden = webElement.GetAttribute("aria-hidden");
                //string.Empty
                //null
                //any string
                string style = webElement.GetAttribute("style");
                //string.Empty
                //null
                //any string

                if (!Selenium.HasAttribute(element, "aria-hidden", "false") && (Selenium.HasAttribute(element, "style", "hidden") || Selenium.HasAttribute(element, "style", "none")))
                {
                    return false;
                }

                
                return true;
            }
            catch (WebDriverTimeoutException)
            {
                return false;
            }
        }

        private bool IsKey(ScenarioContext scenarionContext, string possibleKey)
        {
            return scenarionContext.ContainsKey(possibleKey);
        }

        private string GetValue(ScenarioContext scenarionContext, string key)
        {
            var search = scenarionContext.Where(value => value.Key.Equals(key));
            return (string)search.FirstOrDefault().Value;
        }

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
                result.Add(arg);
            }
            return result.ToArray();
        }

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
                Selenium.FluentWaitForText(pageMapped, pageName);
            }
            return Selenium.ValidateEnabledAndDisplayed(pageMapped, timeout);
        }
    }
}
