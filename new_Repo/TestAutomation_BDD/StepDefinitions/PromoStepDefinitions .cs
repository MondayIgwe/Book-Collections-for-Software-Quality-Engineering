using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.IBP.IBPDocuments;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.Promo;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using TechTalk.SpecFlow;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class PromoStepDefinitions : SeleniumStepDefinition
    {

        private int counter = 0;

        public PromoStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user creates a Promo '(.*)' '(.*)'")]
        public void WhenTheUserCreatesAPromo(string customerHLevel, string customerCode)
        {
            PromoStepHelpers.CreateAPromo(customerHLevel, customerCode);
        }

        [When(@"the user creates a Promo with confirm Level'(.*)' '(.*)' '(.*)'")]
        public void WhenTheUserCreatesAPromo(string customerHLevel, string customerCode, string confirmLevel)
        {
            PromoStepHelpers.CreateAPromo(customerHLevel, customerCode, confirmLevel);
        }

        [When(@"the user creates a Promo with segment '(.*)' '(.*)' '(.*)' '(.*)' '(.*)'")]
        public void WhenTheUserCreatesAPromo(string customerHLevel, string customerCode, string confirmLevel, string refYear, string productSegment)
        {
            if (!int.TryParse(refYear, out _))
                refYear = CommonDates.DateParser(refYear);
            PromoStepHelpers.CreateAPromo(customerHLevel, customerCode, confirmLevel, refYear, productSegment);
        }

        [Then(@"the user populates the cockpit '(.*)' '(.*)' '(.*)' '(.*)' '(.*)' '(.*)'")]
        [When(@"the user populates the cockpit '(.*)' '(.*)' '(.*)' '(.*)' '(.*)' '(.*)'")]
        public void ThenTheUserPopulatesTheCockpit(string description, string sellInStart, string sellInEnd, string sellOutStart, string sellOutEnd, string mechanics)
        {
            if (sellInStart.Contains("Next"))
            {
                int dayUntilMonday = DayOfWeek.Monday - DateTime.Today.AddDays(1).DayOfWeek + 7;
                sellInStart = DateTime.Today.AddDays(dayUntilMonday + 1).ToString("dd/MM/yyyy");
            }

            if (sellInEnd.Contains("Next"))
            {
                int dayUntilMonday = DayOfWeek.Monday - DateTime.Today.AddDays(1).DayOfWeek + 7;
                sellInEnd = DateTime.Today.AddDays(dayUntilMonday + 14).ToString("dd/MM/yyyy");
            }

           StepHelpers.SelectDatePeriod(CockpitPage.SellInDate.LogicalName, CommonDates.DateParser(sellInStart), CommonDates.DateParser(sellInEnd));

            if (!string.IsNullOrEmpty(sellOutStart) && !string.IsNullOrEmpty(sellOutEnd))
            {
                try
                {
                    StepHelpers.SelectDatePeriod(CockpitPage.SellOutStartDate.LogicalName, CommonDates.DateParser(sellOutStart), CommonDates.DateParser(sellOutEnd));
                }
                catch (Exception)
                {
                    StepHelpers.SelectDatePeriod(CockpitPage.SellOutStartDate.LogicalName, CommonDates.DateParser(sellOutStart), CommonDates.DateParser(sellOutEnd));
                }
            }

            int count = 0;

            while (Selenium.GetText(Selenium.GetAbstractedBy(CockpitPage.DescriptionInput.LogicalName)).Equals(description) == false && count < 5)
            {
                Selenium.SendKeys(CockpitPage.DescriptionInput, description);
                Thread.Sleep(500);
                count++;
            }

            List<string> mechanicsList = mechanics.Split(',').ToList();

            if (mechanicsList != null && !mechanics.Equals(string.Empty))
            {
                Selenium.Click(CockpitPage.MechanicsViewAllButton);
                foreach (string mechanic in mechanicsList)
                {
                    Selenium.Click(CockpitPage.MechanicsCheckBox(mechanic.Replace("\"", string.Empty)));
                }
            }

        }

        [When(@"the user adds products '(.*)' '(.*)'")]
        [When(@"the user adds a product '(.*)' '(.*)'")]
        public void ThenTheUserAddsAProduct(string productLevel, string productCodes)
        {
            Selenium.Click(PromoActionsPage.ProductsTab);
            try
            {
                Selenium.Click(PromoActionsPage.ProductAddButton, 3);
            }
            catch (NullReferenceException)
            {
                Selenium.Click(GenericElementsPage.AddButton, 3);
            }
            
            
            Selenium.Click(ProductsPage.ProductLevel(productLevel));
            List<string> productCodeList = productCodes.Split(',').ToList();
            foreach (string productCode in productCodeList)
            {
                Selenium.Click(BasicGrid.GridCheckBox(productCode));
            }
            Selenium.Click(ProductsPage.OkButton);
        }

        [When(@"the user adds an assortment product '(.*)'")]
        public void ThenTheUserAddsAProduct(string productCode)
        {
            Selenium.Click(GenericElementsPage.SidePanelTab("Products"));
            Selenium.Click(PromoActionsPage.ProductAddButton);
            StepHelpers.FilterGrid("Product", "Like", productCode);
            Selenium.Click(BasicGrid.GridCheckBox(productCode));
            Selenium.Click(PopupGenericElements.PopupButton("Next"));
            StepHelpers.SelectsDropdownValueByFieldWithValue("LISTED", "Status");
            Selenium.Click(PopupGenericElements.PopupButton("Next"));
            int count = 0;
            while (Selenium.ValidateEnabledAndDisplayed(PopupGenericElements.PopupButton("Confirm"), 1) && count < 5)
            {
                count++;
                Selenium.Click(PopupGenericElements.PopupButton("Confirm"));
                Thread.Sleep(1000);
            }
            
        }

        [When(@"the user enters '(.*)' on column name '(.*)' for product code '(.*)'")]
        public void WhenTheUserEntersOnColumnNameForProductCode(string text, string columnName, string productCode)
        {
            Selenium.Click(GenericElementsPage.SidePanelTab("Products"));
            int productRowIndex = GridStepHelpers.GetElementContainingTextIndex(ProductGrid.AllProducts, productCode);
            int ColumnIndex = GridStepHelpers.GetColumnPosition(ProductGrid.AllColumnNames, columnName);

            AbstractedBy abstractedBy = ProductGrid.DivByColumnAndRow(productRowIndex.ToString(), ColumnIndex.ToString());

            AbstractedBy elementToValidateAbstractedBy = ProductGrid.InputByColumnAndRow(productRowIndex.ToString());
            if (Selenium.ClickUntilElementIsDisplayed(abstractedBy, elementToValidateAbstractedBy))
            {
                Selenium.ClearByKeys(elementToValidateAbstractedBy);
                Selenium.SendKeys(elementToValidateAbstractedBy, text);
                Selenium.LooseFocusFromAnElement();
                if (!Selenium.GetText(abstractedBy).Contains(text) && counter < 5)
                {
                    counter++;
                    WhenTheUserEntersOnColumnNameForProductCode(text, columnName, productCode);
                }
                counter = 0;
            }
            else
            {
                Assert.Fail("Unable to find element " + elementToValidateAbstractedBy.LogicalName);
            }
        }


        [Then(@"the user validates that column name '(.*)' for product code '(.*)' '(.*)' editable")]
        public void ThenTheUserValidatesThatColumnNameForProductCodeEditable(string columnName, string productCode, string validation)
        {
            int productRowIndex = GridStepHelpers.GetElementContainingTextIndex(ProductGrid.AllProducts, productCode);
            int ColumnIndex = GridStepHelpers.GetColumnPosition(ProductGrid.AllColumnNames, columnName);
            bool isContains = validation.Equals("is");
            Assert.IsTrue(Selenium.HasAttribute(ProductGrid.TdByColumnAndRow(productRowIndex.ToString(), ColumnIndex.ToString()), "class", "editable") == isContains, "The column is not editable " + columnName);
        }


        [When(@"the user validates text '(.*)' on column name '(.*)' for product code '(.*)'")]
        [Then(@"the user validates text '(.*)' on column name '(.*)' for product code '(.*)'")]
        public void WhenTheUserValidatesTextOnColumnNameForProductCode(string expectedText, string columnName, string productCode)
        {
            int productRowIndex = GridStepHelpers.GetElementContainingTextIndex(ProductGrid.AllProducts, productCode);
            int ColumnIndex = GridStepHelpers.GetColumnPosition(ProductGrid.AllColumnNames, columnName);
            string actualText = Selenium.GetText(ProductGrid.DivByColumnAndRow(productRowIndex.ToString(), ColumnIndex.ToString()));
            Assert.AreEqual(expectedText, actualText, "The expected text " + expectedText + " is not the same as actual text: " + actualText);
        }

        [When(@"the user validates text contains '(.*)' on column name '(.*)' for product code '(.*)'")]
        [Then(@"the user validates text contains '(.*)' on column name '(.*)' for product code '(.*)'")]
        public void WhenTheUserValidatesTextContainsOnColumnNameForProductCode(string expectedText, string columnName, string productCode)
        {
            int productRowIndex = GridStepHelpers.GetElementContainingTextIndex(ProductGrid.AllProducts, productCode);
            int ColumnIndex = GridStepHelpers.GetColumnPosition(ProductGrid.AllColumnNames, columnName);
            string actualText = Selenium.GetText(ProductGrid.DivByColumnAndRow(productRowIndex.ToString(), ColumnIndex.ToString()));
            Assert.IsTrue(actualText.Contains(expectedText), "The expected text " + expectedText + " is not the same as actual text: " + actualText);
        }


        [Then(@"the user validates text does not contain '(.*)' on column name '(.*)' for product code '(.*)'")]
        public void WhenTheUserValidatesTextDoesNotContainsOnColumnNameForProductCode(string expectedText, string columnName, string productCode)
        {
            int productRowIndex = GridStepHelpers.GetElementContainingTextIndex(ProductGrid.AllProducts, productCode);
            int ColumnIndex = GridStepHelpers.GetColumnPosition(ProductGrid.AllColumnNames, columnName);

            string actualText = Selenium.GetText(ProductGrid.DivByColumnAndRow(productRowIndex.ToString(), ColumnIndex.ToString()));
            Assert.IsFalse(actualText.Contains(expectedText), "The expected text " + expectedText + " is not the same as actual text: " + actualText);
        }

        [When(@"the user assigns segments to user in responsibility matrix '(.*)'")]
        public void ThenTheUserAssignsSegmentsToUserInResponsibilityMatrix(string description)
        {
            //uncheck any checked boxes first
            int count = 0;
            while (Selenium.ValidateEnabledAndDisplayed(GenericElementsPage.CheckedBox, 1) && count < 10)
            {
                Selenium.Click(GenericElementsPage.CheckedBox);
                count++;
            }

            string username = RetrieveUserName();
            List<IWebElement> usersElements = Selenium.Find(Selenium.GetAbstractedBy("All Users", null));
            int userColumnIndex = 0;
            foreach (var usersElement in usersElements)
            {
                userColumnIndex++;
                Selenium.MoveFocusToElement(usersElement);

                if (usersElement.Text.Contains(username))
                    break;
            }

            List<IWebElement> descriptionElements = Selenium.Find(Selenium.GetAbstractedBy("All Description Names", null));
            int descriptionRowIndex = 0;
            foreach (var descriptionElement in descriptionElements)
            {
                descriptionRowIndex++;
                Selenium.MoveFocusToElement(descriptionElement);
                if (descriptionElement.Text.Contains(description))
                    break;
            }
            Selenium.MoveFocusToElement(ProductSegmentResponsibilityMatrixGrid.ResponsibilityCheckBox(userColumnIndex.ToString(), descriptionRowIndex.ToString()));

            Selenium.Click(ProductSegmentResponsibilityMatrixGrid.ResponsibilityCheckBox(userColumnIndex.ToString(), descriptionRowIndex.ToString()));
        }

        [When(@"the user selects active scenario '([^']*)' from dropdown list '([^']*)'")]
        [Then(@"the user selects active scenario '([^']*)' from dropdown list '([^']*)'")]
        public void WhenTheUserSelectsDropdownValueByFieldWithValue(string valueToSelect, string labelName)
        {
            var by = PromoPlanPage.ActiveScenarioDropDown(valueToSelect.Replace("\"", string.Empty));
            Selenium.ValidateEnabledAndDisplayed(GenericElementsPage.GenericDropDownTrigger(labelName));

            Selenium.ClickUntilElementIsDisplayed(GenericElementsPage.GenericDropDownTrigger(labelName), by);
            Selenium.Click(by);
        }


        [When(@"the user clicks on the Promo Action '([^']*)'")]
        public void WhenTheUserClicksOnTheActionButton(string ActionToClick)
        {
            Selenium.ValidateElementOnPage(GenericElementsPage.Button("Actions"));
            int count = 0;
            Selenium.Click(GenericElementsPage.Button("Actions"));

            while (!Selenium.FindOne(GenericElementsPage.MenuItemText(ActionToClick)).Displayed && count < 5)
            {
                Thread.Sleep(500);
                Selenium.Click(GenericElementsPage.Button("Actions"));
                count++;
            }

            Assert.That(Selenium.FindOne(GenericElementsPage.MenuItemText(ActionToClick)).Displayed, "Element " + ActionToClick + " did not qualify as being displayed");

            Selenium.Click(GenericElementsPage.MenuItemText(ActionToClick));
        }

        [When(@"the user validates text '(.*)' on column name '(.*)' for profit and loss '(.*)' with unique column '(.*)'")]
        [Then(@"the user validates text '(.*)' on column name '(.*)' for profit and loss '(.*)' with unique column '(.*)'")]

        public void WhenTheUserValidatesTextOnColumnNameForProfitAndLossWithUniqueColumn(string expectedText, string columnName, string PLElementName, string uniqueColumn)
        {
            string[] uniqueColumnArray = { uniqueColumn };
            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy("Profit and Loss Elements", uniqueColumnArray));

            List<IWebElement> PLElements = Selenium.Find(Selenium.GetAbstractedBy("Profit and Loss Elements", uniqueColumnArray));
            int ElementsRowIndex = 0;
            foreach (var PLElement in PLElements)
            {
                ElementsRowIndex++;
                if (PLElement.Text.Contains(PLElementName))
                    break;
            }

            Selenium.ValidateAllElementsLoaded(Selenium.GetAbstractedBy("Prodit And Loss All Columns", uniqueColumnArray));
            List<IWebElement> columnElements = Selenium.Find(Selenium.GetAbstractedBy("Prodit And Loss All Columns", uniqueColumnArray));
            int ColumnIndex = 0;
            foreach (var columnElement in columnElements)
            {
                ColumnIndex++;
                if (columnElement.Text.Equals(columnName))
                    break;
            }

            ColumnIndex = ColumnIndex - 2;
            string[] values = { ColumnIndex.ToString(), ElementsRowIndex.ToString(), uniqueColumn };
            string actualText = Selenium.GetText(Selenium.GetAbstractedBy("Profit And Loss Grid Cell", values));
            if (!expectedText.Equals(actualText))
            {
                Selenium.Click(ProfitAndLossPage.ProfitLossRefreshButtonByField(uniqueColumn));
                actualText = Selenium.GetText(Selenium.GetAbstractedBy("Profit And Loss Grid Cell", values));
            }

            Assert.AreEqual(expectedText, actualText, "The expected text " + expectedText + " is not the same as actual text: " + actualText);
        }

        private void ValidateAllElementsLoaded(string logicalName, object[] arguments = null)
        {
            List<IWebElement> elements = Selenium.Find(Selenium.GetAbstractedBy(logicalName, arguments));
            int count = 0;
            int positiveIterations = 0;
            while (Selenium.Find(Selenium.GetAbstractedBy(logicalName, arguments)).Count != count || positiveIterations < 2)
            {
                if (Selenium.Find(Selenium.GetAbstractedBy(logicalName, arguments)).Count == count)
                {
                    positiveIterations++;
                }
                else
                {
                    count = Selenium.Find(Selenium.GetAbstractedBy(logicalName, arguments)).Count;
                    positiveIterations = 0;
                }
                Thread.Sleep(1000);
            }
        }


        [When(@"the user clicks on Calendar Promo Plan with value '(.*)'")]
        public void WhenTheUserClicksCalendarPromoPlanWithValue(string value)
        {
            int count = 0;
            while (!Selenium.GetAttribute(PromoPlanPage.CalendarPromoPlan(value), "class").Contains("schedulerBase-event-selected") && count < 5)
            {
                Selenium.Click(PromoPlanPage.CalendarPromoPlan(value));
                count++;
                Thread.Sleep(1000);
            }
        }

        [Then(@"the user validates that product '([^']*)' is under tier '([^']*)'")]
        [When(@"the user validates that product '([^']*)' is under tier '([^']*)'")]
        public void ThenTheWithValueIsVisible(string product, string tier)
        {
            int count = 0;
            while (!Selenium.ValidateElementOnPage(PromoPlanCalendarPage.PromoProductUnderTier(tier, product)) && count < 10)
            {
                count++;
                Thread.Sleep(1000);
            }

            Assert.True(Selenium.ValidateElementOnPage(PromoPlanCalendarPage.PromoProductUnderTier(tier, product)), "Product " + product + " not found under tier " + tier);
        }

        [When(@"the user removes old promo scenarios")]
        public void WhenTheUserRemovesOldPromoScenarios()
        {
            bool isScenarioAvailable = true;
            int count = 0;
            while (isScenarioAvailable && count < 10)
            {
                try
                {
                    Selenium.ClickUntilElementIsDisplayed(PromoPlanPage.ActionsButton, PromoPlanCalendarPage.RemoveScenarioButton);
                    Selenium.Click(PromoPlanCalendarPage.RemoveScenarioButton);
                    Selenium.Click(PopupGenericElements.PopupOkButton("Remove Scenario"));
                    count++;
                    Thread.Sleep(1000);
                }
                catch (Exception)
                {
                    isScenarioAvailable = false;
                }


            }


        }


        [When(@"the user opens promo by description '([^']*)'")]
        public void WhenTheUserOpensPromoByDescription(string promoDescription)
        {
            Selenium.DoubleClickElement(PromoPlanPage.CalendarPromoPlan(promoDescription));
            int count = 0;
            while (!Selenium.ValidateEnabledAndDisplayed(GenericElementsPage.Button("PromoPlan Scenario"), 1) && count < 3)
            {
                Thread.Sleep(3000);
                Selenium.DoubleClickElement(PromoPlanPage.CalendarPromoPlan(promoDescription));
                count++;
            }
        }


        [When(@"the user removes all promotions with description '(.*)' and customer '(.*)'")]
        [Given(@"the user removes all promotions with description '(.*)' and customer '(.*)'")]

        public void WhenTheUserRemovesAllPromotionsWithDescriptionAndCustomer(string description, string customer)
        {
            Selenium.ValidateEnabledAndDisplayed(BasicGrid.IndexedRow("1"));
            StepHelpers.FilterGrid("Description", "Like", description);
            StepHelpers.FilterGrid("Promo holder code", "Like", customer);
            int count = 0;
            while (Selenium.ValidateEnabledAndDisplayed(BasicGrid.FirstRow, 1) && count < 10)
            {
                try
                {
                    count++;
                    Selenium.Click(GenericElementsPage.Text(description));
                    Selenium.Click(GenericElementsPage.RemoveButton);
                    if (Selenium.ValidateEnabledAndDisplayed(PopupGenericElements.AlertDialogOkButton))
                        Selenium.Click(PopupGenericElements.AlertDialogOkButton);

                    //locked document
                    if (Selenium.GetText(PopupGenericElements.AlertDialogMessageBox).Contains("Locked"))
                    {
                        Selenium.Click(PopupGenericElements.AlertDialogOkButton);
                        break;
                    }

                    Thread.Sleep(3000);
                }
                catch (Exception) { }
            }
        }


        [When(@"the user unchecks all columns on the product table")]
        public void WhenTheUserUnchecksAllColumnsOnTheProductTable()
        {
            int count = 0;
            while (Selenium.Find(ProductGrid.AllCheckedCheckboxes).Count > 0 && count < 50)
            {
                Selenium.Click(ProductGrid.ProductGridCheckBox("ALL - Selected"));
                Thread.Sleep(1000);
                count++;
            }
        }

        [When(@"the user creates a new Promotional What If '(.*)'")]
        public void WhenTheUserCreatesANewPromotionalWhatIf(string description)
        {
            Selenium.ClickUntilElementIsDisplayed(ProductsPage.PromoWhatIfButton, ProductsPage.PromoCreateWhatIfButton);
            Selenium.Click(ProductsPage.PromoCreateWhatIfButton);
            Selenium.SendKeys(ProductsPage.PromoCreateWhatIfText, description);
            Selenium.Click(PopupGenericElements.PopupOkButton("Create What If"));
        }

        [When(@"the user changes the Promo What If '(.*)'")]
        public void WhenTheUserChangesThePromoWhatIf(string description)
        {
            PromoStepHelpers.ChangePromoWhatIf(description);
        }

        [Then(@"the user validates that the number of products is higher than '(.*)'")]
        public void WhenTheUserValidatesThatTheNumberOfProductsIsHigherThan(string expectedNrOfProducts)
        {
            Selenium.Click(GenericElementsPage.SidePanelTab("Cockpit"));
            string totalNrOfProducts = Selenium.GetText(CockpitPage.CardProductsCount).Split('/')[1].Trim();
            Assert.IsTrue(int.Parse(totalNrOfProducts) > int.Parse(expectedNrOfProducts), "Step 6 - The numer of products is less than expected");
        }

        [Then(@"the user validates that the number of anomalies is equal to '(.*)'")]
        public void WhenTheUserValidatesThatTheNumberOfAnomaliesIsEqualTo(string expectedNrOfAnomalies)
        {
            string nrOfAnomalies = Selenium.GetText(WorkflowPage.AnomaliesNumber).Split('/')[1].Trim();
            Assert.AreEqual(int.Parse(expectedNrOfAnomalies), int.Parse(nrOfAnomalies), "Step 10 - The number of anomalies is not as expected - " + nrOfAnomalies);
        }

        [When(@"the user opens the trigger on product column '(.*)' and Row '(.*)'")]
        public void WhenTheUserOpensTheTriggerOnColumnAndRow(string columnName, string rowValue)
        {
            GridStepHelpers.ClickTriggerOnCell(ProductGrid.AllColumnNames, columnName, ProductGrid.AllProducts, rowValue, "Product Grid Cell");
        }


        [Then(@"the user validates that the customer '(.*)' under product '(.*)' is present")]
        public void ThenTheUserValidatesThatTheCustomerUnderProductIsPresent(string customer, string product)
        {
            Assert.IsTrue(PromoStepHelpers.GetCustomerUnderProductIndex(product, customer) > 0, "Customer " + customer + " not found under product " + product);
        }

        [Then(@"the user validates that the customer '(.*)' under product '(.*)' has value '(.*)' for '(.*)'")]
        public void ThenTheUserValidatesThatTheCustomerUnderProductHasValueFor(string customer, string product, string expectedText, string column)
        {

            int productRowIndex = PromoStepHelpers.GetCustomerUnderProductIndex(product, customer) + 1;

            int ColumnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductDirectCustomers.AllColumnNames, column);

            int count = 0;
            while (!Selenium.GetText(ProductDirectCustomers.DivByColumnAndRow(ColumnIndex.ToString(), productRowIndex.ToString())).Equals(expectedText) && count < 10)
            {
                Thread.Sleep(1000);
                count++;
            }

            string actualText = Selenium.GetText(ProductDirectCustomers.DivByColumnAndRow(ColumnIndex.ToString(), productRowIndex.ToString()));
            Assert.AreEqual(expectedText, actualText, "The expected text " + expectedText + " is not the same as actual text: " + actualText);
        }

        [When(@"the user selects a customer '(.*)' '(.*)'")]
        public void WhenTheUserSelectsACustomer(string customerHLevel, string customerCode)
        {
            StepHelpers.SelectCustomer(customerHLevel, customerCode);
        }

        [Then(@"values for product grid and direct customers tab are the same")]
        public void ThenValuesForProductGridAndDirectCustomersTabAreTheSameForProduct()
        {
            var columnNames = new List<string>()
                    {"Estimated quantity","Baseline Quantity","Uplift","% Cut Price","Gross Sales Revenue","Pre Promo Price"};
            List<string> directCustomersValues = new List<string>();
            List<string> productsValues = new List<string>();

            foreach (string columnName in columnNames)
            {
                int ColumnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductDirectCustomers.AllColumnNames, columnName);
                directCustomersValues.Add(Selenium.GetText(ProductDirectCustomers.DivByColumnAndRow(ColumnIndex.ToString(), "1")));
            }

            Selenium.Click(GenericElementsPage.TopTab("Products"));
            foreach (string columnName in columnNames)
            {
                int ColumnIndex = GridStepHelpers.GetColumnPosition(ProductGrid.AllColumnNames, columnName);
                productsValues.Add(Selenium.GetText(ProductGrid.DivByColumnAndRow("2", ColumnIndex.ToString())));
            }

            for (int i = 0; i < directCustomersValues.Count(); i++)
            {
                Assert.AreEqual(Math.Round(Convert.ToDecimal(directCustomersValues[i])), Math.Round(Convert.ToDecimal(productsValues[i])), "Step 19 - DirectCustomers value is not the one expected");
            }
        }

        [Then(@"the user validates that product '(.*)' has '(.*)' customers")]
        public void ThenTheProductHasCustomer(string product, int numberOfCustomers)
        {
            int actualValue = PromoStepHelpers.GetNumberOfCustomerForProduct(product);
            Assert.AreEqual(numberOfCustomers, actualValue, "The expected text " + numberOfCustomers + " is not the same as actual text: " + actualValue);
        }

        [Then(@"the user validates product '(.*)' with '(.*)' of '(.*)' has '(.*)' customers")]
        public void ThenTheUserValidatesThatProductsWithHasCustomers(string product, string column, string columnValue, int numberOfCustomers)
        {
            int ColumnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductDirectCustomers.AllColumnNames, column);
            int actualValue = PromoStepHelpers.GetNumberOfCustomerForProduct(product, ColumnIndex, columnValue);
            Assert.AreEqual(actualValue, numberOfCustomers, "The expected text " + numberOfCustomers + " is not the same as actual text: " + actualValue);
        }

        [Then(@"the user validates the customer '(.*)' under product '(.*)' with '(.*)' of '(.*)' is present")]
        public void ThenTheUserValidatesThatTheCustomerUnderProductIsPresentwithof(string customer, string product, string column, string columnValue)
        {
            int columnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductDirectCustomers.AllColumnNames, column);
            bool result = PromoStepHelpers.IsCustomerPresentUnderProductWithColumnValue(product, customer, columnIndex, columnValue);
            Assert.IsTrue(result, "Customer " + customer + " not found under product " + product);
        }

        [Then(@"the user validates the customer '(.*)' under product '(.*)' with '(.*)' of '(.*)' has value '(.*)' for '(.*)'")]
        public void ThenTheUserValidatesThatTheCustomerUnderProductHasValueFor(string customer, string product, string ProductColumn, string ProductColumnValue, string expectedText, string CustomerColumn)
        {
            int ProductColumnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductDirectCustomers.AllColumnNames, ProductColumn);
            int CustomerColumnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductDirectCustomers.AllColumnNames, CustomerColumn);
            int customerRowIndex = PromoStepHelpers.GetCustomerColumnValueUnderProductWithColumnValue(product, customer, ProductColumnIndex, ProductColumnValue);
            string actualValue = Selenium.GetText(ProductDirectCustomers.DivByColumnAndRow(CustomerColumnIndex.ToString(), (customerRowIndex + 1).ToString()));
            Assert.AreEqual(actualValue, expectedText, "Customer " + customer + " not found under product " + product);
        }

        [When(@"user selects all products on Detail Data with unique row '(.*)' and column '(.*)'")]
        public void WhenUserSelectsAllProductsOnDetailData(string uniqueRow, string uniqueColumn)
        {
            Thread.Sleep(500);
            int count = 0;
            if (!Selenium.ValidateElementOnPage(GenericElementsPage.SelectionPopupAllCheckbox) && count < 10)
            {
                Selenium.Click(ProfitAndLossPage.DropDownTrigger(uniqueRow, "Detail data"));
                Thread.Sleep(500);
                count++;
            }

            Selenium.Click(GenericElementsPage.SelectionPopupAllCheckbox);
            Selenium.Click(PopupGenericElements.PopupOkButton("Selection"));
            Selenium.ValidateAllElementsLoaded(ProditAndLossGrid.AllColumnNames(uniqueRow));
            List<IWebElement> columns = Selenium.Find(ProditAndLossGrid.AllColumnNames(uniqueRow));
            bool isDetailDataApplied = false;
            foreach (var column in columns)
            {
                if (column.Text.Contains(uniqueColumn))
                {
                    isDetailDataApplied = true;
                    break;
                }
            }

            if (!isDetailDataApplied && counter < 5)
            {
                counter++;
                WhenUserSelectsAllProductsOnDetailData(uniqueRow, uniqueColumn);
            }
            else
            {
                counter = 0;
            }
        }


        [Then(@"user validates that all product '(.*)' for column '(.*)' are set to '(.*)'")]
        public void ThenUserValidatesThatAllProductWeightsForColumnAreSetTo(string rowName, string column, string expectedValue)
        {
            int columnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductWeeklySplitGrid.columns, column);
            int RowIndex = 0;
            List<IWebElement> productRows = Selenium.Find(ProductWeeklySplitGrid.rows);
            foreach (var productRow in productRows)
            {
                Selenium.MoveFocusToElement(productRow);
                RowIndex++;
                if (Selenium.GetText(productRow).Contains(rowName) && RowIndex > 2)
                {
                    string actualValue = Selenium.GetText(ProductWeeklySplitGrid.DivByColumnAndRow(rowName, RowIndex.ToString(), columnIndex.ToString()));
                    Assert.AreEqual(expectedValue, actualValue);
                }
            }
        }

        [Then(@"user validates that product code '(.*)' with row '(.*)' for column '(.*)' is set to '(.*)'")]
        public void ThenUserValidatesThatAllProductForColumnAreSetTo(string productCode, string rowName, string column, string expectedValue)
        {
            int productRowIndex = GridStepHelpers.GetElementContainingTextIndex(ProductWeeklySplitGrid.allProducts, productCode);
            int columnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductWeeklySplitGrid.columns, column);
            if (rowName.Equals("Estimated quantity"))
                productRowIndex++;
            string actualValue = Selenium.GetText(ProductWeeklySplitGrid.DivByColumnAndRow(rowName, productRowIndex.ToString(), columnIndex.ToString()));
            Assert.AreEqual(expectedValue, actualValue);
        }

        [When(@"the user enters '(.*)' on Weekly Split column name '(.*)' for product code '(.*)' and row '(.*)'")]
        public void WhenTheUserEntersOnWeeklySplitColumnNameForProductCode(string text, string columnName, string productCode, string rowName)
        {
            int productRowIndex = GridStepHelpers.GetElementContainingTextIndex(ProductWeeklySplitGrid.allProducts, productCode);
            int ColumnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductWeeklySplitGrid.columns, columnName);

            if (rowName.Equals("Estimated quantity"))
                productRowIndex++;

            AbstractedBy abstractedBy = ProductWeeklySplitGrid.DivByColumnAndRow(rowName, productRowIndex.ToString(), ColumnIndex.ToString());

            AbstractedBy elementToValidateAbstractedBy = ProductWeeklySplitGrid.InputByColumnAndRow(productRowIndex.ToString());
            if (Selenium.ClickUntilElementIsDisplayed(abstractedBy, elementToValidateAbstractedBy))
            {
                Selenium.ClearByKeys(elementToValidateAbstractedBy);
                Selenium.SendKeys(elementToValidateAbstractedBy, text);
                Selenium.ClickUntilElementIsDisplayed(GenericElementsPage.SidePanelTab("Cockpit"), GenericElementsPage.InputByLabelName("Action Id"));
                Selenium.ClickUntilElementIsDisplayed(GenericElementsPage.SidePanelTab("Products"), abstractedBy);
            }
            else
            {
                Assert.Fail("Unable to find element " + elementToValidateAbstractedBy.LogicalName);
            }
        }

        [When(@"the user enters '(.*)' on Weekly Split driver for promo week row '(.*)' and promo week column '(.*)'")]
        public void WhenTheUserEntersOnWeeklySplitDriver(string text, string rowValue, string columnNameToSendTextTo)
        {
            int rowIndex = GridStepHelpers.GetElementContainingTextIndex(BasicGrid.Rows, rowValue);
            int columnIndex = GridStepHelpers.GetElementContainingTextIndex(BasicGrid.Columns, columnNameToSendTextTo) + 1;
            GridStepHelpers.EnterTextIntoCell(BasicGrid.Rows, rowIndex, columnIndex, text);
        }

        [Then(@"the user validate that Weekly Split driver for promo week row '(.*)' and promo week column '(.*)' is '(.*)'")]
        public void ThenTheUserValidateThatWeeklySplitDriverForPromoWeekRowAndPromoWeekColumnIs(string rowValue, string columnName, string expectedValue)
        {
            int rowIndex = GridStepHelpers.GetElementContainingTextIndex(BasicGrid.Rows, rowValue);
            int columnIndex = GridStepHelpers.GetElementContainingTextIndex(BasicGrid.Columns, columnName) + 1;
            string actualValue = GridStepHelpers.ExtractTextFromTable(BasicGrid.Columns, BasicGrid.Rows, columnName, rowIndex, 1);
            Assert.AreEqual(expectedValue, actualValue);
        }

        [When(@"the user selects a period on promo plan calendar for product '(.*)' from year '(.*)' quarter '(.*)' to year '(.*)' quarter '(.*)'")]
        public void WhenTheUserSelectsAPeriodOnPromoPlanCalendarFromYearQuarterToYearQuarter(string product, string startYear, string startQuarter, string endYear, string endQuarter)
        {
            try
            {
                if (counter < 5)
                {
                    counter++;
                    Selenium.ValidateElementOnPage(GenericElementsPage.Text(product), 60);
                    Selenium.ClickUntilElementIsDisplayed(PromoPlanPage.ZoomOutButton, PromoPlanPage.YearQuarter(startQuarter, "1"));
                    int productYCoordinate = Selenium.FindOne(GenericElementsPage.Text(product)).Location.Y;
                    int startYearColumnIndex = GridStepHelpers.GetElementContainingTextIndex(PromoPlanPage.CalendarYears, startYear);
                    int endYearColumnIndex = GridStepHelpers.GetElementContainingTextIndex(PromoPlanPage.CalendarYears, endYear);
                    
                    int startQuarterColumnXCoordinate = Selenium.FindOne(PromoPlanPage.YearQuarter(startQuarter, startYearColumnIndex.ToString())).Location.X;
                    int endQuarteColumnrXCoordinate = Selenium.FindOne(PromoPlanPage.YearQuarter(endQuarter, endYearColumnIndex.ToString())).Location.X;
                    Selenium.DragElement(productYCoordinate, startQuarterColumnXCoordinate, 1, endQuarteColumnrXCoordinate, 1);
                    if (!Selenium.ValidateElementOnPage(PopupGenericElements.Popup("New Promotion")))
                    {
                        WhenTheUserSelectsAPeriodOnPromoPlanCalendarFromYearQuarterToYearQuarter(product, startYear, startQuarter, endYear, endQuarter);
                    }
                }
            }
            catch (StaleElementReferenceException)
            {
                WhenTheUserSelectsAPeriodOnPromoPlanCalendarFromYearQuarterToYearQuarter(product, startYear, startQuarter, endYear, endQuarter);
            }
            finally { counter = 0; }
        }

        [Then(@"the user validates that '(.*)' is in quarter '(.*)'")]
        public void ThenTheUserValidatesThatIsInQuarter(string elementLogicalName, string quater)
        {
            int elementValue = Int32.Parse(Selenium.GetText(Selenium.GetAbstractedBy(elementLogicalName)).Substring(0,2));
            switch (quater)
            {
                case "Q1":
                    Assert.That(elementValue > 0 && elementValue < 4, "date is not in the quarter " + quater);
                    break;
                case "Q2":
                    Assert.That(elementValue > 3 && elementValue < 7, "date is not in the quarter " + quater);
                    break;
                case "Q3":
                    Assert.That(elementValue > 6 && elementValue < 10, "date is not in the quarter " + quater);
                    break;
                case "Q4":
                    Assert.That(elementValue > 9 && elementValue < 13, "date is not in the quarter " + quater);
                    break;
                default:
                    Assert.Fail("Date not in the correct range");
                    break;
            }
            
        }

        [When(@"the user drags promo '(.*)' to year '(.*)' and quarter '(.*)'")]
        public void ThenTheUserDragsElementWithValueToElementXCoordinatesWithValueAndValue(string promoDescription, string year, string quarter)
        {
            Selenium.ClickUntilElementIsDisplayed(PromoPlanPage.ZoomOutButton, PromoPlanPage.YearQuarter(quarter, "1".ToString()));
            Selenium.ValidateAllElementsLoaded(PromoPlanPage.CalendarYears);
            int startYearColumnIndex = GridStepHelpers.GetElementContainingTextIndex(PromoPlanPage.CalendarYears, year) - 1;
            var eleToDragTo = Selenium.FindOne(PromoPlanPage.YearQuarter(quarter, startYearColumnIndex.ToString()));

            var eleToDrag = Selenium.FindOne(PromoPlanPage.CalendarPromoPlanReRightRisizeHandle(promoDescription));
            var xOffset = eleToDragTo.Location.X - eleToDrag.Location.X;
            var yOffset = eleToDragTo.Location.Y - eleToDrag.Location.Y;

            Selenium.DragElement(PromoPlanPage.CalendarPromoPlanReRightRisizeHandle(promoDescription), xOffset, yOffset);
            Selenium.Click(NavigationMenu.KantarLogo);
        }

        [When(@"the user drags promo '(.*)' to year '(.*)' and quarter '(.*)' until element '(.*)' with value '(.*)' is present")]
        public void WhenTheUserDragsPromoToYearAndQuarterUntilElementIsPresent(string promoDescription, string year, string quarter, string elementToValidate, string elementToValidateArgs)
        {
            Selenium.ValidateAllElementsLoaded(PromoPlanPage.CalendarYears);
            int startYearColumnIndex = GridStepHelpers.GetElementContainingTextIndex(PromoPlanPage.CalendarYears, year);
            var eleToDragTo = Selenium.FindOne(PromoPlanPage.YearQuarter(quarter, startYearColumnIndex.ToString()));

            var eleToDrag = Selenium.FindOne(PromoPlanPage.CalendarPromoPlanReRightRisizeHandle(promoDescription));
            var xOffset = eleToDragTo.Location.X - eleToDrag.Location.X;
            var yOffset = eleToDragTo.Location.Y - eleToDrag.Location.Y;

          
            Selenium.DragElement(PromoPlanPage.CalendarPromoPlanReRightRisizeHandle(promoDescription), xOffset, yOffset);

            if (elementToValidate != null)
            {
                int count = 0;
                while (!Selenium.ValidateElementOnPage(Selenium.GetAbstractedBy(elementToValidate, new string[] { elementToValidateArgs }), 3) && count < 5)
                {
                    Selenium.DragElement(PromoPlanPage.CalendarPromoPlanReRightRisizeHandle(promoDescription), xOffset, yOffset);
                    Thread.Sleep(1000);
                    count++;
                }
            }
            Selenium.Click(NavigationMenu.KantarLogo);
        }



    }
}
