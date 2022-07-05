Feature: TestCase_544910

@BDD_544910 @PROMO_Regression @PromoActions
Scenario: WEB_TPM_SP_PROMODOCUMENT_WEEKLYSPLIT_REVALUATED_IN_CON_STATUS_001
	#Step 1-2	 Login to the app and go to Promo actions navigator
	Given the user navigates to the 'Promotional actions' page

	#Step 3 Create a new promo with:
	When the user creates a Promo with customer Level '<CUSTLEV>' customerCode: '<CUSTOMER>' confirmLevel: '<CONFIRMATIONLEVEL>'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '' sellOutEnd: '' mechanics: '<MECHANICS>'
	And the user adds products with productLevel: 'Product' productCodes: '<PROD1>'
	And the user adds products with productLevel: 'Product' productCodes: '<PROD2>'
	And the user checks the 'Grid CheckBox' with value 'ALL - Selected'
	And the user enters '<QTYESTIMATED1>' on column name 'Estimated quantity' for product code 'ALL - Selected'
	#4 Move the Promo to  "Confirmed status"  but if it is not possible, move it in Authorization" status and then to "Confirmed" status.
	And the user changes the status to 'To be authorized'
	And the user changes the status to 'Confirm'
	#Once Promo is in confirmed status, check that: - QTYESTIMATED is in readonly (it cannot be modified). 
	And the user clicks on side panel 'Products'
	Then the user validates that column name 'Estimated quantity' for product code '<PRODUCT>' validation: 'is not' editable
	#Weights in Weekly split are readonly (they cannot be modified).
	When the user clicks on top panel 'Weekly Split'
	Then user validates that all weekly split cells are readonly for rowName: 'Weight' and column 'W1'
	And user validates that all weekly split cells are readonly for rowName: 'Weight' and column 'W2'
	#In the "Total" column, value related to the Qty Estimated at Family row level is 1000.
	And user validates that product code 'Family - 01 - ITALIAN WHITE (Default)' with row 'Estimated quantity' for column 'Total' is set to '1000.000'
	#5 Move the Promo to "Actual" status
	When the user changes the status to 'Actual'
	#Once Promo is in Actual status, check that: - QTYESTIMATED is editable (it can be modified).
	And the user clicks on side panel 'Products'
	When the user clicks on top panel 'Products'
	Then the user validates that column name 'Estimated quantity' for product code '<PROD1>' validation: 'is' editable
	And the user validates that column name 'Estimated quantity' for product code '<PROD2>' validation: 'is' editable
	#6 In the Product Grid, Select "All Selected" row and Enter a new value @QTYESTIMATED2 = 2000
	When the user checks the 'Grid CheckBox' with value 'ALL - Selected'
	And the user enters '<QTYESTIMATED2>' on column name 'Estimated quantity' for product code 'ALL - Selected'
	And the user moves the focus away from the element
	#7 Go to Weekly Split tab
	When the user clicks on top panel 'Weekly Split'
	#Weights in Weekly split are readonly (they cannot be modified). 
	Then user validates that all weekly split cells are readonly for rowName: 'Weight' and column 'W1'
	And user validates that all weekly split cells are readonly for rowName: 'Weight' and column 'W2'
	#In the "Total" column, value related to the Qty Estimated at Family row level is updated to 2000.
	And user validates that product code 'Family - 01 - ITALIAN WHITE (Default)' with row 'Estimated quantity' for column 'Total' is set to '2000.000'
	#8 Close promo w/o saving
	When the user closes all pages without saving the work done



Examples:
	| CUSTLEV | CUSTOMER | CONFIRMATIONLEVEL | MECHANICS | SELLINSTART    | SELLINEND      | DESCRIPTION                  | PROD1 | PROD2 | QTYESTIMATED1 | QTYESTIMATED2 |
	| Level 5 | EC86162  | Holder level      | TPR in %  | Next Monday +0 | Next Sunday +2 | Weekly Split After Copy Test | 001   | 002   | 1000          | 2000          |