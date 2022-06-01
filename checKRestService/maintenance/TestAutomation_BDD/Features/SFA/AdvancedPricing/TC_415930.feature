Feature: TC_415930
	Create a new Advanced pricing action using the specified data
	Set invalid benefits values
	check the errors 

Scenario: 415930 WEB_SFA_SF_CNVACT_005_Cannot save canvass action with no rule defined
	#Step 1
	Given the user is on the 'Advanced Pricing Actions' page
	#Step 2
	When the user clicks on the 'Add Button'
	#Step3
	And the user clicks on the 'Advanced Pricing Action Generate Code Button'
	And the user clicks on the 'Advanced Pricing Book Drop Down'
	And the user selects '<CnvBook>' in the 'Advanced Pricing Book Option'
	And the user clicks on the 'Valorization Type Drop Down'
	And the user selects '<ValType>' in the 'Valorization Type Option'
	And the user clicks on Ok button on the popup 'New Advanced Pricing Action'
	Then the user is on the 'General Info Tab' page
	When the user enters '<CnvActDesc>' in the 'Description Text Area'
	And the user clicks on the 'Measure Unit Drop Down Arrow'
	And the user clicks on the 'Measure Unit Drop Down Arrow'
	And the user selects '<CnvMeasure>' in the 'Measure Unit Option'
	#Step 4
	And the user clicks on the 'Save Button'
	Then the user validates that the Toolbar Error message is '<Error>'

	Examples:
	| CnvBook  | ValType  | ValAttrib | CnvMeasure | CnvActDesc               | Error                                                                                  |
	| 29 - JHN | Quantity | Quantity  | CARTONS	   | WEB_SFA_SF_CNVACT_005_01 | Cannot save the current action because no customer attribute rules are defined |