Feature: TestCase_363071
	Create rebate with different filter on target

@mytag
Scenario: Create rebate with different filter on target

    #Step 1
    Given the user is on the 'Dashboard' page
    When the user clicks on the 'User Button'
	And the user retrieves the 'User Description Field' text as 'UserDescription'
	And the user clicks on the 'User Button'
	And the user navigates to the 'Substitutions' page
	And the user clicks on the 'Add Button'

	# Validations
	And the user handles the loading screen
	Then the user validates the 'originalUsers' is mandatory
	Then 'Original Users Textfield' text contains 'UserDescription'
	Then the user validates the 'startDate' is mandatory
	Then the user validates the 'Start Date Textfield' is enabled
	And the user retrieves the 'Start Date Textfield' text as 'StartDate'
	Then the user validates the 'endDate' is mandatory
	Then the user validates the 'End Date Textfield' is enabled
	And the user retrieves the 'End Date Textfield' text as 'EndDate'
	Then the user validates the 'codstatus' is mandatory
	Then the user validates the 'Status Code Textfield' is enabled
	Then the user validates the 'Description Textfield' is enabled
	When the user clicks OK button in the 'New Substitution Popup' popup
	And the user handles the loading screen
	Then the user validates the 'General Division Textfield' is not empty
	Then the user validates the 'General Division Textfield' is disabled
	Then the user validates the 'General ID Textfield' is not empty
	Then the user validates the 'General ID Textfield' is disabled
	# step 4
	Then the user validates the 'Load Button' is enabled

	# step 5 
	And the user selects 'ACIOCAN - Alex Ciocan' in the combo box 'General Info Original Users Textfield'

	# step 6
	# Validation
	Then 'Start Date Textfield' is populated with 'StartDate'

	# step 7
	# Validation
	Then 'End Date Textfield' is populated with 'EndDate'

	# step 8
	When the user creates random text and stores it as 'DescriptionText'
	When the user enters 'DescriptionText' in the 'General Info Description Textfield'

	# Validation
	Then 'General Info Description Textfield' is populated with 'DescriptionText'
	
	# step 9
	When the user selects 'Valid' in the combo box 'General Info Status Textfield'

	# Validation
	And the user handles the loading screen
	Then 'General Info Status Textfield' is populated with 'Valid'
	
	# step 10
	When the user clicks on the 'Load Button'

	# step 10
	And the user handles the loading screen
	Then the user validates that the 'General Info Grid Headings' is displayed

	# step 11
	When the user clicks 'Save' and 'Close'
	And the user clicks on the refresh button
	And the user handles the loading screen

	# Validation
	Then the user validates 'Valid' on the grid using 'DESSUBSTITUTION' 'DescriptionText' 'DESSTATUS'