Feature: TestCase_769049
	Validates the functionality of the 'Text Area With Script Configuration' field

@BDD_TC769049 @FRM_Weekly
Scenario: WEB_FRM_FIELD_LABEL_REFRESH

    # Step 1 - 2 Login to Xtel and Open the main menu and open Reference Docs navigator 
    Given the user navigates to the 'Reference Docs' page

    # Step 3 - Create new reference document, close it. Filter the navigator by this new reference document and then reopen it in edit mode
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '769049'
    And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on 'Button' with value 'Edit'

    # Step 4 - Select "Field Examples" tab
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'

    # Step 5 - Type this @Text into text area field
    And the user enters '<Text>' in the 'Text Area With Script Configuration'

    # Step 6 - Loose Focus
    And the user moves the focus away from the element

    # Expected result - Text Area Label is automatically updated with @Text
    Then the user validates that the element 'Text Area With Script Configuration' has text 'Text Area Label:'

    Examples: 
    |  Text            |
    |  Text Area Label:|