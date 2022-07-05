Feature: TestCase_199918
	Validates the 'Combo' field functionality in the Field Examples side panel tab

@BDD_TC199918 @FRM_Nightly
Scenario: FRM_REFDOC_COMBOBOX_001

    # Step 1 - 3 - Login and create a new Reference doc from scratch and view it
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '199918'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on the 'Edit Button'

    # Step 4 - Go to 'Field Examples' tab
    And the user clicks on the 'Ref Docs Field Examples Tab'

    # Validation - Validate the 'Combo' field is mandatory and is populated with a single value
    Then the user validates that 'Combo Textbox' is populated with '<ComboValue>'
    And the user validates that the 'Combo Textbox Mandatory Icon' is displayed

    # Step 5 - Clear the 'Combo' field text and move focus away from the field
    When the user clears text on the 'Combo Textbox'
    And the user moves the focus away from the element
    
    # Validation - 'Combo' field remains populated with the value
    Then the user validates that the element 'Combo Textbox' has text '<ComboValue>'

    # Step 6 - Fill in the mandatory fields 
    When the user enters 'Test' in the 'Textbox Textbox'
    And the user clicks on the 'Available Fields Date Picker CalendarTrigger'
    And the user clicks on the 'Today Button'
    And the user clicks on the 'Field Validation Top Tab'
    And the user enters 'Test' in the 'Force Uppercase On Validation Textbox'

    # Step 7 - Click on the Save button
    And the user clicks on the 'Save Button'

    # Step 8 - Click on the Back button
    And the user clicks on the 'Back Button'

    # Step 9 -  Re-open the Reference doc
    And the user opens the grid item in row '1'

    # Step 10 - Go to 'Field Examples' tab 
    And the user clicks on the 'Ref Docs Field Examples Tab'

    # Validation - 'Combo' field is mandatory and is populated the old value
    Then the user validates that the 'Combo Textbox Mandatory Icon' is displayed
    Then the user validates that 'Combo Textbox' is populated with '<ComboValue>'
    
	Examples: 
	| Date1  |Date2  | TextboxValue  | ComboValue  | DatePicker  | ForceOnUpperCaseValidation  | 
	| Today  | Today | Test          | voice1      | Today       | test case 199918            | 