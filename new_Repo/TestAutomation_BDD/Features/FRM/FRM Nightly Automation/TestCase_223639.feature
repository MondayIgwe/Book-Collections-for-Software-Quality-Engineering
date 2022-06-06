Feature: TestCase_223639
	Validate filter maker field

@BDD_223639 @FRM_Nightly
Scenario: FRM_REFDOC_FIELDFILTERMAKER_001

    # Step 1 
    Given the user navigates to the 'Reference Docs' page

    # Step 2
    When the user creates a Reference doc 'Today' 'Today' 'Test' 'voice1' 'Today' 'Test'
    And the user filters the column by column name 'Progressive', 'Like', 'ProgressiveValue'
    And the user opens the grid item in row '1'

    # Step 3
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'

    # Validation
    Then the user validates that the 'Input By Label Name' with value 'Complete Filter Maker' is disabled
    And the user validates that the 'Input By Label Name' with value 'Complete Filter Maker' is displayed
    And the user validates that the 'Mandatory Icon' with value 'Complete Filter Maker' is not displayed

    # Step 4
    When the user clicks on 'Button' with value 'Edit'

    # validation
    Then the user validates that the 'Input By Label Name' with value 'Complete Filter Maker' is enabled
    And the user validates that the 'Mandatory Icon' with value 'Complete Filter Maker' is not displayed