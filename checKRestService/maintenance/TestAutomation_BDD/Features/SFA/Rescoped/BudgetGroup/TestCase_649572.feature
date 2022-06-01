Feature: TestCase_649572

@SFA_Nightly @BDD_649572 @SFA_Retest
Scenario: WEB_SFA_SF_BUDGET_014_OWNERS_TAB_LOGIC
	Given the user navigates to the 'Budget Group' page
	When the user adds a new budget group where Budget Group Code is retrieved, Topology: '<Topology>', Description: '<Description>', Measure Unit: '<MeasureUnit>', Default Initial Value: '<DefaultInitialUnit>'

	And the user selects Owner tab User row number '1'
	And the user moves the focus away from the element
	Then the user validates that the checkbox cell in the Owner Tab in row number '1' is editable
	And the user validates that the checkbox cell in the Owner Tab in row number '1' is selected

	And the user validates that the Owners Tab Column: 'Initial Value' has a value of '1000' in row number: '1'
	And the user validates that the Owners Tab Column: 'Assigned Value' has a value of '1000' in row number: '1'
	And the user validates that the Owners Tab Column: 'Current Balance' has a value of '1000' in row number: '1'

	And the user validates that the Owners Tab Column: 'Initial Value' in row number: '1' is editable
	And the user validates that the Owners Tab Column: 'Assigned Value' in row number: '1' is readonly
	And the user validates that the Owners Tab Column: 'Current Balance' in row number: '1' is readonly

	When the user selects Owner tab User row number '2'
	Then the user validates that the Owners Tab Column: 'Initial Value' has a value of '1000' in row number: '2'

	When the user clicks and enters '1500' into the 'Initial Value' column in the Owners Tab in row numbwr '1'
	Then the user validates that the Owners Tab Column: 'Initial Value' has a value of '1500' in row number: '1'
	And the user validates that the Owners Tab Column: 'Assigned Value' has a value of '1500' in row number: '1'
	And the user validates that the Owners Tab Column: 'Current Balance' has a value of '1500' in row number: '1'

	And the user validates that the the Owners Tab Total Balance in the 'Initial Value' column is '2500'
	And the user validates that the the Owners Tab Total Balance in the 'Current Balance' column is '2500'

	When the user clicks on 'Input By Partial Label Name' with value 'Default initial value'
	And the user enters '2000' in field 'Input By Partial Label Name' with value 'Default initial value'
	And the user moves the focus away from the element
	And the user moves the focus away from 'Input By Partial Label Name' with value 'Default initial value' by pressing tab key

	Then the user validates that the Owners Tab Column: 'Assigned Value' has a value of '2000' in row number: '1'
	And the user validates that the Owners Tab Column: 'Current Balance' has a value of '2000' in row number: '1'

	And the user validates that the Owners Tab Column: 'Assigned Value' has a value of '2000' in row number: '2'
	And the user validates that the Owners Tab Column: 'Current Balance' has a value of '2000' in row number: '2'

	And the user validates that the the Owners Tab Total Balance in the 'Initial Value' column is '4000'
	And the user validates that the the Owners Tab Total Balance in the 'Current Balance' column is '4000'

	And the user validates that the Owners Tab Column: 'Balance Date' has a date value of 'd/m/y' in row number: '1'
	And the user validates that the Owners Tab Column: 'Balance Date' has a date value of 'd/m/y' in row number: '2'

	When the user selects Owner tab User row number '2'
	Then the user validates that the Owners Tab Column: 'Initial Value' in row number: '2' is readonly
	And the user validates that the Owners Tab Column: 'Assigned Value' in row number: '2' is readonly

	And the user validates that the Owners Tab Column: 'Current Balance' in row number: '2' is readonly
	And the user validates that the Owners Tab Column: 'Balance Date' has a value of '' in row number: '2'

	And the user validates that the Owners Tab Column: 'Initial Value' has a value of '0' in row number: '2'
	And the user validates that the Owners Tab Column: 'Assigned Value' has a value of '0' in row number: '2'
	And the user validates that the Owners Tab Column: 'Current Balance' has a value of '0' in row number: '2'

	When the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Input By Partial Label Name' with value 'Default initial value' is disabled

	When the user selects Owner tab User row number '2'
	And the user selects Owner tab User row number '3'
	And the user selects Owner tab User row number '4'
	And the user saves all selected users on the Budget Group Owners tab

	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	And the user changes the status to 'Validate'
	
	Then the user validates that 'Input By Label Name' with value 'Current status' has text 'Valid'
	When the user closes the page and saves the work done

	When the user refreshes the grid for the data to load on the page
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Code', Filter Type: 'Like' retrieved value
	And the user refreshes the grid for the data to load on the page
	And the user selects the nav grid item in row '1'
	And the user clicks on the 'Links Button'
	And the user clicks on 'Text' with value 'Budget Detail'

	And the user selects the nav grid item in row '1'
	And the user clicks on 'Button Link' with value 'Adjust balance'
	Then the user validates that the 'Input By Label Name' with value 'New Balance' is visible

	When the user clicks on 'Input By Label Name' with value 'New Balance'
	And the user enters '3000' in field 'Input By Label Name' with value 'New Balance'
	And the user moves the focus away from 'Input By Label Name' with value 'New Balance' by pressing tab key

	And the user clicks on 'Popup Button' with value 'OK'
	And the user selects the nav grid item in row '1'
	And the user selects the nav grid item in row '3'

	And the user clicks on 'Button Link' with value 'Transfer'
	And the user clicks on the 'Add Button'

	And the user clicks on 'Pop Up Text in Grid' with value one 'Budget detail' and value two 'User4'
	And the user clicks on 'Popup Ok Button' with value 'Budget detail'

	And the user clicks and enters the text '200' in the 'Budget Transfer Budget Destination' multigrid table in the '' column name: 'Transfer value' in row number: '1'
	And the user clicks on 'Popup Ok Button' with value 'Budget Transfer'

	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'

	Then the user validates that 'Input By Label Name' with value 'Total initial value' has text '8,000.00'
	And the user validates that 'Input By Label Name' with value 'Total Balance' has text '9,000.00'

	When the user clicks on 'Side Panel Tab' with value 'Owners'
	Then the user validates that the page with 'Input By Partial Label Name' with value 'Default initial value' is loaded
	And the user validates that the Owners Tab Column: 'Initial Value' has a value of '2000' in row number: '1'
	And the user validates that the Owners Tab Column: 'Assigned Value' has a value of '3000' in row number: '1'
	And the user validates that the Owners Tab Column: 'Current Balance' has a value of '3000' in row number: '1'

	And the user validates that the Owners Tab Column: 'Initial Value' has a value of '2000' in row number: '3'
	And the user validates that the Owners Tab Column: 'Assigned Value' has a value of '1800' in row number: '3'
	And the user validates that the Owners Tab Column: 'Current Balance' has a value of '1800' in row number: '3'
	
	And the user validates that the Owners Tab Column: 'Initial Value' has a value of '2000' in row number: '4'
	And the user validates that the Owners Tab Column: 'Assigned Value' has a value of '2200' in row number: '4'
	And the user validates that the Owners Tab Column: 'Current Balance' has a value of '2200' in row number: '4'

	When the user clicks on the 'Owners Select Drop Down'
	And the user clicks on the 'Owners Select Drop Down - None'

	Then the user validates that the checkbox cell in the Owner Tab in row number '1' is selected
	And the user validates that the checkbox cell in the Owner Tab in row number '2' is not selected
	
	And the user validates that the checkbox cell in the Owner Tab in row number '3' is selected
	And the user validates that the checkbox cell in the Owner Tab in row number '4' is selected

	When the user selects Owner tab User row number '1'
	And the user selects Owner tab User row number '3'

	Then the user validates that the checkbox cell in the Owner Tab in row number '1' is selected
	And the user validates that the checkbox cell in the Owner Tab in row number '3' is selected
	And the user validates that the Owners Tab Column: 'Initial Value' in row number: '1' is editable

	When the user clicks and enters '9000' into the 'Initial Value' column in the Owners Tab in row numbwr '1'
	Then the user validates that the Owners Tab Column: 'Initial Value' has a value of '9000' in row number: '1'

	And the user validates that the Owners Tab Column: 'Assigned Value' has a value of '9000' in row number: '1'
	And the user validates that the Owners Tab Column: 'Current Balance' has a value of '9000' in row number: '1'

	And the user validates that the Owners Tab Column: 'Initial Value' in row number: '4' is readonly
	When the user closes all pages without saving the work done
	Examples: 
	| Topology       | Description | MeasureUnit | DefaultInitialUnit |
	| Products Quota | BUDGET_014  | CARTONS     | 1000               |