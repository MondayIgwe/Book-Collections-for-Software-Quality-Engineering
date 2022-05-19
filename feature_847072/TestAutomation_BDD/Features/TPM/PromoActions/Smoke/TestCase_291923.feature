Feature: TestCase_291923

@BDD_291923 @PROMO_Regression @PromoActions @PROMO_Smoke
Scenario: TPM_SP_W_SMOKE_R80V1_0007 - Change Promo State
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
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	#2 Go on Workflow tab and change the status to "In Authorization" and then to "Confirmed"
	And the user clicks on side panel 'Cockpit'
	And the user changes the status to '<status3>'
	And the user changes the status to '<status1>'
	#- verify that state of the promo is changed to confirmed
	Then the user validates that 'Home Toolbar Label' text contains '<status1>'
	#- verify that is not possible to change mechanics
	When the user clicks on side panel 'General info'
	Then the user validates that the 'Grid CheckBox' with value 'TPR in %' is disabled
	And the user validates that the 'Grid CheckBox' with value 'Leaflet' is disabled
	And the user validates that the 'Grid CheckBox' with value 'Def. Cut Price in %' is disabled
	And the user validates that the 'Grid CheckBox' with value 'Hostess' is disabled
	#- is not possible to change measures (quantity estimated) at ALL Selected row and at Single product row
	When the user clicks on side panel 'Products'
	Then the user validates that the column 'Estimated quantity' is not editable
	#- is not possible to add new products
	And the user validates the 'Product Add Button' is disabled
	#3 Go again on Workflow tab and change the status to Cancelled
	When the user clicks on side panel 'Workflow'
	And the user changes the status to '<status2>'
	#- verify that state of the promo is changed to cancelled
	Then the user validates that 'Home Toolbar Label' text contains '<status2>'

Examples:
	| status1 | status2   | status3          | products1 | products2 | products3 | fund                      |
	| Confirm | Cancelled | To be authorized | 051       | 056       | 059       | 871(1)-Automation Fund 01 |
