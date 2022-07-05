Feature: TestCase_1141356
	Check Excel Export in standard grids

@BDD_TC1141356 @FRM_Nightly
Scenario: WEB_FRM_EXCEL_EXPORT_IN_STANDARD_GRIDS

    # Step 1 - Login and create a new Reference doc from scratch and view it
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '197396'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user opens the grid item in row '1'
    # Switch to edit mode and select Grids Examples Tab
    And the user clicks on 'Button' with value 'Edit'
    And the user clicks on 'Side Panel Tab' with value 'Grids Examples'

    # Click on Context Menu of the grid and export the entire grid
    And the user clicks on the 'Grid Settings Menu'
    And the user clicks on the 'Excel Export'
    Then the user validates that 'Alert Dialog Message Box' is populated with 'Export data ?'
    When the user clicks on the 'Alert Dialog Yes Button'