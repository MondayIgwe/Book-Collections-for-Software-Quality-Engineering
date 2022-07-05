Feature: TestCase_472556
	Can Edit a basket node in canvass action

@BDD_472556 @SFA_Weekly
Scenario: WEB_SFA_SF_CNVACT_045_Can Edit a basket node in canvass action
	#Step1
	Given the user navigates to the 'Advanced Pricing Actions' page
	When the user filters the column by column name 'Code', Filter Type 'Like', Value 'WEB_SFA_SF_CNVACT_45'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'

	#Step2 
	And the user clicks on 'Side Panel Tab' with value 'Main constraints'
	Then the user validates that the 'Side Panel Tab' with value 'Main constraints' is displayed
	When the user clicks on the hierarchical node with the value 'Sum - Order Row - Net amount >= 7520 Euro'
	And the user clicks on the 'Toolbar Grid Edit Button'
	Then the user validates that the 'Popup' with value 'Basket constraint' is displayed

	#Step3
	And the user validates that 'Input By Label Name' with value 'Object' has text 'Order Row'
	And the user validates that 'Input By Label Name' with value 'Attribute' has text 'NETAMOUNT - Net amount'
	And the user validates that 'Input By Label Name' with value 'Operator' has text 'Greater Equal'
	And the user validates that 'Input By Label Name' with value 'Calculation type' has text 'Sum'
	And the user validates that 'Input By Label Name' with value 'Value' has text '7520.00'
	And the user validates that 'Input By Label Name' with value 'Measure unit' has text 'EUR - Euro'

	#Step 4
	When the user enters 'Order Row Benefits' in field 'Input By Label Name' with value 'Object'
	And the user moves the focus away from the element
	And the user enters 'QTYGIFT - Free' in field 'Input By Label Name' with value 'Attribute'
	And the user moves the focus away from the element
	And the user enters 'Less or equal' in field 'Input By Label Name' with value 'Operator'
	And the user moves the focus away from the element
	And the user enters '120' in field 'Input By Label Name' with value 'Value'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'

	#Step 5
	Then the user validates that the 'Node' with value 'AND => Sum - Order Row Benefits - Free <= 120' is visible

	#Step 6
	When the user closes the page and saves the work done