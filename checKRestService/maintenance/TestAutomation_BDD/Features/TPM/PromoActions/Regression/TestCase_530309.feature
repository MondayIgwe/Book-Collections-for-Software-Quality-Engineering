Feature: TestCase_530309

@BDD_530309 @PROMO_Regression @PromoActions
Scenario: WEB_TPM_SP_PRODUCTGRID_EDITMEASURES_BLOCKEDFORMULA_001
	#Go to "Promo Action" navigator
	#Step 1
	Given the user navigates to the 'Promotional actions' page

	#Step 2 Create a new Promo with:
	When the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUSTOMER>'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<MECHANICS>'
	
	
	#Step 3 In the product Grid, add:  - @PRODUCT:  001
	And the user clicks on side panel 'Products'
	And the user adds a product with productLevel: '' productCodes: '<PRODUCT>'
	#4 Select to "View ALL Measures"
	And the user clicks on the 'Product Grid Select Measures'
	And the user clicks on 'List' with value 'All'
	#@PriceList = 1
	Then the user validates text '<PriceList>' on column name 'Price List' for product code '<PRODUCT>'
	#5 Set @QTYESTIMATED = 1000
	When the user enters '<QTYESTIMATED1>' on column name 'Estimated quantity' for product code '<PRODUCT>'
	#Gross Sales Revenue = Qty Estimated * Price List =  1000 
	Then the user validates text '1,000.00' on column name 'Gross Sales Revenue' for product code '<PRODUCT>'
	#6 Go to Cockpit.  Change WF Status to "In Authorization"
	When the user changes the status to 'To be authorized'
	#QTYESTIMATED is shown editable in the Product Grid
	And the user clicks on side panel 'Products'
	Then the user validates that column name 'Estimated quantity' for product code '<PRODUCT>' validation: 'is' editable
	#7 Set @QTYESTIMATED = 2000
	When the user enters '<QTYESTIMATED2>' on column name 'Estimated quantity' for product code '<PRODUCT>'
	#Gross Sales Revenue = 2000
	Then the user validates text '2,000.00' on column name 'Gross Sales Revenue' for product code '<PRODUCT>'
	#8 Go to Cockpit. Change WF Status to "Confirmed"
	When the user changes the status to 'Confirm'
	#QTYESTIMATED is shown readonly in the Product Grid.
	And the user clicks on side panel 'Products'
	Then the user validates that column name 'Estimated quantity' for product code '<PRODUCT>' validation: 'is not' editable
	#9 Go to Cockpit.  Change WF Status to "Actual"
	When the user changes the status to 'Actual'
	#QTYESTIMATED is shown editable in the Product Grid
	And the user clicks on side panel 'Products'
	Then the user validates that column name 'Estimated quantity' for product code '<PRODUCT>' validation: 'is' editable
	#Set @QTYESTIMATED = 3000
	When the user enters '<QTYESTIMATED2>' on column name 'Estimated quantity' for product code '<PRODUCT>'
	#ross Sales Revenue = 2000 so it is NOT updated
	Then the user validates text '2,000.00' on column name 'Gross Sales Revenue' for product code '<PRODUCT>'
	#11 Close the promo
	When the user closes all pages without saving the work done

Examples:
	| CUSTLEV | CUSTOMER | MECHANICS | SELLINSTART | SELLINEND  | SELLOUTSTART | SELLOUTEND | DESCRIPTION                             | PRODUCT | PriceList | QTYESTIMATED1 | QTYESTIMATED2 | QTYESTIMATED3 |
	| Level 0 | EC10036  | TPR in %  | 01/05/2021  | 01/11/2021 | 01/05/2021   | 01/11/2021 | Measure Editability and Blocked Formula | 001     | 1.00      | 1000          | 2000          | 3000          |
