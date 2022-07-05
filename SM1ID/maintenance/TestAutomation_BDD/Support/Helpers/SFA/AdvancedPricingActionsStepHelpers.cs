using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.SFA.AdvancedPricingActions.Containers.PopUps;
using Kantar_BDD.Pages.SFA.Containers;
using Kantar_BDD.Support.Helpers;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using OpenQA.Selenium;

namespace Kantar_BDD.Support.Helpers
{
    public class AdvancedPricingActionsStepHelpers : CommonStepHelpers
    {
        public string AdvancedPricingActionsCode { get; set; }
        public AdvancedPricingActionsStepHelpers(IWebDriver driver) : base(driver)
        {
            AdvancedPricingActionsCode = "";
        }

        /// <summary>
        /// Populates the New Advanced Pricing Action pop up
        /// </summary>
        /// <param name="code">Canvas Code</param>
        /// <param name="advancedPricingBook">canvas Book</param>
        /// <param name="targetDiscount">Target Discount</param>
        /// <param name="applicationType">Application Type</param>
        /// <param name="valorizationType">Valorization Type</param>
        public void PopulateAdvancedPricingActionsPopUp(string code = null, string advancedPricingBook = null, bool targetDiscount = false, string applicationType = null, string valorizationType = null)
        {
            if(code == null)
            {
                Selenium.Click(NewAdvancedPricingActionsPopUp.CodeGenerateButton);
                Selenium.LooseFocusFromAnElement();
            }
            else
            {
                Selenium.Click(NewAdvancedPricingActionsPopUp.CodeField);
                Selenium.SendKeys(NewAdvancedPricingActionsPopUp.CodeField, code);
                Selenium.LooseFocusFromAnElement();
            }

            AdvancedPricingActionsCode = Selenium.GetText(NewAdvancedPricingActionsPopUp.CodeField);

            if (advancedPricingBook != null)
            {
                Selenium.Click(NewAdvancedPricingActionsPopUp.AdvancedPricingBookField);
                Selenium.SendKeys(NewAdvancedPricingActionsPopUp.AdvancedPricingBookField, advancedPricingBook);
                Selenium.LooseFocusFromAnElement();
            }

            if(targetDiscount == true)
            {
                Selenium.Click(NewAdvancedPricingActionsPopUp.TargetDiscountCheckbox);
            }

            if (applicationType != null)
            {
                Selenium.Click(NewAdvancedPricingActionsPopUp.ApplicationTypeField);
                Selenium.SendKeys(NewAdvancedPricingActionsPopUp.ApplicationTypeField, applicationType);
                Selenium.LooseFocusFromAnElement();
            }

            if (valorizationType != null)
            {
                Selenium.Click(NewAdvancedPricingActionsPopUp.ValorazationTypeField);
                Selenium.SendKeys(NewAdvancedPricingActionsPopUp.ValorazationTypeField, valorizationType);
                Selenium.LooseFocusFromAnElement();
            }
        }

        /// <summary>
        /// Populates the Advanced Pricing Actions New Benefit Pop Up menu fields
        /// </summary>
        /// <param name="benefitType">Benefit Type Field Value</param>
        /// <param name="benefitValue">Benefit Value Field Value</param>
        /// <param name="benefitUM">Benefit UM Field Value</param>
        /// <param name="benefitSubReason">Benefit Sub Field Value</param>
        public void AdvancedPricingBooksPopulateBenefitsPopUp(string benefitType = null, string benefitValue = null, string benefitUM = null, string benefitSubReason = null)
        {
            if (benefitType != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Benefit type"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Benefit type"), benefitType);
                Selenium.EnterTextByKeys(Keys.Enter);
                Selenium.LooseFocusFromAnElement();
            }
            if (benefitValue != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Benefit"));
                Selenium.EnterTextByKeys(GenericElementsPage.InputByLabelName("Benefit"), benefitValue);
                Selenium.LooseFocusFromAnElement();
            }
            if (benefitUM != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Benefit Um."));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Benefit Um."), benefitUM);
                Selenium.EnterTextByKeys(Keys.Enter);
                Selenium.LooseFocusFromAnElement();
            }
            if (benefitSubReason != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Benefit sub-reason"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Benefit sub-reason"), benefitSubReason);
                Selenium.EnterTextByKeys(Keys.Enter);
                Selenium.LooseFocusFromAnElement();
            }
        }
    }
}
