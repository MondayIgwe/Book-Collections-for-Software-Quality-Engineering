Feature: TestCase_451221

@BDD_451221 @PROMO_Nightly @FundsAndRules @FundsAndRulesNightly
Scenario: WEB_TPM_SP_FR_QTYFUNDS_GRID
	#Step 1
	Given the user has logged in with division '<DIVISION>'
	When the user navigates to the 'Funds & Rules' page
	#Step 3 - 6
	When the user creates a new fund and rules with configuration ID: '<CONFIGURATIONID>' BRCustomerLevel: '<CUSTOMERLEVEL>' Description: '<PAGEDESCRIPTION >' sellInStart: '<STARTSELLIN>' sellInEnd: '<ENDSELLIN>' productGroup: '<PRODUCT_GROUPS>' rateFundSource: '<RATEFUNDSOURCE>'
	#7  Go to "Constraints" tab In the constraints grid, the following cols are visible: Code	 Movements	Start Date	End Date	 Fund value	Uncommitted Balance	Remaining balance	Unit measure
	And the user clicks on side panel 'Constraints'
	Then the user validates that the 'Column Name' with value 'Code' is present
	And the user validates that the 'Column Name' with value 'Movements' is present
	And the user validates that the 'Column Name' with value 'Start Date' is present
	And the user validates that the 'Column Name' with value 'End Date' is present
	And the user validates that the 'Column Name' with value 'Fund value' is present
	And the user validates that the 'Column Name' with value 'Uncommitted Balance' is present
	And the user validates that the 'Column Name' with value 'Remaining balance' is present
	And the user validates that the 'Column Name' with value 'Unit measure' is present
	#8 Add a  new costraint In the popup are shown: Period of Validity = @SELLIN Fund Value [Mandatory] Unit Measure = @UNITMEASURE
	#9 Set  Fund Value = @FUNDVALUE Click OK
	When user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<FUNDVALUE>' startDate: '' endDate: '' familyConstraints: ''
	#IN the grid Code = 1 Movements = icon Start Date = Current date + 1 day End Date	 = Current date + 15 days Fund value = @FUNDVALUE Uncommitted Balance	= @FUNDVALUE Remaining balance	= @FUNDVALUE Unit measure = Packages
	Then the user validates that column 'Code' has '1' with row text '<FUNDVALUE>'
	And the user validates that column 'Start Date' has '<STARTSELLIN>' with row text '<FUNDVALUE>'
	And the user validates that column 'End Date' has '<ENDSELLIN>' with row text '<FUNDVALUE>'
	And the user validates that column 'Fund value' has '<FUNDVALUE>' with row text '<FUNDVALUE>'
	And the user validates that column 'Uncommitted Balance' has '<FUNDVALUE>' with row text '<FUNDVALUE>'
	And the user validates that column 'Remaining balance' has '<FUNDVALUE>' with row text '<FUNDVALUE>'
	And the user validates that column 'Unit measure' has 'Packages' with row text '<FUNDVALUE>'
	#10 Open Movements panel
	When the user clicks on the 'Open Folder Icon'
	#Remaining Balance = @FUNDVALUE Uncommitted Balance = @FUNDVALUE Fund Reserve = 0
	Then the user validates that 'Input By Label Name' with value 'Remaining balance' has text '<FUNDVALUE>'
	And the user validates that 'Input By Label Name' with value 'Uncommitted Balance' has text '<FUNDVALUE>'
 	And the user validates that 'Input By Label Name' with value 'Fund reserve' has text '0.0000'
	#11 Save the F&R
	When the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Close Tab'

	Examples:
		| DIVISION                                 | CONFIGURATIONID | STARTSELLIN | ENDSELLIN | CUSTOMERLEVEL | UNITMEASURE | FUNDVALUE  | TYPEOFMOVEMENT | PAGEDESCRIPTION | PRODUCT_GROUPS | RATEFUNDSOURCE |
		| XTEL SFA AUTOMATION - Global Group SM1V4 | QTY Fund        | d+1/m/y     | d+15/m/y  | 5 - Level 5   | Packages    | 1,000.0000 | Deposit        | Funds & Rules   |                |                |