Feature: TestCase_455389

@BDD_455389 @PROMO_Regression @FundsAndRules
Scenario: WEB_TPM_SP_FRDOCUMENT_RATEBASEDFUND_002
	#Step 1PRECONDITION 1
	Given the user navigates to the 'Funds & Rules' page
	
    # Go to the Funds&Rules navigator and create a new fund:
	When the user creates a new fund and rules with configuration ID: '<CONFIGURATIONID>' BRCustomerLevel: '<CUSTOMERLEVEL>' Description: '<DESCRIPTION>' sellInStart: '<STARTSELLIN>' sellInEnd: '<ENDSELLIN>' productGroup: '' rateFundSource: '<RATEFUNDSOURCE>'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode'
	And the user clicks on side panel 'Constraints'
	And the user clicks on the 'Add Button'
	And user adds a ConstraintField: '% Rate Fund' constraint with value ConstraintValue: '<CONSTRAINT1>' startDate: '' endDate: '' familyConstraints: ''
	
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	#Step 2 Open a Funds & Rules document from precondition
	And the user filters the column by column name 'Funds & Rules code', Filter Type 'Like', Value 'FundsRulesCode'
	And the user clicks on 'Text' with value 'FundsRulesCode'
	#The document is opened (and it is not in Edit mode) in the Summary tab and the "Rate Fund Source" field is disabled
	Then the user validates that element: 'Button Link' with value: 'Edit' and attribute: 'aria-pressed' is in state: 'false'
	And the user validates that the 'Input By Label Name' with value 'Rate Fund Source' is disabled

	#Step 3 Click on "Constraints" from the Sidemenu
	When the user clicks on side panel 'Constraints'
	#The Constraints grid is displayed and the "Calculate" Button is disabled
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled
	#missing step - Constraints grid is displayed

	#Step 4 From the Toolbar click on "Edit" button
	When the user clicks on 'Button' with value 'Edit'
	#The "Calculate" button is disabled
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled

	#Step 5 Select a Constraint @CONSTRAINT1
	When the user clicks on 'Grid CheckBox Containing' with value '<CONSTRAINT1>'
	#The "Calculate" button is enabled
	Then the user validates that the 'Button Link' with value 'Calculate' is enabled

	#Step 6 Modify the constraint so that it has a validation error (changing Rate Fund to more than 100%) @INVALIDVALUE
	When the user clicks on 'Text' with value '<CONSTRAINT1>'
	And the user enters '<INVALIDVALUE>' in cell with column '% Rate Fund' and row text '1'
	#The "Calculate" button is disabled
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled

	#Step 7 Modify the constraint so that it doesn't have a validation error (changing Rate Fund to the previous @VALUE)
	When the user clicks on 'Text' with value '<INVALIDVALUE>'
	And the user enters '<VALUE>' in cell with column '% Rate Fund' and row text '1'
	#The "Calculate" button is enabled
	Then the user validates that the 'Button Link' with value 'Calculate' is enabled

	#Step 8 Click on "Summary" tab from the sidemenu
	When the user clicks on side panel 'Summary'
	#The Summary page is displayed and the "Rate Fund Source" field is enabled
	Then the user validates that the 'Input By Label Name' with value 'Rate Fund Source' is enabled

	#Step 9 Click on "Workflow" from the sidemenu @WORKFLOWTITLE
	When the user clicks on side panel '<WORKFLOWTITLE>'
	#Status workflow page is displayed
	Then the user validates that the 'Column Name' with value 'Current status' is present

	#Step 10 Click on "Current Status" field
	When the user clicks on 'Generic Drop Down Trigger' with value 'Current status'
	#Status workflow page is displayed
	Then the user validates that the 'Popup' with value '<POPUP1TITLE>' is present

	#Step 11 Select @STATUS = Confirm and click "Ok" button
	When the user changes the status to '<STATUS>'
	#The document is switched in Confirmed status @NEWSTATUSES
	Then the user validates that the 'Column Name' with value '<NEWSTATUSES>' is present

	#Step 12 Save the document 
	When the user clicks on the 'Save Button'
	#The document is saved (and remains in Edit mode)
	Then the user validates that element: 'Button Link' with value: 'Edit' and attribute: 'aria-pressed' is in state: 'true'

	#Step 13 Click on "Summary" from the sidemenu
	When the user clicks on side panel 'Summary'
	#The Summary page is displayed and the "Rate Fund Source" field is disabled
	Then the user validates that the 'Input By Label Name' with value 'Rate Fund Source' is disabled

	#Step 14 Click on "Constraints" from the Sidemenu
	When the user clicks on side panel 'Constraints'
	#The button "Calculate" is disabled (if no constrain is selected by default or no constraints are present)
	
	#Step 15 Select a Constraint
	When the user checks the 'Grid CheckBox' with value '<VALUE>'
	#The "Calculate" button is enabled - missing

	#Step 16 Close the document and reopen it
	When the user clicks on the 'Close Tab'
	And the user filters the column by column name 'Funds & Rules code', Filter Type 'Like', Value 'FundsRulesCode'
	And the user clicks on 'Text' with value 'FundsRulesCode'
	#The document is reopened and it is not in edit mode. The "Summary" page is displayed and the "Rate Fund Source" field is disabled 
	Then the user validates that element: 'Button Link' with value: 'Edit' and attribute: 'aria-pressed' is in state: 'false'
	And the user validates that the 'Input By Label Name' with value 'Rate Fund Source' is disabled

	#Step 17 Click on "Constraints" from the Sidemenu
	When the user clicks on side panel 'Constraints'
	#The Constraints grid is opened and the button "Calculate" is disabled 
	#Constraints grid is opened is missing
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled

	#Step 18 Select a Constraint
	When the user checks the 'Grid CheckBox' with value '<VALUE>'
	#The "Calculate" button is disabled
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled

	#Step 19 Click on "Workflow" from the sidemenu
	When the user clicks on side panel '<WORKFLOWTITLE>'
	#Status workflow page is displayed
	Then the user validates that the 'Column Name' with value 'Current status' is present

	#Step 20 Click "Edit" button
	When the user clicks on 'Button' with value 'Edit'
	#The document is switched in edit mode
	Then the user validates that element: 'Button Link' with value: 'Edit' and attribute: 'aria-pressed' is in state: 'true'

	#Step 21 Click on "Current Status" field 
	When the user clicks on 'Generic Drop Down Trigger' with value 'Current status'
	#A "Change Status" popup window is displayed
	Then the user validates that the 'Popup' with value '<POPUP1TITLE>' is present

	#Step 22 Select @STATUS = Terminated and click "Ok" button
	When the user changes the status to '<STATUS1>'
	#The document is switched in Terminated status
	Then the user validates that the 'Column Name' with value '<NEWSTATUSES1>' is present

	#Step 23 Click on "Summary" from the Sidemenu
	When the user clicks on side panel 'Summary'
	#The Summary page is displayed and the "Rate Fund Source" field is disabled
	Then the user validates that the 'Input By Label Name' with value 'Rate Fund Source' is disabled

	#Step 24 Click on "Constraints" from the Sidemenu
	When the user clicks on side panel 'Constraints'
	#The Constraints grid is displayed and the "Calculate" Button is disabled
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled
	#missing step - Constraints grid is displayed

	#Step 25 Select a Constraint
	When the user checks the 'Grid CheckBox' with value '<VALUE>'
	#The "Calculate" button is disabled
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled

Examples:
	| CONFIGURATIONID | DESCRIPTION                             | CUSTOMERLEVEL | RATEFUNDSOURCE | VALUE | CONSTRAINT1 | INVALIDVALUE | WORKFLOWTITLE | POPUP1TITLE   | STATUS  | STATUS1    | NEWSTATUSES | NEWSTATUSES1 | STARTSELLIN | ENDSELLIN |
	| Rate Based Fund | WEB_TPM_SP_FRDOCUMENT_RATEBASEDFUND_002 | Level 4       | SOURCE1        | 87.00 | 1.00        | 120.00       | Workflow      | Change Status | Confirm | Terminated | Confirmed   | Terminated   | d/m/y       | d+7/m/y   |
