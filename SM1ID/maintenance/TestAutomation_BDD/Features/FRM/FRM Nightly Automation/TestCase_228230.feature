Feature: TestCase_228230
	Validates the 'Primary' checkbox column functionality 'Notes/Attachments' tab


@BDD_TC228230 @FRM_Nightly
Scenario: FRM_REFDOC_CHECKBOXCOLUMN_001

    # Step 1 - Login and create a new Reference doc from scratch and view it
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '228230'
    And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user clicks on the link with value 'ProgressiveValue' on the grid
    And the user clicks on 'Button' with value 'Edit'

    # Step 3 - Go on Notes/Attachments tab and then navigate to Attachments sub tab
    And the user clicks on 'Side Panel Tab' with value 'Notes / Attachments'
    And the user clicks on 'Top Tab' with value 'Attachments'

    # Step 4 - Add an URL attachment with primary flag as FALSE
    And the user adds an attachment with Subject: 'TC228230 Url' Source: 'Url' File name or URL: 'https://en.wikipedia.org/wiki/Selenium_(software)#/media/File:Seleniumlogo.png' Primary Checkbox state: 'false'

    # Step 5 - Add an URL attachment with primary flag as TRUE
    And the user adds an attachment with Subject: 'TC228230 Image' Source: 'File' File name or URL: 'img1.jpg' Primary Checkbox state: 'true'
    
    # Expected result - URL attachment is added and shown in the attachments grid marked as primary flag = FALSE
    Then the user validates that the grid has the checkbox cell marked as 'false' in the 'Primary' column with row value of 'TC228230 Url'

    # Expected result - IMG attachment is added and shown in the attachments grid marked as primary flag = TRUE
    And the user validates that the grid has the checkbox cell marked as 'true' in the 'Primary' column with row value of 'TC228230 Image'

    # Step 6 - Insert values for all the mandatory fields and then save the changes
    When the user clicks on 'Side Panel Tab' with value 'Field Examples'
    And the user enters 'Test' in field 'Input By Label Name' with value 'TEXTBOX'
    And the user clicks on 'Generic Drop Down Trigger' with value 'Date Picker'
    And the user clicks on the 'Today Button'
    And the user clicks on 'Top Tab' with value 'Field Validation'
    And the user enters 'Test' in field 'Input By Label Name' with value 'Force Uppercase on validation'
    And the user clicks on 'Button' with value 'Save'

    # Step 7 - Click on back button and then reopen the same reference doc GUI in read only
    And the user clicks on the 'Back Button'
    And the user opens the grid item in row '1'
    And the user clicks on 'Side Panel Tab' with value 'Notes / Attachments'
    And the user clicks on 'Top Tab' with value 'Attachments'

    # Expected result - URL attachment is added and shown in the attachments grid marked as primary flag = FALSE
    Then the user validates that the grid has the checkbox cell marked as 'false' in the 'Primary' column with row value of 'TC228230 Url'

    # Expected result - IMG attachment is added and shown in the attachments grid marked as primary flag = TRUE
    And the user validates that the grid has the checkbox cell marked as 'true' in the 'Primary' column with row value of 'TC228230 Image'

    # Step 8 - Click on edit button, go on Primary Column (SM1.LogicalCheckboxColumn) and set primary flag = TRUE for the URL attachment
    When the user clicks on 'Button' with value 'Edit'
    And the user clicks on column 'Primary' with row text 'TC228230 Url'

    # Expected result - URL attachment is added and shown in the attachments grid marked as primary flag = TRUE
    Then the user validates that the grid has the checkbox cell marked as 'true' in the 'Primary' column with row value of 'TC228230 Url'

    # Expected result - IMG attachment is added and shown in the attachments grid marked as primary flag = FALSE
    And the user validates that the grid has the checkbox cell marked as 'false' in the 'Primary' column with row value of 'TC228230 Image'