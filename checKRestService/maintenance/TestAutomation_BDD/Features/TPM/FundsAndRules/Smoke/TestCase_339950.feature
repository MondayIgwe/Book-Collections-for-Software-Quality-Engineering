Feature: TestCase_339950

@BDD_339950 @PROMO_Regression @FundsAndRules @PROMO_Smoke
Scenario: TPM_FR_W_SMOKE_R81V1_0010 - Remove F&R
	#precondition
	Given the user navigates to the 'Funds & Rules' page
	#1
	#2 Create a F&R in draft
	When the user creates a new fund and rules with configuration ID: '<CONFIGURATION_ID>' BRCustomerLevel: '<CUSTOMER_LEVEL>' Description: '<DESCRIPTION_1>' sellInStart: '<SELL_IN>' sellInEnd: '<SELLIN_END>' productGroup: '' rateFundSource: ''
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<FUND_VALUE>' startDate: '' endDate: '' familyConstraints: ''
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#3 Select and delete  the @DESCRIPTION_1
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Funds & Rules', Filter Type 'Like', Value '<DESCRIPTION_1>'
	And the user clicks on 'Grid CheckBox' with value '<DESCRIPTION_1>'
	And the user clicks on the 'Remove Button'
	When the user clicks on the 'Alert Dialog Ok Button'
	#4 confirm DESCRIPTION_1 is deleted
	Then the user validates that the 'Grid CheckBox' with value 'DESCRIPTION_1' is not present
	#5 Create a F&R in draft
	When the user opens the Grid Settings Menu option: 'Remove Filter'
	And the user creates a new fund and rules with configuration ID: '<CONFIGURATION_ID>' BRCustomerLevel: '<CUSTOMER_LEVEL>' Description: '<DESCRIPTION_2>' sellInStart: '<SELL_IN>' sellInEnd: '<SELLIN_END>' productGroup: '' rateFundSource: ''
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<FUND_VALUE>' startDate: '' endDate: '' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#6 Select and delete  the @DESCRIPTION_2
	When the user opens the Grid Settings Menu option: 'Remove Filter'
	And the user filters the column by column name 'Funds & Rules', Filter Type 'Like', Value '<DESCRIPTION_2>'
	And the user clicks on 'Grid CheckBox' with value '<DESCRIPTION_2>'
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
	Then the user validates that the 'Alert Dialog Message Box' is visible
	When the user clicks on the 'Alert Dialog Ok Button'
	#7 Create a F&R in draft
	When the user opens the Grid Settings Menu option: 'Remove Filter'
	And the user creates a new fund and rules with configuration ID: '<CONFIGURATION_ID>' BRCustomerLevel: '<CUSTOMER_LEVEL>' Description: '<DESCRIPTION_3>' sellInStart: '<SELL_IN_3>' sellInEnd: '<SELLIN_END_3>' productGroup: '' rateFundSource: ''
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<FUND_VALUE>' startDate: '' endDate: '' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user changes the status to 'Terminated'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	#8 Select and delete  the @DESCRIPTION_3
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Funds & Rules', Filter Type 'Like', Value '<DESCRIPTION_3>'
	And the user clicks on 'Grid CheckBox' with value '<DESCRIPTION_3>'
	And the user clicks on the 'Remove Button'

	#9 Cancel the delete
	And the user clicks on the 'Alert Dialog Cancel Button'
	

	Examples:
		| CONFIGURATION_ID | SELL_IN | SELLIN_END | DESCRIPTION_1 | CUSTOMER_LEVEL | FUND_VALUE | DESCRIPTION_2 | STATUS  | SELL_IN_3 | SELLIN_END_3 | DESCRIPTION_3 | STATUS2    |
		| 632              | d/m/y   | d+1/m/y    | FUND_1        | 5 - Level 5    | 1000       | FUND_2        | CONFIRM | d+1/m+1/y | d+1/m+1/y    | FUND_3        | Terminated |