Feature: TestCase_538166

@BDD_538166 @PROMO_Regression @PromoActions @PromoActions
Scenario: WEB_TPM_SP_PROMOACTION_SCENARIO_ASSIGNMENT_POPUP_RULES_US472700_AC2_OFF_006

    #Step 1 Login to the app @DIVISION
	Given the user has logged in with division '<DIVISION>'

	#2 Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page

	#Step 3 Save and close the promo
	When the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUST>'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user populates the cockpit with description: '<DESCRPROMO>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '' sellOutEnd: '' mechanics: '<MECHANICS>'
	And the user adds a product with productLevel: 'Product' productCodes: '<PRODS>,<PRODS1>'
	#Check that @BUTTON1 exists and it is not clickable (active)
	Then the user validates that the 'Button Link' with value '<BUTTON1>' is disabled
	#Then the user validates that element: 'Button Link' with value: '<BUTTON1>' and attribute: 'aria-pressed' is in state: 'false'

	#Step 4 Save Promo
	When the user clicks on the 'Save Button'
	#Check that @BUTTON1 exists and it is clickable (active)
	Then the user validates that element: 'Button Link' with value: '<BUTTON1>' and attribute: 'aria-pressed' is in state: 'true'
	
	#Step 5 Close the promo
	When the user clicks on the 'Close Tab'
	

Examples:
	| DIVISION                                 | CUST    | CONFIRMATIONLEVHOLDER | CUSTLEV | SELLINSTART | SELLINEND | DESCRPROMO          | PRODS | PRODS1 | MECHANICS | BUTTON1            |
	| XTEL TPM AUTOMATION - Global Group SM1V4 | EC94763 | Holder level          | Level 3 | d/m/y       | d+10/m/y  | POPUP PROMO AC2_006 | 001   | 002    | TPR in %  | PromoPlan Scenario |