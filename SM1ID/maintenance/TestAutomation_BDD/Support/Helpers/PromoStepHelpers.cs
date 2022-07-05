using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.Promo;
using Kantar_BDD.Pages.Toolbar;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;

namespace Kantar_BDD.Support.Helpers
{
    public class PromoStepHelpers
    {
        public SeleniumFunctions Selenium { get; set; }
        public IWebDriver Driver { get; set; }
        CommonStepHelpers StepHelpers;
        public PromoStepHelpers(IWebDriver driver) 
        {
            Selenium = new SeleniumFunctions(driver);
            Driver = driver;
            StepHelpers = new CommonStepHelpers(driver);
        }

        /// <summary>
        /// Create a new promo for a specific customer. ref year and productSegment only populated if provided
        /// </summary>
        /// <param name="customerHLevel"></param>
        /// <param name="customerCode"></param>
        /// <param name="confirmLevel"></param>
        /// <param name="refYear"></param>
        /// <param name="productSegment"></param>
        public void CreateAPromo(string customerHLevel, string customerCode, string confirmLevel = null, string refYear = null, string productSegment = null )
        {
            if (Selenium.ValidateElementOnPage(GuiToolbar.AddButton))
            {
                Selenium.ClickUntilElementIsDisplayed(GuiToolbar.AddButton, PromoActionsPage.CustomerEntitySelector);
            }
            else
            {
                Selenium.ClickUntilElementIsDisplayed(PromoActionsPage.PromoAddButton, PromoActionsPage.CustomerEntitySelector);
            }
            StepHelpers.SelectCustomer(customerHLevel,  customerCode);
            
            if (!String.IsNullOrEmpty(confirmLevel))
                StepHelpers.SelectComboValue(confirmLevel, PromoActionsPage.ConfirmationLevelCombo, false);
            if (!String.IsNullOrEmpty(refYear))
                StepHelpers.SelectsDropdownValueByFieldWithValue(refYear, "Reference Year", false);
            if (!String.IsNullOrEmpty(productSegment))
                SelectProductSegment(productSegment);
            try
            {
                Selenium.ClickUntilElementIsDisplayed(GenericElementsPage.OkButton, Calendar.ValidityPeriodStartField);
            }catch(Exception) { };
        }

        /// <summary>
        /// Selects a product segment from the list
        /// </summary>
        /// <param name="productSegment"></param>
        public void SelectProductSegment(string productSegment)
        {
            Selenium.Click(GenericElementsPage.GenericDropDownTrigger("Product Segment"));
            Selenium.Click(GenericElementsPage.Text(productSegment));
            Selenium.Click(PopupGenericElements.PopupOkButton("Selection"));
        }

        /// <summary>
        /// Selects a promo what if
        /// </summary>
        /// <param name="whatIf"></param>
        public void ChangePromoWhatIf(string whatIf)
        {
            Selenium.ClickUntilElementIsDisplayed(ProductsPage.PromoWhatIfButton, ProductsPage.PromoCreateWhatIfButton);
            Selenium.Click(ProductsPage.WhatIfDescription(whatIf));
            Selenium.Click(ProductsPage.PromoConfirmWhatIfButton);
            Selenium.FluentWaitElementToBeNotPresentInDOM(Selenium.GetAbstractedBy("Loading Mask", new string[] { }), 300);
        }

        /// <summary>
        /// Create a new Fund and Rules
        /// </summary>
        /// <param name="configurationID"></param>
        /// <param name="CustomerLevel"></param>
        /// <param name="Description"></param>
        /// <param name="sellInStart"></param>
        /// <param name="sellInEnd"></param>
        /// <param name="ProductGroup"></param>
        /// <param name="RateFundSource"></param>
        public void CreatesANewFundAndRules(string configurationID, string CustomerLevel, string Description, string sellInStart, string sellInEnd, string ProductGroup, string RateFundSource)
        {
            Selenium.ClickUntilElementIsDisplayed(GuiToolbar.AddButton, FundsAndRules.ConfigurationIdCombo, 5);
            StepHelpers.SelectComboValue(configurationID, FundsAndRules.ConfigurationIdCombo, false);
            Selenium.Click(GenericElementsPage.OkButton);
            Selenium.FluentWaitElementToBeNotPresentInDOM(Selenium.GetAbstractedBy("Loading Mask", new string[] { }), 300);
            StepHelpers.SelectDatePeriod(Calendar.ValidityPeriodStartField, CommonDates.DateParser(sellInStart), CommonDates.DateParser(sellInEnd));
            StepHelpers.SelectComboValue(CustomerLevel, FundsAndRules.CustomerLevelCombo, false);
            int count = 0;
            while (!Selenium.GetText(FundsAndRules.DescriptionTextbox).Equals(Description) && count < 5)
            {
                Selenium.SendKeys(FundsAndRules.DescriptionTextbox, Description);
                Thread.Sleep(500);
                count++;
            }

            List<string> ProductGroupList = ProductGroup.Split(',').ToList();

            if (ProductGroupList != null && !ProductGroup.Equals(String.Empty))
            {
                Selenium.Click(FundsAndRules.ProductGroupEntitySelector);
                foreach (string group in ProductGroupList)
                {
                    count = 0;
                    while (!Selenium.ValidateElementOnPage(GridPopups.PopUpGridCheckBox(group)) && count < 5)
                    {
                        count++;
                        Selenium.Click(BasicGrid.NextPageButton);
                    }
                    Selenium.Click(GridPopups.PopUpGridCheckBox(group));
                }
                Selenium.Click(GenericElementsPage.OkButton);
            }

            if (!RateFundSource.Equals(string.Empty))
            {
                StepHelpers.SelectComboValue(RateFundSource, FundsAndRules.RateFundSourceCombo, false);
            }
        }

        /// <summary>
        /// creates a new movement
        /// </summary>
        /// <param name="movementType"></param>
        /// <param name="value"></param>
        /// <param name="reason"></param>
        public void CreateMovement(string movementType, string value, string reason)
        {
            Selenium.ClickUntilElementIsDisplayed(PopupGenericElements.PopupAddButton, PopupGenericElements.PopupByHeading("Create New Movement"));
            StepHelpers.SelectsDropdownValueByFieldWithValue(movementType, "Type of movement", true);
            Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("Value"));
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Value"), value);
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Reason"), reason);
            Selenium.LooseFocusFromAnElement();
            Selenium.Click(PopupGenericElements.PopupOkButton("Create New Movement"));
        }

        /// <summary>
        /// Retrieves the index for the customer code under product in the Products -> Direct Customers tab
        /// </summary>
        /// <param name="product">Product code</param>
        /// <param name="customer">Customer Code</param>
        /// <returns>Record index of customer found under product</returns>
        public int GetCustomerUnderProductIndex(string product, string customer)
        {
            List<int> indices = GetProductDataRecodindex(product);
            return GetCustomerIndex(customer, indices);
        }

        /// <summary>
        /// Retrieves the number of customers under product in the Products -> Direct Customers tab
        /// </summary>
        /// <param name="product">Product code</param>
        /// <returns>Number of customers found</returns>
        public int GetNumberOfCustomersForProduct(string product)
        {
            List<int> indices = GetProductDataRecodindex(product);
            return GetNumberOfCustomers(indices);
        }

        /// <summary>
        /// Searches for number of customers under a particular product with a specific column value
        /// </summary>
        /// <param name="product">Product code</param>
        /// <param name="columnIndex"></param>
        /// <param name="columnValue"></param>
        /// <returns>Number of customers found</returns>
        public int GetNumberOfCustomersForProduct(string product, int columnIndex, string columnValue)
        {
            List<int> indices = GetProductDataRecodindex(product, columnIndex, columnValue);
            return GetNumberOfCustomers(indices);
        }

        /// <summary>
        /// Checks if there is a customer under a product with a specific column value
        /// </summary>
        /// <param name="product">Product code</param>
        /// <param name="customerCode">Customer code</param>
        /// <param name="columnIndex"></param>
        /// <param name="columnValue"></param>
        /// <returns>true if the customer is found</returns>
        public bool IsCustomerPresentUnderProductWithColumnValue(string product, string customerCode, int columnIndex, string columnValue)
        {
            List<int> indices = GetProductDataRecodindex(product, columnIndex, columnValue);
            return GetCustomerIndex(customerCode, indices) > 0;
        }

        /// <summary>
        /// Searches for a customer with a particular column value under a product with a specific column value
        /// </summary>
        /// <param name="product">Product code</param>
        /// <param name="customerName">Customer code</param>
        /// <param name="productColumnIndex"></param>
        /// <param name="productColumnValue"></param>
        /// <returns>The record index of the customer matching the search</returns>
        public int GetCustomerColumnIndexUnderProductWithColumnValue(string product, string customerName, int productColumnIndex, string productColumnValue)
        {
            List<int> indices = GetProductDataRecodindex(product, productColumnIndex, productColumnValue);
            return GetCustomerIndex(customerName, indices);
        }

        /// <summary>
        /// Searches the table for a product provided and the product index of the next product where the product has a specific column value
        /// </summary>
        /// <param name="product">Product code</param>
        /// <param name="productColumnIndex"></param>
        /// <param name="productColumnValue"></param>
        /// <returns>List of product record indeces (min and max) where there is a column with a value</returns>
        private List<int> GetProductDataRecodindex(string product, int productColumnIndex, string productColumnValue)
        {
            IList<IWebElement> products = Selenium.Driver.FindElements(ProductDirectCustomers.AllProductsByLevel("2").SeleniumBy);
            IList<IWebElement> customers = Selenium.Driver.FindElements(ProductDirectCustomers.AllProductsByLevel("3").SeleniumBy);
            List<int> productDataRecodindex = new List<int>();

            for (int i = 0; i < products.Count; i++)
            {
                if (products[i].Text.Contains(product))
                {
                    int index = Int32.Parse(products[i].GetAttribute("data-recordindex"));

                    if (Selenium.GetText(ProductDirectCustomers.DivByColumnAndRow(productColumnIndex.ToString(), (index + 1).ToString())).Equals(productColumnValue))
                    {
                        productDataRecodindex.Add(index);
                        if (i < (products.Count - 1))
                        {
                            //add the next product record index in the list as the top range
                            productDataRecodindex.Add(Int32.Parse(products[i + 1].GetAttribute("data-recordindex")));
                        }
                        else
                        {
                            //add the last index as the top range
                            productDataRecodindex.Add(customers.Count + products.Count);
                        }
                        break;
                    }
                }
            }
            return productDataRecodindex;
        }

        /// <summary>
        /// Searches the table for a product provided and the product index of the next product
        /// </summary>
        /// <param name="product">Product code</param>
        /// <returns>List of product record indeces (min and max) for a product code</returns>

        private List<int> GetProductDataRecodindex(string product)
        {

            IList<IWebElement> products = Selenium.Driver.FindElements(ProductDirectCustomers.AllProductsByLevel("2").SeleniumBy);
            IList<IWebElement> customers = Selenium.Driver.FindElements(ProductDirectCustomers.AllProductsByLevel("3").SeleniumBy);
            List<int> productDataRecodindex = new List<int>();

            for (int i = 0; i < products.Count; i++)
            {
                if (products[i].Text.Contains(product))
                {
                    productDataRecodindex.Add(Int32.Parse(products[i].GetAttribute("data-recordindex")));
                    if (i < (products.Count - 1))
                    {
                        productDataRecodindex.Add(Int32.Parse(products[i + 1].GetAttribute("data-recordindex")));
                    }
                    else
                    {
                        productDataRecodindex.Add(customers.Count + products.Count);
                    }
                }
            }
            return productDataRecodindex;
        }

        /// <summary>
        /// Searches for a customer code between 2 product record indeces
        /// </summary>
        /// <param name="customer">Customer code</param>
        /// <param name="productDataRecodindex"></param>
        /// <returns>returns the int data-recordindex of the customer found</returns>
        private int GetCustomerIndex(string customer, List<int> productDataRecodindex)
        {
            IList<IWebElement> customers = Selenium.Driver.FindElements(ProductDirectCustomers.AllProductsByLevel("3").SeleniumBy);

            for (int i = 0; i < customers.Count; i++)
            {
                int customerRecordIndex = Int32.Parse(customers[i].GetAttribute("data-recordindex"));
                if (customers[i].Text.Contains(customer) && (customerRecordIndex > productDataRecodindex[0] && customerRecordIndex < productDataRecodindex[1]))
                {
                    return Int32.Parse(customers[i].GetAttribute("data-recordindex"));
                }
            }
            return -1;
        }

        /// <summary>
        /// Retrieves the number of customers available under a product by its product record index
        /// </summary>
        /// <param name="productDataRecodindex"></param>
        /// <returns>Number of customers found</returns>
        private int GetNumberOfCustomers(List<int> productDataRecodindex)
        {
            IList<IWebElement> customers = Selenium.Driver.FindElements(ProductDirectCustomers.AllProductsByLevel("3").SeleniumBy);
            int numberOfCustomers = 0;
            for (int i = 0; i < customers.Count; i++)
            {
                int customerRecordIndex = Int32.Parse(customers[i].GetAttribute("data-recordindex"));
                if (customerRecordIndex > productDataRecodindex[0] && customerRecordIndex < productDataRecodindex[1])
                {
                    numberOfCustomers++;
                }
            }
            return numberOfCustomers;
        }
    }
}
