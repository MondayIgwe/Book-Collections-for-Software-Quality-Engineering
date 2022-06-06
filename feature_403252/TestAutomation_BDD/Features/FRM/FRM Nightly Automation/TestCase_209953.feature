Feature: TestCase_209953
	Validates the 'Toast Controls' in the Field Examples tab

@BDD_TC209953 @FRM_Nightly
Scenario: FRM_REFDOC_TOAST_NOTIFICATION_001

    # Step 1 - 2 - Login and open a Ref doc in Edit mode
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc '<Date1>' '<Date2>' '<TextboxValue>' '<ComboValue>' '<DatePicker>' '<ForceOnUpperCaseValidation>'
    When the user filters the column by column name 'Progressive', 'Like', 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on 'Button' with value 'Edit'

    # Step 3 - Go to 'Field Examples' tab then 'Toast Controls' sub tab
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'
    And the user clicks on 'Horizontal Panel Tab' with value 'TOAST_CONTROLS'

    # Step 4 - Click on button that trigger an "Informational" toast message
    And the user clicks on 'Button' with value 'Info toast'

    # Expected Result - INFO toast popup is triggered and shown by the system 
    Then the user validates that the 'Info Toast Message' is displayed

    # Step 5 - Click on button that trigger an "Warning" toast message
    When the user clicks on 'Button' with value 'Warning toast'

    # Expected Result - WARNING toast popup is triggered and shown by the system 
    Then the user validates that the 'Warning Toast Message' is displayed

    # Step 6 - Click on button that trigger an "Error" toast message
    When the user clicks on 'Button' with value 'Error toast'

    # Expected Result - ERROR toast popup is triggered and shown by the system 
    Then the user validates that the 'Error Toast Message' is displayed

    # Step 7 - Click on button that trigger an "Success" toast message
    When the user clicks on 'Button' with value 'Success toast'

    # Expected Result - SUCCESS toast popup is triggered and shown by the system 
    Then the user validates that the 'Success Toast Message' is displayed

	Examples: 
	| Date1  |Date2  | TextboxValue  | ComboValue  | DatePicker  | ForceOnUpperCaseValidation  | 
	| Today  | Today | Test          | voice1      | Today       | test case 209953            | 