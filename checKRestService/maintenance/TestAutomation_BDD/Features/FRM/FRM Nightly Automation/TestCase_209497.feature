Feature: TestCase_209497
	Validates the 'MULTI-vALUE COMBO' functionality

@BDD_TC209497 @FRM_Nightly
Scenario: FRM_REFDOC_COMBOBOX_003

    # Step 1 - 2 - Open Reference Docs Navigator and Open Reference Doc UI in Read Only
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '209497'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user clicks on the link with value 'ProgressiveValue' on the grid

    # Step 3 - Go on Field Examples tab
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'

    # Expected result - 
    # Multi value combo is displayed 
    # Multi value combo is disabled  
    Then the user validates that the 'Input By Label Name' with value 'Multivalue combo' is displayed
    And the user validates that the 'Input By Label Name' with value 'Multivalue combo' is disabled

    # Step 4 - Click on Edit button and Open empty Multi Value combo (SM1.LogicalFieldSelect)
    When the user clicks on 'Button' with value 'Edit'
    And  the user clicks on 'Generic Drop Down Trigger' with value 'Multivalue combo'

    # Step 5 - Select  'voice1', 'voice2' and 'voice3' rows and Click the OK button
    And the user clicks on 'Popup Checkbox' with value 'voice1'
    And the user clicks on 'Popup Checkbox' with value 'voice2'
    And the user clicks on 'Popup Checkbox' with value 'voice3'
    And the user clicks on the 'OK Button'

    # Expected result - Multi Value combo is fill in with the selected values
    Then the user validates that 'Input By Label Name' with value 'Multivalue combo' has text 'voice1 | voice2 | voice3'

    # Step 6 - Re-open Multi Value combo and deselect 'voice1', 'voice2' and 'voice3' rows and Click OK button
    When the user clicks on 'Generic Drop Down Trigger' with value 'Multivalue combo'
    And the user clicks on 'Popup Checkbox' with value 'voice1'
    And the user clicks on 'Popup Checkbox' with value 'voice2'
    And the user clicks on 'Popup Checkbox' with value 'voice3'
    And the user clicks on the 'OK Button'

    # Expected result - Multi Value combo is empty. No value inserted
    Then the user validates that the 'Input By Label Name' with value 'Multivalue combo' has no text

    # Step 7 - Re-open Multi Value combo and select 'voice1', 'voice2' and 'voice3' rows and Click OK button
    When the user clicks on 'Generic Drop Down Trigger' with value 'Multivalue combo'
    And the user clicks on 'Popup Checkbox' with value 'voice1'
    And the user clicks on 'Popup Checkbox' with value 'voice2'
    And the user clicks on 'Popup Checkbox' with value 'voice3'
    And the user clicks on the 'OK Button'

    # Step 8 - Click on X button to remove all the selected values
    And the user clicks on 'Trigger Clear Button' with value 'Multivalue combo'

    # Expected result - Multi Value combo is empty
    Then the user validates that the 'Input By Label Name' with value 'Multivalue combo' has no text
