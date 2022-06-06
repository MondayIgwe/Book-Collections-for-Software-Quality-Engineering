using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.SFA.Containers;
using Kantar_BDD.Support.Helpers;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using OpenQA.Selenium;

namespace Kantar_BDD.Support.Helpers
{
    public class AdvancedPricingActionsStepHelpers : StepHelpers
    {
        public string AdvancedPricingActionsCode { get; set; }
        public AdvancedPricingActionsStepHelpers(IWebDriver driver) : base(driver)
        {
            AdvancedPricingActionsCode = "";
        }

        public void PopulateAdvancedPricingActionsPopUp(string code = null, string advancedPricingBook = null, bool targetDiscount = false, string applicationType = null, string valorizationType = null)
        {
            if(code == null)
            {
                Selenium.Click(GenericElementsPage.GenericGenerateCodeButton("Code"));
                Selenium.LooseFocusFromAnElement();
            }
            else
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Code"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Code"), code);
                Selenium.LooseFocusFromAnElement();
            }

            AdvancedPricingActionsCode = Selenium.GetText(GenericElementsPage.InputByLabelName("Code"));

            if (advancedPricingBook != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Advanced Pricing Book"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Advanced Pricing Book"), advancedPricingBook);
                Selenium.LooseFocusFromAnElement();
            }

            if(targetDiscount == true)
            {
                Selenium.Click(GenericElementsPage.CheckboxInputByLabel("Target discount"));
            }

            if (applicationType != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Application type"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Application type"), applicationType);
                Selenium.LooseFocusFromAnElement();
            }

            if (valorizationType != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Valorization type"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Valorization type"), valorizationType);
                Selenium.LooseFocusFromAnElement();
            }
        }
    }
}
