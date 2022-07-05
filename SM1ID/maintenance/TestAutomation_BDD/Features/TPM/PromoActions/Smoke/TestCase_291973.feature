Feature: TestCase_291973

@BDD_291973 @PROMO_Regression @PromoActions @PROMO_Smoke
Scenario: TPM_SP_W_SMOKE_R80V1_0010 - Remove a Promo
    Given the user navigates to the 'Promotional actions' page
    #precondition - create a promo in draft
    When the user creates a Promo with customerHLevel: 'Level 2' customerCode: 'EC94440'
	And the user populates the cockpit with description: 'TPM_SP_W_SMOKE_R80V1_0003' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: 'TPR in %'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
   #1 open promo navigator and select a promo in draft
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId'
	And the user clicks on 'Grid CheckBox' with value 'ActionId'
	#2 delete the promo
	And the user clicks on the 'Remove Button'
	When the user clicks on the 'Alert Dialog Ok Button'
	#the promo is deleted form the navigator
	Then the user validates that the 'Grid CheckBox' with value 'ActionId' is not present
	#3 delete a promo in confirmed
	When the user opens the Grid Settings Menu option: 'Remove Filter'
	And the user filters the column by column name 'Action code', Filter Type 'Like', Value '<confirmed>'
	And the user clicks on 'Grid Checkbox' with value '<confirmed>'
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
	Then the user validates that the 'Alert Dialog Message Box' is visible


	Examples:
		| confirmed                      |
		| 00000TPM_AUTOM2190917133207788 |