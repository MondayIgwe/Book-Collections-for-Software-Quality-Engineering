Feature: TestCase_220548
	Validates the addition of a note "Notes/Attachments" tab

@BDD_TC220548 @FRM_Nightly
Scenario: FRM_REFDOC_NOTES_001

    # Step 1 - Login and create a new Reference doc from scratch and view it
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc 'Today' 'Today' 'Test' 'voice1' 'Today' 'Test220548'
    When the user filters the column by column name 'Progressive', 'Like', 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on 'Button' with value 'Edit'

    # Step  2
    And the user clicks on 'Side Panel Tab' with value 'Notes / Attachments'

    # Step 3 
    And the user clicks on the 'Ref Doc Sub Tab Add Button'
    And the user select value 'A Note' from dropdown list 'Reason type'
    And the user enters 'Note 1' in field 'Input By Label Name' with value 'Note'
    And the user moves the focus away from 'Input By Label Name' with value 'Note' by pressing tab key
    And the user clicks on 'Popup Ok Button' with value 'Add a New Note'

    # Expected result - 
    Then the user validates that column 'Note type' has 'A Note' with row text 'Note 1'

    # Step 4 
    When the user clicks on the 'Ref Doc Sub Tab Add Button'
    And the user select value 'B Note' from dropdown list 'Reason type'
    And the user enters 'Note 2' in field 'Input By Label Name' with value 'Note'
    And the user moves the focus away from 'Input By Label Name' with value 'Note' by pressing tab key
    And the user clicks on 'Popup Ok Button' with value 'Add a New Note'

    # Expected result - 
    Then the user validates that column 'Note type' has 'A Note' with row text 'Note 1'
    And the user validates that column 'Note type' has 'B Note' with row text 'Note 2'

    # Step 5
    When the user clicks on 'Grid Checkbox' with value 'Note 2'
    And the user clicks on the 'Sub Tab Remove Button'
    And the user clicks on 'Alert Dialog Button' with value 'OK'
    Then the user validates that the grid has no text with value 'B Note' on column 'Note type'
   