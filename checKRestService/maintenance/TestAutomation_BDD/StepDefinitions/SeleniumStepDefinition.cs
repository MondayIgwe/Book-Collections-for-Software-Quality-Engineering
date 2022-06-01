using Kantar_BDD.Pages;
using Kantar_BDD.Support.Helpers;
using Kantar_BDD.Support.Helpers.Selenium;
using Kantar_BDD.Support.Helpers.SFA;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using System;
using System.Linq;
using TechTalk.SpecFlow;
[assembly: Parallelizable(ParallelScope.Fixtures)]

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class SeleniumStepDefinition
    {
        public ScenarioContext ScenarioContext { get; set; }
        public SeleniumFunctions Selenium { get; set; }
        public IWebDriver Driver { get; set; }
        public StepHelpers StepHelpers { get; set; }
        public AssortmentStepHelpers AssortmentStepHelpers { get; set; }
        public GridStepHelpers GridStepHelpers { get; set; }
        public SFASaleOrdersStepHelpers SFASaleOrdersStepHelpers { get; set; }
        public PromoStepHelpers PromoStepHelpers { get; set; }
        public CustomerMasterStepHelpers CustomerMasterStepHelpers { get; set; }
        public AdvancedPricingActionsStepHelpers AdvancedPricingActionsStepHelpers { get; set; }
        public DiscountListsStepHelpers DiscountListsStepHelpers { get; set; }
        [ThreadStatic] public static string RetrievedValue = string.Empty;
        public SalesForceStepHelpers SalesForceStepHelpers { get; set; }
        public SAStepHelpers SAStepHelpers { get; set; }
        public BudgetGroupStepHelpers BudgetGroupStepHelpersClass { get; set; }
        public UsersStepHelpers UsersStepHelpers { get; set; }
        public SeleniumStepHeplers SeleniumHelpers { get; set; }
        public SeleniumStepDefinition(ScenarioContext scenarionContext) 
        {
            ScenarioContext = scenarionContext;
            Driver = scenarionContext.Get<IWebDriver>("Driver");
            Selenium = new SeleniumFunctions(Driver);
            StepHelpers = new StepHelpers(Driver);
            AssortmentStepHelpers = new AssortmentStepHelpers(Driver);
            GridStepHelpers = new GridStepHelpers(Driver);
            SFASaleOrdersStepHelpers = new SFASaleOrdersStepHelpers(Driver);
            PromoStepHelpers = new PromoStepHelpers(Driver);
            CustomerMasterStepHelpers = new CustomerMasterStepHelpers(Driver);
            AdvancedPricingActionsStepHelpers = new AdvancedPricingActionsStepHelpers(Driver);
            SalesForceStepHelpers = new SalesForceStepHelpers(Driver);
            DiscountListsStepHelpers = new DiscountListsStepHelpers(Driver);
            SAStepHelpers = new SAStepHelpers(Driver);
            BudgetGroupStepHelpersClass = new BudgetGroupStepHelpers(Driver);
            UsersStepHelpers = new UsersStepHelpers(Driver);
            SeleniumHelpers = new SeleniumStepHeplers(Driver);
        }

        public bool IsKey(string possibleKey)
        {
            return ScenarioContext.ContainsKey(possibleKey);
        }

        /// <summary>
        /// replaces a key with a string value from ScenarioContext map.
        /// if the string contains a key inside a longer string with left and right boundaries as ##
        /// This will be stripped and replaced with that value from ScenarioContext. e.g #savedValue#_user
        /// </summary>
        /// <param name="key"></param>
        /// <returns>string</returns>
        public string GetValue(string key)
        {
            string valueToReturn = key;
            if (IsKey(key))
            {
                var search = ScenarioContext.Where(value => value.Key.Equals(key));
                valueToReturn = (string)search.FirstOrDefault().Value;
            }
            if (valueToReturn.Count(f => f == '#')>1)
                valueToReturn = ReplaceSavedValuesInString(key);

            if (key.Contains("/") && (key.Contains("d") || key.Contains("m") || key.Contains("y")))
                valueToReturn = CommonDates.DateParser(valueToReturn);

            return valueToReturn;
        }

        public void SaveValue(string key, string value)
        {
            if (IsKey(key))
            {
                ScenarioContext[key] = value;
            }
            else
            {
                ScenarioContext.Add(key, value);
            }
        }

        /// <summary>
        /// Replaces a string identified by ## by a value thats saved in the scenarionContext
        /// </summary>
        /// <param name="scenarionContext"></param>
        /// <param name="text"></param>
        /// <returns>The updated string after replacing</returns>
        public string ReplaceSavedValuesInString(string text)
        {
            while (text.Contains("#"))
            {
                var startIndex = text.IndexOf("#") + 1;
                var endIndex = text.IndexOf("#", startIndex);
                var key = text.Substring(startIndex, endIndex - startIndex);

                if (IsKey(key))
                {
                    var value = GetValue(key);
                    text = text.Replace($"#{key}#", value);
                }
                else
                {
                    break;
                }
            }
            return text;
        }

        /// <summary>
        /// Rertrieves the logged user's username
        /// </summary>
        /// <returns>String username</returns>
        public string RetrieveUserName()
        {
            Selenium.Click(UserProfile.HomeToolbarUserButton);
            return Selenium.GetText(Selenium.GetAbstractedBy("User Description Text"));
        }

        /// <summary>
        /// Adds a value to the Scenario context
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        public void AddToScenarioContext(string key, string value)
        {
            if (IsKey(key))
            {
                ScenarioContext[key] = value;
            }
            else
            {
                ScenarioContext.Add(key, value);
            }
        }
    }
}
