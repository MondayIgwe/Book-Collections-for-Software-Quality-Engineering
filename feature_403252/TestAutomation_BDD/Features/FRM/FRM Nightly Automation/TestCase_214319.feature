Feature: TestCase_214319
	Validates the New Product Group fields
    Validates the functionality of the 'Code Field Number Generator Button'
    Validates the 'Text Area Field' in Reference Docs

@BDD_TC214319 @FRM_Nightly @FRM
Scenario: FRM_REFDOC_TEXTBOXACTION_001

    # Step 1
	Given the user navigates to the 'Product Groups' page

    # Step 2
    When the user clicks on the 'Add Button'
    Then the user validates that the 'Popup' with value 'New Product Group' is displayed
    And the user validates that the 'Input By Label Name' with value 'Code' is enabled
    And the user validates that the 'Mandatory Icon' with value 'Code' is displayed

    # Step 3
    When the user clicks on the 'Code Field Number Generator Button'
    Then the user validates that the 'Input By Label Name' with value 'Code' has a numeric value

    # Step 4
    When the user clicks on the 'Code Field Clear Button'
    And the user moves the focus away from the element
    Then the user validates that the 'Input By Label Name' with value 'Code' has no text

    # Step 5
    When the user clicks on 'Popup Cancel Button' with value 'New Product Group'
    And the user navigates to the 'Reference Docs' page
    When the user opens the grid item in row '1'
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'
    Then the user validates that the 'Input By Label Name' with value 'TEXT ACTION' is disabled