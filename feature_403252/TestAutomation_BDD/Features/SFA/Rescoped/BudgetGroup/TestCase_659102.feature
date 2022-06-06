Feature: TestCase_659102

@SFA_Nightly @BDD_659102
Scenario: WEB_SFA_SF_BUDGET_044
	Given the user navigates to the 'Users' page
	When the user adds a new User where User Code: '<User>', User ID: '<User>', User Name: '<User>', Predefined Division: '<Division>', Group: 'Global Group SM1V4', Language code: 'English', Connection type: 'Web Online'
	And the user adds a new User Division where Division: '<Division>', Group: 'MOB_DEFAULT - SFA Mobile Group', Connection type: '4 - Touch'
	Then the user closes the page and saves the work done

	When the user navigates to the 'Budget Group' page
	And the user adds a new budget group where Budget Group Code is retrieved, Topology: '<Topology>', Description: '<Description>', Budget Measures: 'Stock', Default Initial Value: '35000'
	
	And the user filters the column by column name 'Code', 'Like', '<User>'
	And the user clicks on 'Grid CheckBox Containing' with value '<User>'
	Then the user closes the page and saves the work done

	When the user navigates to the 'Users' page
	And the user filters the column by column name 'User Code', 'Like', '<User>'
	And the user opens the grid item in row '1'

	And the user clicks on 'Button' with value 'Edit'
	And the user removes the User Division where Division: '<Division>', Group or Connection type: 'MOB_DEFAULT - SFA Mobile Group'
	Then the user closes the page and saves the work done

	When the user navigates to the 'Budget Group' page
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Code', 'Like' retrieved value
	And the user clicks on 'Grid CheckBox Containing' with value '<Description>'

	And the user clicks on 'Button Link' with value 'Copy'
	And the user retrieves text from element 'Input By Label Name' with value 'Code' and saves it as 'Copied Budget Group'
	And the user clicks on 'Popup Ok Button' with value 'Copy Budget Group'
	
	Then the user is on the 'General Info Tab' page
	And the user validates that 'Input By Label Name' with value 'Code' is read-only
	And the user validates that 'Input By Label Name' with value 'Typology' is read-only
	And the user validates that 'Input By Label Name' with value 'Owner level' is read-only
	And the user validates that 'Input By Label Name' with value 'Total initial value' is read-only
	And the user validates that 'Input By Label Name' with value 'Total Balance' is read-only

	And the user validates that 'Input By Label Name' with value 'Description' is editable
	And the user validates that 'Input By Label Name' with value 'Validity period' is editable
	And the user validates that 'Input By Label Name' with value 'Budget measures' is editable
	And the user validates that 'Checkbox By Label' with value 'Allow negative' is marked as: 'FALSE'
	
	And the user validates that the page with 'Input By Label Name' with value 'Code' is loaded
	And the user validates that 'Input By Label Name' with value 'Code' has text 'Copied Budget Group'
	And the user validates that 'Input By Label Name' with value 'Typology' has text '<Topology>'
	And the user validates that 'Input By Label Name' with value 'Owner level' has text 'Sales rep'
	And the user validates that 'Input By Label Name' with value 'Total initial value' has text '0.00'
	And the user validates that 'Input By Label Name' with value 'Total Balance' has text '0.00'

	And the user validates that 'Input By Label Name' with value 'Description' has text 'Copy of WEB_SFA_SF_BUDGET_044'
	And the user validates that 'Period Input By Label Name' with value one 'Validity period' and value two 'start' has date text 'd/m/y'
	And the user validates that 'Period Input By Label Name' with value one 'Validity period' and value two 'end' has date text '01/01/2100'
	And the user validates that 'Input By Label Name' with value 'Budget measures' has text 'Stock'

	When the user clicks on 'Side Panel Tab' with value 'Owners'
	Then the user validates that 'Input By Partial Label Name' with value 'Default initial value' has text '35,000.00'

	When the user filters the column by column name 'Code', 'Like', '<User>'
	Then the user validates that the 'Grid CheckBox Containing' with value '<User>' is not shown

	When the user opens the Grid Settings Menu option: 'Remove Filter'
	Then the user validates that the 'Grid CheckBox Containing' with date value 'ACAR' is visible

	When the user selects Owner tab User row number '1'
	And the user selects Owner tab User row number '2'
	And the user selects Owner tab User row number '3'

	Then the user validates that the the Owners Tab Total Balance in the 'Initial Value' column is '105000'
	And the user validates that the the Owners Tab Total Balance in the 'Current Balance' column is '105000'

	And the user closes the page and saves the work done

	Examples: 
	| User                           | Division            | Group1             | Topology | Description           |
	| WEB_SFA_SF_BUDGET_044_NEWUSER  | XTEL TPM AUTOMATION | Global Group SM1V4 | SE Quota | WEB_SFA_SF_BUDGET_044 |