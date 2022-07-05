Feature: TestCase_291097

@BDD_291097 @PROMO_Nightly @PromoActions
Scenario: TPM_SP_W_SMOKE_R80V1_0005 - Copy Promo
	#Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	# 1select promo already created from the navigator and create a copy @description
	When the user creates a Promo with customerHLevel: 'Level 2' customerCode: 'EC94440'
	And the user populates the cockpit with description: '<description>' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: 'TPR in %'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user clicks on the 'Save Button'
	And the user clicks on side panel 'General info'
	And the user clicks on top panel 'Header info'
	And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'SourceActionCode'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId'
	And the user clicks on 'Grid CheckBox' with value 'ActionId'
	And the user clicks on 'Button Link' with value 'Copy action'
	And the user clicks on 'Popup Button' with value 'OK'
	#Check the following info are copied: - Customer - Coverage - Holder Level - Sell-in / Sell-out
	Then the user validates that 'Input By Label Name' with value 'Customer holder' contains text 'EC94440'
	And the user validates that 'Input By Label Name' with value 'Confirmation level' has text 'Holder level'
	And the user validates that 'Start Date' with value 'Sell in' has text 'd/m/y'
	And the user validates that 'End Date' with value 'Sell in' has text 'd+15/m/y'
	And the user validates that 'Start Date' with value 'Sell out' has text 'd+1/m/y'
	And the user validates that 'End Date' with value 'Sell out' has text 'd+16/m/y'
	#2 save it
	When the user clicks on the 'Save Button'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'CopyActionId'
	#in the Promo actions navigator, the field Source ID action is populated with the source promo. 
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'CopyActionId'
	Then the user validates that column 'Source ID Action' has 'SourceActionCode' with row text 'CopyActionId'
	When the user opens the grid item in row '1' 
	Then the user validates that the 'Input By Label Name' with value 'Action Id' is present

Examples:
	| description               |
	| TPM_SP_W_SMOKE_R80V1_0005 |