Feature: TestCase_291091

@BDD_291091 @PROMO_Regression @PromoActions @PROMO_Smoke
Scenario: TPM_SP_W_SMOKE_R80V1_0004 - Change Sellin Date
	# Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#Precondition
	When the user creates a Promo with customerHLevel: 'Level 2' customerCode: 'EC94440'
	And the user populates the cockpit with description: 'TPM_SP_W_SMOKE_R80V1_0004' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: 'TPR in %'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#1 Open a promo  in draft from the navigator and switch to edit mode
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	#2 change the sellin date (one week in past and one week in the future related to today)
	And the user clicks on side panel 'Cockpit'
	And the user selects validity period from: 'd-7/m/y' to: 'd+7/m/y' on the 'Validity Period Start Date' field
	#3 go to ship to - end date have to be changed according
	And the user clicks on side panel 'General info'
	And the user clicks on top panel 'Header info'
	And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode'
	And the user clicks on side panel 'Participants'
	And the user clicks on top panel 'Ship-To'
	#Then the user validates that column 'End Date' has 'd+7/m/y' with row text 'ActionCode'
	Then the user validates that column 'End Date' has 'd+7/m/y' with row number '1'

Examples:
	| description                          | participant |
	| (modified) TPM_SP_W_SMOKE_R80V1_0003 | Customer    |