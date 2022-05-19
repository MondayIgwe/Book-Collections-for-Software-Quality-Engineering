Feature: TestCase_360161
	Validates the functionality and the text in the 'TagAction' buttons 

@BDD_TC360161 @FRM_Nightly
Scenario: FRM_REFDOC_TAGACTION_001

    # Step 1 - Open a random Ref doc in read-only mode
    Given the user navigates to the 'Reference Docs' page
    When the user opens the grid item in row '1'

    # Step 2 - Go on field examples -> buttons and actions sub tab 
    # Expected results - Tag actions disabled 
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'
    And the user clicks on 'Top Tab' with value 'BUTTONS_ACTIONS'
    Then the user validates the 'Teal Button' is disabled
    And the user validates the 'Orange Button' is disabled
    And the user validates the 'Red Button' is disabled
    And the user validates the 'Green Button' is disabled

    # Step 3 - Check the label present on the tag action control 
    # Expected results - the label is present 
    And the user validates that 'Teal Button Label' is populated with 'LABEL'
    And the user validates that 'Orange Button Label' is populated with 'LABEL'
    And the user validates that 'Red Button Label' is populated with 'LABEL'
    And the user validates that 'Green Button Label' is populated with 'LABEL'
