Feature: TestCase_344836

@BDD_344836 @PROMO_Regression @FundsAndRules @PROMO_Smoke
Scenario: TPM_SP_W_SMOKE_R80V1_0012 - Mass WF Change (Fund & Rules)
	#Step 1 - Go to "Fund & Rules" Navigator @DIVISION
	Given the user navigates to the 'Funds & Rules' page
	#2 Create a 2 Funds&Rules with:
	#fund 1
	When the user creates a new fund and rules with configuration ID: '<ConfigurationID>' BRCustomerLevel: '<Customer_Level>' Description: '<Description1>' sellInStart: '<Start_Date1>' sellInEnd: '<End_Date1>' productGroup: '' rateFundSource: ''
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<Fund_Value>' startDate: '' endDate: '' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode1'
	And the user changes the status to 'Terminated'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#fund 2
	When the user creates a new fund and rules with configuration ID: '<ConfigurationID>' BRCustomerLevel: '<Customer_Level>' Description: '<Description1>' sellInStart: '<Start_Date2>' sellInEnd: '<End_Date2>' productGroup: '' rateFundSource: ''
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<Fund_Value>' startDate: '' endDate: '' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode2'
	And the user changes the status to 'Terminated'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#3 Select some F&R having status "Terminated" and click on "Mass WF Change" @Description and @Description2
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Funds & Rules', Filter Type 'Like', Value '<Description1>'
	And the user checks the 'Grid CheckBox' with value 'FundsRulesCode1'
	And the user checks the 'Grid CheckBox' with value 'FundsRulesCode2'
	And the user clicks on 'Button' with value 'Mass workflow change'
	And the user select value containing '<statuses1>' from dropdown list 'Desired Transition'
	And the user select value containing '<statuses2>' from dropdown list 'Desired Transition'
	And the user select value containing '<statuses3>' from dropdown list 'Desired Transition'
	Then the user validates that the 'Text In Table Cell' with value 'FundsRulesCode1' is present
	And the user validates that the 'Text In Table Cell' with value 'FundsRulesCode2' is present
	#4 Set "Desired Transition" = "Draft"
	When the user select value containing '<statuses1>' from dropdown list 'Desired Transition'
	And the user clicks on 'Button' with value 'Start'
	Then the user validates that column 'Process Status' has '<procStatuses>' with row text 'FundsRulesCode1'
	And the user validates that column 'Process Status' has '<procStatuses>' with row text 'FundsRulesCode2'
	And the user validates that column 'Process Status Description' has '<procStatusesDesc1>' with row text 'FundsRulesCode1'
	And the user validates that column 'Process Status Description' has '<procStatusesDesc1>' with row text 'FundsRulesCode2'
	#6 Close the Mass WF Change UI
	When the user clicks on the 'Close Tab'
	#7 Create a 2 Funds&Rules with:
	When the user creates a new fund and rules with configuration ID: '<ConfigurationID>' BRCustomerLevel: '<Customer_Level>' Description: '<Description3>' sellInStart: '<Start_Date2>' sellInEnd: '<End_Date2>' productGroup: '' rateFundSource: ''
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<Fund_Value>' startDate: '' endDate: '' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode3'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#fund 2
	When the user creates a new fund and rules with configuration ID: '<ConfigurationID>' BRCustomerLevel: '<Customer_Level>' Description: '<Description3>' sellInStart: '<Start_Date1>' sellInEnd: '<End_Date1>' productGroup: '' rateFundSource: ''
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<Fund_Value>' startDate: '' endDate: '' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode4'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#8 Select some F&R having status "Draft" and click on "Mass WF Change"
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Funds & Rules', Filter Type 'Like', Value '<Description3>'
	And the user checks the 'Grid CheckBox' with value 'FundsRulesCode3'
	And the user checks the 'Grid CheckBox' with value 'FundsRulesCode4'
	And the user clicks on 'Button' with value 'Mass workflow change'
	#9 Set "Desired Transition" = "Draft"
	And the user select value containing '<statuses1>' from dropdown list 'Desired Transition'
	And the user clicks on 'Button' with value 'Start'
	Then the user validates that column 'Process Status' has '<procStatuses>' with row text 'FundsRulesCode3'
	And the user validates that column 'Process Status' has '<procStatuses>' with row text 'FundsRulesCode4'
	And the user validates that column 'Process Status Description' has '<procStatusesDesc2>' with row text 'FundsRulesCode3'
	And the user validates that column 'Process Status Description' has '<procStatusesDesc2>' with row text 'FundsRulesCode4'
	#Close the Mass WF Change UI
	When the user clicks on the 'Close Tab'
	#12 Select some F&R having status "Draft" (without anomalies, having some injectedFunds/Business Rules) and click on "Mass WF Change"
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Funds & Rules', Filter Type 'Like', Value '<Description3>'
	And the user checks the 'Grid CheckBox' with value 'FundsRulesCode3'
	And the user checks the 'Grid CheckBox' with value 'FundsRulesCode4'
	And the user clicks on 'Button' with value 'Mass workflow change'
	#13 Deselect some of them and set "Desired Transition" = "Confirmed" (@Description4)
	And the user unchecks the 'Grid CheckBox' with value 'FundsRulesCode3'
	And the user select value containing '<statuses2>' from dropdown list 'Desired Transition'
	#14 Click on "Start"
	And the user clicks on 'Button' with value 'Start'
	Then the user validates that column 'Process Status' has '<procStatuses2>' with row text 'FundsRulesCode4'
	And the user validates that column 'Process Status Description' has '<procStatusesDesc3>' with row text 'FundsRulesCode4'
	And the user validates that column 'Result State' has 'Confirmed' with row text 'FundsRulesCode4'
	#15 Close the Mass WF Change UI
	When the user clicks on the 'Close Tab'
	#16 Refresh the navigator
	And the user clicks on the 'Refresh Button'
	Then the user validates that column 'Status' has 'Draft' with row text 'FundsRulesCode3'
	Then the user validates that column 'Status' has 'Confirmed' with row text 'FundsRulesCode4'

Examples:
	| DIVISION | ConfigurationID      | Start_Date1 | End_Date1 | Customer_Level | Description1                | Fund_Value | Start_Date2 | End_Date2 | Description2                | Description               | statuses1 | statuses2     | statuses3      | procStatuses | procStatuses2    | procStatusesDesc1 | procStatusesDesc2     | procStatusesDesc3 | Description3                | Description4                |
	| Autom2   | 631 - Marketing Fund | d/m/y       | d+10/m/y  | 2              | TPM_SP_W_SMOKE_R80V1_0012_1 | 100        | d+11/m/y    | d+21/m/y  | TPM_SP_W_SMOKE_R80V1_0012_2 | TPM_SP_W_SMOKE_R80V1_0012 | 1 - Draft | 2 - Confirmed | 3 - Terminated | Error        | Process Finished | No transitions    | Already in transition | Success           | TPM_SP_W_SMOKE_R80V1_0012_3 | TPM_SP_W_SMOKE_R80V1_0012_4 |
