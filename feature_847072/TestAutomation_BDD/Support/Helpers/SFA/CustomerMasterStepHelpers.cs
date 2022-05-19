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
    public class CustomerMasterStepHelpers : StepHelpers
    {
        public GridStepHelpers GridStepHelpers { get; set; }
        public string CustomerCodeSelected { get; set; }
        public CustomerMasterStepHelpers(IWebDriver driver) : base(driver)
        {
            GridStepHelpers = new GridStepHelpers(driver);
            CustomerCodeSelected = "";
        }

        /// <summary>
        /// Pre-requisite: The Add new customer pop must be open
        /// Populates the Add new Customer pop-up on the customer master pop up
        /// </summary>
        /// <param name="customerType">The Customer Type</param>
        /// <param name="nation">The Nation</param>
        /// <param name="vatCode">The Vat Code</param>
        /// <param name="billTo">Filters the Customer Code table for Bill-to value</param>
        /// <param name="shipTo">\Filters the Customer Code table for Ship-to value</param>
        /// <param name="customerPosition">Selects the cusotmer on by row number</param>
        public void AddNewCustomerMaster(string customerType, string nation = null, string vatCode = null, string billTo = null, string shipTo = null, int customerPosition = 0)
        {
            Selenium.Click(GenericElementsPage.InputByLabelName("Customer Type"));
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Customer Type"), customerType);
            Selenium.LooseFocusFromAnElement();
            
            if (nation != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Nation"));
                Selenium.ClearText(GenericElementsPage.InputByLabelName("Nation"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Nation"), nation);
                Selenium.LooseFocusFromAnElement();
            }

            if (vatCode != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("VAT Code"));
                Selenium.ClearText(GenericElementsPage.InputByLabelName("VAT Code"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("VAT Code"), vatCode);
                Selenium.LooseFocusFromAnElement();
            }

            if(billTo != null)
            {
                Selenium.Click(GenericElementsPage.GenericDropDownTrigger("Bill-to"));
                Selenium.ValidateAllElementsLoaded(CustomerMasterGrid.SelectRow(1.ToString()));
                Selenium.ValidateElementDisplayed(CustomerMasterGrid.SelectRow(1.ToString()), 30);
                FilterGrid("Customer Code", "Like", billTo);
                Selenium.ValidateAllElementsLoaded(CustomerMasterGrid.SelectRow(1.ToString()));
                CustomerCodeSelected = GridStepHelpers.GetTextFromTable(CustomerMasterGrid.Columns, CustomerMasterGrid.RowsLeft, CustomerMasterGrid.RowsRight, "Customer Code", 1);
                Selenium.ClickJavaScript(CustomerMasterGrid.SelectRow(1.ToString()), 15);
                Selenium.Click(PopupGenericElements.PopupOkButton("Customer Master"));
                Selenium.LooseFocusFromAnElement();
            }

            if (shipTo != null)
            {
                Selenium.Click(GenericElementsPage.GenericDropDownTrigger("Ship-to"));
                Selenium.ValidateElementDisplayed(CustomerMasterGrid.SelectRow(1.ToString()), 30);
                FilterGrid("Customer Code", "Like", shipTo);
                Selenium.ValidateAllElementsLoaded(CustomerMasterGrid.SelectRow(1.ToString()));
                CustomerCodeSelected = GridStepHelpers.GetTextFromTable(CustomerMasterGrid.Columns, CustomerMasterGrid.RowsLeft, CustomerMasterGrid.RowsRight, "Customer Code", 1);
                Selenium.ClickJavaScript(CustomerMasterGrid.SelectRow(1.ToString()), 15);
                Selenium.Click(PopupGenericElements.PopupOkButton("Customer Master"));
                Selenium.LooseFocusFromAnElement();
            }

            if (customerPosition != 0)
            {
                List<IWebElement> elementList = Selenium.Find(GenericElementsPage.GenericDropDownTrigger("Customer"));
                IWebElement element = elementList.Where(iterate => iterate.Displayed).FirstOrDefault();
                element.Click();
                Selenium.ValidateAllElementsLoaded(CustomerMasterGrid.CustomersSelectRow(customerPosition.ToString()));
                Selenium.ValidateElementDisplayed(CustomerMasterGrid.CustomersSelectRow(customerPosition.ToString()), 30);
                Selenium.Click(CustomerMasterGrid.CustomersSelectRow(customerPosition.ToString()), 15);
                Selenium.Click(CustomerMasterGrid.PopupButtonInGridSm1Id("Customer"));
                Selenium.LooseFocusFromAnElement();
            }
        }
    }
}
