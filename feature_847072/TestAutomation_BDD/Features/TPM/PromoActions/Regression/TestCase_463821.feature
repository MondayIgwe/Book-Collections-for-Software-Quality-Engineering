Feature: TestCase_463821

@BDD_463821 @PROMO_Regression @PromoActions
Scenario: WEB_TPM_SP_PRODUCTGRID_REMOVE_SINGLEGROUP_001
	#Go to "Promo Action" navigator
	#Step 1
	Given the user navigates to the 'Promotional actions' page

	#Step 2
	When the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUSTOMER>'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '' sellOutEnd: '' mechanics: '<MECHANICS>'
	And the user clicks on side panel 'Products'
	And the user adds a product with productLevel: '<PRODUCTLEVEL>' productCodes: '<REF1>'
	And the user adds a product with productLevel: '<PRODUCTLEVEL>' productCodes: '<REF2>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	
	#Step 3 Open in Edit mode the promo just created
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId1'
	And the user clicks on link on column 'Action Code' with row text 'ActionId1'
	And the user clicks on 'Button' with value 'Edit'

	#Step 4 In the Product Grid,Remove the following aggregated rows:@REF1
	And the user clicks on side panel 'Products'
	Then the user validates that the 'Grid CheckBox Containing' with value '<PRODCODE1>' is present
	And the user validates that the 'Grid CheckBox Containing' with value '<PRODCODE2>' is present
	When the user clicks on 'Grid CheckBox Containing' with value '<REF1>'
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
	Then the user validates that the 'Grid CheckBox' with value '<REF1>' is not present
	And the user validates that the 'Grid CheckBox Containing' with value '<PRODCODE1>' is not present
	And the user validates that the 'Grid CheckBox Containing' with value '<PRODCODE2>' is not present
	And the user validates that the 'Grid CheckBox Containing' with value '<REF2>' is present
	 And the user validates that the 'Grid CheckBox Containing' with value '<PRODCODE3>' is present

Examples:
	| CUSTLEV | CUSTOMER | MECHANICS     | SELLINSTART | SELLINEND | PRODUCTLEVEL | DESCRIPTION                        | REF1  | REF2  | PRODCODE1 | PRODCODE2 | PRODCODE3 |
	| Level 5 | EC86162  | TPR in Rate " | d+1/m/y     | d+15/m/y  | Reference    | Remove reference from product grid | 00201 | 00202 | 004       | 005       | 006       |
