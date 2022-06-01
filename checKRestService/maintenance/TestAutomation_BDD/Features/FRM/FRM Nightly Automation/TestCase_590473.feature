Feature: TestCase_590473
	
    Check fixed header field from reference doc UI

@BDD_590473 @FRM_Nightly
Scenario: WEB_FRM_TAB_LEVEL_FIXED_HEADER

    #Open reference docs navigator -> Open reference doc UI in read only and go on main tab
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '203947'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user clicks on the link with value 'ProgressiveValue' on the grid
    Then the user validates that 'Input By Label Name' with value 'Tab level fixed Header' is read-only
 
    #View the document in Edit mode
    When the user clicks on 'Button' with value 'Edit'

    #Write text into fixed header field and check if it's populated correctly
    And the user enters 'field is editable' in field 'Input By Label Name' with value 'Tab level fixed Header'
    And the user moves the focus away from the element
    Then the user validates that 'Input By Label Name' with value 'Tab level fixed Header' has text 'field is editable'

    #Clear-out the field and check if the fixed header field is empty
    When the user clears the text on the 'Input By Label Name' with value 'Tab level fixed Header'
    Then the user validates that the 'Input By Label Name' with value 'Tab level fixed Header' has no text