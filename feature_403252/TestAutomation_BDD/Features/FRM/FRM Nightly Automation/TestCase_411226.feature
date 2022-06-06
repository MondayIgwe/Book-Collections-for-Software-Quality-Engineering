Feature: TestCase_411226
	WEB_FRM_SEARCH_CODARTSOURCE_FIELD_001

@BDD_TC411226 @FRM_NoParr_Nightly
Scenario: WEB_FRM_SEARCH_CODARTSOURCE_FIELD_001
	
	# Step 1, 2
	Given the user navigates to the 'Products' page

	# Step 3
	When the user filters the column by column name 'Product', 'Like', '<Id>'
	And the user clicks on '<Id>' text on the grid

	# Step 4
	And the user clicks on the 'Gui Configurator Button'

	# Step 5
	And the user clicks on the 'Alert Dialog Yes Button' if it exists

	# Step 6
	And the user clicks on the 'Side Panel Settings Icon'
	Then the user validates that the 'Popup' with value 'Gui Configurator' is present

	# Step 7, 8
	When the user clicks on the 'Flattened Tree Tab Search Field'
	And the user enters 'CODARTSOURCE' in the 'Flattened Tree Tab Search Field'
	Then the user validates that the 'Flattened Tree Tab Item' with value 'CODARTSOURCE' is present


	Examples: 
	| Id  |
	| 001 |