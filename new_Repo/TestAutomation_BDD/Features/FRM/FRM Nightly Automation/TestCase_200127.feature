Feature: TestCase_200127
	Validate that the 'Date Picker' field does not accept wrong format values

	@BDD_TC200127 @FRM_Nightly @FRM
Scenario: FRM_REFDOC_DATEPICKER_004

    #  Step 1
	Given the user navigates to the 'Reference Docs' page

	# Step 2 - Create a reference doc
    When the user creates a Reference doc 'Today' 'Today' 'Test' 'voice1' 'Today' 'Test200127'
	And the user filters the column by column name 'Progressive', 'Like', 'ProgressiveValue'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'

	# View the Reference Doc
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'
	When the user enters '<Numeric>' in the 'Available Fields Date Picker Field'
	And the user moves the focus to the 'Save Button'
	Then the user validates that the 'Error Popup' is displayed
	When the user clicks on the 'Error Popup Ok Button'
	Then the user validates the 'Available Fields Date Picker Field' has no text

	# Step 2
	When the user enters '<Text>' in the 'Available Fields Date Picker Field'
	And the user moves the focus to the 'Save Button'
	Then the user validates that the 'Error Popup' is displayed
	When the user clicks on the 'Error Popup Ok Button'
	Then the user validates the 'Available Fields Date Picker Field' has no text

	# Step 3
	When the user enters '<InvalidDate>' in the 'Available Fields Date Picker Field'
	And the user moves the focus to the 'Save Button'
	Then the user validates that the 'Error Popup' is displayed
	When the user clicks on the 'Error Popup Ok Button'
	Then the user validates the 'Available Fields Date Picker Field' has no text

	# Step 4
	When the user enters '<WrongFormatDate>' in the 'Available Fields Date Picker Field'
	And the user moves the focus to the 'Save Button'
	Then the user validates that the 'Error Popup' is displayed
	When the user clicks on the 'Error Popup Ok Button'
	Then the user validates the 'Available Fields Date Picker Field' has no text

	# Step 5
	When the user enters '<WrongDate>' in the 'Available Fields Date Picker Field'
	And the user moves the focus to the 'Save Button'
	Then the user validates that the 'Error Popup' is displayed
	When the user clicks on the 'Error Popup Ok Button'
	Then the user validates the 'Available Fields Date Picker Field' has no text

	Examples: 
	| Numeric | Text | InvalidDate | WrongFormatDate | WrongDate    | 
	| 23      | test | 08/02       | 16/02/2019      | 100/100/2018 | 