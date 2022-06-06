Feature: TestCase_221151
	Validates the functionality of the 'Sec1' section collapse/expand functionality

@BDD_221151 @FRM_Nightly
Scenario: FRM_REFDOC_PANEL_001

    # Step 1 - 2 - Login and open a reference doc in read-only mode
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc '<Date1>' '<Date2>' '<TextboxValue>' '<ComboValue>' '<DatePicker>' '<ForceOnUpperCaseValidation>'
    When the user filters the column by column name 'Progressive', 'Like', 'ProgressiveValue'
    And the user opens the grid item in row '1'

    # Step 3 - Go to 'Panel Examples' tab and then go to 'Table Panel' sub tab
    And the user clicks on 'Side Panel Tab' with value 'Panel Examples'
    And the user clicks on 'Horizontal Panel Tab' with value 'Table Panel'
    Then the user validates that the 'Card Section' with value 'Sec1' is displayed

    # Step 4 - Collapse the 'Sec1' panel
    When the user clicks on 'Card Section Arrow Icon' with value 'Sec1'

    # Validation - 'Sec1' panel is collapsed
    Then the user validates that the 'Card Section Body' with value 'Sec1' is not displayed

    # Step 5 - Expand the 'Sec1' panel
    When the user clicks on 'Card Section Arrow Icon' with value 'Sec1'

    # Validation - 'Sec1' panel is expanded
    Then the user validates that the 'Card Section Body' with value 'Sec1' is displayed
    
	Examples: 
	| Date1  |Date2  | TextboxValue  | ComboValue  | DatePicker  | ForceOnUpperCaseValidation  | 
	| Today  | Today | Test          | voice1      | Today       | test case 221151            | 