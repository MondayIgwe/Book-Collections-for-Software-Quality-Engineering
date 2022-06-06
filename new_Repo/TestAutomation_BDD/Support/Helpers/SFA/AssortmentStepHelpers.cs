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
    public class AssortmentStepHelpers : StepHelpers
    {
        public AssortmentStepHelpers(IWebDriver driver) : base(driver)
        {
        }

        public void PopulateNewAssortmentPopUp(string Type, string CustomerNode, string StartDate = null, string EndDate = null, string AssortmentType_ProductLine = null, string CustomerNodeLevel = null, string CustomerNodeDescription = null)
        {
            int counter = 0;
            Selenium.ValidateEnabledAndDisplayed(AssortmentsPopUp.NewAssortmentsPopUpMenu, 30);
            Selenium.Click(AssortmentsPopUp.AssortmentTypeCheckbox(Type));
            if (AssortmentType_ProductLine != null)
            {
                if(!AssortmentType_ProductLine.Equals("Order - Execution"))
                {
                    Selenium.Click(GenericElementsPage.InputByLabelName("Assortment Type - Product Line"));
                    Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("Assortment Type - Product Line"));
                    Selenium.SendKeys(GenericElementsPage.InputByLabelName("Assortment Type - Product Line"), AssortmentType_ProductLine);
                    Selenium.LooseFocusFromAnElement();
                }
            }
            
            Selenium.Click(AssortmentsPopUp.CustomerNodeDropDown);
            Selenium.ValidateEnabledAndDisplayed(CustomerNodesGrid.SelectRow(1.ToString()), 15);
            
            if (CustomerNodeLevel != null)
            {
                FilterGrid("Level", "Like", CustomerNodeLevel);
            }

            if (CustomerNodeDescription != null)
            {
                FilterGrid("Customer description", "Like", CustomerNodeDescription);
            }

            FilterGrid("Customer code", "Like", CustomerNode);
            Selenium.Click(CustomerNodesGrid.SelectRow(1.ToString()), 15);
            Selenium.Click(PopupGenericElements.PopupOkButton("Customer Hierarchy Nodes"));

            if (StartDate != null && EndDate != null)
            {
                StartDate = CommonDates.DateParser(StartDate);
                EndDate = CommonDates.DateParser(EndDate);
                while (!ValidateDateField(GenericElementsPage.Sm1IdAttributeOfField(AssortmentsPopUp.ValidityPeriodCalendarButton.ByToString), StartDate, EndDate) || counter < 10)
                {
                    SelectDatePeriod(AssortmentsPopUp.ValidityPeriodCalendarButton, StartDate, EndDate);
                    bool breakLoop = ValidateDateField(GenericElementsPage.Sm1IdAttributeOfField(AssortmentsPopUp.ValidityPeriodCalendarButton.ByToString), StartDate, EndDate);
                    if (breakLoop) { break; }
                    counter++;
                }

            }
            Selenium.Click(PopupGenericElements.PopupOkButton("Assortment"));
        }

        public void PopulateGeneralInfoTabAndSave(string Description = null, string Status = null, string Save_YesOrNo = null)
        {
            if(!Selenium.ValidateEnabledAndDisplayed(NavigationMenu.GeneralInfoTab, 30))
            {
                Selenium.Click(NavigationMenu.GeneralInfoTab);
            }

            if (Description != null)
            {
                if (!Selenium.ValidateEnabledAndDisplayed(GeneralInfoPage.AssortmentDescription))
                {
                    Selenium.Click(GeneralInfoPage.AssortmentDescription, 15);
                    Selenium.ClearText(GeneralInfoPage.AssortmentDescription);
                }
                Selenium.Click(GeneralInfoPage.AssortmentDescription, 15);
                Selenium.SendKeys(GeneralInfoPage.AssortmentDescription, Description);
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
