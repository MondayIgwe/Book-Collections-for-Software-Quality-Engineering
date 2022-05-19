Feature: UnitTest
Unit tests for BDD framework
Scenario: Textbox validation
    When the user navigates to the 'Reference Docs' page
    And the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'testtesttesttesttesttesttesttesttesttesttesttesttesttesttest' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: 'TEST'
    And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on 'Button' with value 'Edit'
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'
    #TEXTBOX VALIDATION
    When the user enters 'testtesttesttesttesttesttesttesttesttesttesttesttesttesttest' in field 'Input by Label Name' with value 'TEXTBOX'
    And the user moves the focus away from the element
    And the user retrieves text from element 'Input by Label Name' with value 'TEXTBOX' and saves it as 'test'
    Then the user validates that the 'Input by Label Name' with value 'TEXTBOX' is displayed
    And the user validates that the 'Input by Label Name' with value 'TEXTBOX' is present
    And the user validates that the 'Input by Label Name' with value 'TEXTBOX' is enabled
    And the user validates that the 'Input by Label Name' with value 'TEXTBOX' is not empty
    And the user validates that the 'Mandatory Icon' with value 'TEXTBOX' is displayed
    And the user validates that the 'Mandatory Icon' with value 'TEXTBOX' is present
    And the user validates that the value 'test' is equal to 'testtesttesttesttesttesttesttesttesttesttesttesttesttesttest'
    # Performance: this step shouldn't take more than 3 seconds to clear the field, whatever content there's inside
    When the user clears the text on the 'Input by Label Name' with value 'TEXTBOX'
    And the user moves the focus away from the element
    Then the user validates that the 'Input by Label Name' with value 'TEXTBOX' is displayed
    And the user validates that the 'Input by Label Name' with value 'TEXTBOX' is present
    And the user validates that the 'Input by Label Name' with value 'TEXTBOX' is enabled
    And the user validates that the 'Input by Label Name' with value 'TEXTBOX' is empty
    And the user validates that the 'Mandatory Icon' with value 'TEXTBOX' is displayed
    And the user validates that the 'Mandatory Icon' with value 'TEXTBOX' is present
    #NUMBOX VALIDATION
    When the user enters '1111111111111111' in field 'Input by Label Name' with value 'Numeric box'
    And the user moves the focus away from the element
    And the user retrieves text from element 'Input by Label Name' with value 'Numeric box' and saves it as 'test'
    Then the user validates that the 'Input by Label Name' with value 'Numeric box' is displayed
    And the user validates that the 'Input by Label Name' with value 'Numeric box' is present
    And the user validates that the 'Input by Label Name' with value 'Numeric box' is enabled
    And the user validates that the 'Input by Label Name' with value 'Numeric box' is not empty
    And the user validates that 'Input by Label Name' text with value 'Numeric box' contains '1111111111111111'
    And the user validates that 'Input by Label Name' text with value 'Numeric box' contains '.00'
    And the user validates that the 'Mandatory Icon' with value 'Numeric box' is not displayed
    # WARNING: THE STEP BELOW FAILS
    And the user validates that the 'Mandatory Icon' with value 'Numeric box' is not present
    # Performance: this step shouldn't take more than 3 seconds to clear the field, whatever content there's inside
    When the user clears the text on the 'Input by Label Name' with value 'Numeric box'
    And the user moves the focus away from the element
    Then the user validates that the 'Input by Label Name' with value 'Numeric box' is displayed
    And the user validates that the 'Input by Label Name' with value 'Numeric box' is present
    And the user validates that the 'Input by Label Name' with value 'Numeric box' is enabled
    And the user validates that the 'Input by Label Name' with value 'Numeric box' is not empty
    And the user validates that the 'Mandatory Icon' with value 'Numeric box' is not displayed
    # WARNING: THE STEP BELOW FAILS
    And the user validates that the 'Mandatory Icon' with value 'Numeric box' is not present
    # Present but not visible fields validations - 1ST AND 3RD STEP FAIL
    Then the user validates that the 'Summary Current Status Textfield' is not displayed
    And the user validates that the 'Input by Label Name' with value 'Current Status' is not displayed
    Then the user validates that the 'Summary Current Status Textfield' is not present
    And the user validates that the 'Input by Label Name' with value 'Current Status' is not present
    # Non-existing fields validations - SOME OF THESE STEPS FAIL
    Then the user validates that the 'Feedback Field' is not displayed
    And the user validates that the 'Input by Label Name' with value 'CUSTOMER' is not displayed
    Then the user validates that the 'Feedback Field' is not present
    And the user validates that the 'Input by Label Name' with value 'CUSTOMER' is not present
    #THESE STEPS MUST FAIL
    Then the user validates that the 'Input by Label Name' with value 'TEXTBOX' is not displayed
    #And the user validates that the 'Input by Label Name' with value 'TEXTBOX' is not present
    #And the user validates that the 'Input by Label Name' with value 'TEXTBOX' is not empty
    #And the user validates that the 'Input by Label Name' with value 'TEXTBOX' is disabled
    #And the user validates that the 'Mandatory Icon' with value 'TEXTBOX' is not displayed
    #And the user validates that the 'Mandatory Icon' with value 'TEXTBOX' is not present
    #And the user validates that the 'Mandatory Icon' with value 'Numeric box' is displayed
    #And the user validates that the 'Mandatory Icon' with value 'Numeric box' is present
    #Then the user validates that the 'Feedback Field' is displayed
    #And the user validates that the 'Input by Label Name' with value 'CUSTOMER' is displayed


