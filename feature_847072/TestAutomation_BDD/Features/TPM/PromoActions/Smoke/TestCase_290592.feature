Feature: TestCase_290592

@BDD_290592 @PROMO_Regression @PromoActions @PROMO_Smoke
Scenario: TPM_SP_W_SMOKE_R80V1_0003 - Switch in Edit a Promo in Draft
	# Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#Precondition
	When the user creates a Promo with customerHLevel: 'Level 2' customerCode: 'EC94440'
	And the user populates the cockpit with description: 'TPM_SP_W_SMOKE_R80V1_0003' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: 'TPR in %'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#1 Select a promotion in draft from the navigator and open it
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId'
	And the user opens the grid item in row '1'
	#2 Switch in Edit
	And the user clicks on 'Button' with value 'Edit'
	#3 modify the @description of the promo
	And the user clicks on side panel 'Cockpit'
	And the user enters '<description>' in field 'Input By Label Name' with value 'Description'
	Then the user validates that 'Input By Label Name' with value 'Description' has text '<description>'
	#4 modify the @participant level to "Customer"
	When the user clicks on side panel 'Participants'
	And the user clicks on top panel 'Participants'
	And the user retrieves count of 'Grid With Unique Column Rows' with value 'Customer description' and saves it as 'ParticipantsTabRowCount'
	And the user clicks on top panel 'Ship-To'
	And the user retrieves count of 'Grid With Unique Column Rows' with value 'Ship-to code' and saves it as 'ShipToTabRowCount'
	Then the user validates that the value 'ParticipantsTabRowCount' is equal to 'ShipToTabRowCount'

Examples:
	| description                          | participant |
	| (modified) TPM_SP_W_SMOKE_R80V1_0003 | Customer    |