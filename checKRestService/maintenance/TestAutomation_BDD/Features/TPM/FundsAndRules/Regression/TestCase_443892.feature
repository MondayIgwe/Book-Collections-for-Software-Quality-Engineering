Feature: TestCase_443892

@BDD_443892 @PROMO_Regression @FundsAndRules
Scenario: WEB_TPM_SP_ANOM_GL_CHECKSETVALIDATION_NOCONSTR_001
	#Step 1
	Given the user navigates to the 'Funds & Rules' page
	#Step 2 - Create a Confirmed F&R_01 having 
	When the user creates a new fund and rules with configuration ID: '<Configuration>' BRCustomerLevel: '<Level>' Description: '<DESCRIPTION>' sellInStart: '<FRSTART>' sellInEnd: '<FREND>' productGroup: '<CategoryA>,<CategoryB>' rateFundSource: ''
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '10' startDate: '' endDate: '' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode1'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#Step 3 - Create a  Confirmed F&R_02 having 
	When the user creates a new fund and rules with configuration ID: '<Configuration>' BRCustomerLevel: '<Level>' Description: '<DESCRIPTION>' sellInStart: '<FRSTART>' sellInEnd: '<FREND>' productGroup: '<CategoryA>,<CategoryC>' rateFundSource: ''
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '10' startDate: '' endDate: '' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode2'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#4. Create a Promo in Draft with
	And the user navigates to the 'Promotional actions' page
	And the user removes all promotions with description '<DESCRIPTION>' and customer '<CUSTOMERCODE>'
	When the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUSTOMERCODE>'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<P0_STARTSELLIN>' sellInEnd: '<P0_ENDSELLIN>' sellOutStart: '' sellOutEnd: '' mechanics: '<ACTIVITY_A>'
	And the user adds a product with productLevel: 'Product' productCodes: '<PROD1>'
	And the user adds a product with productLevel: 'Product' productCodes: '<PROD2>'
	And the user adds a product with productLevel: 'Product' productCodes: '<PROD3>'
	And the user clicks on the 'Save Button'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Alert Dialog Yes Button' if it exists
	#5 Go to the promo actions navigator.
	When the user clicks on the 'Refresh Button'
	#6. Open the created Promo in edit mode
	And the user opens the Grid Settings Menu option: 'Remove Filter'
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId'
	And the user clicks on 'Indexed Row Link' with value '1'
	When the user clicks on 'Button' with value 'Edit'
	#7 Go to the Workflow tab and Evaluate anomalies. @AnomalyMsg
	And the user clicks on side panel 'Workflow'
	And the user clicks on the 'ReEvaluate Anomalies Button'
	Then the user validates that the 'Text In Table Cell' with value '<AnomalyMsg>' is present
	#8 Make both funds injected in the promo.
	When the user clicks on side panel 'Products'
	And the user clicks on top panel 'Funds'
	And the user checks the 'Grid Row CheckBox' with value '#FundsRulesCode1#(1)-<DESCRIPTION>'
	And the user checks the 'Grid Row CheckBox' with value '#FundsRulesCode2#(1)-<DESCRIPTION>'
	#9 Go to the Workflow tab and Evaluate anomalies.
	And the user clicks on side panel 'Workflow'
	And the user clicks on the 'ReEvaluate Anomalies Button'
	#GL_CHECKSETVALIDATION_NOCONSTR anomaly is no longer displayed.
	When the user filters the column by column name 'Business rule/Fund', Filter Type 'Like', Value 'Sales Fund'
	And the user filters the column by column name 'Description', Filter Type 'Like', Value '<AnomalyMsg>'
	Then the user validates that the 'Text In Table Cell' with value '<AnomalyMsg>' is not present
	#10 Close w/o saving
	When the user closes all pages without saving the work done
	

Examples:
	| Configuration          | Level   | FRSTART   | FREND      | CategoryA    | CategoryB    | CategoryC | CUSTLEV | CUSTOMERCODE | CUSTOMER                 | DESCRIPTION                     | P0_STARTSELLIN | P0_ENDSELLIN | ACTIVITY_A | PROD1 | PROD2 | PROD3 | AnomalyMsg                             | MandatoyFund   |
	| Sales Fund (Mandatory) | Level 5 | d+1/m+2/y | d+25/m+2/y | ITALIAN WINE | FOREIGN WINE | CRACKERS  | Level 3 | EC86212      | EC86212 - FINI (Level 3) | Two Business Rules are injected | d+5/m+2/y      | d+20/m+2/y   | Leaflet    | 004   | 046   | 136   | No constraints selected for validation | Mandatory Fund |