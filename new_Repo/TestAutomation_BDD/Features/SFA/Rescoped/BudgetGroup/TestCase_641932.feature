Feature: TestCase_641932


@SFA_Nightly @BDD_641932
Scenario: WEB_SFA_SF_BUDGET_009_CREATE_OPEN_RULE_FOR_FREE_GOODS_BUDGET
	Given the user navigates to the 'Budget Group' page
	When the user adds a new budget group where Budget Group Code is retrieved, Topology: '<Topology>', Owner Level: '<OwnerLevel>',Description: '<Description>', Measure Unit: '<MeasureUnit>'

	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Current status'
	And the user clicks on 'Radio Button' with value 'Validate'

	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that 'Input By Label Name' with value 'Current status' has text 'Valid'
	When the user clicks on 'Side Panel Tab' with value 'General Info'
	
	And the user clicks on the 'Add Button'
	Then the user validates that the page with 'Section' with value 'Valorization' is loaded
	And the user validates that 'Home Toolbar Label' text contains '<Description>'

	Then the user validates that 'Input By Label Name' with value 'Code' is read-only
	And the user validates that the 'Input By Label Name' with value 'Code' is not empty
	When the user retrieves text from element 'Input By Label Name' with value 'Code' and saves it as 'RuleCode'

	Then the user validates that 'Input By Label Name' with value 'Status' is editable
	And the user validates that 'Input By Label Name' with value 'Status' has text 'Active'

	And the user validates that 'Input By Label Name' with value 'Application Type' is read-only
	And the user validates that 'Input By Label Name' with value 'Application Type' has text 'Automatic'

	And the user validates that 'Checkbox' with value 'Target discount' is read-only
	And the user validates that the 'Checkbox' with value 'Target discount' is not selected

	And the user validates that the 'Side Panel Tab Container' with value 'Excluded actions' is not displayed
	And the user validates that the 'Side Panel Tab Container' with value 'Benefits' is not displayed

	And the user validates that 'Input By Label Name' with value 'Description' has text '<Description>'
	And the user validates that 'Input By Label Name' with value 'Advanced Pricing Book' has text '999999999 - Budget Group'

	And the user validates that 'Period Input By Label Name' with value one 'Valid Period' and value two 'start' has date text 'd/m/y'
	And the user validates that 'Period Input By Label Name' with value one 'Valid Period' and value two 'end' has date text '01/01/2100'

	And the user validates that 'Checkbox' with value 'Post application action' is read-only
	And the user validates that the 'Checkbox' with value 'Post application action' is not selected

	And the user validates that 'Input By Label Name' with value 'Valorization Type' is read-only
	And the user validates that 'Input By Label Name' with value 'Valorization Type' has text 'Quantity'

	And the user validates that 'Input By Label Name' with value 'Measure Unit' is editable
	And the user validates that 'Input By Label Name' with value 'Measure Unit' has text '<MeasureUnit>'

	And the user validates that 'Checkbox' with value 'Maximum Bracket Only' is read-only
	And the user validates that the element 'Checkbox' with value 'Maximum Bracket Only' is selected

	When the user populates the 'Valorization Attribute' field with: 'Quantity'
	And the user selects validity period 'd+5/m/y' '27/12/2099' on the 'Generic Drop Down Trigger' element with value 'Valid Period'

	And the user clicks on 'Side Panel Tab' with value 'Customers'
	And the user clicks on 'Top Tab' with value 'Customer Attributes'
	
	And the user clicks on 'Top Tab' with value 'Inclusion Rules (0)'
	And the user clicks on the 'Add Button'

	And the user selects from the 'Sales Area' drop down grid menu the 'B2B' option
	And the user clicks on 'Popup Button' with value 'OK'
	
	And the user clicks on 'Side Panel Tab' with value 'Valorization'
	Then the user validates that the hierarchical node with value 'AND' -> 'Order Row - Row Type = Free' is visible
	And the user closes the page and saves the work done

	And the user validates that the 'Text in Grid' with value 'RuleCode' is visible
	And the user validates that the 'Text in Grid' with value '<Description>' is visible
	And the user validates that the 'Text in Grid' with value 'Active' is visible
	
	And the user validates that the 'Contains Text in Grid' with date value 'd+5/m/y' is visible
	And the user validates that the 'Contains Text in Grid' with date value '27/12/2099' is visible
	And the user validates that the 'Text in Grid' with value 'Automatic' is visible

	And the user closes the page and saves the work done
	When the user filters the column by column name 'Code', 'Like' retrieved value
	And the user opens the grid item in row '1'

	Then the user validates that the page with 'Section' with value 'Rules' is loaded
	And the user validates that the 'Section' with value 'Rules' is visible

	When the user opens the grid item in row '1'
	Then the user validates that the page with 'Section' with value 'Benefits' is loaded
	
	And the user validates that the 'Button' with value 'Edit' is not displayed
	And the user closes all pages without saving the work done where there is no pop up
	And the user closes all pages without saving the work done where there is no pop up

	Examples:
	| Topology   | OwnerLevel | Description           | MeasureUnit |
	| Free goods | KA         | WEB_SFA_SF_BUDGET_009 | PACKS       |