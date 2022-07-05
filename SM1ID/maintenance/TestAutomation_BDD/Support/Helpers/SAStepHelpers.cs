using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.Promo;
using Kantar_BDD.Pages.SA;
using Kantar_BDD.Pages.Toolbar;
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
        public SeleniumFunctions Selenium { get; set; }
        public IWebDriver Driver { get; set; }
        CommonStepHelpers StepHelpers;
        public SAStepHelpers(IWebDriver driver)
        {
            Selenium = new SeleniumFunctions(driver);
            Driver = driver;
            StepHelpers = new CommonStepHelpers(driver);
        }

        /// <summary>
        /// Create a Balance 
        /// </summary>
        /// <param name="customerLevel"></param>
        /// <param name="customerCode"></param>
        /// <param name="BalanceYear"></param>
        public void CreateABalance(string customerLevel, string customerCode, string BalanceYear = null)
        {
            Selenium.ClickUntilElementIsDisplayed(GuiToolbar.AddButton, GenericElementsPage.TriggerByFieldName("Customer"));
            SelectCustomer(customerLevel, customerCode);

            if (string.IsNullOrEmpty(BalanceYear))
                StepHelpers.SelectsDropdownValueByFieldWithValue(BalanceYear, "Year", false);

            try
            {
                Selenium.ClickUntilElementIsDisplayed(PopupGenericElements.PopupOkButton("New Balance"), GenericElementsPage.InputElementBySM1ID("TxtBalanceID"));
            }
            catch (Exception) { };
        }

        public void SelectCustomer(string customerHLevel, string customerCode)
        {
            Selenium.Click(Balances.CustomerSelector);
            Selenium.Click(PromoPlanCalendarPage.HierLevel(customerHLevel));

            StepHelpers.FilterGrid("Customer code", "Like", customerCode);

            Selenium.Click(GridPopups.TextInGrid(customerCode));
            Selenium.Click(GenericElementsPage.OkButton);
        }
    }
}
