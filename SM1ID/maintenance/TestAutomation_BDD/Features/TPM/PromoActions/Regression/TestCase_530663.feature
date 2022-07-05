Feature: TestCase_530663

@BDD_530663 @PROMO_Regression @PromoActions
Scenario: WEB_TPM_SP_PRODUCTGRID_EDITMEASURES_OUTOFRANGEERROR_001
	#Go to "Promo Action" navigator
	#Step 1
	Given the user navigates to the 'Promotional actions' page

	#Step 2
	When the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUSTOMER>'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<MECHANICS>'
	#3 In the product Grid, add: 	  - @PRODUCT:  001
	And the user clicks on side panel 'Products'
	And the user adds a product with productLevel: '' productCodes: '<PRODUCT>'
	#4 Set @QTYESTIMATED = 1234567890123
	And the user enters '<QTYESTIMATED1>' on column name 'Estimated quantity' for product code '<PRODUCT>'
	#5 Try to save
	And the user clicks on the 'Save Button'
	#A @message is shown: Server Error: Parameter value '1234567890123.0000' is out of range.
	Then the user validates that 'Alert Dialog Message Box' text contains '<ERROR>'
	And the user validates that 'Alert Dialog Message Box' text contains '1234567890123.0000'
	#6 Set @QTYESTIMATED = 123456789012
	When the user clicks on the 'Error Popup Ok Button'
	When the user enters '<QTYESTIMATED2>' on column name 'Estimated quantity' for product code '<PRODUCT>'
	#7 Save promo
	And the user clicks on the 'Save Button'
	#Promo is saved
	Then the user validates that the 'Alert Dialog Message Box' is not present
	When the user closes all pages without saving the work done

Examples:
	| CUSTLEV | CUSTOMER | MECHANICS     | SELLINSTART | SELLINEND  | SELLOUTSTART | SELLOUTEND | DESCRIPTION                             | PRODUCT | QTYESTIMATED1 | QTYESTIMATED2 | ERROR                                                 |
	| Level 0 | EC10036  | TPR in Rate " | 01/05/2020  | 01/11/2020 | 01/05/2020   | 01/11/2020 | Measure Editability and Blocked Formula | 001     | 1234567890123 | 123456789012  | is out of range. |
