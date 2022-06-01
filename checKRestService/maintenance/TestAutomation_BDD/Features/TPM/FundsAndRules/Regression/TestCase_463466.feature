Feature: TestCase_463466

@BDD_463466 @PROMO_Regression @FundsAndRules
Scenario: WEB_TPM_SP_FRDOCUMENT_MOVEMENTS_007
	#1 PRECONDITION 1
	Given the user navigates to the 'Funds & Rules' page
	#Step 2 - Create a Confirmed F&R_01 having 
	When the user creates a new fund and rules with configuration ID: '<CONFIGURATIONID>' BRCustomerLevel: '<CUSTOMERLEVEL>' Description: '<DESCRIPTION1>' sellInStart: 'd/m/y' sellInEnd: 'd+7/m/y' productGroup: '' rateFundSource: ''
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<VALUE1>' startDate: '' endDate: '' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode1'
	And the user changes the status to '<STATUS>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#2 PRECONDITION 2 
	And the user creates a new fund and rules with configuration ID: '<CONFIGURATIONID>' BRCustomerLevel: '<CUSTOMERLEVEL>' Description: '<DESCRIPTION2>' sellInStart: 'd/m/y' sellInEnd: 'd+7/m/y' productGroup: '' rateFundSource: ''
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<VALUE2>' startDate: '' endDate: '' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode2'
	And the user clicks on the 'Save Button'
	#3 Go back to F&R navigator
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Refresh Button'
	#4 Open in edit F&R document from PRECONDITION 2
	And the user filters the column by column name 'Funds & Rules code', Filter Type 'Like', Value 'FundsRulesCode2'
	And the user clicks on 'Text' with value 'FundsRulesCode2'
	And the user clicks on 'Button' with value 'Edit'
	#Go to Constraints tab and click on "Movements" icon (folder icon)
	And the user clicks on side panel 'Constraints'
	And the user clicks on 'Funds Folder Icon By Row' with value '1'
	#6 Click on "Add" in order to add a new constraint
	And the user clicks on the 'Popup Add Button'
	#7 In @MOVEMENTTYPE combo select TRANSFER_INTO 
	And the user select value '<MOVEMENTTYPE>' from dropdown list 'Type of movement'
	#All constraints belonging to the current fund (except the current one and the constraints having an End Date <= CurrentDate)
	Then the user validates that 'Pop Up Text in Grid' with value one 'Create New Movement' and value two 'FundsRulesCode1' is visible
	#Next to Type of movement combo are displayed:- @VALUEFIELD : free number field - @REASONFIELD : free text field
	And the user validates that the 'Input By Label Name' with value 'Value' is present
	And the user validates that the 'Input By Label Name' with value 'Reason' is present
	#8 Focus on Source fund constraint(s) selector
	When the user clicks on element 'Popup Grid Row' with value 'Create New Movement' and value '1'
	Then the user validates that 'Pop Up Text in Grid' with value one 'Create New Movement' and value two 'FundsRulesCode1' is visible
	And the user validates that the 'Pop Up Text in Grid' with value one 'Create New Movement' and value two 'FundsRulesCode2' is not visible
	#The grid displaying fund constraints must be in read only and user can select just one for each movement.
	#9 From Destination fund constraint(s) selector, choose multiple fund constraints  #Multiselection is not allowed.
	When the user clicks on element 'Popup Grid Row' with value 'Create New Movement' and value '2'
	Then the user validates that the count for 'Popup Grid Selected Rows' with value 'Create New Movement' is '1'
	#- Constraint from PRECONDITION 2 ALL THE FIELDS DISPLAYED IN THE CONSTRAINTS GRID- ID, VALIDITY PERIOD, ATRIBUTES, 
	And the user validates that popup 'Create New Movement' column 'Funds & Rules code' has 'FundsRulesCode1' with row text 'FundsRulesCode1'
	And the user validates that popup 'Create New Movement' column 'Configuration description' has 'Sales Fund' with row text 'FundsRulesCode1'
	And the user validates that popup 'Create New Movement' column 'Start Date' has 'd/m/y' with row text 'FundsRulesCode1'
	And the user validates that popup 'Create New Movement' column 'End Date' has 'd+7/m/y' with row text 'FundsRulesCode1'
	And the user validates that popup 'Create New Movement' column 'Fund value' has '2,200.0000' with row text 'FundsRulesCode1'
	And the user validates that popup 'Create New Movement' column 'Fund UM' has 'Euro' with row text 'FundsRulesCode1'
	#10 Complete the mandatory fields ("@MOVEMENTVALUE" and "@REASON")
	When the user enters '<REASON>' in field 'Input By Label Name' with value 'Reason'
	And the user enters '<MOVEMENTVALUE>' in field 'Input By Label Name' with value 'Value'
	#11 Select a constraint and click "ADD"
	And the user clicks on 'Text In Table Cell' with value 'FundsRulesCode1'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Ok Button' with value 'Create New Movement'
	#12 Click "OK" and close the promo 
	And the user clicks on 'Popup Ok Button' with value 'Movements'
	And the user closes all pages without saving the work done


Examples:
	| CONFIGURATIONID  | DESCRIPTION1                          | DESCRIPTION2                          | CUSTOMERLEVEL | VALUE1 | VALUE2 | STATUS  | MOVEMENTTYPE | VALUEFIELD | REASONFIELD | MOVEMENTVALUE | REASON |
	| 632 - Sales Fund | WEB_TPM_SP_FRDOCUMENT_MOVEMENTS_008#1 | WEB_TPM_SP_FRDOCUMENT_MOVEMENTS_008#2 | Level 2       | 2200   | 1200   | Confirm | Load From    | VALUE:     | REASON:     | 900           | TEST   |