﻿Feature: TestCase_200215
	Validate the 'Num 1' field

@BDD_TC200215 @FRM_Nightly
Scenario: FRM_REFDOC_NUMERIC_002

    # Step 1 
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '200125'
    And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'

    # Step 2 
    And the user clicks on the link with value 'ProgressiveValue' on the grid
    And the user clicks on 'Button' with value 'Edit'
    # Step 3
    And the user enters '1.00' in field 'Input By Label Name' with value 'Num 1'
    And the user moves the focus to the 'Save Button'
    Then the user validates that 'Input By Label Name' with value 'Num 1' has text '1.00'

    # Step 4
    When the user enters '230.25' in field 'Input By Label Name' with value 'Num 1'
    And the user moves the focus to the 'Save Button'
    Then the user validates that 'Input By Label Name' with value 'Num 1' has text '230.25'

    # Step 5
    When the user enters '11111.00' in field 'Input By Label Name' with value 'Num 1'
    And the user moves the focus to the 'Save Button'
    Then the user validates that 'Input By Label Name' with value 'Num 1' has text '11111.00'

    # Step 6
    When the user enters '1000000.00' in field 'Input By Label Name' with value 'Num 1'
    And the user moves the focus to the 'Save Button'
    Then the user validates that 'Input By Label Name' with value 'Num 1' has text '1000000.00'

    # Step 7
    When the user enters '12456.00' in field 'Input By Label Name' with value 'Num 1'
    And the user moves the focus to the 'Save Button'
    Then the user validates that 'Input By Label Name' with value 'Num 1' has text '12456.00'

    # Step 8
    When the user enters '-1.00' in field 'Input By Label Name' with value 'Num 1'
    And the user moves the focus to the 'Save Button'
    Then the user validates that 'Input By Label Name' with value 'Num 1' has text '-1.00'

    # Step 9
    When the user enters '-1245.12' in field 'Input By Label Name' with value 'Num 1'
    And the user moves the focus to the 'Save Button'
    Then the user validates that 'Input By Label Name' with value 'Num 1' has text '-1245.12'

    

    
    

    



