Feature: TestCase_199929
	Validates the 'TEXTBOX' field functionality in the Field Examples side panel tab

@BDD_TC199929 @FRM_Nightly
Scenario: FRM_REFDOC_TEXTBOX_002

    # Step 1 - Login and create a new Reference doc from scratch and view it
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '199929'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on the 'Edit Button'

    # Step 2 - Go to 'Field Examples' tab
    And the user clicks on the 'Ref Docs Field Examples Tab'

    # Step 3 - Fill in all the mandatory fields except for the 'Textbox' field and press 'Save'
    And the user select value 'voice1' from the combo 'Combo Textbox Trigger Picker Icon'
    And the user clicks on the 'Available Fields Date Picker Calendar Trigger Icon'
    And the user clicks on the 'Today Button'
    And the user clicks on the 'Field Validation Top Tab'
    And the user enters 'ITAC Test' in the 'Force Uppercase On Validation Textbox'
    And the user clicks on the 'Available Fields Top Tab'
    And the user clicks on the 'Save Button'
    And the user clicks on the 'Error Popup Ok Button' if it exists

    # Validation
    Then the user validates that 'Main Toolbar Error Message Textbox' is populated with 'TEXTBOX: Mandatory field empty'

    # Step 4 - Go to main tab and enter "my first test" on "DES1" textfield 
    When the user clicks on the 'Ref Docs Summary Tab'
    And the user enters 'ITAC Test' in the 'Force Uppercase On Validation Textbox'
    And the user enters 'my first test' in the 'D1 Textbox'

    # Validation
    Then the user validates that the element 'D1 Textbox' has text 'my first test'

    # Step 5 - Press the 'Tab' key
    When the user presses the 'Tab' key on the 'D1 Textbox'

    # Validation
    Then the user validates that 'Home Toolbar Label' text contains 'Reference document'
    And the user validates that 'Home Toolbar Label' text contains 'my first test'
    
    # Step 6 - Enter "test validation" on "DES1" textfield 
    When the user enters 'test validation' in the 'D1 Textbox'

    # Validation
    Then the user validates that the element 'D1 Textbox' has text 'test validation'

    # Step 7 - Press the 'Enter' key
    When the user presses the 'Enter' key on the 'D1 Textbox'

    # Validation
    Then the user validates that 'Home Toolbar Label' text contains 'Reference document'
    And the user validates that 'Home Toolbar Label' text contains 'test validation'

    # Step 8 - Enter "1223wfsdfs#455%^%$#%%**&&&^^!!" on "DES1" textfield and press the tab key
    When the user enters '1223wfsdfs#455%^%$#%%**&&&^^!!' in the 'D1 Textbox'
    And the user presses the 'Enter' key on the 'D1 Textbox'
    
    # Validation
    Then the user validates that the element 'D1 Textbox' has text '1223wfsdfs#455%^%$#%%**&&&^^!!'
    And the user validates that 'Home Toolbar Label' text contains 'Reference document'
    And the user validates that 'Home Toolbar Label' text contains '1223wfsdfs#455%^%$#%%**&&&^^!!'

    # Step 9 - Enter text (378 characters) on "DES1" textfield and press the tab key
    When the user enters '<LongText>' in the 'D1 Textbox'
    And the user presses the 'Tab' key on the 'D1 Textbox'

    # Validation - field does not accept more that 300 characters
    Then the user validates that the 'D1 Textbox' has a number of characters less than '300'

    # Step 10 - Enter text "text box is editable" on "DES1" textfield and moves focus by clicking on the Date 1 field
    When the user enters 'text box is editable' in the 'D1 Textbox'
    And the user clicks on the 'Date 1 Textbox'

    # Step 11 - Set the focus on the D1 field by clicking on it and clear the text on the text field
    And the user clears the text on the 'D1 Textbox'
    And the user presses the 'Tab' key on the 'D1 Textbox'

    # validation - validate that the 'X' icon is not present on the 'D1' field
    Then the user validates 'D1 Textbox Clear Trigger Icon' is not displayed
    
    # Step 12 - Enter any text  on "DES1" textfield and press the Tab key
    When the user enters 'TC 199929' in the 'D1 Textbox'
    And the user presses the 'Tab' key on the 'D1 Textbox'

    # validation - validate that the 'X' icon is not present on the 'D1' field
    Then the user validates that the 'D1 Textbox Clear Trigger Icon' is displayed
    And the user validates the 'D1 Textbox Clear Trigger Icon' is enabled

    # Step 13 - Press the 'X' icon and press the Tab key
    When the user clicks on the 'D1 Textbox Clear Trigger Icon'

    # validation - Validate the text on the D1 field is removed
    Then the user validates the 'D1 Textbox' has no text

    # Step 14 - Enter text 'test automation' into the 'DES1' field
    When the user enters 'test automation' in the 'D1 Textbox'

    # validation - Validate the text on the D1 field is removed
    Then the user validates that the element 'D1 Textbox' has text 'test automation'

    # Step 14 - Fill in all the mandatory fields, save, close and open the Reference doc
    When the user clicks on the 'Ref Docs Field Examples Tab'
    And the user enters 'test automation' in the 'Textbox Textbox'
    When the user clicks on the 'Save Button'
    And the user clicks on the 'Back Button'
    And the user opens the grid item in row '1'

    # validation - Validate the text on the D1 field is removed
    Then the user validates that the element 'D1 Textbox' has text 'test automation'
    And the user validates 'D1 Textbox Clear Trigger Icon' is not displayed
    And the user validates the 'D1 Textbox' is disabled

	Examples: 
	| LongText                                                                                                                                                                                                                                                                                                                                                                                   | 
	| InspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingFRM | 