Feature: TestCase_458495

@BDD_458495 @PROMO_Regression @PromoActions
Scenario: WEB_TPM_SP_FRDOCUMENT_MOVEMENTS_010
	#1 PRECONDITION
	Given the user navigates to the 'Funds & Rules' page
	When the user creates a new fund and rules with configuration ID: '<CONFIGURATIONID>' BRCustomerLevel: '<CUSTOMERLEVEL>' Description: '<DESCRIPTION>' sellInStart: 'd/m/y' sellInEnd: 'd+7/m/y' productGroup: '' rateFundSource: ''
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<VALUE1>' startDate: '' endDate: '' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode1'
	And the user changes the status to '<STATUS1>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#2 PRECONDITION
	Given the user navigates to the 'Funds & Rules' page
	When the user creates a new fund and rules with configuration ID: '<CONFIGURATIONID>' BRCustomerLevel: '<CUSTOMERLEVEL>' Description: '<DESCRIPTION2>' sellInStart: 'd/m/y' sellInEnd: 'd+7/m/y' productGroup: '' rateFundSource: ''
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
	#6 Click on "New"
	And the user clicks on the 'Popup Add Button'
	#7 Select @MOVEMENTTYPE = Load From
	And the user select value '<MOVEMENTTYPE>' from dropdown list 'Type of movement'
	#8 Select constraint from PRECONDITION 1 and click "OK"
	And the user clicks on 'Text In Table Cell' with value 'FundsRulesCode1'
	And the user enters 'Testing' in field 'Input By Label Name' with value 'Reason'
	#9 In Value field insert a grater value than the one from Remaining Balance of the source constraint, like <@VALUE from PRECONDITION 1> + 1
	And the user enters '<VALUE3>' in field 'Input By Label Name' with value 'Value'
	And the user moves the focus away from the element
	Then the user validates that the 'Pop Up Error Message' with value 'Value: Transaction invalid value for transfer' is present
	When the user enters '<VALUE1>' in field 'Input By Label Name' with value 'Value'
	And the user moves the focus away from the element
	Then the user validates that the 'Pop Up Error Message' with value 'Value: Transaction invalid value for transfer' is not present


Examples:
	| CONFIGURATIONID  | DESCRIPTION                           | DESCRIPTION2                          | CUSTOMERLEVEL | VALUE1 | VALUE2 | VALUE3 | STATUS1 | STATUS2 | MOVEMENTTYPE | COLORBOX |
	| 632 - Sales Fund | WEB_TPM_SP_FRDOCUMENT_MOVEMENTS_006_1 | WEB_TPM_SP_FRDOCUMENT_MOVEMENTS_006_2 | Level 3       | 2200   | 500    | 2201   | Confirm | Draft   | Load From    | 008fe1   |