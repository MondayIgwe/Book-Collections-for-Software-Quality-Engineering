Feature: TestCase_199929
	Validates the 'TEXTBOX' field functionality in the Field Examples side panel tab

@BDD_TC199929 @FRM_Nightly
Scenario: FRM_REFDOC_TEXTBOX_002

    # Step 1 - Login and create a new Reference doc from scratch and view it
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc 'Today' 'Today' 'Test' 'voice1' 'Today' 'Test'
    When the user filters the column by column name 'Progressive', 'Like', 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on 'Button' with value 'Edit'

    # Step 2 - Go to 'Field Examples' tab
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'

    # Step 3 - Fill in all the mandatory fields except for the 'Textbox' field and press 'Save'
    And the user select value 'voice1' from dropdown list 'Combo'
    And the user clicks on 'Generic Drop Down Trigger' with value 'Date Picker'
    And the user clicks on the 'Today Button'
    And the user clicks on 'Horizontal Panel Tab' with value 'Field Validation'
    And the user enters 'ITAC Test' in field 'Input By Label Name' with value 'Force Uppercase on validation'
    And the user clicks on 'Horizontal Panel Tab' with value 'Available Fields'
    And the user clicks on 'Button' with value 'Save'

    # Validation
    Then 'Main Toolbar Error Message Field' is populated with 'TEXTBOX: Mandatory field empty'

    # Step 4 - Go to main tab and enter "my first test" on "DES1" textfield 
    And the user clicks on 'Side Panel Tab' with value 'Summary'
    And the user enters 'my first test' in field 'Input By Label Name' with value 'D1'

    # Validation
    And the user validates that 'Input By Label Name' with value 'D1' has text 'my first test'

    # Step 5 - Press the 'Tab' key
    When the user press the 'Tab' key on the 'Input By Label Name' with value 'D1'

    # Validation
    Then the user validates that 'Home Toolbar Label' text contains 'Reference document'
    And the user validates that 'Home Toolbar Label' text contains 'my first test'
    
    # Step 6 - Enter "test validation" on "DES1" textfield 
    When the user enters 'test validation' in field 'Input By Label Name' with value 'D1'

    # Validation
    And the user validates that 'Input By Label Name' with value 'D1' has text 'test validation'

    # Step 7 - Press the 'Enter' key
    When the user press the 'Enter' key on the 'Input By Label Name' with value 'D1'

    # Validation
    Then the user validates that 'Home Toolbar Label' text contains 'Reference document'
    And the user validates that 'Home Toolbar Label' text contains 'test validation'

    # Step 8 - Enter "1223wfsdfs#455%^%$#%%**&&&^^!!" on "DES1" textfield and press the tab key
    When the user enters '1223wfsdfs#455%^%$#%%**&&&^^!!' in field 'Input By Label Name' with value 'D1'
    And the user press the 'Enter' key on the 'Input By Label Name' with value 'D1'
    
    # Validation
    Then the user validates that 'Input By Label Name' with value 'D1' has text '1223wfsdfs#455%^%$#%%**&&&^^!!'
    And the user validates that 'Home Toolbar Label' text contains 'Reference document'
    And the user validates that 'Home Toolbar Label' text contains '1223wfsdfs#455%^%$#%%**&&&^^!!'

    # Step 9 - Enter text (378 characters) on "DES1" textfield and press the tab key
    When the user enters '<LongText>' in field 'Input By Label Name' with value 'D1'
    And the user press the 'Tab' key on the 'Input By Label Name' with value 'D1'

    # Validation - field does not accept more that 300 characters
    Then the user validates that the 'Input By Label Name' with value 'D1' has number of characters '255'

    # Step 10 - Enter text "text box is editable" on "DES1" textfield and moves focus by clicking on the Date 1 field
    When the user enters 'text box is editable' in field 'Input By Label Name' with value 'D1'
    And the user clicks on 'Input By Label Name' with value 'Date 1'

    # Step 11 - Set the focus on the D1 field by clicking on it and clear the text on the text field
    And the user clears the text on the 'Input By Label Name' with value 'D1'
    And the user press the 'Tab' key on the 'Input By Label Name' with value 'D1'

    # validation - validate that the 'X' icon is not present on the 'D1' field
    Then the user validates that the 'Trigger Clear Button' with value 'D1' is not displayed
    
    # Step 12 - Enter any text  on "DES1" textfield and press the Tab key
    When the user enters 'TC 199929' in field 'Input By Label Name' with value 'D1'
    And the user press the 'Tab' key on the 'Input By Label Name' with value 'D1'

    # validation - validate that the 'X' icon is not present on the 'D1' field
    Then the user validates that the 'Trigger Clear Button' with value 'D1' is displayed
    Then the user validates that the 'Trigger Clear Button' with value 'D1' is enabled

    # Step 13 - Press the 'X' icon and press the Tab key
    When the user clicks on 'Trigger Clear Button' with value 'D1'

    # validation - Validate the text on the D1 field is removed
    Then the user validates that the 'Input By Label Name' with value 'D1' has no text

    # Step 14 - Enter text 'test automation' into the 'DES1' field
    When the user enters 'test automation' in field 'Input By Label Name' with value 'D1'

    # validation - Validate the text on the D1 field is removed
    Then the user validates that 'Input By Label Name' with value 'D1' has text 'test automation'

    # Step 14 - Fill in all the mandatory fields, save, close and open the Reference doc
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'
    And the user enters 'textbox' in field 'Input By Label Name' with value 'TEXTBOX'
    And the user clicks on 'Input By Label Name' with value 'Numeric box'
    And the user validates that 'Input By Label Name' with value 'TEXTBOX' has text 'textbox'
    And the user clicks on 'Button' with value 'Save'
    And the user clicks on the 'Toolbar Close Button'
    And the user opens the grid item in row '1'

    # validation - Validate the text on the D1 field is removed
    Then the user validates that 'Input By Label Name' with value 'D1' has text 'test automation'
    And the user validates that the 'Trigger Clear Button' with value 'D1' is not displayed
    And the user validates that the 'Input By Label Name' with value 'D1' is disabled

	Examples: 
	| LongText                                                                                                                                                                                                                                                                                                                                                                                   | 
	| InspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingInspiredTestingFRM | 