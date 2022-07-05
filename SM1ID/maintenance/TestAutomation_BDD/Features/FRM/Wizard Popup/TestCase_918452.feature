Feature: TestCase_918452

Logical Wizard Popup component works as designed 

Scenario: WEB_FRM_LOGICAL_WIZARD_POPUP

    # Step 1 
    Given the user is on the 'Reference Docs' page

    # Step 2 
    When the user clicks on the 'Add Button'
    And the user selects 'Today' from calendar icon 'Date 1 Calendar Icon'
    And the user selects 'Today' from calendar icon 'Date 2 Calendar Icon'
    And the user clicks OK button in the 'Reference Doc Detail Popup' popup
    Then the user is on the 'Summary' page
    When the user selects 'Today' from calendar icon 'Event Test Type Calendar Icon'
    And the user clicks on the 'Transactional Data Button'
    And the user retrieves the 'Progressive Field' text as 'ProgressiveValue'
    And the user clicks on the 'Field Examples'
    Then the user is on the 'Available Fields Tab' page
    When the user enters 'ITAC Test' in the 'Textbox Field'
    And the user selects 'voice1' in the combo box 'Combo Field'
    And the user clicks on the 'Field Validation Button'
    Then the user is on the 'Field Validation Tab' page
    And the user enters 'ITAC TEST' in the 'Force Upper Case Field'
    Then the user clicks on the 'Toolbar Save Button'
    And the user clicks on the 'Back Button'
    Then the user is on the 'Reference Docs' page
    And the user filters the column by column name 'Progressive', 'like', 'ProgressiveValue'
    And the user clicks on the link value 'ProgressiveValue' on the grid
    And the user clicks on the 'Edit Segmented Button'

    # Step 3
    And the user clicks on the 'WizardWithExampleButton'

    # Validation
    Then the user validates that the 'Wizard Popup Example Popup' is displayed
    And the user validates that the 'Wizard Step 1' is selected
    And the user validates the 'Wizard Popup Next Button' is disabled
    And the user validates the 'Wizard Popup Confirm Button' is disabled
    And the user validates the 'Wizard Popup Back Button' is disabled
    And the user validates the 'Wizard Popup Cancel Button' is enabled
    And 'Wizard Popup Example Title Field' is populated with 'Wizard Popup Example: WP 1 1/3'

    # Validation
    Then the user validates the 'Wizard Popup Next Button' is enabled

    # Step 5
    When the user clicks on the 'Wizard Popup Next Button'

    # Validation
    Then the user validates that the 'Wizard Step 2' is selected
    And the user validates the 'Wizard Popup Next Button' is disabled
    And the user validates the 'Wizard Popup Confirm Button' is disabled
    And the user validates the 'Wizard Popup Back Button' is enabled
    And the user validates the 'Wizard Popup Cancel Button' is enabled
    And 'Wizard Popup Example Title Field' is populated with 'Wizard Popup Example: WP 2 2/3'

    # Validation
    Then the user validates the 'Wizard Popup Next Button' is enabled

     # Step 7
    When the user clicks on the 'Wizard Popup Next Button'

    # Validation
    Then the user validates that the 'Wizard Step 3' is selected
    And the user validates the 'Wizard Popup Next Button' is disabled
    And the user validates the 'Wizard Popup Confirm Button' is enabled
    And the user validates the 'Wizard Popup Back Button' is enabled
    And the user validates the 'Wizard Popup Cancel Button' is enabled
    And 'Wizard Popup Example Title Field' is populated with 'Wizard Popup Example: WP 3 3/3'

    # Step 9
    When the user clicks on the 'Wizard Popup Back Button'

    # Validation
    Then the user validates that the 'Wizard Step 2' is selected
    And the user validates the 'Wizard Popup Next Button' is enabled
    And the user validates the 'Wizard Popup Confirm Button' is disabled
    And the user validates the 'Wizard Popup Back Button' is enabled
    And the user validates the 'Wizard Popup Cancel Button' is enabled
    And 'Wizard Popup Example Title Field' is populated with 'Wizard Popup Example: WP 2 2/3'

     # Step 10
    When the user clicks on the 'Wizard Popup Back Button'

    # Validation
    Then the user validates that the 'Wizard Step 1' is selected
    And the user validates the 'Wizard Popup Next Button' is enabled
    And the user validates the 'Wizard Popup Confirm Button' is disabled
    And the user validates the 'Wizard Popup Back Button' is disabled
    And the user validates the 'Wizard Popup Cancel Button' is enabled
    And 'Wizard Popup Example Title Field' is populated with 'Wizard Popup Example: WP 1 1/3'

    # Step 11
    When the user clicks on the 'Wizard Popup Next Button'

    # Step 12
    When the user clicks on the 'Wizard Popup Next Button'

    # Step 13
    When the user clicks on the 'Wizard Popup Confirm Button'

    # Validation
    Then the user validates 'Wizard Popup Example Popup' is not visible

    # Step 14
    When the user clicks on the 'WizardWithExampleButton'
    When the user clicks on the 'Wizard Popup Cancel Button'

    # Validation
    Then the user validates 'Wizard Popup Example Popup' is not visible