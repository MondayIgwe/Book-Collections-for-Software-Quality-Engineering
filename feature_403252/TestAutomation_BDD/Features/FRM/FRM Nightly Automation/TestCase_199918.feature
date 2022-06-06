Feature: TestCase_199918
	Validates the 'Combo' field functionality in the Field Examples side panel tab

@BDD_TC199918 @FRM_Nightly
Scenario: FRM_REFDOC_COMBOBOX_001

    # Step 1 - 3 - Login and create a new Reference doc from scratch and view it
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc '<Date1>' '<Date2>' '<TextboxValue>' '<ComboValue>' '<DatePicker>' '<ForceOnUpperCaseValidation>'
    When the user filters the column by column name 'Progressive', 'Like', 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on 'Button' with value 'Edit'

    # Step 4 - Go to 'Field Examples' tab
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'

    # Validation - Validate the 'Combo' field is mandatory and is populated with a single value
    Then 'Combo Field' is populated with '<ComboValue>'
    And the user validates that the 'Mandatory Icon' with value 'Combo' is displayed

    # Step 5 - Clear the 'Combo' field text and move focus away from the field
    When the user clears the text on the 'Input By Label Name' with value 'Combo'
    And the user moves the focus away from the element
    
    # Validation - 'Combo' field remains populated with the value
    Then the user validates that 'Input By Label Name' with value 'Combo' has text '<ComboValue>'

    # Step 6 - Fill in the mandatory fields 
    When the user enters 'Test' in field 'Input By Label Name' with value 'TEXTBOX'
    And the user clicks on the 'Date Picker Calendar Icon'
    And the user clicks on the 'Today Button'
    And the user clicks on 'Horizontal Panel Tab' with value 'Field Validation'
    And the user enters 'Test' in field 'Input By Label Name' with value 'Force Uppercase on validation'

    # Step 7 - Click on the Save button
    And the user clicks on the 'Save Button'

    # Step 8 - Click on the Back button
    And the user clicks on the 'Toolbar Close Button'

    # Step 9 -  Re-open the Reference doc
    And the user opens the grid item in row '1'

    # Step 10 - Go to 'Field Examples' tab 
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'

    # Validation - 'Combo' field is mandatory and is populated the old value
    Then the user validates that the 'Mandatory Icon' with value 'Combo' is displayed
    And the user validates that 'Input By Label Name' with value 'Combo' has text '<ComboValue>'
    
	Examples: 
	| Date1  |Date2  | TextboxValue  | ComboValue  | DatePicker  | ForceOnUpperCaseValidation  | 
	| Today  | Today | Test          | voice1      | Today       | test case 199918            | 