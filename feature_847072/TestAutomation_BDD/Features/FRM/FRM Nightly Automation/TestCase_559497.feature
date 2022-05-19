Feature: TestCase_559497
	Validates the functionality of the Multi Selection with toolbar  list grid section

@BDD_559497 @FRM_Nightly
Scenario: WEB_FRM_LIST_GRID_001

    # Step 1 - 2
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '559497'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on 'Button' with value 'Edit'

    # Step 3
    And the user clicks on 'Side Panel Tab' with value 'Grids Examples'

    # Step 4
    And the user clicks on 'Horizontal Panel Tab' with value 'List Grids'

    # Step 5
    And the user clicks on 'Card Section Arrow Icon' with value 'Multi-Selection with toolbar'
    Then the user validates that the 'Card Section Body' with value 'Multi-Selection with toolbar' is not displayed

    # Step 6
    When the user clicks on 'Card Section Arrow Icon' with value 'Multi-Selection with toolbar'
    Then the user validates that the 'Card Section Body' with value 'Multi-Selection with toolbar' is displayed

    # Step 7
    When the user clicks on 'Card Section Add Button' with value 'Multi-Selection with toolbar'
    Then the user validates that the 'Popup' with value 'Add detail: ' is present

    # Step 8
    When the user enters 'TC559497' in field 'Input By Label Name' with value '[POPUP.v1]'
    And the user clicks on 'Popup Button' with value 'OK'
    Then the user validates that the 'Multi Selection With Toolbar Checkbox' with value 'TC559497' is displayed

    # Step 8
    When the user clicks on 'Multi Selection With Toolbar Checkbox' with value 'TC559497'
    And the user clicks on 'Card Section Remove Button' with value 'Multi-Selection with toolbar'
    And the user clicks on 'Alert Dialog Button' with value 'OK'
    Then the user validates that the 'Multi Selection With Toolbar Checkbox' with value 'TC559497' is not present


