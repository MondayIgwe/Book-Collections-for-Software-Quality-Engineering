Feature: TestCase_720464
	Validates the functionality of the 'Choose file' field in the Excel Import Utility popup

@BDD_TC720464 @FRM_NoParr_Nightly
Scenario: WEB_FRM_EXCEL_IMPORT_UTILITY_003

    # Step 1 - Login and Open the Main Menu and then open Excel Import Utility tool
    Given the user navigates to the 'Excel import utility' page

    # Step 3 - upload excel file that is not compatible with the import table
    When the user uploads the file 'InvalidData.xlsx' in the 'Choose File Textbox'

    # Expected result - The info message "Upload successful" is displayed inside the popup
    Then the user validates that the element 'Status Bar Textbox' has text 'Upload successful'

    # Step 4 - open Table Name combo and select the table to import data
    When the user select value 'TTESTIMPORT - test' from the combo 'Table Name Combo Trigger Icon'

    # Step 5 - start the import procedure clicking on OK button
    And the user clicks on the 'OK Button'

    # Expected result - The error message "The excel columns do not match the table." should be displayed inside the Excel Import Utility Popup
    Then the user validates that the element 'Status Bar Textbox' has text 'The excel columns do not match the table.'
