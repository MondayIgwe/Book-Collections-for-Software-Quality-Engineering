Feature: TestCase_224091
	Validates the 'Filter Maker' functionality

@BDD_TC224091 @FRM_Nightly
Scenario: FRM_REFDOC_FIELDFILTERMAKER_002

    # Step 1 - 2 - Login and create a new Reference doc from scratch and view it in Edit mode
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '224091'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user clicks on the link with value 'ProgressiveValue' on the grid
    And the user clicks on 'Button' with value 'Edit'

    # Step 3 - Go on field examples tab and open field filter maker popup (with flag mandatory save = FALSE configured )
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'
    And the user clicks on 'Generic Drop Down Trigger' with value 'Complete Filter Maker'

    # Step 4 - Create and set following constraint, after that click ok button
    And the user adds a filter with Attribute: 'Division' Operator: 'Equal' Value: 'E001'
    And the user clicks on 'Popup Button' with value 'Save'
    And the user enters 'FRM_REFDOC_FIELDFILTERMAKER_002' in field 'Input By Label Name' with value 'Filter Name'
    And the user moves the focus away from 'Input By Label Name' with value 'Filter Name' by pressing tab key
    And the user clicks on 'Popup Ok Button' with value 'Save Filter'
    And the user clicks on 'Popup Ok Button' with value 'Filter Maker'

    # Step 5 - Click on X button to remove filter applied 
    And the user clicks on 'Trigger Clear Button' with value 'Complete Filter Maker'

    # Expected result - "No filter" placeholder is shown in the input of field filter maker 
    Then the user validates that 'Input By Label Name' with value 'Complete Filter Maker' has text 'No filter'
    
    # Step 6 - go and open field filter maker popup (with flag mandatory save = TRUE configured )
    When the user clicks on 'Generic Drop Down Trigger' with value 'Limited Filter Maker'

    # Step 7 - load a SavedFilterName and apply it
    And the user clicks on 'Popup Button' with value 'Load'
    And the user clicks on 'Filter' with value 'FRM_REFDOC_FIELDFILTERMAKER_002'
    And the user clicks on 'Popup Ok Button' with value 'Load filter'
    And the user clicks on 'Popup Ok Button' with value 'Filter Maker'

    # Step 8 - Click on X button to remove filter applied 
    And the user clicks on 'Trigger Clear Button' with value 'Limited Filter Maker'

    # Expected result - "No filter" placeholder is shown in the input of field filter maker 
    Then the user validates that 'Input By Label Name' with value 'Complete Filter Maker' has text 'No filter'
