Feature: TestCase_600236

@BDD_600236 @SFA_Nightly
Scenario: WEB_SFA_SF_BUDGET_001_CREATE_DISCOUNTS_BUDGET
	Given the user navigates to the 'Budget Group' page
	When the user clicks on the 'Add Button'

	Then the user validates that the page with 'Input By Label Name' with value 'Code' is loaded
	And the user validates that the 'Input By Label Name' with value 'Code' is visible
	And the user validates that the 'Input By Label Name' with value 'Typology' is visible
	And the user validates that the 'Input By Label Name' with value 'Owner Level' is visible
	And the user validates that the 'Input By Label Name' with value 'Validity period' is visible

	And the user validates that the 'Input By Label Name' with value 'Code' is enabled
	And the user validates that the 'Input By Label Name' with value 'Typology' is enabled
	And the user validates that the 'Input By Label Name' with value 'Owner Level' is enabled
	And the user validates that the 'Input By Label Name' with value 'Validity period' is enabled

	And the user validates that the 'Mandatory Icon' with value 'Code' is visible
	And the user validates that the 'Mandatory Icon' with value 'Typology' is visible
	And the user validates that the 'Mandatory Icon' with value 'Owner Level' is visible
	And the user validates that the 'Mandatory Icon' with value 'Validity period' is visible

	And the user validates that 'Input By Label Name' with value 'Typology' has text 'Free goods'
	And the user validates that 'Input By Label Name' with value 'Owner Level' has text 'Sales rep'
	
	And the user validates that 'Period Input By Label Name' with value one 'Validity period' and value two 'start' has date text 'd/m/y'
	And the user validates that 'Period Input By Label Name' with value one 'Validity period' and value two 'end' has date text '01/01/2100'

	When the user clicks on 'Generate Button' with value 'Code'

	And the user clicks on 'Input By Label Name' with value 'Typology'
	And the user enters '<TypologyDValue>' in field 'Input By Label Name' with value 'Typology'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Code'
	And the user enters '<BdgGroupCode>' in field 'Input By Label Name' with value 'Code'
	And the user moves the focus away from the element

	And the user selects validity period from: 'd-1/m/y' to: '01/01/2100' on the 'Generic Drop Down Trigger' with value 'Validity period' without validation
	Then the user validates that 'Period Input By Label Name' with value one 'Validity period' and value two 'start' has date text 'd/m/y'

	When the user selects validity period from: 'd+1/m/y' to: '01/01/2100' on the 'Generic Drop Down Trigger' element with value 'Validity period'
	And the user clicks on 'Popup Button' with value 'OK'

	Then the user validates that the page with 'Input By Label Name' with value 'Description' is loaded
	And the user validates that the 'Input By Label Name' with value 'Description' is visible

	And the user validates that 'Input By Label Name' with value 'Code' contains text '<BdgGroupCode>'
	And the user validates that 'Input By Label Name' with value 'Typology' contains text '<TypologyDValue>'
	And the user validates that 'Input By Label Name' with value 'Owner level' contains text '<Owner>'
	And the user validates that 'Input By Label Name' with value 'Total initial value' contains text '<NumericValue>'
	And the user validates that 'Input By Label Name' with value 'Total Balance' contains text '<NumericValue>'

	And the user validates that the 'Input By Label Name' with value 'Description' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Description' is visible

	And the user validates that 'Period Input By Label Name' with value one 'Validity period' and value two 'start' has date text 'd+1/m/y'
	And the user validates that 'Period Input By Label Name' with value one 'Validity period' and value two 'end' has date text '01/01/2100'

	And the user validates that the 'Input By Label Name' with value 'Validity period' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Validity period' is visible

	And the user validates that 'Input By Label Name' with value 'Measure unit' has text '<UM>'
	And the user validates that the 'Input By Label Name' with value 'Measure unit' is enabled
	And the user validates that the 'Input By Label Name' with value 'Measure unit' is visible

	And the user validates that the 'Input By Label Name' with value 'Budget measure' is not shown
	And the user validates that the 'Input By Label Name' with value 'Event Typology' is not shown
	And the user validates that the 'Input By Label Name' with value 'Positive movement %' is not shown

	And the user validates that the 'Checkbox By Label' with value 'Mandatory for order Taken' is visible
	And the user validates that the checkbox container 'Checkbox By Label' with value 'Mandatory for order Taken' is set to the state: 'OFF'

	And the user validates that the 'Checkbox By Label' with value 'Allow negative' is visible
	And the user validates that the checkbox container 'Checkbox By Label' with value 'Allow negative' is set to the state: 'OFF'

	And the user validates that the 'Checkbox By Label' with value 'Usable by subordinates' is not shown
	And the user validates that the 'Checkbox By Label' with value 'Block order if used by subordinates' is not shown

	When the user clicks on 'Input By Label Name' with value 'Description'
	And the user enters '<BdgGroupDescription>' in field 'Input By Label Name' with value 'Description'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Measure unit'
	And the user enters '<MeasureUnitValue>' in field 'Input By Label Name' with value 'Measure unit'
	And the user moves the focus away from the element

	When the user clicks on 'Side Panel Tab' with value 'Owners'

	And the user clicks on 'Grid CheckBox' with value 'AANASTASIEI'
	And the user clicks on 'Side Panel Tab' with value 'General Info'

	Then the user validates that the 'Input By Label Name' with value 'Measure unit' is enabled
	When the user clicks on 'Button' with value 'Save'

	Then the user validates that the 'Input By Label Name' with value 'Description' is enabled
	And the user validates that the 'Input By Label Name' with value 'Validity period' is enabled

	And the user validates that the 'Checkbox By Label' with value 'Usable by subordinates' is not shown
	And the user validates that the 'Checkbox By Label' with value 'Block order if used by subordinates' is not shown

	And the user validates that the 'Input By Label Name' with value 'Measure unit' is disabled
	When the user closes all pages without saving the work done where there is no pop up
	And the user clicks on the 'Add Button'

	And the user clicks on 'Input By Label Name' with value 'Code'
	And the user enters '<BdgGroupCode>' in field 'Input By Label Name' with value 'Code'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Typology'
	And the user enters '<TypologyDValue>' in field 'Input By Label Name' with value 'Typology'
	And the user moves the focus away from the element

	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the 'Main Toolbar Error Message Field' is visible

	When the user clicks on 'Popup Button' with value 'Cancel'

	Examples:
	| TypologyDValue | BdgGroupCode               | Owner     | NumericValue | UM   | BdgGroupDescription   | MeasureUnitValue | OwnerVal    |
	| Discounts      | WEB_SFA_SF_BUDGET_001_CODE | Sales rep | 0.00         | Euro | WEB_SFA_SF_BUDGET_001 | US Dollar        | AANASTASIEI |