Feature: TestCase_463818

@BDD_463818 @PROMO_Regression @PromoActions
Scenario: WEB_TPM_SP_PRODUCTGRID_REMOVE_SINGLEDISPLAY_001
	#Step 1	 Login to the app and go to Promo actions navigator
	Given the user navigates to the 'Promotional actions' page

	#Step 2 Create a new promo with:
	When the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUSTOMER>'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '' sellOutEnd: '' mechanics: '<MECHANICS>'
	And the user clicks on side panel 'Products'
	And the user adds a product with productLevel: '<PRODUCTLEVEL>' productCodes: '<D001>'
	And the user adds a product with productLevel: '<PRODUCTLEVEL>' productCodes: '<D002>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	
	#Step 3 Open in Edit mode the promo
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId1'
	And the user clicks on link on column 'Action Code' with row text 'ActionId1'
	And the user clicks on 'Button' with value 'Edit'

	#Step 4 In the Product Grid, Remove the following aggregated rows: @D001
	And the user clicks on side panel 'Products'
	Then the user validates that the 'Grid CheckBox Containing' with value '<D001>' is present
	And the user validates that the 'Grid CheckBox Containing' with value '<D002>' is present
	When the user clicks on 'Grid CheckBox Containing' with value '<D001>'
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
	Then the user validates that the 'Grid CheckBox' with value '<D001>' is not present
	And the user validates that the 'Grid CheckBox' with value '054' is not present
	And the user validates that the 'Grid CheckBox' with value '065' is not present
	And the user validates that the 'Grid CheckBox' with value '070' is not present
	And the user validates that the 'Grid CheckBox' with value 'A001' is not present
	And the user validates that the 'Grid CheckBox Containing' with value '<D002>' is present
	And the user validates that the 'Grid CheckBox Containing' with value '023' is present
	And the user validates that the 'Grid CheckBox Containing' with value '026' is present
	And the user validates that the 'Grid CheckBox Containing' with value '029' is present
	And the user validates that the 'Grid CheckBox Containing' with value '006' is present

Examples:
	| CUSTLEV | CUSTOMER | MECHANICS   | SELLINSTART | SELLINEND | PRODUCTLEVEL | DESCRIPTION                  | D001 | D002 |
	| Level 5 | EC86162  | TPR in % | d+1/m/y     | d+15/m/y  | Display      | Remove display from products | D001 | D002 |