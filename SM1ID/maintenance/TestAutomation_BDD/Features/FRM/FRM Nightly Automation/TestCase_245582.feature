Feature: TestCase_245582
	Validates Configurable Value Field

@BDD_245582 @FRM_Nightly
Scenario: FRM_REFDOC_CONFIGURABLEVALUE_001

    # Step 1 
    Given the user navigates to the 'Reference Docs' page

    # Step 2
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '225582'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user clicks on the link with value 'ProgressiveValue' on the grid

    # Step 3
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'

    # Validation
    Then the user validates that the 'Input By Label Name' with value 'Configurable Value' is displayed
    And the user validates that the 'Input By Label Name' with value 'Configurable Value' is disabled
    And the user validates that the 'Mandatory Icon' with value 'Configurable Value' is not present

    # Step 4
    When the user clicks on 'Trigger By Field Name' with value 'Configurable Value'

    # Validation
    Then the user validates that the 'Input By Label Name' with value 'Value' is displayed
    And the user validates that the 'Input By Label Name' with value 'Value' is disabled

    # Step 5
    When the user clicks on 'Popup Button' with value 'Cancel'
    And the user clicks on 'Button' with value 'Edit'

    # Validation
    Then the user validates that the 'Input By Label Name' with value 'Configurable Value' is enabled

    # Step 6
    When the user clicks on 'Trigger By Field Name' with value 'Configurable Value'
    And the user enters 'ITAC Test' in field 'Input By Label Name' with value 'Value'
    And the user clicks on 'Popup Button' with value 'OK'

    # Validation
    Then the user validates that 'Input By Label Name' with value 'Configurable Value' contains text 'ITAC Test'