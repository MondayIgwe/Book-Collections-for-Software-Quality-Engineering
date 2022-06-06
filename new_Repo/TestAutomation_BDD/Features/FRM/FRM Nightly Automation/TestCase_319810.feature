Feature: TestCase_319810
	Validates the 'Context Menu' functionality

@BDD_TC319810 @FRM_Nightly
Scenario: FRM_REFDOC_CONTEXTUAL_MENU_001

    # Step 1 - 2 - Login and and open a Reference doc
    Given the user navigates to the 'Reference Docs' page
    When the user opens the grid item in row '1'

    # Step 3 - Click on button with contextual menu integrated
    And the user clicks on 'Button' with value 'CONTEXT MENU'

    # Validation - Context menu is opened
    Then the user validates that the 'Contextual Menu' is displayed

    # Step 4 - select <DisabledValue> 
    # Validation - <DisabledValue> is visible and disabled
    And the user validates that the 'Contextual Menu Item' with value '<DisabledValue>' is displayed
    And the user validates that the 'Contextual Menu Item' with value '<DisabledValue>' is disabled

    # Step 5 - Lose focus
    When the user moves the focus away from the element

    # Validation
    Then the user validates that the 'Contextual Menu' is not present

    # Step 6 - Click on button with contextual menu integrated
    And the user clicks on 'Button' with value 'CONTEXT MENU'

    # Validation - Context menu is opened
    Then the user validates that the 'Contextual Menu' is displayed

    # Step 7 - select <EnabledValue> 
    # Validation - <EnabledValue> is visible and enabled
    And the user validates that the 'Contextual Menu Item' with value '<EnabledValue>' is displayed
    And the user validates that the 'Contextual Menu Item' with value '<EnabledValue>' is enabled
    When the user clicks on 'Contextual Menu Item' with value '<EnabledValue>'
    Then the user validates that an alert is displayed
    
	Examples: 
	| DisabledValue   |EnabledValue  | 
	| Item 2          | Item 3       | 