Feature: TestCase_248775
	Validates the 'Field File Picker' upload functionality

@BDD_248775 @FRM_Nightly 
Scenario: FRM_REFDOC_FIELDFILECHOOSER_001

    # Step 1 
    Given the user navigates to the 'Reference Docs' page

    # Step 2 
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '248775'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on 'Button' with value 'Edit'
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'
    
    # Step 3
    And the user uploads the file 'doc1.docx' in the 'Input By Label Name' with value 'File Picker'
    And the user uploads the file 'doc5.pdf' in the 'Input By Label Name' with value 'File Picker'
    And the user uploads the file 'img1.jpg' in the 'Input By Label Name' with value 'File Picker'
    And the user uploads the file 'doc2.xls' in the 'Input By Label Name' with value 'File Picker'
    And the user uploads the file 'doc3.pptx' in the 'Input By Label Name' with value 'File Picker'

