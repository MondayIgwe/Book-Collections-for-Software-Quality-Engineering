Feature: Sergio

Test feature

@tag1
Scenario: TEST
    #  Step 1
	Given the user navigates to the 'Reference Docs' page

	# Step 2 - Create a reference doc
    When the user creates a Reference doc 'Today' 'Today' 'Test' 'voice1' 'Today' 'TestSergio'
	And the user filters the column by column name 'Progressive', 'Like', 'ProgressiveValue'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'
	
	Then the user validates the 'Textbox Field' is empty
	And the user validates that the 'Input By Label Name' with value 'TEXTBOX' is empty
	And the user validates the 'Combo Field' is not empty
	And the user validates that the 'Input By Label Name' with value 'Combo' is not empty

	Then the user validates that the 'Input By Label Name' with value 'Numeric box' has a numeric value
	And the user validates the 'Numeric Field' has a numeric value
	And the user validates that the 'Input By Label Name' with value 'Textbox with two actions' has a numeric value
	And the user validates the 'Textbox With Two Actions' has a numeric value

	Then the user validates that the 'Input By Label Name' with value 'TEXTBOX' has a numeric value

	And the user validates the 'Textbox Field' has a numeric value

	# false results
	Then the user validates the 'Textbox Field' is not empty

	And the user validates that the 'Input By Label Name' with value 'TEXTBOX' is not empty

	And the user validates the 'Combo Field' is empty

	And the user validates that the 'Input By Label Name' with value 'Combo' is empty