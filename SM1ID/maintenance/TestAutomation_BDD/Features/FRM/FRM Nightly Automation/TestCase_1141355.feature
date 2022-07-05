Feature: TestCase_1141355
	Check Excel Export in navigators

@BDD_TC1141355 @FRM_Nightly
Scenario: WEB_FRM_EXCEL_EXPORT_IN_NAVIGATORS

    # Step 1 - Open Customer master navigator
    Given the user navigates to the 'Customer Master' page

    # Click on Context Menu of the grid and export the entire grid
    When the user clicks on the 'Grid Settings Menu'
    And the user clicks on the 'Excel Export'
    Then the user validates that 'Alert Dialog Message Box' is populated with 'Export data ?'
    When the user clicks on the 'Alert Dialog Yes Button'