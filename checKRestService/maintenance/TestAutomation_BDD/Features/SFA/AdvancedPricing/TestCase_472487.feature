Feature: TestCase_472487
	Can Edit a leaf node in canvass action

@BDD_472487 @SFA_Weekly
Scenario: 472487_WEB_SFA_SF_CNVACT_044_Can Edit a leaf node in canvass action
	#Step1
	Given the user navigates to the 'Advanced Pricing Actions' page
	When the user filters the column by column name 'Code', Filter Type 'Like', Value 'WEB_SFA_SF_CNVACT_044'
	And the user opens the grid item in row '1'

	#Step2
	And the user clicks on 'Side Panel Tab' with value 'Main constraints'
	Then the user validates that the 'Side Panel Tab' with value 'Main constraints' is displayed
	And the user validates the 'Toolbar Grid Edit Button' is disabled
	When the user clicks on 'Side Panel Tab' with value 'Valorization'
	Then the user validates that the 'Side Panel Tab' with value 'Valorization' is displayed
	And the user validates the 'Toolbar Grid Edit Button' is disabled
	When the user clicks on 'Side Panel Tab' with value 'Benefits'
	Then the user validates that the 'Side Panel Tab' with value 'Benefits' is displayed
	When the user clicks on 'Top Tab' with value 'Benefit'
	Then the user validates the 'Toolbar Grid Edit Button' is disabled

	# Step3
	When the user clicks on 'Button' with value 'Edit'
	And the user clicks on the 'Toolbar Grid Edit Button'

	#Step 4
	When the user clicks on 'Side Panel Tab' with value 'Main constraints'
	Then the user validates that the 'Side Panel Tab' with value 'Main constraints' is displayed
	When the user clicks on the hierarchical node with the value 'AND' -> 'Order Row - Payment Terms = CASH SALE'

	#Step5
	And the user clicks on the 'Toolbar Grid Edit Button'
	Then the user validates that the 'Popup' with value 'Leaf constraint' is displayed
	And the user validates that 'Input By Label Name' with value 'Object' has text 'Order Row'
	And the user validates that 'Input By Label Name' with value 'Attribute' has text 'CODPAYTRM - Payment Terms'
	And the user validates that 'Input By Label Name' with value 'Operator' has text 'Equal'
	And the user validates that 'Input By Label Name' with value 'Value' has text 'CASH SALE'

	#Step6
	When the user enters 'CODPAYMOD - Payment Type' in field 'Input By Label Name' with value 'Attribute'
	And the user moves the focus away from the element
	Then the user validates that the 'Input By Label Name' with value 'Value' has no text

	#Step 7
	When the user enters 'CASH ON DELIVERY (LETTER)' in field 'Input By Label Name' with value 'Value'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'

	#Step8
	Then  the user validates that the 'Node' with value 'AND => Sum - Order Row - Net amount >= 7520 Euro => OR => Order Row - Payment Type = CASH ON DELIVERY (LETTER)' is visible
	
	#Step 9
	When the user clicks on 'Side Panel Tab' with value 'Benefits'
	Then the user validates that the 'Side Panel Tab' with value 'Benefits' is displayed
	When the user clicks on 'Top Tab' with value 'Benefit'
	And the user clicks on the hierarchical node with the value 'Order Header - Payment Type = Bank Receipt'
	And the user clicks on the 'Toolbar Grid Edit Button'
	Then the user validates that the 'Popup' with value 'Leaf constraint' is displayed

	#Step10
	And the user validates that 'Input By Label Name' with value 'Object' has text 'Order Header'
	And the user validates that 'Input By Label Name' with value 'Attribute' has text 'CODPAYMOD - Payment Type'
	And the user validates that 'Input By Label Name' with value 'Operator' has text 'Equal'
	And the user validates that 'Input By Label Name' with value 'Value' has text 'Bank Receipt'

	#Step11
	When the user enters 'Product' in field 'Input By Label Name' with value 'Object'
	And the user moves the focus away from the element
	And the user enters 'CODBRAND - Brand' in field 'Input By Label Name' with value 'Attribute'
	And the user moves the focus away from the element
	And the user enters 'Not equal' in field 'Input By Label Name' with value 'Operator'
	And the user moves the focus away from the element
	And the user enters 'BACIOCK' in field 'Input By Label Name' with value 'Value'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'
	
	#Step 12
	Then  the user validates that the 'Node' with value 'AND => Order Row - Row Type = Sale => OR => Order Header - Net amount >= 5100 => NOT => Product - Brand <> BACIOCK' is visible

	#Step 13
	When the user closes the page and saves the work done