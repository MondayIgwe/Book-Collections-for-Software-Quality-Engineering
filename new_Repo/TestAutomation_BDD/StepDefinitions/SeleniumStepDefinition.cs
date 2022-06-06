using Kantar_BDD.Pages;
using Kantar_BDD.Support.Helpers;
using Kantar_BDD.Support.Helpers.SFA;
using Kantar_BDD.Support.Selenium;
using NUnit.Framework;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
        public static string RetrievedValue { get; set; }
        public SalesForceStepHelpers SalesForceStepHelpers { get; set; }
        public SAStepHelpers SAStepHelpers { get; set; }
        public BudgetGroupStepHelpers BudgetGroupStepHelpersClass { get; set; }
        public UsersStepHelpers UsersStepHelpers { get; set; }
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
        }

        public bool IsKey(string possibleKey)
        {
            return ScenarioContext.ContainsKey(possibleKey);
        }

        public string GetValue(string key)
        {
            if (IsKey(key))
            {
                var search = ScenarioContext.Where(value => value.Key.Equals(key));
                return (string)search.FirstOrDefault().Value;
            }
            else
            {
                return key;
            }
        }

        public string RetrieveUserName()
        {
            Selenium.Click(UserProfile.HomeToolbarUserButton);
            return Selenium.GetText(Selenium.GetAbstractedBy("User Description Text"));
        }
    }
}
