Feature: TestCase_335198

@BDD_335198 @PROMO_Regression @FundsAndRules @PROMO_Smoke
Scenario: TPM_FR_W_SMOKE_R81V1_0005 - Create New F&R (Rate Based Fund)
	#Step 1 - Go to "Fund & Rules" navigator
	Given the user navigates to the 'Funds & Rules' page
	#2 Create a New F&R
	When the user clicks on the 'Add Button'
	#3 Select @FR_CONFID1
	And the user select value '<FR_CONFID1>' from dropdown list 'Configuration ID'
	#4 In the popup, click on OK button
	And the user clicks on 'Popup Ok Button' with value containing '[New Fund&Rules]'
	Then the user validates that the 'Input By Label Name' with value 'Configuration ID' is disabled
	And the user validates that 'Input By Label Name' with value 'Configuration ID' has text '<FR_CONFID1>'
	And the user validates the 'Validity Period Start Date' is not empty
	And the user validates the 'Validity Period End Date' is not empty
	And the user validates the 'Validity Period Start Date' is enabled
	And the user validates the 'Validity Period End Date' is enabled
	And the user validates that the 'Validity Period Start Date' is present
	And the user validates that the 'Validity Period End Date' is present
	And the user validates that 'Input By Label Name' with value 'Status' has text '<Status>'
	And the user validates that the 'Input By Label Name' with value 'Funds & Rules code' is disabled
	And the user validates that the 'Input By Label Name' with value 'Description' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Product Groups' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Customer level' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Customer level' is present
	And the user validates that 'Checkbox' with value 'Select customer nodes' is marked as: 'false'
	And the user validates that the 'Checkbox' with value 'Select customer nodes' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Rate Fund Source' is present
	#5 In Summay Page enter the following info:
	When the user selects validity period from: '<STARTSELLIN>' to: '<ENDSELLIN>' on the 'Validity Period Start Date' field
	And the user enters '<Description>' in field 'Input By Label Name' with value 'Description'
	And the user select value '<custLevel>' from dropdown list 'Customer level'
	And the user select value '<rateFundSource>' from dropdown list 'Rate Fund Source'
	#6 Click on Save button
	And the user clicks on the 'Save Button'
	#7 Go to "Constraints" Page
	And the user clicks on side panel 'Constraints'
	Then the user validates that the column 'Code' is not editable
	And the user validates that the column 'Movements' is editable
	And the user validates that the column 'Start Date' is editable
	And the user validates that the column 'End Date' is editable
	And the user validates that the column 'Fund Source Value' is not editable
	And the user validates that the column '% Rate Fund' is editable
	And the user validates that the column 'Uncommitted Balance' is not editable
	And the user validates that the column 'Remaining balance' is not editable
	And the user validates that the column 'Fund reserve' is not editable
	And the user validates that the column 'Unit measure' is not editable
	#8 Add a new constraint
	When the user clicks on the 'Add Button'
	Then the user validates that the 'Popup' with value 'Create New Constraint' is present
	Then the user validates that the date field 'Validity Period Start Date' has '<STARTSELLIN>'
	And the user validates that the date field 'Validity Period End Date' has '<ENDSELLIN>'
	And the user validates that the 'Mandatory Icon' with value '% Rate Fund' is present
	And the user validates that the 'Input By Label Name' with value '% Rate Fund' is enabled
	And the user validates that 'Input By Label Name' with value 'Unit measure' has text '<UnitMeasure>'
	#9 In the popup, click on "Cancel" button
	When the user clicks on 'Popup Cancel Button' with value 'Create New Constraint'
	Then the user validates that the 'Select Indexed Row' with value '1' is not present
	#10 Close F&R Document
	When the user closes all pages without saving the work done

Examples:
	| FR_CONFID1            | Status | Description              | custLevel   | rateFundSource      | UnitMeasure | STARTSELLIN | ENDSELLIN |
	| 633 - Rate Based Fund | Draft  | Test F&R Rate Based Fund | 5 - Level 5 | SOURCE1 - NETAMOUNT | Euro        | d/m/y       | d+1/m/y     |