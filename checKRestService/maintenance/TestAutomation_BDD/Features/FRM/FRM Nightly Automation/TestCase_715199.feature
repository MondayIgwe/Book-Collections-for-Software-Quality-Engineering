Feature: TestCase_715199
	Validates the functionality of the 'Choose file' field in the Excel Import Utility popup

@BDD_TC715199 @FRM_NoParr_Nightly
Scenario: WEB_FRM_EXCEL_IMPORT_UTILITY_002

    # Step 1 - Login and Open the Main Menu and then open Excel Import Utility tool
    Given the user navigates to the 'Excel import utility' page

    # Step 3 - upload PDF file
    When the user uploads the file 'doc5.pdf' in the 'Input By Label Name' with value 'Choose file'

    # Expected result - The error message "Invalid File Format" should be displayed inside the Excel Import Utility Popup
    Then the user validates that the element 'Status Bar Field' has text 'Invalid file format'

    # Step 4 - upload WORD file
    When the user uploads the file 'doc1.docx' in the 'Input By Label Name' with value 'Choose file'

    # Expected result - The error message "Invalid File Format" should be displayed inside the Excel Import Utility Popup
    Then the user validates that the element 'Status Bar Field' has text 'Invalid file format'

    # Step 4 - upload PPT file
    When the user uploads the file 'doc3.pptx' in the 'Input By Label Name' with value 'Choose file'

    # Expected result - The error message "Invalid File Format" should be displayed inside the Excel Import Utility Popup
    Then the user validates that the element 'Status Bar Field' has text 'Invalid file format'
