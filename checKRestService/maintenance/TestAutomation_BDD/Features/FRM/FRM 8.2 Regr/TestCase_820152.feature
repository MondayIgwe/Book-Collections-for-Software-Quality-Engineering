Feature: TestCase_820152
	Validates the filtering functionality for the StringMultiTypeColumn

@BDD_TC820152 @FRM
Scenario: WEB_FRM_FILTERING_STRING_MULTITYPE_COLUMN

    # Step 1 - Open to the Users navigator and open ACONST
    Given the user navigates to the 'Reference Docs' page

    # Step 2 - Create a reference document and view it
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '820152'
    And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on 'Button' with value 'Edit'

    # Step 3 - Select Grids Examples tab
    And the user clicks on 'Side Panel Tab' with value 'Grids Examples'

    # Step 4 - Filter the grid by using this constraint field @LIKE_OPERATOR = E001
    And the user filters the column by column name 'StringMultiTypeColumn', Filter Type 'Like', Value 'E001'

    # Expected result - The grid must be filtered by StringMultiTypeColumn containing E001
    Then the user validates that the grid on Column: 'StringMultiTypeColumn' is filtered by Filter Type: 'Like' for Value: 'E001' 

    # Step 5 - Filter the grid by using this constraint field @NOT_LIKE_OPERATOR = US01
    When the user filters the column by column name 'StringMultiTypeColumn', Filter Type 'Not Like', Value 'US01'

    # Expected result - The grid must be filtered by StringMultiTypeColumn not like US01
    Then the user validates that the grid on Column: 'StringMultiTypeColumn' is filtered by Filter Type: 'Not Like' for Value: 'US01'

    # Step 6 - Filter the grid by using this constraint field @IN_OPERATOR IN = E001;PHARMA
    When the user filters the column by column name 'StringMultiTypeColumn', Filter Type 'In', Value 'E001;PHARMA'

    # Expected result - The grid must be filtered by StringMultiTypeColumn in E001;PHARMA
    Then the user validates that the grid on Column: 'StringMultiTypeColumn' is filtered by Filter Type: 'In' for Value: 'E001;PHARMA'
