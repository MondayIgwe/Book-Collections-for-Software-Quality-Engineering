Feature: TestCase_463847

@BDD_463847 @PROMO_Regression @FundsAndRules @FundsAndRules
Scenario: WEB_TPM_SP_FRDOCUMENT_ENLARGE_VALIDITYPERIOD_001
	#1 Go to F&R navigator
	Given the user navigates to the 'Funds & Rules' page
	#Step 2	PRECONDITION 1 - Go to the Funds&Rules navigator and create a new fund:
	When the user creates a new fund and rules with configuration ID: '<CONFIGURATIONID>' BRCustomerLevel: '<CUSTOMERLEVEL>' Description: '<DESCRIPTION>' sellInStart: '<SELLIN>' sellInEnd: '<SELLIN1>' productGroup: '' rateFundSource: ''
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode'
	Then the user validates that 'Input By Label Name' with value 'Status' has text '<STATUS>'
	When the user clicks on side panel 'Constraints'
	And the user clicks on the 'Add Button'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<VALUE1>' startDate: '<DATE1_1>' endDate: '<DATE2_1>' familyConstraints: ''
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<VALUE2>' startDate: '<DATE1_2>' endDate: '<DATE2_2>' familyConstraints: ''
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<VALUE3>' startDate: '<DATE1_3>' endDate: '<DATE2_3>' familyConstraints: ''
	When the user clicks on the 'Save Button'
	
	#Step 3 Open in Edit mode the F&R document just created
	And the user clicks on the 'Close Tab'
	And the user filters the column by column name 'Funds & Rules code', Filter Type 'Like', Value 'FundsRulesCode'
	And the user clicks on 'Text' with value 'FundsRulesCode'

	#Step 4 Go to Summary tab- change the Validity period
	And the user clicks on side panel 'Summary'
	And the user clicks on 'Button' with value 'Edit'
	When the user selects validity period from: '<NEWSELLIN>' to: '<NEWSELLIN1>' on the 'Validity Period Start Date' field

	#Step 5 Go to Constraints tab
	When the user clicks on side panel 'Constraints'
	#C1- 02/04/2020-02/05/2020
	Then the user validates that column 'Start Date' has '04/02/2020' with row number '1'
	And the user validates that column 'End Date' has '05/02/2020' with row number '1'
	#C2- 02/06/2020-02/07/2020
	Then the user validates that column 'Start Date' has '06/02/2020' with row number '2'
	And the user validates that column 'End Date' has '07/02/2020' with row number '2'
	#C3- 02/08/2020-02/09/2020
	Then the user validates that column 'Start Date' has '08/02/2020' with row number '3'
	And the user validates that column 'End Date' has '09/02/2020' with row number '3'


	#Step 6 Save and close the F&R @PAGEDESCRIPTION
	When the user clicks on the 'Save Button'
	When the user clicks on the 'Close Tab'

Examples:
	| CONFIGURATIONID | SELLIN     | SELLIN1    | DESCRIPTION                                        | CUSTOMERLEVEL | STATUS | DATE1_1    | DATE1_2    | DATE1_3    | DATE2_1    | DATE2_2    | DATE2_3    | VALUE1 | VALUE2 | VALUE3 | NEWSELLIN  | NEWSELLIN1 | PAGEDESCRIPTION |
	| Sales Fund      | 02/02/2020 | 02/11/2020 | WEB_TPM_SP_FRDOCUMENT_ENLARGE_VALIDITYPERIOD_001#1 | Level 5       | Draft  | 02/04/2020 | 02/06/2020 | 02/08/2020 | 02/05/2020 | 02/07/2020 | 02/09/2020 | 1000   | 2000   | 3000   | 02/03/2020 | 02/10/2020 | Funds & Rules   |
