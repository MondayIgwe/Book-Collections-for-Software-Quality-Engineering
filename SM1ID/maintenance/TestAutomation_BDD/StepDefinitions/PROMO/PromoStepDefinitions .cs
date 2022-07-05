using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.Promo;
using Kantar_BDD.Pages.Toolbar;
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

        public PromoStepDefinitions(ScenarioContext scenarionContext) : base(scenarionContext)
        {
        }

        [When(@"the user creates a Promo with customerHLevel: '(.*)' customerCode: '(.*)'")]
        public void WhenTheUserCreatesAPromo(string customerHLevel, string customerCode)
        {
            PromoStepHelpers.CreateAPromo(customerHLevel, customerCode);
        }

        [When(@"the user creates a Promo with customer Level '(.*)' customerCode: '(.*)' confirmLevel: '(.*)'")]
        public void WhenTheUserCreatesAPromo(string customerHLevel, string customerCode, string confirmLevel)
        {
            PromoStepHelpers.CreateAPromo(customerHLevel, customerCode, confirmLevel);
        }

        [When(@"the user creates a Promo with segment customerHLevel: '(.*)' customerCode: '(.*)' confirmLevel: '(.*)' refYear: '(.*)' productSegment: '(.*)'")]
        public void WhenTheUserCreatesAPromo(string customerHLevel, string customerCode, string confirmLevel, string refYear, string productSegment)
        {
            if (!int.TryParse(refYear, out _))
                refYear = CommonDates.DateParser(refYear);
            PromoStepHelpers.CreateAPromo(customerHLevel, customerCode, confirmLevel, refYear, productSegment);
        }

        [When(@"the user populates the cockpit with description: '(.*)' sellInStart: '(.*)' sellInEnd: '(.*)' sellOutStart: '(.*)' sellOutEnd: '(.*)' mechanics: '(.*)'")]
        public void ThenTheUserPopulatesTheCockpit(string description, string sellInStart, string sellInEnd, string sellOutStart, string sellOutEnd, string mechanics)
        {
            sellInStart = GetNextWeekDate(sellInStart);
            sellInEnd = GetNextWeekDate(sellInEnd);
            sellOutStart = GetNextWeekDate(sellOutStart);
            sellOutEnd = GetNextWeekDate(sellOutEnd);

            StepHelpers.SelectDatePeriod(Calendar.SellInDate, CommonDates.DateParser(sellInStart), CommonDates.DateParser(sellInEnd));

            if (!string.IsNullOrEmpty(sellOutStart) && !string.IsNullOrEmpty(sellOutEnd))
            {
                try
                {
                    StepHelpers.SelectDatePeriod(Calendar.SellOutStartDate, CommonDates.DateParser(sellOutStart), CommonDates.DateParser(sellOutEnd));
                }
                catch (Exception)
                {
                    StepHelpers.SelectDatePeriod(Calendar.SellOutStartDate, CommonDates.DateParser(sellOutStart), CommonDates.DateParser(sellOutEnd));
                }
            }

            int count = 0;

            while (Selenium.GetText(CockpitPage.PromoDescriptionTextField).Equals(description) == false && count < 10)
            {
                Selenium.SendKeys(CockpitPage.PromoDescriptionTextField, description);
                Thread.Sleep(1000);
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

        public string GetNextWeekDate(string nextDate)
        {
            if (nextDate.Contains("Next"))
            {
                string dayOfWeek = nextDate.Split(" ")[1];
                int NumberOfWeeks = Int32.Parse((nextDate.Split(" ")[2].Replace("+", "")));
                int dayUntilNextDay = 0;
                switch (dayOfWeek)
                {
                    case "Monday":
                        dayUntilNextDay = DayOfWeek.Monday - DateTime.Today.AddDays(1).DayOfWeek + 7;
                        break;
                    case "Sunday":
                        dayUntilNextDay = DayOfWeek.Sunday - DateTime.Today.AddDays(1).DayOfWeek + 7;
                        break;
                    default:
                        // code block
                        break;
                }

                if (NumberOfWeeks == 0)
                {
                    nextDate = DateTime.Today.AddDays(dayUntilNextDay + 1).ToString("dd/MM/yyyy");
                }
                else
                {
                    nextDate = DateTime.Today.AddDays(dayUntilNextDay + 1 + (7 * NumberOfWeeks)).ToString("dd/MM/yyyy");
                }

                return nextDate;
            }
            else
            {
                return nextDate;
            }
        }


        [When(@"the user adds products with productLevel: '(.*)' productCodes: '(.*)'")]
        [When(@"the user adds a product with productLevel: '(.*)' productCodes: '(.*)'")]
        public void ThenTheUserAddsAProduct(string productLevel, string productCodes)
        {
            Selenium.Click(PromoActionsPage.ProductsTab);
            Selenium.Click(GuiToolbar.AddButton, 3);

            if (!String.IsNullOrEmpty(productLevel))
            {
                Selenium.Click(ProductsPage.ProductLevel(productLevel));
            }

            List<string> productCodeList = productCodes.Split(',').ToList();

            if (productLevel.Equals("Display"))
            {
                StepHelpers.FilterGrid("Product", "Product Code", productCodeList);
            }
            else
            {
                StepHelpers.FilterGrid("Product", "Host Prod. Code", productCodeList);
            }

            foreach (string productCode in productCodeList)
            {
                Selenium.Click(BasicGrid.GridCheckBox(productCode));
            }

            Selenium.Click(GenericElementsPage.OkButton);
        }

        [When(@"the user adds an assortment product with productCode: '(.*)'")]
        public void ThenTheUserAddsAssortmentProduct(string productCode)
        {
            Selenium.Click(GenericElementsPage.SidePanelTab("Products"));
            Selenium.Click(PromoActionsPage.ProductAddButton);
            StepHelpers.FilterGrid("Product", "Like", productCode);
            Selenium.Click(BasicGrid.GridCheckBox(productCode));
            Selenium.Click(PopupGenericElements.PopupButton("Next"));
            StepHelpers.SelectsDropdownValueByFieldWithValue("LISTED", "Status", false);
            Selenium.Click(PopupGenericElements.PopupButton("Next"));
            int count = 0;
            while (Selenium.ValidateElementDisplayed(PopupGenericElements.PopupButton("Confirm"), 1) && count < 5)
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
            string originalText = Selenium.GetText(abstractedBy);
            string newText = originalText;

            if (text.Equals(originalText))
                return;

            int counter = 0;
            while (originalText.Equals(newText) && counter < 5)
            {
                if (Selenium.ClickUntilElementIsDisplayed(abstractedBy, elementToValidateAbstractedBy))
                {
                    counter++;
                    Selenium.ClearByKeys(elementToValidateAbstractedBy);
                    Selenium.SendKeys(elementToValidateAbstractedBy, text);
                    Selenium.LooseFocusFromAnElement();
                    newText = Selenium.GetText(abstractedBy);
                }
                else
                {
                    Assert.Fail("Unable to find element " + elementToValidateAbstractedBy.LogicalName);
                }
            }

        }


        [When(@"the user retrieves value on column name '(.*)' for product code '(.*)' and saves it as '(.*)'")]
        public void WhenTheUserRetrievesValueOnColumnNameForProductCode(string columnName, string productCode, string key)
        {
            Selenium.Click(GenericElementsPage.SidePanelTab("Products"));
            int productRowIndex = GridStepHelpers.GetElementContainingTextIndex(ProductGrid.AllProducts, productCode);
            int ColumnIndex = GridStepHelpers.GetColumnPosition(ProductGrid.AllColumnNames, columnName);

            AbstractedBy abstractedBy = ProductGrid.DivByColumnAndRow(productRowIndex.ToString(), ColumnIndex.ToString());

            AbstractedBy elementToValidateAbstractedBy = ProductGrid.InputByColumnAndRow(productRowIndex.ToString());
            string text = Selenium.GetText(abstractedBy);
            SaveValue(key, text);
        }



        [Then(@"the user validates that column name '(.*)' for product code '(.*)' validation: '(.*)' editable")]
        public void ThenTheUserValidatesThatColumnNameForProductCodeEditable(string columnName, string productCode, string validation)
        {
            int productRowIndex = GridStepHelpers.GetElementContainingTextIndex(ProductGrid.AllProducts, productCode);
            int ColumnIndex = GridStepHelpers.GetColumnPosition(ProductGrid.AllColumnNames, columnName);
            bool isContains = validation.Equals("is");
            Assert.IsTrue(Selenium.HasAttribute(ProductGrid.TdByColumnAndRow(productRowIndex.ToString(), ColumnIndex.ToString()), "class", "editable") == isContains, "The column is not editable " + columnName);
        }


        [Then(@"the user validates text '(.*)' on column name '(.*)' for product code '(.*)'")]
        public void WhenTheUserValidatesTextOnColumnNameForProductCode(string expectedText, string columnName, string productCode)
        {
            int productRowIndex = GridStepHelpers.GetElementContainingTextIndex(ProductGrid.AllProducts, productCode);
            int ColumnIndex = GridStepHelpers.GetColumnPosition(ProductGrid.AllColumnNames, columnName);
            string actualText = Selenium.GetText(ProductGrid.DivByColumnAndRow(productRowIndex.ToString(), ColumnIndex.ToString()));
            Assert.AreEqual(expectedText, actualText, "The expected text " + expectedText + " is not the same as actual text: " + actualText);
        }

        [When(@"the user retrieves text on column name '(.*)' for product code '(.*)' and saves it as '(.*)'")]
        public void WhenTheUserRetreivesTextOnColumnNameForProductCode(string columnName, string productCode, string key)
        {
            int productRowIndex = GridStepHelpers.GetElementContainingTextIndex(ProductGrid.AllProducts, productCode);
            int ColumnIndex = GridStepHelpers.GetColumnPosition(ProductGrid.AllColumnNames, columnName);
            string actualText = Selenium.GetText(ProductGrid.DivByColumnAndRow(productRowIndex.ToString(), ColumnIndex.ToString()));
            SaveValue(key, actualText);
        }

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

        [When(@"the user assigns segments to user in responsibility matrix with description: '(.*)'")]
        public void ThenTheUserAssignsSegmentsToUserInResponsibilityMatrix(string description)
        {
            //uncheck any checked boxes first
            int count = 0;
            while (Selenium.ValidateElementDisplayed(GenericElementsPage.CheckedBox, 1) && count < 10)
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
        public void WhenTheUserSelectsActiveScenarionFromDropDownList(string valueToSelect, string labelName)
        {
            var by = PromoPlanPage.ActiveScenarioDropDown(valueToSelect.Replace("\"", string.Empty));
            Selenium.ValidateElementDisplayed(GenericElementsPage.GenericDropDownTrigger(labelName));

            Selenium.ClickUntilElementIsDisplayed(GenericElementsPage.GenericDropDownTrigger(labelName), by);
            Selenium.Click(by);
        }

        [Then(@"the user validates text '(.*)' on column name '(.*)' for profit and loss element name '(.*)' with unique column '(.*)'")]
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

        [When(@"the user clicks on Calendar Promo Plan with description '(.*)'")]
        public void WhenTheUserClicksCalendarPromoPlanWithValue(string description)
        {
            int count = 0;
            while (!Selenium.GetAttribute(PromoPlanPage.CalendarPromoPlan(description), "class").Contains("schedulerBase-event-selected") && count < 5)
            {
                Selenium.Click(PromoPlanPage.CalendarPromoPlan(description));
                count++;
                Thread.Sleep(1000);
            }
        }

        [Then(@"the user validates that product code '([^']*)' is under tier '([^']*)'")]
        public void ThenTheUSerValidatesProductCodeIsUnderTier(string product, string tier)
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
            while (!Selenium.ValidateElementDisplayed(GenericElementsPage.Button("PromoPlan Scenario"), 15) && count < 3)
            {
                Selenium.DoubleClickElement(PromoPlanPage.CalendarPromoPlan(promoDescription));
                count++;
            }
        }


        [When(@"the user removes all promotions with description '(.*)' and customer '(.*)'")]
        public void WhenTheUserRemovesAllPromotionsWithDescriptionAndCustomer(string description, string customer)
        {
            Selenium.ValidateElementDisplayed(BasicGrid.IndexedRow("1"));
            StepHelpers.FilterGrid("Description", "Like", description);
            StepHelpers.FilterGrid("Promo holder code", "Like", customer);
            int count = 0;
            while (Selenium.ValidateElementDisplayed(BasicGrid.FirstRow, 1) && count < 10)
            {
                try
                {
                    count++;
                    Selenium.Click(GenericElementsPage.Text(description));
                    Selenium.Click(GenericElementsPage.RemoveButton);
                    if (Selenium.ValidateElementDisplayed(PopupGenericElements.AlertDialogOkButton))
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
            Selenium.Click(ProductGrid.ProductGridCheckBox("ALL - Selected"));
            while (Selenium.Find(ProductGrid.AllCheckedCheckboxes).Count > 0 && count < 50)
            {
                Selenium.Click(ProductGrid.ProductGridCheckBox("ALL - Selected"));
                Thread.Sleep(1000);
                count++;
            }
        }

        [When(@"the user creates a new Promotional What If with description '(.*)'")]
        public void WhenTheUserCreatesANewPromotionalWhatIf(string description)
        {
            Selenium.ClickUntilElementIsDisplayed(ProductsPage.PromoWhatIfButton, ProductsPage.PromoCreateWhatIfButton);
            Selenium.Click(ProductsPage.PromoCreateWhatIfButton);
            Selenium.SendKeys(ProductsPage.PromoCreateWhatIfText, description);
            Selenium.Click(PopupGenericElements.PopupOkButton("Create What If"));
            Selenium.FluentWaitElementToBeNotPresentInDOM(Selenium.GetAbstractedBy("Loading Mask", new string[] { }), 300);
        }

        [When(@"the user changes the Promo What If with description '(.*)'")]
        public void WhenTheUserChangesThePromoWhatIf(string description)
        {
            PromoStepHelpers.ChangePromoWhatIf(description);
        }

        [Then(@"the user validates that the number of products is higher than value '(.*)'")]
        public void WhenTheUserValidatesThatTheNumberOfProductsIsHigherThan(string expectedNrOfProducts)
        {
            Selenium.Click(GenericElementsPage.SidePanelTab("Cockpit"));
            string totalNrOfProducts = Selenium.GetText(CockpitPage.CardProductsCount).Split('/')[1].Trim();
            Assert.IsTrue(int.Parse(totalNrOfProducts) > int.Parse(expectedNrOfProducts), "Step 6 - The numer of products is less than expected");
        }

        [Then(@"the user validates that the number of anomalies is equal to value '(.*)'")]
        public void WhenTheUserValidatesThatTheNumberOfAnomaliesIsEqualTo(string expectedNrOfAnomalies)
        {
            string nrOfAnomalies = Selenium.GetText(WorkflowPage.AnomaliesNumber).Split('/')[1].Trim();
            Assert.AreEqual(int.Parse(expectedNrOfAnomalies), int.Parse(nrOfAnomalies), "Step 10 - The number of anomalies is not as expected - " + nrOfAnomalies);
        }

        [When(@"the user opens the trigger on product column '(.*)' and Row with value '(.*)'")]
        public void WhenTheUserOpensTheTriggerOnColumnAndRow(string columnName, string rowValue)
        {
            GridStepHelpers.ClickTriggerOnCell(ProductGrid.AllColumnNames, columnName, ProductGrid.AllProducts, rowValue, "Product Grid Cell");
        }


        [Then(@"the user validates that the customer '(.*)' under product '(.*)' is present")]
        public void ThenTheUserValidatesThatTheCustomerUnderProductIsPresent(string customer, string product)
        {
            Assert.IsTrue(PromoStepHelpers.GetCustomerUnderProductIndex(product, customer) > 0, "Customer " + customer + " not found under product " + product);
        }

        [Then(@"the user validates that the customer '(.*)' under product '(.*)' has value '(.*)' for column '(.*)'")]
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

        [When(@"the user selects a customer with customerHLevel: '(.*)' customerCode: '(.*)'")]
        public void WhenTheUserSelectsACustomer(string customerHLevel, string customerCode)
        {
            StepHelpers.SelectCustomer(customerHLevel, customerCode);
        }

        [Then(@"the user validates that values for product grid and direct customers tab are the same")]
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

        [Then(@"the user validates that product code '(.*)' has numberOfCustomers: '(.*)' customers")]
        public void ThenTheProductHasNumberOfCustomers(string product, int numberOfCustomers)
        {
            int actualValue = PromoStepHelpers.GetNumberOfCustomersForProduct(product);
            Assert.AreEqual(numberOfCustomers, actualValue, "The expected text " + numberOfCustomers + " is not the same as actual text: " + actualValue);
        }

        [Then(@"the user validates product code '(.*)' with column name '(.*)' column value '(.*)' has numberOfCustomers: '(.*)' customers")]
        public void ThenTheUserValidatesThatProductsWithHasNumberOfCustomers(string product, string column, string columnValue, int numberOfCustomers)
        {
            int ColumnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductDirectCustomers.AllColumnNames, column);
            int actualValue = PromoStepHelpers.GetNumberOfCustomersForProduct(product, ColumnIndex, columnValue);
            Assert.AreEqual(actualValue, numberOfCustomers, "The expected text " + numberOfCustomers + " is not the same as actual text: " + actualValue);
        }

        [Then(@"the user validates the customer '(.*)' under product '(.*)' with column name '(.*)' column value '(.*)' is present")]
        public void ThenTheUserValidatesThatTheCustomerUnderProductIsPresent(string customer, string product, string column, string columnValue)
        {
            int columnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductDirectCustomers.AllColumnNames, column);
            bool result = PromoStepHelpers.IsCustomerPresentUnderProductWithColumnValue(product, customer, columnIndex, columnValue);
            Assert.IsTrue(result, "Customer " + customer + " not found under product " + product);
        }

        [Then(@"the user validates the customer '(.*)' under product '(.*)' with ProductColumn: '(.*)' ProductColumnValue: '(.*)' has value '(.*)' for CustomerColumn: '(.*)'")]
        public void ThenTheUserValidatesThatTheCustomerUnderProductHasValue(string customer, string product, string ProductColumn, string ProductColumnValue, string expectedText, string CustomerColumn)
        {
            int ProductColumnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductDirectCustomers.AllColumnNames, ProductColumn);
            int CustomerColumnIndex = GridStepHelpers.GetElementContainingTextIndex(ProductDirectCustomers.AllColumnNames, CustomerColumn);
            int customerRowIndex = PromoStepHelpers.GetCustomerColumnIndexUnderProductWithColumnValue(product, customer, ProductColumnIndex, ProductColumnValue);
            string actualValue = Selenium.GetText(ProductDirectCustomers.DivByColumnAndRow(CustomerColumnIndex.ToString(), (customerRowIndex + 1).ToString()));
            Assert.AreEqual(actualValue, expectedText, "Customer " + customer + " not found under product " + product);
        }

        [When(@"user selects all products on Detail Data for '(.*)' tab and column '(.*)'")]
        public void WhenUserSelectsAllProductsOnDetailData(string tab, string uniqueColumn)
        {
            bool isDetailDataApplied = false;
            int tryCount = 0;
            AbstractedBy detailDataBy = null;
            AbstractedBy allColumnsBy = null;
            switch (tab)
            {
                case "Profit & Loss":
                    detailDataBy = ProfitAndLossPage.ProfitAndLossDetailDataTriggerIcon;
                    allColumnsBy = ProfitAndLossGrid.ProfitAndLossColumns;
                    break;
                case "Profit & Loss Retailer":
                    detailDataBy = ProfitAndLossPage.ProfitAndLossRetailerDetailDataTriggerIcon;
                    allColumnsBy = ProfitAndLossGrid.ProfitAndLossRetaillerColumns;
                    break;
                case "Profit & Loss What if":
                    detailDataBy = ProfitAndLossPage.ProfitAndLossWhatIfDetailDataTriggerIcon;
                    allColumnsBy = ProfitAndLossGrid.ProfitAndLossWhatIfColumns;
                    break;
                default:
                    Assert.Fail("Provided tab name not valid");
                    break;
            }
            while (!isDetailDataApplied && tryCount < 5)
            {
                tryCount++;
                int openPopupCount = 0;
                Selenium.Click(detailDataBy);
                while (!Selenium.ValidateElementOnPage(GenericElementsPage.SelectionPopupAllCheckbox) && openPopupCount < 10)
                {
                    Selenium.Click(detailDataBy);
                    Thread.Sleep(500);
                    openPopupCount++;
                }

                Selenium.Click(GenericElementsPage.SelectionPopupAllCheckbox);
                Selenium.Click(GenericElementsPage.OkButton);
                Selenium.ValidateAllElementsLoaded(allColumnsBy);
                List<IWebElement> columns = Selenium.Find(allColumnsBy);

                foreach (var column in columns)
                {
                    if (column.Text.Contains(uniqueColumn))
                    {
                        isDetailDataApplied = true;
                        break;
                    }
                }
            }

        }

        [Then(@"user validates that all products rowName: '(.*)' for column '(.*)' are set to '(.*)'")]
        public void ThenUserValidatesThatAllProductRowNameForColumnAreSetTo(string rowName, string column, string expectedValue)
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
                    Assert.AreEqual(expectedValue, actualValue, "Failed to validate that all products for row name '" + rowName + "' for column '" + column + "' are set to '" + expectedValue + "'");
                }
            }
        }



        [Then(@"user validates that all weekly split cells are readonly for rowName: '(.*)' and column '(.*)'")]
        public void ThenUserValidatesThatAllWeeklySplitCellsAreReadonlyForRowAndColumn(string rowName, string column)
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
                    AbstractedBy td = ProductWeeklySplitGrid.DivByColumnAndRow(rowName, RowIndex.ToString(), columnIndex.ToString());
                    Assert.IsEmpty(Selenium.GetAttribute(td, "id"));
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
            Assert.AreEqual(expectedValue, actualValue, "Failed to validate that product code '" + productCode + "' with row '" + rowName + "' for column '" + column + "' is set to '" + expectedValue + "'");
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
            Assert.AreEqual(expectedValue, actualValue, "Failed to validate that split driver for promo week row '" + rowValue + "' and promo week column '" + columnName + "' is" + expectedValue + "'");
        }

        [When(@"the user selects a period on promo plan calendar for product '(.*)' from year '(.*)' quarter '(.*)' to year '(.*)' quarter '(.*)'")]
        public void WhenTheUserSelectsAPeriodOnPromoPlanCalendarFromYearQuarterToYearQuarter(string product, string startYear, string startQuarter, string endYear, string endQuarter)
        {
            int count = 0;
            while (!Selenium.ValidateElementOnPage(PopupGenericElements.PopupByHeading("New Promotion")) && count < 3)
            {
                try
                {
                    count++;
                    Selenium.ValidateElementOnPage(GenericElementsPage.Text(product), 60);
                    Selenium.ClickUntilElementIsDisplayed(PromoPlanPage.ZoomOutButton, PromoPlanPage.YearQuarter(startQuarter, "1"));
                    int productYCoordinate = Selenium.FindOne(GenericElementsPage.Text(product)).Location.Y;
                    int startYearColumnIndex = GridStepHelpers.GetElementContainingTextIndex(PromoPlanPage.CalendarYears, startYear);
                    int endYearColumnIndex = GridStepHelpers.GetElementContainingTextIndex(PromoPlanPage.CalendarYears, endYear);

                    int startQuarterColumnXCoordinate = Selenium.FindOne(PromoPlanPage.YearQuarter(startQuarter, startYearColumnIndex.ToString())).Location.X;
                    int endQuarteColumnrXCoordinate = Selenium.FindOne(PromoPlanPage.YearQuarter(endQuarter, endYearColumnIndex.ToString())).Location.X;
                    Selenium.DragElement(productYCoordinate, startQuarterColumnXCoordinate, endQuarteColumnrXCoordinate);
                }
                catch (Exception ex) when (ex is StaleElementReferenceException)
                {
                    Thread.Sleep(1000);
                    Console.WriteLine($"Expected exception occured {ex.GetType().Name}");
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        [Then(@"the user validates that '(.*)' is in quarter '(.*)'")]
        public void ThenTheUserValidatesThatIsInQuarter(string elementLogicalName, string quater)
        {
            int elementValue = Int32.Parse(Selenium.GetText(Selenium.GetAbstractedBy(elementLogicalName)).Substring(0, 2));
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

        [When(@"the user drags promo promoDescription: '(.*)' to year '(.*)' and quarter '(.*)'")]
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
            Selenium.Click(TopToolbar.KantarLogo);
        }

        [When(@"the user drags promo promoDescription: '(.*)' to year '(.*)' and quarter '(.*)' until element '(.*)' with value '(.*)' is present")]
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
                    Selenium.DragElement(PromoPlanPage.CalendarPromoPlanReRightRisizeHandle(promoDescription), xOffset + count, yOffset);
                    Thread.Sleep(1000);
                    count++;
                }
            }
            Selenium.Click(TopToolbar.KantarLogo);
        }
    }
}
