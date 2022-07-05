Feature: TestCase_339953

@BDD_339953 @PROMO_Regression @FundsAndRules @PROMO_Smoke
Scenario: TPM_FR_W_SMOKE_R81V1_0011 - F&R Change WF status
	#Step 1 - Go to "Fund & Rules" navigator
	Given the user navigates to the 'Funds & Rules' page
	#2 Create new Fund and Rule @FUND_1
	#fund 1
	When the user creates a new fund and rules with configuration ID: '<ConfigurationID>' BRCustomerLevel: '<Customer_Level>' Description: '<Description1>' sellInStart: '<Start_Date1>' sellInEnd: '<End_Date1>' productGroup: '' rateFundSource: ''
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<Fund_Value>' startDate: '' endDate: '' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user clicks on the 'Save Button'
	# 4 Move to Confirmed
	And the user changes the status to '<TRANSITION>'
	Then the user validates that 'Input By Label Name' with value 'Status' has text '<STATUS>'
	#5 Move back to Draft
	When the user changes the status to '<TRANSITION2>'
	Then the user validates that 'Input By Label Name' with value 'Status' has text '<STATUS2>'
	#6 Move back to Terminated
	When the user changes the status to '<TRANSITION3>'
	Then the user validates that 'Input By Label Name' with value 'Status' has text '<STATUS3>'
	#7 Close @FUND_1
	When the user clicks on the 'Close Tab'
	#8 Create new Fund and Rule @FUND_2 without any constraints
	When the user creates a new fund and rules with configuration ID: '<ConfigurationID>' BRCustomerLevel: '<Customer_Level>' Description: '<Description1>' sellInStart: '<Start_Date1>' sellInEnd: '<End_Date1>' productGroup: '' rateFundSource: ''
	#9 Save the newly created Fund Rule @FUND_2 (draft status)
	And the user clicks on the 'Save Button'
	#10 Try to move it to Confirmed
	And the user changes the status to '<TRANSITION>'
	Then the user validates that 'Input By Label Name' with value 'Status feedback' has text 'Guide line cannot be confirmed due to missing constraints'
	When the user clicks on 'Popup Cancel Button' with value 'Change Status'
	#11 Try to move it to Terminated
	And the user changes the status to '<TRANSITION3>'
	Then the user validates that 'Input By Label Name' with value 'Status feedback' has text 'Guide line cannot be confirmed due to missing constraints'
	When the user clicks on 'Popup Cancel Button' with value 'Change Status'
	#12 Add at least a valid Constraint to the Fund
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<Fund_Value>' startDate: '' endDate: '' familyConstraints: ''
	#13 Move to Confirmed
	And the user clicks on side panel 'Summary'
	And the user changes the status to '<TRANSITION>'
	Then the user validates that 'Input By Label Name' with value 'Status' has text '<STATUS>'
	#14 In the Summary page, Edit @FUND_2 description
	When the user clicks on side panel 'Summary'
	And the user enters 'New Description' in field 'Input By Label Name' with value 'Description'
	#15 Save and Close it
	And the user clicks on the 'Save Button'
	And the user clicks on side panel 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode1'
	And the user clicks on the 'Close Tab'
	#16 Refresh "Fund&Rules" navigator
	And the user clicks on the 'Refresh Button'
	When the user filters the column by column name 'Funds & Rules code', Filter Type 'Like', Value 'FundsRulesCode1'
	Then the user validates that column 'Funds & Rules' has 'New Description' with row text 'FundsRulesCode1'

Examples:
	| ConfigurationID      | Start_Date1 | End_Date1 | Customer_Level | Description1              | Fund_Value | Start_Date2 | End_Date2 | Description2                | STATUS    | STATUS2 | STATUS3    | TRANSITION | TRANSITION2 | TRANSITION3 |
	| 631 - Marketing Fund | d/m/y       | d+10/m/y  | 2              | TPM_FR_W_SMOKE_R81V1_0011 | 100        | d+11/m/y    | d+21/m/y  | TPM_SP_W_SMOKE_R80V1_0012_2 | Confirmed | Draft   | Terminated | Confirm    | Modified    | Terminated  |
