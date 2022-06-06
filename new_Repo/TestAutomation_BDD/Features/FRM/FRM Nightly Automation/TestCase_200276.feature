Feature: TestCase_200276
	Validates the 'Multi-Select' field functionality in the Field Examples side panel tab

@BDD_TC200276 @FRM_Nightly
Scenario: FRM_REFDOC_DROPDOWNACTION_001

    # Step 1 - 2 Login, Open a Ref doc in Edit mode
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc 'Today' 'Today' 'Test' 'voice1' 'Today' 'Test'
    When the user filters the column by column name 'Progressive', 'Like', 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on 'Button' with value 'Edit'
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'

    # Step 3 - Open dropdown with multi selection => select one value BOTTLES
    And the user clicks on 'Generic Drop Down Trigger' with value 'Multi select'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'BOTTLES'
    And the user moves the focus away from the element

    # Expected result - one value is selected
    And the user validates that 'Input By Label Name' with value 'Multi select' has text 'BOTTLES'

    # Step 4 - Lose focus by clicking outside the control
    When the user moves the focus away from the element

    # Expected result - BOTTLES is selected, dropdown closed
    Then the user validates that the 'Dropdown Panel' is not displayed
    And the user validates that 'Input By Label Name' with value 'Multi select' has text 'BOTTLES'

    # Step 5 - Re-open dropdown 
    When the user clicks on 'Generic Drop Down Trigger' with value 'Multi select'

    # Expected result - BOTTLES selected
    Then the user validates that 'Input By Label Name' with value 'Multi select' has text 'BOTTLES'

    # Step 6 - select CARTONS -> click on OK button ->Re-open dropdown
    And the user clicks on 'Dropdown Panel Checkbox' with value 'CARTONS'
    And the user clicks on 'Dropdown Panel Button' with value 'OK'
    And the user clicks on 'Generic Drop Down Trigger' with value 'Multi select'

    # Expected result - CARTONS selected, BOTTLES selected
    Then the user validates that 'Input By Label Name' with value 'Multi select' has text 'BOTTLES | CARTONS'


    # Step 7 - deselect all selected rows  -> click OK button -> Re-open dropdown 
    When the user clicks on 'Dropdown Panel Checkbox' with value 'BOTTLES'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'CARTONS'
    And the user clicks on 'Dropdown Panel Button' with value 'OK'
    And the user clicks on 'Generic Drop Down Trigger' with value 'Multi select'

    # Expected result - all rows are deselected 
    Then the user validates that the 'Input By Label Name' with value 'Multi select' has no text

    # Step 8 - Select BOTTLES, CARTONS, CUBIC METRES -> Lose focus -> Re-open dropdown
    When the user clicks on 'Dropdown Panel Checkbox' with value 'BOTTLES'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'CARTONS'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'CUBIC METERS'
    And the user moves the focus away from the element
    And the user clicks on 'Generic Drop Down Trigger' with value 'Multi select'

    # Expected result - BOTTLES, CARTONS, CUBIC METRES rows are selected
    Then the user validates that 'Input By Label Name' with value 'Multi select' has text 'BOTTLES | CARTONS | CUBIC METERS'
 
    # Step 9 - Select BOTTLES, CARTONS, CUBIC METRES, KILOGRAMS, LITRES, PACKS, UNITS
    When the user clicks on 'Dropdown Panel Checkbox' with value 'KILOGRAMS'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'LITRES'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'PACKS'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'UNITS'

    # Step 10 - Click Cancel button -> Re-open dropdown 
    And the user clicks on 'Dropdown Panel Button' with value 'Cancel'
    And the user clicks on 'Generic Drop Down Trigger' with value 'Multi select'

    # Expected result - BOTTLES, CARTONS, CUBIC METRES rows are selected
    Then the user validates that 'Input By Label Name' with value 'Multi select' has text 'BOTTLES | CARTONS | CUBIC METERS'

    # Step 11 - Select BOTTLES, CARTONS, CUBIC METRES, KILOGRAMS, LITRES, PACKS, UNITS -> lose focus 
    When the user clicks on 'Dropdown Panel Checkbox' with value 'KILOGRAMS'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'LITRES'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'PACKS'
    And the user clicks on 'Dropdown Panel Checkbox' with value 'UNITS'
    And the user moves the focus away from the element

    # Expected result - BOTTLES, CARTONS, CUBIC METRES, KILOGRAMS, LITRES, PACKS, UNITS rows are selected
    Then the user validates that 'Input By Label Name' with value 'Multi select' has text 'BOTTLES | CARTONS | CUBIC METERS | KILOGRAMS | LITRES | PACKS | UNITS'