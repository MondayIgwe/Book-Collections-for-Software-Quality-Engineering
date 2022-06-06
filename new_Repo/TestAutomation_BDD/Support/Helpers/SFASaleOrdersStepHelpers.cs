using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.SFA.Containers;
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
    public class SFASaleOrdersStepHelpers
    {
        public SeleniumFunctions Selenium { get; set; }
        public IWebDriver Driver { get; set; }

        public StepHelpers StepHelpers { get; set; }

        public GridStepHelpers GridStepHelpers { get; set; }

        public SFASaleOrdersStepHelpers(IWebDriver driver)
        {
            Selenium = new SeleniumFunctions(driver);
            Driver = driver;
            StepHelpers = new StepHelpers(driver);
            GridStepHelpers = new GridStepHelpers(driver);
        }

        public void PopulateNewOrderPopUp(string? orderType = null, string? orderDate = null, string? customerType = null, string? customerPharmacyDoctor = null, string? pos = null)
        {
            AbstractedBy? typeDropDownField = null;
            AbstractedBy? typePOSDropDownField = null;
            string? filterField = null;
            string? popUpName = null;
            string? posName = null;
            Selenium.ValidateEnabledAndDisplayed(NewSalesOrder.NewOrderPopUp, 30);
            if (orderType != null)
            {
                Selenium.Click(GenericElementsPage.GenericDropDownSelectedValue("Order type"));
                Selenium.ClearByKeys(GenericElementsPage.GenericDropDownSelectedValue("Order type"));
                Selenium.SendKeys(GenericElementsPage.GenericDropDownSelectedValue("Order type"), orderType);
                Selenium.LooseFocusFromAnElement();
            }
            if (orderDate != null)
            {
                Selenium.Click(GenericElementsPage.GenericDropDownTrigger("Order Date"));
                StepHelpers.SelectDate(CommonDates.DateParser(orderDate));
            }
            if (customerType != null)
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Customer Type"));
                Selenium.ClearByKeys(GenericElementsPage.InputByLabelName("Customer Type"));
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Customer Type"), customerType);
                Selenium.LooseFocusFromAnElement();

                switch (customerType.ToLower().Trim())
                {
                    case "customer":
                        typeDropDownField = GenericElementsPage.GenericDropDownTrigger("Ship to customer");
                        typePOSDropDownField = GenericElementsPage.GenericDropDownTrigger("Pos");
                        filterField = "Customer Code";
                        popUpName = "Customer Master";
                        posName = "Point of Sales";
                        break;
                    case "pharmacy":
                        typeDropDownField = GenericElementsPage.GenericDropDownTrigger("Pharmacy");
                        typePOSDropDownField = GenericElementsPage.GenericDropDownTrigger("Pharmacy / POS");
                        filterField = "Pharmacy Code";
                        popUpName = "Pharmacy";
                        posName = "Pharmacy";
                        break;
                    case "doctor":
                        typeDropDownField = GenericElementsPage.GenericDropDownTrigger("Doctor");
                        filterField = "Code";
                        popUpName = "Doctors";
                        break;
                    default:
                        Assert.IsNotNull(null, "Customer Type: '" + customerType + "' does not exist.");
                        break;
                }
            }

            if (customerPharmacyDoctor != null)
            {
                
                Selenium.Click(typeDropDownField, 15);
                StepHelpers.FilterGrid(filterField, "Like", customerPharmacyDoctor);
                Selenium.Click(GridPopups.SelectRow(popUpName, "1"), 30);
                Selenium.Click(PopupGenericElements.PopupOkButton(popUpName), 30);
                if (pos != null)
                {
                    Selenium.Click(typePOSDropDownField, 15);
                    StepHelpers.FilterGrid(filterField, "Like", pos);
                    Selenium.Click(PopupGenericElements.PopupOkButton(posName), 30);
                }
            }
        }

        public void AddNewProduct(string? productCode = null, string? productDescription = null, string? quantity = null, string? freeQuantity = null, string? oneDisc = null, string? twoDisc = null, string? threeDisc = null, string? specialPrice = null, string? euroPieces = null, string? productionItemCode = null, string? brandDescr = null, string? category = null, string? line = null, string? familyDesc = null, string? productGroupDesc = null, string? formatDesc = null, string? orderUnit = null)
        {
            Selenium.ValidateEnabledAndDisplayed(PopupGenericElements.PopupOkButton("Add new products"), 30);

            if (productCode != null)
            {
                StepHelpers.FilterGrid("Add new products", "Product", "Like", productCode);
            }

            if (productDescription != null)
            {
                StepHelpers.FilterGrid("Add new products", "Product Description", "Like", productDescription);
            }

            if (productionItemCode != null)
            {
                StepHelpers.FilterGrid("Add new products", "Production item code", "Like", productionItemCode);
            }

            if (brandDescr != null)
            {
                StepHelpers.FilterGrid("Add new products", "Brand Descr.", "Like", brandDescr);
            }

            if (category != null)
            {
                StepHelpers.FilterGrid("Add new products", "Category", "Like", category);
            }

            if (line != null)
            {
                StepHelpers.FilterGrid("Add new products", "Line", "Like", line);
            }

            if (familyDesc != null)
            {
                StepHelpers.FilterGrid("Add new products", "Family Desc.", "Like", familyDesc);
            }

            if (productGroupDesc != null)
            {
                StepHelpers.FilterGrid("Add new products", "Product Group Desc.", "Like", productGroupDesc);
            }

            if (formatDesc != null)
            {
                StepHelpers.FilterGrid("Add new products", "Format Description", "Like", formatDesc);
            }

            if (orderUnit != null)
            {
                StepHelpers.FilterGrid("Add new products", "Order unit", "Like", orderUnit);
            }
            
            Selenium.FluentWaitElementToBePresent(GridPopups.MultipleRowCells("Add new products", 1.ToString()), 30);
            List<IWebElement> countColumns = Selenium.Find(GridPopups.MultipleLeftSideRow("Add new products", 1.ToString()));
            while(countColumns.Count == 0)
            {
                countColumns = Selenium.Find(GridPopups.MultipleLeftSideRow("Add new products", 1.ToString()));
            }

            if (quantity != null)
            {
                AbstractedBy productsRow = GridStepHelpers.GetCorrectRowGroup(GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), GridPopups.MultipleLeftSideRows("Add new products"), GridPopups.MultipleRightSideRows("Add new products"), "Quantity");
                GridStepHelpers.EnterTextIntoTextCell(productsRow, GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), 1, "Quantity", quantity, 1);
            }

            if (freeQuantity != null)
            {
                AbstractedBy productsRow = GridStepHelpers.GetCorrectRowGroup(GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), GridPopups.MultipleLeftSideRows("Add new products"), GridPopups.MultipleRightSideRows("Add new products"), "Free quantity");
                GridStepHelpers.EnterTextIntoTextCell(productsRow, GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), 1, "Free quantity", freeQuantity, 1);
            }

            if (oneDisc != null)
            {
                AbstractedBy productsRow = GridStepHelpers.GetCorrectRowGroup(GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), GridPopups.MultipleLeftSideRows("Add new products"), GridPopups.MultipleRightSideRows("Add new products"), "1° % Disc.");
                GridStepHelpers.EnterTextIntoTextCell(productsRow, GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), 1, "1° % Disc.", oneDisc, 1);
            }

            if (twoDisc != null)
            {
                AbstractedBy productsRow = GridStepHelpers.GetCorrectRowGroup(GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), GridPopups.MultipleLeftSideRows("Add new products"), GridPopups.MultipleRightSideRows("Add new products"), "2° % Disc.");
                GridStepHelpers.EnterTextIntoTextCell(productsRow, GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), 1, "'2° % Disc.", twoDisc, 1);
            }

            if (threeDisc != null)
            {
                AbstractedBy productsRow = GridStepHelpers.GetCorrectRowGroup(GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), GridPopups.MultipleLeftSideRows("Add new products"), GridPopups.MultipleRightSideRows("Add new products"), "3° % Disc.");
                GridStepHelpers.EnterTextIntoTextCell(productsRow, GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), 1, "3° % Disc.", threeDisc, 1);
            }

            if (specialPrice != null)
            {
                AbstractedBy productsRow = GridStepHelpers.GetCorrectRowGroup(GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), GridPopups.MultipleLeftSideRows("Add new products"), GridPopups.MultipleRightSideRows("Add new products"), "Special Price");
                GridStepHelpers.EnterTextIntoTextCell(productsRow, GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), 1, "Special Price", specialPrice, 1);
            }

            if (euroPieces != null)
            {
                AbstractedBy productsRow = GridStepHelpers.GetCorrectRowGroup(GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), GridPopups.MultipleLeftSideRows("Add new products"), GridPopups.MultipleRightSideRows("Add new products"), " €/pieces");
                GridStepHelpers.EnterTextIntoTextCell(productsRow, GridPopups.ColumnHeadersWithPopUpSM1ID("LOGICALNEWORDERROWPOPUP"), 1, " €/pieces", euroPieces, 1);
            }

            Selenium.Click(GridPopups.SelectRow("Add new products", "1"));
            Selenium.Click(PopupGenericElements.PopupOkButton("Add new products"), 30);
        }

        public void PopulateProductTable(string textToEnter, string columnToPopulate, string referenceValueColumn, string referenceRowData)
        {
            GridStepHelpers.EnterTextIntoTextCell(SalesOrderProductsGrid.RowsLeftSide, SalesOrderProductsGrid.RowsRightSide, SalesOrderProductsGrid.ColumnHeaders, referenceValueColumn, referenceRowData, columnToPopulate, textToEnter, 1);
        }

        public void ChangeUserResponsibility(string user)
        {
            Selenium.ValidateAllElementsLoaded(GenericElementsPage.InputByLabelName("Customer's Responsible"));
            string currentUser = Selenium.GetText(GenericElementsPage.InputByLabelName("Customer's Responsible"));
            if (currentUser == null || currentUser.Equals(string.Empty))
            {
                Selenium.Click(GenericElementsPage.InputByLabelName("Customer's Responsible"), 15);
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Customer's Responsible"), user);
                Selenium.LooseFocusFromAnElement();
            }
        }
    }
}
