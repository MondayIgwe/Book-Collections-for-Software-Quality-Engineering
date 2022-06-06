Feature: TestCase_560508
	Validate the Wizard with Validation popup

@BDD_TC560508 @FRM_Nightly @FRM
Scenario: WEB_FRM_WIZARD_POPUP_VALIDATION

    # Step 1 - Navigate to the Reference Docs page
    Given the user navigates to the 'Reference Docs' page

    # Step 2 - Create a Reference 
    When the user creates a Reference doc 'Today' 'Today' 'Test' 'voice1' 'Today' 'Test560508'
    And the user filters the column by column name 'Progressive', 'Like', 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on 'Button' with value 'Edit'

    # Step 3 - Open the Wizard Popup from Header UI
    And the user clicks on 'Button' with value 'Wizard with Validation'

    # Validation
    Then the user validates that the 'Wizard Popup Example Popup' is displayed
    Then the user validates that the element 'Wizard Step' with value '1' is selected
    And 'Popup Title' is populated with 'Wizard Popup Example: WP 1 1/3'
    And the user validates that the 'Popup Button' with value 'Back' is disabled
    And the user validates that the 'Popup Button' with value 'Cancel' is enabled
    And the user validates that the 'Popup Button' with value 'Next' is disabled
    And the user validates that the 'Popup Button' with value 'Confirm' is disabled
    And the user validates that the 'Step 1 TextBox Field Mandatory Icon' is displayed
    And the user validates the 'Step 1 Text Box Field' has no text
    And 'Wizard Popup Example Popup Error Field' is populated with 'Text Box: Mandatory field empty'

    # Step 4 - Fill in the mandatory Text Box field
    When the user enters 'ITAC Test' in the 'Step 1 Text Box Field'
    And the user moves the focus away from the element

    # Validation
    Then the user validates that the 'Popup Button' with value 'Next' is enabled

    # Step 5 - Click the 'Next' button
    When the user clicks on 'Popup Button' with value 'Next'

    # Validation
    Then the user validates that the element 'Wizard Step' with value '2' is selected
    And 'Popup Title' is populated with 'Wizard Popup Example: WP 2 2/3'
    And the user validates that the 'Popup Button' with value 'Back' is enabled
    And the user validates that the 'Popup Button' with value 'Cancel' is enabled
    And the user validates that the 'Popup Button' with value 'Next' is disabled
    And the user validates that the 'Popup Button' with value 'Confirm' is disabled
    And the user validates that the 'Step 2 TextBox Field Mandatory Icon' is displayed
    And the user validates the 'Step 2 Text Box Field' has no text
    And 'Wizard Popup Example Popup Error Field' is populated with 'Text Box: Mandatory field empty'

    # Step 6 - Fill in the mandatory Text Box field
    When the user enters 'ITAC Test' in the 'Step 2 Text Box Field'
    And the user moves the focus away from the element

    # Validation
    Then the user validates that the 'Popup Button' with value 'Next' is enabled

     # Step 7 - Click the 'Next' button
    When the user clicks on 'Popup Button' with value 'Next'

    # Validation
    Then the user validates that the element 'Wizard Step' with value '3' is selected
    And 'Popup Title' is populated with 'Wizard Popup Example: WP 3 3/3'
    And the user validates that the 'Popup Button' with value 'Back' is enabled
    And the user validates that the 'Popup Button' with value 'Cancel' is enabled
    And the user validates that the 'Popup Button' with value 'Next' is disabled
    And the user validates that the 'Popup Button' with value 'Confirm' is disabled
    And the user validates that the 'Step 3 TextBox Field Mandatory Icon' is displayed
    And the user validates the 'Step 3 Text Box Field' has no text
    And 'Wizard Popup Example Popup Error Field' is populated with 'Text Box: Mandatory field empty'

    # Step 8 - Fill in the mandatory Text Box field
    When the user enters 'ITAC Test' in the 'Step 3 Text Box Field'
    And the user moves the focus away from the element

    # Validation
    Then the user validates that the 'Popup Button' with value 'Back' is enabled
    And the user validates that the 'Popup Button' with value 'Cancel' is enabled
    And the user validates that the 'Popup Button' with value 'Next' is disabled
    And the user validates that the 'Popup Button' with value 'Confirm' is enabled

    # Step 9 - Click the 'Back' button
    When the user clicks on 'Popup Button' with value 'Back'

    # Validation
    Then the user validates that the element 'Wizard Step' with value '2' is selected
    And the user validates that the 'Popup Button' with value 'Back' is enabled
    And the user validates that the 'Popup Button' with value 'Cancel' is enabled
    And the user validates that the 'Popup Button' with value 'Next' is enabled
    And the user validates that the 'Popup Button' with value 'Confirm' is disabled
    And 'Popup Title' is populated with 'Wizard Popup Example: WP 2 2/3'

     # Step 10 - Click the 'Back' button
    When the user clicks on 'Popup Back Button' with value 'Wizard Popup Example: WP 2 2/3'

    # Validation
    Then the user validates that the element 'Wizard Step' with value '1' is selected
    And 'Popup Title' is populated with 'Wizard Popup Example: WP 1 1/3'
    And the user validates that the 'Popup Button' with value 'Back' is disabled
    And the user validates that the 'Popup Button' with value 'Cancel' is enabled
    And the user validates that the 'Popup Button' with value 'Next' is enabled
    And the user validates that the 'Popup Button' with value 'Confirm' is disabled
    

    # Step 11 - Click the 'Next' button
    When the user clicks on 'Popup Button' with value 'Next'

    # Step 12 - Click the 'Next' button
    When the user clicks on 'Popup Button' with value 'Next'

    # Step 13 - Click the 'Next' button
    When the user clicks on 'Popup Button' with value 'Confirm'

    # Validation - The Wizard Popup is not displayed
    Then the user validates that the 'Button' with value 'Confirm' is not present