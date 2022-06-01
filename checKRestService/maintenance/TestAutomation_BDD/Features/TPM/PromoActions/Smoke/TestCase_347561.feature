Feature: TestCase_347561

@BDD_347561 @PROMO_Regression @PromoActions @PROMO_Smoke
Scenario: TPM_SP_W_SMOKE_R80V1_0017 - Create new What-If Scenario in Draft Promo
	#1 Go to "Promo Action" navigator for @DIVISION
	Given the user has logged in with division '<DIVISION>'
	And the user navigates to the 'Promotional actions' page
	#Step 2 - Open Promo Actions menu and click on "New" button and create the following promotion
	When the user creates a Promo with customerHLevel: '<COVERAGE>' customerCode: '<CUST>'
	And the user populates the cockpit with description: '<PROMODESC>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<MECH>'
	And the user adds a product with productLevel: 'Product' productCodes: '<PRODCODE>'
	And the user clicks on the 'Save Button'
	#edit EstimatedQty and SellloutPromoPrize for the native what if scenarion
	And the user enters '<QTYESTIMATED>' on column name 'Estimated quantity' for product code '<PRODCODE>'
	#3 Save the promotion
	And the user clicks on the 'Save Button'
	#4 Click on "Promotional What-If" button in the toolbar
	And the user clicks on the 'Promo What If Button'
	Then the user validates that the 'Popup' with value 'Promotional What If' is present
	And the user validates the 'Promo Create WhatIf Button' is enabled
	And the user validates that the 'Element by SM1Id' with value 'ACTION_LOAD_SHOT' is disabled
	And the user validates the 'Promo Confirm WhatIf Button' is disabled
	And the user validates that the count for 'Popup Grid Rows' with value 'Promotional What If' is '1'
	And the user validates that popup 'Promotional What If' column 'What-If Description' has 'NATIVE' with row text 'What-If Description'
	And the user validates that all popup 'Promotional What If' checkboxes for column 'Conf' are 'checked'
	#5 Click on "Create What-If" option
	When the user clicks on the 'Promo Create WhatIf Button'
	#6 Enter a name "Version1" @whatIfName
	And the user enters '<whatIfName>' in the 'Promo Create WhatIf Text'
	#7 Click on "OK"
	And the user clicks on 'Popup OK Button' with value 'Create What If'
	Then the user validates that the 'Popup' with value 'Promotional What If' is not present
	#8 Click on "Promotional What-If" button in the toolbar
	When the user clicks on the 'Promo What If Button'
	Then the user validates that the count for 'Popup Grid Rows' with value 'Promotional What If' is '2'
	And the user validates that 'Grid CheckBox' with value '<whatIfName>' is marked as: 'checked'
	And the user validates that 'Grid CheckBox' with value 'NATIVE' is marked as: 'not checked'
	#9 Click on Cancel
	#When the user clicks on 'Popup Cancel Button' with value 'Create What If'
	When the user clicks on 'Popup Cancel Button' with value 'Promotional What If'
	Then the user validates that the 'Popup' with value 'Promotional What If' is not present
	#10 Change some measures (e.g. set a different @QTYESTIMATED )
	When the user enters '123' on column name 'Estimated quantity' for product code '<PRODCODE>'
	#11 Save the promo. 
	And the user clicks on the 'Save Button'
	#12 Click on "Promotional What-If" button in the toolbar
	#13 Load NATIVE version
	And the user changes the Promo What If with description 'NATIVE'
	Then the user validates text '<QTYESTIMATED>' on column name 'Estimated quantity' for product code '<PRODCODE>'
	When the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'


Examples:
	| DIVISION                                 | DIVISION2 | CUST    | CONFLEV      | COVERAGE | PROMODESC                 | SELLINSTART | SELLINEND | SELLOUTSTART | SELLOUTEND | MECH    | PRODCODE | QTYESTIMATED | QTYESTIMATED2 | whatIfName |
	| XTEL TPM AUTOMATION - Global Group SM1V4 | AUTOM2    | EC94011 | Holder level | Level 2  | TPM_SP_W_SMOKE_R80V1_0017 | d+5/m/y     | d+15/m/y  | d+5/m/y      | d+15/m/y   | Leaflet | 033      | 100          | 200           | Version1   |