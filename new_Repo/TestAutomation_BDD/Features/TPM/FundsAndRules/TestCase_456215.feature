Feature: TestCase_456215

@BDD_456215 @PROMO_Nightly @FundsAndRules
Scenario: WEB_TPM_SP_FRDOCUMENT_RATEBASEDFUND_CALCULATE_001
	#Step 1
	Given the user navigates to the 'Funds & Rules' page
	#Step 2 - Create a Confirmed BR_01 having
	When the user creates a new fund and rules '<CONFIGURATION_ID>' '<CUST_LEVEL>' '<DESCRIPTION>' '<SELLINSTART>' '<SELLINEND>' '<PRODUCT_GROUPS>' '<RATEFUNDSOURCE>'
	#Add a constraint @CONSTRAINT1 with % Rate Fund = @RATE_FUND
	And the user clicks on 'Side Panel Tab' with value 'Constraints'
	And user adds a '% Rate Fund' constraint with value '<RATE_FUND>' '' '' ''
	#5 Save and close the Fund
	And the user clicks on 'Side Panel Tab' with value 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#6 Refresh the Fund&Rules Navigator and open the Fund with the description = @DESCRIPTION -> The Rate Fund Source filed is disabled (no modification can be done)
	And the user clicks on the 'Refresh Button'
	And the user clicks on 'Text' with value 'FundsRulesCode'
	Then the user validates that the Loading Mask is not present
	And the user validates that the 'Input By Label Name' with value 'Rate Fund Source' is disabled
	#7 Click on "Constraints" from the Sidemenu -> The Constraints grid is present and the "Calculate" Button is disabled
	When the user clicks on 'Side Panel Tab' with value 'Constraints'
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled
	#8 From the Toolbar click on "Edit" button- > The "Calculate" button is disabled
	When the user clicks on 'Button' with value 'Edit'
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled
	#9 Select a Constraint The "Calculate" button is enabled
	When the user clicks on 'Text' with value '<RATE_FUND>.00'
	Then the user validates that the 'Button Link' with value 'Calculate' is enabled
	#10 Modify the constraint so that it has a validation error. Modify the value from "% Rate fund" to the value = @INVALID_VALUE - >The "Calculate" button is disabled and a Notification message is present @MESSAGE_VALIDATION
	When the user enters '<INVALID_VALUE>' in cell with column '% Rate Fund' and row text '<RATE_FUND>.00'
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled
	And the user validates that the 'Text' with value '<MESSAGE_VALIDATION>' is present
	#11 Modify the constraint so that it doesn't have a validation error = @RATE_FUND -> The "Calculate" button is enabled
	When the user enters '<RATE_FUND>' in cell with column '% Rate Fund' and row text '<INVALID_VALUE>.00'
	Then the user validates that the 'Button Link' with value 'Calculate' is enabled
	#12 Click on "Summary" from the Sidemenu -> The Summary page is present and the "Rate Fund Source" field is enabled
	When the user clicks on 'Side Panel Tab' with value 'Summary'
	Then the user validates that the 'Input By Label Name' with value 'Rate Fund Source' is enabled
	#13 Click on "Current Status" field from the "Workflow" tab -> A @POPUP1TITLE "Change Status" popup window is present with the confirm status @STATUS1 and Terminated status @STATUS2 available
	When the user clicks on 'Side Panel Tab' with value 'Workflow'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Current status'
	Then the user validates that the 'Radio Button' with value '<STATUS1>' is present
	And the user validates that the 'Radio Button' with value '<STATUS2>' is present
	#14 Select "Confirm" @STATUS1 and click "Ok" button The document is switched in Confirmed status @NEWSTATUS
	When the user clicks on 'Radio Button' with value '<STATUS1>'
	And the user clicks on 'Popup Ok Button' with value 'Change Status'
	Then the user validates that 'Home Toolbar Label' text contains '<NEWSTATUS>'
	#15 Save the document  -> The document is saved (and remains in Edit mode)
	When the user clicks on the 'Save Button'
	#16 Click on "Summary" from the Sidemenu -> The Summary page is present and the "Rate Fund Source" field is disabled
	And the user clicks on 'Side Panel Tab' with value 'Summary'
	Then the user validates that the 'Input By Label Name' with value 'Rate Fund Source' is disabled
	#17 Click on "Constraints" from the Sidemenu The button "Calculate" is disabled (if no constrain is selected by default or no constrains are present)
	When the user clicks on 'Side Panel Tab' with value 'Constraints'
	#And the user clicks on 'Grid Checkbox' with value '<RATE_FUND>.00'
	And the user checks the 'Grid Checkbox' with value '<RATE_FUND>.00'
	Then the user validates that the 'Button Link' with value 'Calculate' is enabled
	#18 Select a Constraint @CONSTRAINT1 -> The "Calculate" button is enabled
	#When the user clicks on 'Text' with value '<RATE_FUND>.00'
	When the user unchecks the 'Grid Checkbox' with value '<RATE_FUND>.00'
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled
	#19 Close the document and reopen the F&R document with the description = @DESCRIPTION - >
	When the user clicks on the 'Close Tab'
	And the user clicks on the 'Refresh Button'
	And the user clicks on 'Text' with value 'FundsRulesCode'
	#The document is reopened and it is not in edit mode. The "Summary" page is present and the "Rate Fund Source" field is disabled
	Then the user validates that the 'Input By Label Name' with value 'Rate Fund Source' is disabled
	And the user waits for 'Button Link' with value 'Edit' attribute 'aria-pressed' to be 'false'
	#20 Click on "Constraints" from the Sidemenu - > The Constraints grid is opened and the button "Calculate" is disabled
	When the user clicks on 'Side Panel Tab' with value 'Constraints'
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled
	#21 Select a Constraint @CONSTRAINT1 -> The "Calculate" button is disabled
	When the user clicks on 'Text' with value '<RATE_FUND>.00'
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled
	#22 Click on "Workflow" from the sidemenu -> Status workflow page is present and the "Current Status" field is disabled
	When the user clicks on 'Side Panel Tab' with value 'Workflow'
	Then the user validates that the 'Input By Label Name' with value 'Current status' is disabled
	#23 Click "Edit" button -> The document is switched in edit mode
	When the user clicks on 'Button' with value 'Edit'
	#24 Click on "Current Status" field A "Change Status" popup window is present with the Terminated status @STATUS2 and Modified status @STATUS3 available
	And the user clicks on 'Generic Drop Down Trigger' with value 'Current status'
	Then the user validates that the 'Radio Button' with value '<STATUS2>' is present
	And the user validates that the 'Radio Button' with value '<STATUS3>' is present
	#25 Select  @TERMINATEDSTATUS "Terminated" status @STATUS2 and click "Ok" button - > The document is switched in Terminated status
	When the user clicks on 'Radio Button' with value '<STATUS2>'
	And the user clicks on 'Popup Ok Button' with value 'Change Status'
	Then the user validates that 'Home Toolbar Label' text contains '<STATUS2>'
	#26 Click on "Summary" from the Sidemenu -> The Summary page is present and the "Rate Fund Source" field is disabled
	When the user clicks on 'Side Panel Tab' with value 'Summary'
	Then the user validates that the 'Input By Label Name' with value 'Rate Fund Source' is disabled
	#27 Click on "Constraints" from the Sidemenu -> The Constraints grid is present and the "Calculate" Button is disabled
	When the user clicks on 'Side Panel Tab' with value 'Constraints'
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled
	#28 Select a Constraint @CONSTRAINT1 -> The "Calculate" button is disabled
	When the user clicks on 'Text' with value '<RATE_FUND>.00'
	Then the user validates that the 'Button Link' with value 'Calculate' is disabled
	#29 Close the document
	When the user clicks on the 'Close Tab'
	And the user clicks on the 'Close Tab'

	Examples:
		| CONFIGURATION_ID | DESCRIPTION              | CUST_LEVEL  | SELLINSTART | SELLINEND | RATEFUNDSOURCE      | PRODUCT_GROUPS | CONSTRAINT1 | RATE_FUND | INVALID_VALUE | MESSAGE_VALIDATION            | POPUP1TITLE   | STATUS1 | STATUS2    | NEWSTATUS | STATUS3  | TERMINATEDSTATUS | START_DATE | END_DATE |
		| Rate Based Fund  | RBF_creation_and_editing | 3 - Level 3 | d+30/m/y    | d+60/m/y  | SOURCE1 - NETAMOUNT |                | 1           | 10        | 555           | Constraints: Validation Error | Change Status | Confirm | Terminated | Confirmed | Modified | Terminated       |            |          |