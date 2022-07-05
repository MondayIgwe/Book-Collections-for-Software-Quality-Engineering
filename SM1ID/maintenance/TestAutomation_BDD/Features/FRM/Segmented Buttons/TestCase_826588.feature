Feature: TestCase_826588
	When NAVIGATE_EDIT right is enabled on customer master navigator, the document must be directly in edit mode with.
	Segmented Buttons must be available with EDIT button selected

Scenario: SEGMENTED_BUTTONS_NAVIGATE_EDIT_RIGHT_ENABLED
	
	#Step 1, 2 and 3
	Given the user is on the 'Customer Master' page
    When the 'Customer Master Title' is visible
	And the user filters the column by column name 'Customer Code', 'Like', '<CustomerCodeExample>'
	And the user handles the loading screen
    And the user clicks on the link value '<Name>' on the grid
    Then the user is on the 'Main Information' page     
	And the user handles the loading screen

	#Step 4
	Then the user validates the 'View Segmented Button' is enabled
	And the user validates the 'Edit Segmented Button' is enabled
	And the user validates the 'Edit Segmented Button' is pressed
	And the user validates the 'Toolbar Save Button' is enabled
	
	#Step 5
	When the user enters '<SalesAreaExample>' in the 'Sales Area Field'
	And the user clicks on the 'Toolbar Save Button'

	#Step 6
	And the user clicks on the 'View Segmented Button'
    Then the user validates that 'Sales Area Field' is read-only

	#Step 7
	When the user clicks on the 'Back Button'
    
	#Step 8
	And the user filters the column by column name 'Customer Code', 'Like', '<CustomerCodeExample>'
	And the user handles the loading screen
    And the user clicks on the link value '<Name>' on the grid
	Then the user is on the 'Main Information' page     
	And the user handles the loading screen
	Then the user validates the 'View Segmented Button' is enabled
	And the user validates the 'Edit Segmented Button' is enabled
	And the user validates the 'Toolbar Save Button' is enabled
    And 'CustomerCodeExample' is populated with '<SalesAreaExample>'


	Examples: 
	 | CustomerCodeExample            | SalesAreaExample | Name      |
	 | 000000000000000160606124838324 | DIRECT CUSTOMERS | Warehouse |