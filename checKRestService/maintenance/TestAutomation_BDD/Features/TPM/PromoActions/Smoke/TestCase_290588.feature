Feature: TestCase_290588

@BDD_290588 @PROMO_Regression @PromoActions @PROMO_Smoke
Scenario: TPM_SP_W_SMOKE_R80V1_0002 - Open Promo in Draft
	# Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#Precondition
	When the user creates a Promo with customerHLevel: 'Level 2' customerCode: 'EC94440'
	And the user populates the cockpit with description: 'TPM_SP_W_SMOKE_R80V1_0007' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: 'TPR in %'
	And the user adds products with productLevel: 'Product' productCodes: '<products1>'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#1 Select a promotion in draft from the navigator and open it
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId'
	And the user retrieves text from column 'Action Id' with unique row text 'Action Id' and saves it as 'ActionId1'
	And the user retrieves text from column 'Sell-in start' with unique row text '<SellinStart>' and saves it as 'SellinStart1'
	And the user retrieves text from column 'Sell-in end' with unique row text '<SellinEnd>' and saves it as 'SellinEnd1'
	And the user retrieves text from column 'Status' with unique row text '<Status>' and saves it as 'Status1'
	And the user retrieves text from column 'Description' with unique row text '<Description>' and saves it as 'Description1'
	
	And the user opens the grid item in row '1'
	Then the user validates that the Loading Mask is not present
	Then the user validates that 'Input By Label Name' with value 'Action Id' has text 'ActionId1'
	Then the user validates that 'Input By Label Name' with value 'Description' has text 'Description1'
	Then the user validates that 'Start Date' with value 'Sell in' has text 'SellinStart1'
	Then the user validates that 'End Date' with value 'Sell in' has text 'SellinEnd1'
	Then the user validates that 'Input By Label Name' with value 'Status' has text 'Status1'
	



	Examples:
		| products1 | Description               | SellinStart | SellinEND | Status | CUST    |
		| 051       | TPM_SP_W_SMOKE_R80V1_0007 | d/m/y       | d+15/m/y  | Draft  | EC94440 |