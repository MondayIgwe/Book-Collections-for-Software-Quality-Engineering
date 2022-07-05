Feature: TestCase_715197
	Validates the functionality of the 'Choose file' field in the Excel Import Utility popup

@BDD_TC715197 @FRM_NoParr_Nightly
Scenario: WEB_FRM_EXCEL_IMPORT_UTILITY_001

    # Step 1 - 2  Login and Open the Main Menu and then open Excel Import Utility tool
    Given the user navigates to the 'Excel import utility' page

    # Validation 
    # Excel Import Utility popup is opened.
    # ALL the fields and checkboxes are disabled
    Then the user validates the 'Table Name Textbox' is disabled
    And the user validates the 'Remove Existing Data Checkbox' is disabled
    And the user validates the 'Worksheet Textbox' is disabled
    And the user validates the 'First Row Contains Column Name Checkbox' is disabled
    And the user validates the 'Insert Or Update Checkbox' is disabled

    # Step 3 - upload a compatible excel file
    When the user uploads the file 'ValidData.xlsx' in the 'Choose File Textbox'

    # Expected result - Info message "Upload Successful" is displayed
    Then the user validates that the element 'Status Bar Textbox' has text 'Upload successful'

    # Step 4 - select the table name and flag "Remove Existing Data" checkbox as TRUE 
    When the user select value 'TTESTIMPORT - test' from the combo 'Table Name Combo Trigger Icon'
    And the user checks the 'Remove Existing Data Checkbox'

    # Step 5 - click the OK button starting the import procedure
    And the user clicks on the 'OK Button'

    # Validation - 
    Then the user validates that the element 'Alert Dialog Message Box' has text 'This will delete the existing data. Do you wish to continue?'

    # Step 6 - click on Yes button
    When the user clicks on the 'Yes Button'

    # Validation - Info message "the import was started" should be displayed for a moment and excel file will be successfully imported into the target table
    Then the user validates that the element 'Status Bar Textbox' has text 'Import successful'

    # Step 7 - upload a compatible excel file
    When the user uploads the file 'ValidData.xlsx' in the 'Choose File Textbox'

    # Step 8 - select the table name and flag "Remove Existing Data" checkbox as TRUE 
    When the user select value 'TTESTIMPORT - test' from the combo 'Table Name Combo Trigger Icon'
    And the user checks the 'Remove Existing Data Checkbox'

    # Step 9 - click on NO button available on warning message popup
    And the user clicks on the 'No Button'

    # Validation - the user will be redirected to Excel Import Utility popup. Flag "Remove existing data" is still checked
    Then the user validates that the 'Import Excel Utility Popup' is displayed
    And the user validates that the checkbox 'Remove Existing Data Checkbox' is Checked

    # Step 10 - try to flag both "remove existing data" and "Insert or update"
    # Validation - you are not able to flag both. if you flag one, the other one is toggle unflagged
    When the user checks the 'Insert Or Update Checkbox'
    Then the user validates that the checkbox 'Remove Existing Data Checkbox' is not Checked
    When the user checks the 'Remove Existing Data Checkbox'
    Then the user validates that the checkbox 'Insert Or Update Checkbox' is not Checked

    # Step 11 - flag "Insert or Update" checkbox as TRUE
    When the user checks the 'Insert Or Update Checkbox'

    # Step 12 - Click on Import button 
    And the user clicks on the 'OK Button'

    # Validation - Info message "the import was started" should be displayed for a moment and excel file will be successfully imported into the target table. existing records from TTESTIMPORT have been updated.
    Then the user validates that the element 'Status Bar Textbox' has text 'Import successful'

    # Step 13 - upload an compatible excel file and select destination table
    When the user uploads the file 'ValidData.xlsx' in the 'Choose File Textbox'
    And the user select value 'TTESTIMPORT - test' from the combo 'Table Name Combo Trigger Icon'

    # Step 13 - flag "First row contains column name" checkbox as TRUE
    And the user checks the 'First Row Contains Column Name Checkbox'

    # Step 15 - click on Import button
    And the user clicks on the 'OK Button'

    # Validation - Info message "the import was started" should be displayed for a moment and excel file will be successfully imported into the target table. TTESTIMPORT table has been updated and Info message "Import Successful" should be displayed.
    Then the user validates that the element 'Status Bar Textbox' has text 'Import successful'