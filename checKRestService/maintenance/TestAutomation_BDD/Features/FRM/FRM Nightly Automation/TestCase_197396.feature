Feature: TestCase_197396
	Validates the 'MULTI-SELECT' and 'SINGLE SELECT' functionality in the 'Field Examples' tab

@BDD_TC197396 @FRM_Nightly
Scenario: FRM_REFDOC_DROPDOWNFIELD_005

    # Step 1 - Login and create a new Reference doc from scratch and view it
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '197396'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on 'Button' with value 'Edit'
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'
    And the user clicks on 'Generic Drop Down Trigger' with value 'Multi select'

    # Step 2 - 
    And the user clicks on 'Dropdown Panel Checkbox' with value 'CUBIC METERS'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'CARTONS'
    And the user moves the focus away from the element


    # Expected result - 
    Then the user validates that 'Input By Label Name' with value 'Multi select' has text 'CARTONS | CUBIC METERS'

    # Step 3 - 
    When the user clicks on 'Generic Drop Down Trigger' with value 'Multi select'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'BOTTLES'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'KILOGRAMS'
    And the user clicks on 'Dropdown Panel Button' with value 'OK'

    # Expected result - 
    Then the user validates that 'Input By Label Name' with value 'Multi select' has text 'BOTTLES | CARTONS | CUBIC METERS | KILOGRAMS'
    
    # Step 4 - 
    When the user clicks on 'Generic Drop Down Trigger' with value 'Multi select'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'BOTTLES'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'KILOGRAMS'
    And the user clicks on 'Dropdown Panel Button' with value 'OK'

    # Expected result - 
    Then the user validates that 'Input By Label Name' with value 'Multi select' has text 'CARTONS | CUBIC METERS'

    # Step 5 - 
    When the user clicks on 'Generic Drop Down Trigger' with value 'Multi select'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'BOTTLES'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'KILOGRAMS'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'LITRES'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'PACKS'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'UNITS'
    And the user moves the focus away from the element

    # Expected result - 
    Then the user validates that 'Input Field Selected Row Count Label' with value 'Multi select' has text 'ALL'

    # Step 6 - 
    When the user clicks on 'Generic Drop Down Trigger' with value 'Multi select'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'BOTTLES'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'CUBIC METERS'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'CARTONS'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'KILOGRAMS'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'LITRES'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'PACKS'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'UNITS'
    And the user clicks on 'Dropdown Panel Button' with value 'OK'

    # Expected result -
    Then the user validates that the 'Input By Label Name' with value 'Multi select' has no text

    # Step 7 
    When the user clicks on 'Generic Drop Down Trigger' with value 'Multi select'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'PACKS'
    And the user clicks on 'Dropdown Panel Button' with value 'Cancel'

     # Expected result -
    Then the user validates that the 'Input By Label Name' with value 'Multi select' has no text

    # Step 8 - 
    When the user clicks on 'Generic Drop Down Trigger' with value 'Single Select'
    And the user clicks on 'Dropdown Panel Item' with value 'BOTTLES'
    Then the user validates that 'Input By Label Name' with value 'Single Select' has text 'BOTTLES'
    And the user validates that the 'Dropdown Panel' is not displayed

    # Step 9 - 
    When the user clicks on 'Generic Drop Down Trigger' with value 'Single Select'
    And the user clicks on 'Dropdown Panel Item' with value 'CARTONS'
    Then the user validates that 'Input By Label Name' with value 'Single Select' has text 'CARTONS'
    And the user validates that the 'Dropdown Panel' is not displayed

    # Step 10 - 
    When the user clicks on 'Generic Drop Down Trigger' with value 'Single Select'
    And the user clicks on 'Dropdown Panel Item' with value 'CUBIC METERS'
    Then the user validates that 'Input By Label Name' with value 'Single Select' has text 'CUBIC METERS'
    And the user validates that the 'Dropdown Panel' is not displayed

    # Step 11 - 
    When the user clicks on 'Generic Drop Down Trigger' with value 'Single Select'
    And the user clicks on 'Dropdown Panel Item' with value 'KILOGRAMS'
    Then the user validates that 'Input By Label Name' with value 'Single Select' has text 'KILOGRAMS'
    And the user validates that the 'Dropdown Panel' is not displayed