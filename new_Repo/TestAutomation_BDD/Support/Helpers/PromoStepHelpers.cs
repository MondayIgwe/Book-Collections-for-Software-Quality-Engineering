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
    public class PromoStepHelpers
    {
        private int counter = 0;

        public SeleniumFunctions Selenium { get; set; }
        public IWebDriver Driver { get; set; }
        StepHelpers StepHelpers;
        public PromoStepHelpers(IWebDriver driver) 
        {
            Selenium = new SeleniumFunctions(driver);
            Driver = driver;
            StepHelpers = new StepHelpers(driver);
        }


        public void CreateAPromo(string customerHLevel, string customerCode, string confirmLevel = null, string refYear = null, string productSegment = null )
        {
            try
            {
                Selenium.ClickUntilElementIsDisplayed(GenericElementsPage.AddButton, PromoPlanCalendarPage.ContractorMenuIcon);
            }
            catch (WebDriverTimeoutException)
            {
                Selenium.ClickUntilElementIsDisplayed(PromoActionsPage.PromoAddButton, PromoPlanCalendarPage.ContractorMenuIcon);
            }
            StepHelpers.SelectCustomer(customerHLevel,  customerCode);
            
            if (confirmLevel != null)
                StepHelpers.SelectsDropdownValueByFieldWithValue(confirmLevel, "Confirmation level");
            if (refYear != null)
                StepHelpers.SelectsDropdownValueByFieldWithValue(refYear, "Reference Year");
            if (productSegment != null)
                SelectProductSegment(productSegment);
            try
            {
                Selenium.ClickUntilElementIsDisplayed(PromoPlanCalendarPage.NewPromoPopupOkBtn, Calendar.ValidityPeriodStartField);
            }catch(Exception) { };
        }

        public void SelectProductSegment(string productSegment)
        {
            Selenium.Click(GenericElementsPage.GenericDropDownTrigger("Product Segment"));
            Selenium.Click(GenericElementsPage.Text(productSegment));
            Selenium.Click(PopupGenericElements.PopupOkButton("Selection"));
        }

        public void ChangePromoWhatIf(string whatIf)
        {
            Selenium.ClickUntilElementIsDisplayed(ProductsPage.PromoWhatIfButton, ProductsPage.PromoCreateWhatIfButton);
            Selenium.Click(ProductsPage.WhatIfDescription(whatIf));
            Selenium.Click(ProductsPage.PromoConfirmWhatIfButton);
        }

        public void CreatesANewFundAndRules(string configurationID, string CustomerLevel, string Description, string sellInStart, string sellInEnd, string ProductGroup, string RateFundSource)
        {
            Selenium.ClickUntilElementIsDisplayed(GenericElementsPage.AddButton, GenericElementsPage.GenericDropDownTrigger("Configuration ID"), 3000);
            StepHelpers.SelectsDropdownValueByFieldWithValue(configurationID, "Configuration ID");
            Selenium.Click(PopupGenericElements.PopupOkButton("[New Fund&Rules]"));
            StepHelpers.SelectDatePeriod(Calendar.ValidityPeriodStartField, CommonDates.DateParser(sellInStart), CommonDates.DateParser(sellInEnd));
            StepHelpers.SelectsDropdownValueByFieldWithValue(CustomerLevel, "Customer level");
            int count = 0;
            while (!Selenium.GetText(GenericElementsPage.InputByLabelName("Description")).Equals(Description) && count < 5)
            {
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Description"), Description);
                Thread.Sleep(500);
                count++;
            }

            if (!ProductGroup.Equals(string.Empty))
            {
                Selenium.Click(GenericElementsPage.GenericDropDownTrigger("Product Groups"));
                Selenium.Click(GenericElementsPage.Text(ProductGroup));
                Selenium.Click(PopupGenericElements.PopupOkButton("Product level"));
            }

            if (!RateFundSource.Equals(string.Empty))
            {
                StepHelpers.SelectsDropdownValueByFieldWithValue(RateFundSource, "Rate Fund Source");
            }
        }

        public void CreateMovement(string movementType, string value, string reason)
        {
            Selenium.ClickUntilElementIsDisplayed(PopupGenericElements.PopupAddButton, PopupGenericElements.Popup("Create New Movement"));
            StepHelpers.SelectsDropdownValueByFieldWithExactValue(movementType, "Type of movement");
            Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("Value"));
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Value"), value);
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Reason"), reason);
            Selenium.LooseFocusFromAnElement();
            Selenium.Click(PopupGenericElements.PopupOkButton("Create New Movement"));
        }

        public int GetCustomerUnderProductIndex(string product, string customer)
        {
            List<int> indices = GetProductDataRecodindex(product);
            return GetCustomerIndex(customer, indices);
        }

        public int GetNumberOfCustomerForProduct(string product)
        {
            List<int> indices = GetProductDataRecodindex(product);
            return GetNumberOfCustomers(indices);
        }

        public int GetNumberOfCustomerForProduct(string product, int columnIndex, string columnValue)
        {
            List<int> indices = GetProductDataRecodindex(product, columnIndex, columnValue);
            return GetNumberOfCustomers(indices);
        }

        public bool IsCustomerPresentUnderProductWithColumnValue(string product, string customerName, int columnIndex, string columnValue)
        {
            List<int> indices = GetProductDataRecodindex(product, columnIndex, columnValue);
            return GetCustomerIndex(customerName, indices) > 0;
        }

        public int GetCustomerColumnValueUnderProductWithColumnValue(string product, string customerName, int productColumnIndex, string productColumnValue)
        {
            List<int> indices = GetProductDataRecodindex(product, productColumnIndex, productColumnValue);
            return GetCustomerIndex(customerName, indices);
        }

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
                            productDataRecodindex.Add(Int32.Parse(products[i + 1].GetAttribute("data-recordindex")));
                        }
                        else
                        {
                            productDataRecodindex.Add(customers.Count + products.Count);
                        }
                        break;
                    }
                }
            }
            return productDataRecodindex;
        }

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
