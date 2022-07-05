Feature: TestCase_650304

@BDD_650304 @SFA_Weekly
Scenario: WEB_SFA_SF_BUDGET_015_OWNERS_TAB_END_DATE_BEHAVIOR
	Given the user navigates to the 'Budget Group' page
	When the user adds a new budget group where Budget Group Code is retrieved, Topology: 'Discounts', Description: 'Budget015'
	
	And the user retrieves the 'Validity Period Start Date' text as 'Start Date'
	And the user retrieves the 'Validity Period End Date' text as 'End Date'
	
	And the user enters a Default Initial Value: '1000' on the Budget Group Owners Tab
	And the user clicks on 'Budget Group Owners Tab Checkbox' with value '1'

	And the user clicks and enters '01/02/2100' into the 'End Date' column in the Owners Tab in row numbwr '1'
	And the user clicks on 'Side Panel Tab' with value 'Owners'

	And the user clicks and enters 'd-1/m/y' into the 'End Date' column in the Owners Tab in row numbwr '1'
	And the user clicks on 'Side Panel Tab' with value 'Owners'
	
	And the user clicks and enters 'd+1/m/y' into the 'End Date' column in the Owners Tab in row numbwr '1'

	And the user clicks on 'Budget Group Owners Tab Checkbox' with value '1'

	And the user clicks on 'Budget Group Owners Tab Checkbox' with value '1'
	And the user clicks on 'Budget Group Owners Tab Checkbox' with value '2'
	And the user clicks on 'Budget Group Owners Tab Checkbox' with value '3'
	And the user clicks on 'Budget Group Owners Tab Checkbox' with value '4'

	And the user clicks and enters '01/01/2100' into the 'End Date' column in the Owners Tab in row numbwr '1'
	And the user clicks on 'Side Panel Tab' with value 'Owners'
	And the user clicks and enters '12/12/2099' into the 'End Date' column in the Owners Tab in row numbwr '2'
	And the user clicks on 'Side Panel Tab' with value 'Owners'
	And the user clicks and enters '12/22/2099' into the 'End Date' column in the Owners Tab in row numbwr '3'
	And the user clicks on 'Side Panel Tab' with value 'Owners'

	And the user clicks on 'Side Panel Tab' with value 'General Info'
	And the user selects validity period from: 'd/m/y' to: '17/12/2099' on the 'Budget Group Validity Period' field
	And the user clicks on 'Side Panel Tab' with value 'Owners'

	Then the user validates that the Owners Tab Column: 'End Date' has a date value of '17/12/2099' in row number: '1'
	And the user validates that the Owners Tab Column: 'End Date' has a date value of '12/12/2099' in row number: '2'
	And the user validates that the Owners Tab Column: 'End Date' has a date value of '17/12/2099' in row number: '3'
	And the user validates that the Owners Tab Column: 'End Date' has no value in row number: '4'

	When the user closes all pages without saving the work done