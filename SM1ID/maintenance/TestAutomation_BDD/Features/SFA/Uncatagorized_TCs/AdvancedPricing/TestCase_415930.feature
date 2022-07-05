Feature: TestCase_415930
	Create a new Advanced pricing action using the specified data
	Set invalid benefits values
	check the errors 

Scenario: 415930 WEB_SFA_SF_CNVACT_005_Cannot save canvass action with no rule defined
	#Step 1
	Given the user navigates to the 'Advanced Pricing Actions' page
	
	#Step 2
	When the user clicks on the 'Add Button'
	
	#Step3
	And the user clicks on 'Generate Button' with value 'Code'

	And the user clicks on 'Input By Label Name' with value 'Advanced Pricing Book'
	And the user enters '<CnvBook>' in field 'Input By Label Name' with value 'Advanced Pricing Book'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Advanced Pricing Book'

	And the user clicks on 'Input By Label Name' with value 'Valorization type'
	And the user enters '<ValType>' in field 'Input By Label Name' with value 'Valorization type'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Valorization type'

	And the user clicks on 'Popup Ok Button' with value 'New Advanced Pricing Action'
	Then the user validates that the 'Input By Label Name' with value 'Measure Unit' is displayed
	When the user populates the 'General info' tab where 'Description' input field: '<CnvActDesc>', 'Measure Unit' input field: '<CnvMeasure>'

	#Step 4
	And the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Navigation Error Icon' with value '<Error>' is displayed
	When the user closes all pages without saving the work done

	Examples:
	| CnvBook  | ValType  | ValAttrib | CnvMeasure | CnvActDesc               | Error                                                                          |
	| 29 - JHN | Quantity | Quantity  | CARTONS	   | WEB_SFA_SF_CNVACT_005_01 | Cannot save the current action because no customer attribute rules are defined |