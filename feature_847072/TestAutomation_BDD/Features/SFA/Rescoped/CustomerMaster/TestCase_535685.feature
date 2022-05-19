Feature: TestCase_535685
	Test Case 535685

@BDD_535685 @SFA_Nightly
Scenario: TC_535685_WEB_SFA_MD_CUST_UI_019_RESPONSIBILITY_TAB
	#Step 1
	Given the user navigates to the 'Customer Master' page
	When the user adds a new Customer Master where Action: '<CustomerAction1>', Customer Type: '<CustomerType>', Bill-To: '<BillTo>'
	
	#Step 2
	And the user clicks on 'Top Tab' with value 'Responsibility'
	Then the user validates that the 'Input By Label Name' with value 'Rep ID' is visible
	And the user validates that the 'Input By Label Name' with value 'District Manager ID' is visible
	And the user validates that the 'Input By Label Name' with value 'RKA/RAM' is visible
	And the user validates that the 'Input By Label Name' with value 'NAM' is visible
	And the user validates that the 'Input By Label Name' with value 'HQ Reference' is visible
	
	And the user validates that the 'Mandatory Icon' with value 'Rep ID' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'District Manager ID' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'RKA/RAM' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'NAM' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'HQ Reference' is not displayed

	And the user validates that the 'Input By Label Name' with value 'Rep ID' is disabled
	And the user validates that the 'Input By Label Name' with value 'District Manager ID' is disabled
	And the user validates that the 'Input By Label Name' with value 'RKA/RAM' is disabled
	And the user validates that the 'Input By Label Name' with value 'NAM' is disabled
	And the user validates that the 'Input By Label Name' with value 'HQ Reference' is disabled

	And the user validates that the 'Grid Filter' with value 'User Code' is visible
	And the user validates that the 'Grid Filter' with value 'Responsible' is visible
	And the user validates that the 'Grid Filter' with value 'Start Date' is visible
	And the user validates that the 'Grid Filter' with value 'End Date' is visible
	And the user validates that the 'Grid Filter' with value 'Cancelled' is visible

	#Step 2
	When the user retrieves the 'Input By Label Name' text with value 'Rep ID'
	Then the user validates that the retrieved value is equal to the username currently logged in
	When the user closes all pages without saving the work done

	Examples: 
	| CustomerAction1 | CustomerType               | BillTo   |
	| New customer    | Ship to and point of Sales | 10003052 |