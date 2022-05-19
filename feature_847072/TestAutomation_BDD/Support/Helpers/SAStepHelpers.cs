using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.Promo;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Kantar_BDD.Support.Helpers
{
    public class SAStepHelpers
    {
        private int counter = 0;

        public SeleniumFunctions Selenium { get; set; }
        public IWebDriver Driver { get; set; }
        StepHelpers StepHelpers;
        public SAStepHelpers(IWebDriver driver)
        {
            Selenium = new SeleniumFunctions(driver);
            Driver = driver;
            StepHelpers = new StepHelpers(driver);
        }

        /// <summary>
        /// Create a Balance 
        /// </summary>
        /// <param name="customerLevel"></param>
        /// <param name="customerCode"></param>
        /// <param name="BalanceYear"></param>
        public void CreateABalance(string customerLevel, string customerCode, string BalanceYear = null)
        {
            Selenium.ClickUntilElementIsDisplayed(GenericElementsPage.AddButton, GenericElementsPage.TriggerByFieldName("Customer"));
            StepHelpers.SelectCustomer(customerLevel, customerCode);

            if (string.IsNullOrEmpty(BalanceYear))
                StepHelpers.SelectsDropdownValueByFieldWithValue(BalanceYear, "Year", false);

            try
            {
                Selenium.ClickUntilElementIsDisplayed(PopupGenericElements.PopupOkButton("New Balance"), GenericElementsPage.InputByLabelName("Balance ID:"));
            }
            catch (Exception) { };
        }
    }
}
