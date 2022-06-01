using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Support.Selenium;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using System;
using System.Collections.Generic;
using System.Threading;
using TechTalk.SpecFlow;


namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class SFASaleOrdersStepDefinitions : SeleniumStepDefinition
    {
        private int PageLoadTimeout { get; set; } = 60;

        public SFASaleOrdersStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user adds a new Sale Order where Customer Type: '([^']*)', Ship-To Customer: '([^']*)'")]
        public void WhenTheUserAddsANewSaleOrderWhereCustomerTypeShip_ToCustomer(string customerType, string shipToCustomer)
        {
            Selenium.Click(GenericElementsPage.AddButton, 30);
            SFASaleOrdersStepHelpers.PopulateNewOrderPopUp(null, null, customerType, shipToCustomer);
            Selenium.Click(PopupGenericElements.PopupOkButton("New Order"));
        }

        [When(@"the user adds a new Sales Order Product where Product Code: '([^']*)', Quantity: '([^']*)'")]
        public void WhenTheUserAddsANewSalesOrderProductWhereProductCodeQuantity(string productCode, string quantity)
        {
            Selenium.FluentWaitElementToBePresent(GenericElementsPage.AddButton, 30);
            Selenium.Click(GenericElementsPage.AddButton, 30);
            Selenium.ValidateElementDisplayed(GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), 30);
            SFASaleOrdersStepHelpers.AddNewProduct(productCode, null, quantity);
        }

        [Then(@"the user changes the Sales Order Customer Reponsibility User: '([^']*)'")]
        [When(@"the user changes the Sales Order Customer Reponsibility User: '([^']*)'")]
        public void ThenTheUserChangesTheSalesOrderCustomerReponsibilityUser(string user)
        {
            SFASaleOrdersStepHelpers.ChangeUserResponsibility(user);
        }

        [When(@"the user enters '([^']*)' in the '([^']*)' Column on Sale Orders Product table in the row where the '([^']*)' column has a value of '([^']*)'")]
        public void WhenTheUserEntersInTheColumnOnSaleOrdersProductTableInTheRowWhereTheColumnHasAValueOf(string textToEnter, string columnToPopulate, string referenceValueColumn, string referenceRowData)
        {
            SFASaleOrdersStepHelpers.PopulateProductTable(textToEnter,columnToPopulate,referenceValueColumn,referenceRowData);
        }

        [When(@"the user adds a new Sale Order where Order Type: '([^']*)', Customer Type: '([^']*)', Ship-To Customer: '([^']*)'")]
        public void WhenTheUserAddsANewSaleOrderWhereOrderTypeCustomerTypeShip_ToCustomer(string orderType, string customerType, string customer)
        {
            Selenium.Click(GenericElementsPage.AddButton, 30);
            SFASaleOrdersStepHelpers.PopulateNewOrderPopUp(orderType, null, customerType, customer);
            Selenium.Click(PopupGenericElements.PopupOkButton("New Order"));
        }
    }
}
