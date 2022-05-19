Feature: TestCase_226346

@BDD_TC226346 @FRM
Scenario: FRM_REFDOC_FIELDFILTERMAKER_004

    # Step 1 - 2 Login to Xtel and Open the main menu and open Reference Docs navigator 
    Given the user navigates to the 'Reference Docs' page

    # Step 3 - Create new reference document, close it. Filter the navigator by this new reference document and then reopen it in edit mode
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '769049'
    And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on 'Button' with value 'Edit'

    # Step 4 - Create a filter @Attribute @Operator @Value and apply it; have a look at the input of field filter maker
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'
    And the user clicks on 'Generic Drop Down Trigger' with value 'Complete Filter Maker'
    And the user adds a filter with Attribute: '<Attribute>' Operator: '<Operator>' Value: '<Value>'
    And the user clicks on 'Popup Save Button' with value 'Filter Maker'
    And the user enters 'TC226346' in field 'Input By Label Name' with value 'Filter Name'
    And the user moves the focus away from 'Input By Label Name' with value 'Filter Name' by pressing tab key
    And the user clicks on 'Popup Ok Button' with value 'Save Filter'
    And the user clicks on 'Popup Ok Button' with value containing 'Filter Maker'

    # Expected result - The name of the existing filter is shown in the input of field filter maker
    Then the user validates that 'Input By Label Name' with value 'Complete Filter Maker' contains text 'TC226346'

    # Step 5 - reopen field filter maker with flag mandatory save = FALSE and create constraint ; click     on New Filter Set button -> click OK button 
    When the user clicks on 'Trigger Clear Button' with value 'Complete Filter Maker'
    And the user clicks on 'Generic Drop Down Trigger' with value 'Complete Filter Maker'
    And the user adds a filter with Attribute: 'Country' Operator: 'Equal' Value: 'South Africa' 
    And the user clicks on 'Popup New Filter Set Button' with value containing 'Filter Maker'
    And the user clicks on 'Popup Ok Button' with value containing 'Filter Maker'

    # Expected result - "Custom Constraints" shown in the input of the field filter maker
    Then the user validates that 'Input By Label Name' with value 'Complete Filter Maker' contains text 'Custom Constraints'

    # Step 6 - create other constraint and save the new filter, afterwards, apply it
    When the user clicks on 'Trigger Clear Button' with value 'Complete Filter Maker'
    And the user clicks on 'Generic Drop Down Trigger' with value 'Complete Filter Maker'
    And the user adds a filter with Attribute: 'Country' Operator: 'Equal' Value: 'Romania'
    And the user clicks on 'Popup Save Button' with value 'Filter Maker'
    And the user enters 'Romania' in field 'Input By Label Name' with value 'Filter Name'
    And the user moves the focus away from 'Input By Label Name' with value 'Filter Name' by pressing tab key
    And the user clicks on 'Popup Ok Button' with value 'Save Filter'
    And the user clicks on 'Popup Ok Button' with value containing 'Filter Maker'
  
    # Expected result - The name of saved filter is shown in the input of field filter maker
    Then the user validates that 'Input By Label Name' with value 'Complete Filter Maker' contains text 'Romania'

    Examples: 
    |  Attribute        |Operator        |Value        |
    | Division          | Equal          | E001        |