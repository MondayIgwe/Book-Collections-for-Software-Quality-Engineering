Feature: TestCase_1132515
Check the warning popups on documents when the document fields are cleare-out

@BDD_TC1132515 @FRM
Scenario: WEB_FRM_WARNING_MESSAGE_DOCUMENT_VALIDATION
    
	#Create new customer without filling mandatory fields
	Given the user navigates to the 'Customer Master' page
	When the user clicks on the 'Add Button'
	And the user clicks on 'Radio Button' with value 'New customer'
	And the user clicks on 'Input By Label Name' with value 'Customer Type'
	And the user clears the text on the 'Input By Label Name' with value 'Customer Type'
	And the user enters 'Bill-to, Ship-to and POS' in field 'Input By Label Name' with value 'Customer Type'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Type'
	And the user clicks on 'Popup Ok Button' with value 'Customer'
	Then the user validates that the 'Button' with value 'Save' is visible

	#Click Save
	When the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Warning Pop Up OK Button' is visible

	#Close Error message and fill in the mandatory fields. Then save the new customer document
	When the user clicks on the 'Warning Pop Up OK Button'
	And the user clicks on 'Input By Label Name' with value 'Customer Name'
	And the user enters 'VALIDATION TEST' in field 'Input By Label Name' with value 'Customer Name'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Name'
	And the user clicks on 'Input By Label Name' with value 'Address'
	And the user enters 'VALIDATION TEST' in field 'Input By Label Name' with value 'Address'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Address'
	And the user clicks on 'Input By Label Name' with value 'Country'
	And the user enters 'Austria' in field 'Input By Label Name' with value 'Country'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Country'
	And the user retrieves the 'Input By Label Name' text with value 'Customer Code'
	When the user clicks on 'Button' with value 'Save'


	#Clears out mandatory field and then click on View button
	And the user clears the text on the 'Input By Label Name' with value 'Customer Name'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Name'
	And the user clicks on 'Segmented Button' with value 'View'
	Then the user validates that 'Alert Dialog Message Box' is populated with 'There are unsaved changes.Do you want to save them before switching on VIEW mode?'