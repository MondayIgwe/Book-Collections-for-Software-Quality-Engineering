Feature: TestCase_523670
	Create a new Advanced pricing action using the specified data

@BDD_523670 @SFA_Weekly
Scenario: 523670_WEB_SFA_SF_CNVACT_080_Messages are cleared when Leaf/ Benefit node are inserted in the trees
	#Step 1
	Given the user navigates to the 'Advanced Pricing Actions' page
	When the user adds a new Advanced Pricing Action with Advanced Pricing Book: '29 - JHN', Application Type: 'Discretionary', Valorization Type: 'Number of times'
	And the user populates the 'General info' tab where 'Description' input field: 'Canvass for WEB_SFA_SF_CNVACT_080', 'Benefit Sub-reason' input field: 'Volume Discounts'
	And the user clicks on 'Side Panel Tab' with value 'Customers'
	And the user clicks on 'Top Tab' with value 'Customer Attributes'
	And the user clicks on 'Top Tab' with value 'Inclusion Rules (0)'
	And the user clicks on the 'Add Button'
	And the user selects from the 'Customer Category' drop down grid menu the 'B2B' option
	And the user clicks on 'Popup Button' with value 'OK'

	#Step 2 Main Constraints
	When the user clicks on 'Side Panel Tab' with value 'Main constraints'
	Then the user validates that the 'Side Panel Tab' with value 'Main constraints' is displayed
	And the user validates that the 'Node' with value 'AND' is visible
	When the user clicks on the hierarchical node with the value 'AND'
	And the user clicks on 'Button Link' with value 'Add Basket'
	Then the user validates that the 'Popup' with value 'Basket constraint' is displayed
	And the user validates that the 'Mandatory Icon' with value 'Object' is visible
	And the user validates that the 'Mandatory Icon' with value 'Attribute' is visible

	When the user clicks on 'Input By Label Name' with value 'Object'
	And the user enters 'Order Row' in field 'Input By Label Name' with value 'Object'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Attribute'
	And the user enters 'QTYORD - Quantity' in field 'Input By Label Name' with value 'Attribute'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Value'
	And the user enters '10.00' in field 'Input By Label Name' with value 'Value'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Measure unit'
	And the user enters 'CT - CARTONS' in field 'Input By Label Name' with value 'Measure unit'
	And the user moves the focus away from the element

	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value 'AND' -> 'Sum - Order Row - Quantity >= 10 CARTONS' is visible

	#Step 3
	When the user clicks on 'Side Panel Tab' with value 'Valorization'
	Then the user validates that the 'Side Panel Tab' with value 'Valorization' is displayed
	And the user validates that the 'Node' with value 'MULTIPLE' is visible

	When the user clicks on the hierarchical node with the value 'MULTIPLE'
	And the user clicks on 'Button Link' with value 'Add Basket'
	Then the user validates that the 'Popup' with value 'Basket constraint' is displayed
	And the user validates that the 'Mandatory Icon' with value 'Object' is visible
	And the user validates that the 'Mandatory Icon' with value 'Attribute' is visible

	When the user clicks on 'Input By Label Name' with value 'Object'
	And the user enters 'Product' in field 'Input By Label Name' with value 'Object'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Attribute'
	And the user enters 'CODBRAND - Brand' in field 'Input By Label Name' with value 'Attribute'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Value'
	And the user enters '2.00' in field 'Input By Label Name' with value 'Value'
	And the user moves the focus away from the element

	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value 'MULTIPLE' -> 'Count Distinct - Product - Brand = 2' is visible

	#Step 4 General Info tab
	When the user clicks on 'Side Panel Tab' with value 'General info'
	Then the user validates that the 'Side Panel Tab' with value 'General info' is displayed

	#Step 5 Save document
	When the user clicks on the 'Save Button'
	Then the user validates that the 'Side Panel Tab' with value 'Main constraints' is displayed
	
	When the user clicks on the 'Toolbar Error Icon'
	Then the user validates that 'Pop Up Text in Grid Containing' with value one 'Notifications' and value two '<ErrMsg1>' is visible
	And the user validates that 'Pop Up Text in Grid Containing' with value one 'Notifications' and value two '<ErrMsg2>' is visible
	And the user validates that 'Pop Up Text in Grid Containing' with value one 'Notifications' and value two '<ErrMsg3>' is visible
	When the user clicks on 'Popup Button' with value 'Cancel'


	#Step 6
	And the user clicks on 'Side Panel Tab' with value 'Benefits'
	Then the user validates that the 'Side Panel Tab' with value 'Benefits' is displayed
	When the user clicks on 'Top Tab' with value 'Benefit brackets'
	And the user clicks on 'Button Link' with value 'Threshold'
	Then the user validates that the 'Input By Label Name' with value 'Number of times' is displayed
	When the user enters '50.00' in field 'Input By Label Name' with value 'Number of times'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the 'Node' with value '<ThresholdNode>' is visible

	When the user clicks on 'Node' with value '<ThresholdNode>'
	And the user clicks on 'Button Link' with value 'Benefit Group'
	And the user clicks on 'Input By Label Name' with value 'Description'
	And the user enters 'Ben1' in field 'Input By Label Name' with value 'Description'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value '<ThresholdNode>' -> '<groupNode>' is visible

	When the user clicks on 'Node' with value '<groupNode>'
	And the user clicks on 'Button Link' with value 'Benefit'
	Then the user validates that the 'Popup' with value 'Benefit' is displayed
	When the user moves the focus away from the element
	Then the user validates that the 'Input By Label Name' with value 'Benefit type' is visible
	And the user validates that the 'Input By Label Name' with value 'Benefit' is visible
	When the user clicks on 'Generic Drop Down Trigger' with value 'Benefit type'
	And the user select value '3 - % Discount on Order Row' from dropdown list 'Generic Drop Down Trigger'
	And the user enters '10.00' in field 'Input By Label Name' with value 'Benefit'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Benefit reason'
	And the user select value 'Channel Discount' from dropdown list 'Generic Drop Down Trigger'
	And the user moves the focus away from the element
	And the user clicks on 'Generic Drop Down Trigger' with value 'Benefit sub-reason'
	And the user select value 'By Formats' from dropdown list 'Generic Drop Down Trigger'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value '<ThresholdNode>' -> '<groupNode>' -> '% Discount on Order Row - 10%' is visible

	When the user clicks on the 'Toolbar Error Icon'
	Then the user validates that 'Pop Up Text in Grid Containing' with value one 'Notifications' and value two '<ErrMsg1>' is visible
	And the user validates that 'Pop Up Text in Grid Containing' with value one 'Notifications' and value two '<ErrMsg2>' is visible
	And the user validates that the 'Pop Up Text in Grid Containing' with value one 'Notifications' and value two '<ErrMsg3>' is not visible
	When the user clicks on 'Popup Button' with value 'Cancel'
	
	#step 7
	When the user clicks on 'Side Panel Tab' with value 'Main constraints'
	Then the user validates that the 'Side Panel Tab' with value 'Main constraints' is displayed
	When the user clicks on 'Node' with value '<Basket1>'
	And the user clicks on 'Button Link' with value 'AND'
	And the user clicks on 'Node' with value 'AND => <Basket1> => AND'
	And the user clicks on 'Button Link' with value 'Add Leaf'
	Then the user validates that the 'Popup' with value 'Leaf constraint' is displayed
	And the user validates that the 'Mandatory Icon' with value 'Object' is visible
	And the user validates that the 'Mandatory Icon' with value 'Attribute' is visible
	When the user clicks on 'Input By Label Name' with value 'Object'
	And the user enters 'Order Row' in field 'Input By Label Name' with value 'Object'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Attribute'
	And the user enters 'GROSSAMOUNT - Gross Amount' in field 'Input By Label Name' with value 'Attribute'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Value'
	And the user enters '100.00' in field 'Input By Label Name' with value 'Value'
	And the user moves the focus away from the element

	And the user clicks on 'Popup Button' with value 'OK'
	Then  the user validates that the 'Node' with value 'AND => <Basket1> => AND => Order Row - Gross Amount = 100' is visible

	#Step 8
	When the user clicks on the 'Toolbar Error Icon'
	Then the user validates that 'Pop Up Text in Grid Containing' with value one 'Notifications' and value two '<ErrMsg2>' is visible
	And the user validates that the 'Pop Up Text in Grid Containing' with value one 'Notifications' and value two '<ErrMsg1>' is not visible
	When the user clicks on 'Popup Button' with value 'Cancel'

	#step 9
	When the user clicks on 'Side Panel Tab' with value 'Valorization'
	Then the user validates that the 'Side Panel Tab' with value 'Valorization' is displayed

	When the user clicks on the hierarchical node with the value '<Basket3>'
	And the user clicks on 'Button Link' with value 'Remove'
	Then the user validates that the 'Alert Dialog Message Box' is visible
	When the user clicks on the 'Alert Dialog Yes Button'
	Then the user validates that the 'Node' with value 'AND' is not shown
	And the user validates that the 'Node' with value 'AND => <Basket3>' is not shown
	When the user clicks on the 'Toolbar Error Icon'
	Then the user validates that the 'Pop Up Text in Grid Containing' with value one 'Notifications' and value two '<ErrMsg1>' is not visible

	#Step 10
	When the user closes the page and saves the work done

	Examples:
	| ErrMsg1                                                          | ErrMsg2                                                      | ErrMsg3                                | ThresholdNode                   | groupNode                                    | Basket1                                  | Basket3                              |
	| Cannot save because there is an empty basket in Main constraints | Cannot save because there is an empty basket in Valorization | Cannot save because benefit is missing | Thresholds - Number of times 50 | Group Ben1 - Cost 50 - Max Number of Times 0 | Sum - Order Row - Quantity >= 10 CARTONS | Count Distinct - Product - Brand = 2 |