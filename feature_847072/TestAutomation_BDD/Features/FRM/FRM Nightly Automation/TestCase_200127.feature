Feature: TestCase_200127
	Validate that the 'Date Picker' field does not accept wrong format values

	@BDD_TC200127 @FRM_Nightly @FRM
Scenario: FRM_REFDOC_DATEPICKER_004

    #  Step 1 - open reference doc UI in edit mode and go on main tab -> go on empty date picker field and write @Numeric -> lose focus 
	Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '200127'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'
	And the user enters '<Numeric>' in the 'Available Fields Date Picker Field'
	And the user moves the focus to the 'Save Button'

	# Expected result -  
	# error message "invalid date" triggered and displayed
    # the system automatically remove the invalid date and date picker remains empty 
	Then the user validates that the 'Error Popup' is displayed
	When the user clicks on the 'Error Popup Ok Button'
	Then the user validates the 'Available Fields Date Picker Field' has no text

	# Step 2 - write this @Text -> lose focus 
	When the user enters '<Text>' in the 'Available Fields Date Picker Field'
	And the user moves the focus to the 'Save Button'

	# Expected result -  
	# error message "invalid date" triggered and displayed
    # the system automatically remove the invalid date and date picker remains empty 
	Then the user validates that the 'Error Popup' is displayed
	When the user clicks on the 'Error Popup Ok Button'
	Then the user validates the 'Available Fields Date Picker Field' has no text

	# Step 3 - write this @InvalidDate  -> lose focus  
	When the user enters '<InvalidDate>' in the 'Available Fields Date Picker Field'
	And the user moves the focus to the 'Save Button'

	# Expected result -  
	# error message "invalid date" triggered and displayed
    # the system automatically remove the invalid date and date picker remains empty 
	Then the user validates that the 'Error Popup' is displayed
	When the user clicks on the 'Error Popup Ok Button'
	Then the user validates the 'Available Fields Date Picker Field' has no text

	# Step 4 - write a date with this @WrongFormatDate DD/MM/YYYY e.q. 15/08/2018 -> lose focus 
	When the user enters '<WrongFormatDate>' in the 'Available Fields Date Picker Field'
	And the user moves the focus to the 'Save Button'

	# Expected result -  
	# error message "invalid date" triggered and displayed
    # the system automatically remove the invalid date and date picker remains empty 
	Then the user validates that the 'Error Popup' is displayed
	When the user clicks on the 'Error Popup Ok Button'
	Then the user validates the 'Available Fields Date Picker Field' has no text

	# Step 5 - write a @WrongDate -> lose focus  
	When the user enters '<WrongDate>' in the 'Available Fields Date Picker Field'
	And the user moves the focus to the 'Save Button'

	# Expected result -  
	# error message "invalid date" triggered and displayed
    # the system automatically remove the invalid date and date picker remains empty 
	Then the user validates that the 'Error Popup' is displayed
	When the user clicks on the 'Error Popup Ok Button'
	Then the user validates the 'Available Fields Date Picker Field' has no text

	Examples: 
	| Numeric | Text | InvalidDate | WrongFormatDate | WrongDate    | 
	| 23      | test | 08/02       | 16/02/2019      | 100/100/2018 | 