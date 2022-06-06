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
    public class SalesForceStepHelpers : StepHelpers
    {
        public SalesForceStepHelpers(IWebDriver driver) : base(driver)
        {
        }

        public void PopulateNewPriceListPopUp(string Type, string listCode, string CustomerNodeLevel = null, string CustomerNodeDescription = null, string CustomerNode = null, string StartDate = null, string EndDate = null)
        {
            int counter = 0;
            Selenium.ValidateEnabledAndDisplayed(SaleForcePopUp.NewSaleForcePopUpMenu, 30);
            Selenium.Click(SaleForcePopUp.SalesForceTypeCheckbox(Type));

            if (listCode != null)
            {
                Selenium.SendKeys(SaleForcePopUp.SalesForceListCodeField, listCode + Keys.Enter);               
            }
            
            if (CustomerNodeLevel != null)
            {
                Selenium.Click(SaleForcePopUp.PriceListeNodeCodeDropDown);
                Selenium.ValidateEnabledAndDisplayed(CustomerNodesGrid.SelectRow(1.ToString()), 15);
                FilterGrid("Level", "Like", CustomerNodeLevel);
            }

            if (CustomerNodeDescription != null)
            {
                FilterGrid("Customer description", "Like", CustomerNodeDescription);
            }

            if(CustomerNode != null)
            {
                FilterGrid("Customer code", "Like", CustomerNode);
                Selenium.Click(CustomerNodesGrid.SelectRow(1.ToString()), 15);
                Selenium.Click(PopupGenericElements.PopupOkButton("Customer Hierarchy Nodes"));
            }
           
            if (StartDate != null && EndDate != null)
            {
                StartDate = CommonDates.DateParser(StartDate);
                EndDate = CommonDates.DateParser(EndDate);
                while (!ValidateDateField(GenericElementsPage.Sm1IdAttributeOfField(SaleForcePopUp.ValidityPeriodCalendarButton.ByToString), StartDate, EndDate) || counter < 10)
                {
                    SelectDatePeriod(SaleForcePopUp.ValidityPeriodCalendarButton, StartDate, EndDate);
                    bool breakLoop = ValidateDateField(GenericElementsPage.Sm1IdAttributeOfField(SaleForcePopUp.ValidityPeriodCalendarButton.ByToString), StartDate, EndDate);
                    if (breakLoop) { break; }
                    counter++;
                }

            }
            Selenium.Click(PopupGenericElements.PopupOkButton("New List"));
        }

        public void PopulateGeneralInfoTabAndSave(string Description = null, string Status = null, string Save_YesOrNo = null)
        {
            Selenium.ValidateEnabledAndDisplayed(NavigationMenu.GeneralInfoTab, 30);
            if (Description != null)
            {
                if (!Selenium.ValidateEnabledAndDisplayed(GeneralInfoPage.NewListDescription))
                {
                    Selenium.Click(GeneralInfoPage.NewListDescription, 15);
                    Selenium.ClearText(GeneralInfoPage.NewListDescription);
                }
                Selenium.Click(GeneralInfoPage.NewListDescription, 15);
                Selenium.SendKeys(GeneralInfoPage.NewListDescription, Description);
            }
            if (Status != null)
            {
                Selenium.Click(GeneralInfoPage.AssortmentStatusCodeField, 15);
                Selenium.ClearByKeys(GeneralInfoPage.AssortmentStatusCodeField);
                Selenium.SendKeys(GeneralInfoPage.AssortmentStatusCodeField, Status + Keys.Enter);
                Selenium.LooseFocusFromAnElement();
            }
            if (Save_YesOrNo != null)
            {
                if (Save_YesOrNo.Trim().ToUpper().Equals("YES"))
                {
                    Selenium.Click(NavigationMenu.SaveButton);
                }
            }
        }

        public void EditAssortment(string text)
        {
            Selenium.Click(NavigationMenu.GeneralInfoTab);
            Selenium.Click(GenericElementsPage.Button(text));
        }
    }
}
