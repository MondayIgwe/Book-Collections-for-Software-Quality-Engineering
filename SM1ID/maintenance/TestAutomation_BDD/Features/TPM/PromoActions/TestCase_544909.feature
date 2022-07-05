Feature: TestCase_641912

@BDD_641912 @PROMO_Regression @PromoActions @PromoActions
Scenario: WEB_TPM_SP_PROMOACTION_REWORK_OF_AUTOMATIC_ASSOCIATION_DEPENDING_ON_PARAMS_SETTINGS_US548225_AC2_012_OFF

    #Step 1 Login to the app @DIVISION
	Given the user has logged in with division '<DIVISION>'
	#2 Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page

	#Step 3 Save and close the promo
	When the user creates a Promo with customerHLevel: '<COVERAGE>' customerCode: '<CONTRACTOR>'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELL_IN_START>' sellInEnd: '<SELL_IN_END>' sellOutStart: '<SELL_OUT_START>' sellOutEnd: '<SELL_OUT_END>' mechanics: '<MECH1>'
	And the user adds a product with productLevel: 'Product' productCodes: '<PROD1>'
	#Then the user validates that "Promo Plan Scenarios" button is shown
	Then the user validates that the 'PromoPlan Scenario Button' is visible
	When the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	#Step 4 Reopen the recently created promo
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId'
	And the user clicks on link on column 'Generated Action Code' with row text 'ActionId'
	#Then the user validates that "Promo Plan Scenarios" button is shown
	Then the user validates that the 'PromoPlan Scenario Button' is visible

	#Step 5 Close the promo
	When the user clicks on the 'Close Tab'
	

Examples:
	| DIVISION                                 | CONTRACTOR | CONFIRMATION_LEVEL | COVERAGE | SELL_IN_START | SELL_IN_END | DESCRIPTION         | SELL_OUT_START | SELL_OUT_END | PROD1 | MECH1       |
	| XTEL TPM AUTOMATION - Global Group SM1V4 | EC93906    | Holder level       | Level 3  | d+30/m/y      | d+40/m/y    | US548225_AC1_002_ON | d+30/m/y       | d+40/m/y     | 079   | TPR in Rate " |