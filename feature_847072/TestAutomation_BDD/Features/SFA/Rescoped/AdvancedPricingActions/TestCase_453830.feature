Feature: TC_453830
	Leaf constraint popup opens when click on 'Add leaf' button

@BDD_453830 @SFA_Nightly
Scenario: TC_453830_WEB_SFA_SF_CNVACT_025_
	Given the user navigates to the 'Advanced Pricing Actions' page
	When the user filters the column by column name 'Code', Filter Type 'Like', Value '<Canvass1>'
	And the user opens the grid item in row '1'
	And the user clicks on 'Segmented Button' with value 'Edit'
	Then the user validates that the 'Side Panel Tab' with value 'General info' is present
	
	When the user clicks on 'Side Panel Tab' with value 'Main constraints'
	And the user clicks on 'AND Node' with value '<NodeA1>'
	Then the user validates that the 'Main Constraints Toolbar' with value 'leaf' is enabled
	
	When the user clicks on 'Main Constraints Toolbar' with value 'leaf'
	Then the user validates that the 'Popup' with value '<Title1>' is displayed
	When the user clicks on 'Input By Label Name' with value 'Object'
	And the user enters '<Object1>' in field 'Input By Label Name' with value 'Object'
	And the user moves the focus away from the element
	And the user clicks on 'Input By Label Name' with value 'Attribute'
	And the user enters '<Attribute1>' in field 'Input By Label Name' with value 'Attribute'
	And the user moves the focus away from the element
	Then the user validates that 'Input By Label Name' with value 'Operator' has text 'Equal'
	
	When the user clicks on 'Input By Label Name' with value 'Operator'
	And the user enters '<Operator1>' in field 'Input By Label Name' with value 'Operator'
	And the user moves the focus away from the element
	And the user clicks on 'Input By Label Name' with value 'Value'
	And the user enters '<Value>' in field 'Input By Label Name' with value 'Value'
	And the user moves the focus away from the element

	# Change the Object value into @Object2	
	And the user clicks on 'Input By Label Name' with value 'Object'
	And the user enters '<Object2>' in field 'Input By Label Name' with value 'Object'
	And the user moves the focus away from the element

	# Validate All the other fields values are cleared. (empty value)
	Then the user validates that the 'Input By Label Name' with value 'Attribute' has no text
	And the user validates that the 'Input By Label Name' with value 'Operator' has no text

	When the user clicks on the 'Change Status Cancel Button'
	Then the user validates that the 'Main Constraints Toolbar' with value 'leaf' is enabled
	
	When the user clicks on 'Main Constraints Toolbar' with value 'leaf'
	And the user clicks on 'Input By Label Name' with value 'Object'
	And the user enters '<Object1>' in field 'Input By Label Name' with value 'Object'
	And the user moves the focus away from the element
	And the user clicks on 'Generic Drop Down Trigger' with value 'Attribute'
	And the user select value containing '<Attribute1>' from dropdown list 'Attribute'
	Then the user validates that 'Input By Label Name' with value 'Operator' has text 'Equal'

	When the user clicks on 'Generic Drop Down Trigger' with value 'Operator'
	And the user select value containing '<Operator1>' from dropdown list 'Operator'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Value'
	And the user select value containing '<Value>' from dropdown list 'Value'
    Then the user validates that the hierarchical node with value 'AND' -> 'Order Row - Row Type = Sale' is visible
	
	When the user clicks on 'Button' with value 'OK'
	And the user closes all pages without saving the work done
	Examples: 
	| Canvass1              | NodeA1 | Title1          | Object1   | Attribute1           | Operator1 | Value | Object2 |
	| WEB_SFA_SF_CNVACT_027 | AND    | Leaf constraint | Order Row | CODTYPROW - Row Type | Equal     | Sale  | Product |