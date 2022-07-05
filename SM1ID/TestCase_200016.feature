Feature: TestCase_200016
	Validates the 'MULTI-SELECT' and 'SINGLE SELECT' functionality in the 'Field Examples' tab

@BDD_TC200016 @FRM_Nightly
Scenario: FRM_REFDOC_RADIOBUTTON_004

    # Step 1 - Login and create a new Reference doc from scratch and view it
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '200016'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on the 'Field Examples Tab'

    # Expected result - Radio button is read only , is not possible to select the control because reference doc is in read only
    Then the user validates that the 'Radio Group Radio Button' with value 'option1' is disabled
    And the user validates that the 'Radio Group Radio Button' with value 'option2' is disabled
    And the user validates that the 'Radio Group Radio Button' with value 'option3' is disabled
    And the user validates that the 'Radio Group Radio Button' with value 'option4' is disabled
    And the user validates that the 'Radio Group Radio Button' with value 'option5' is disabled
    And the user validates that the 'Radio Group Radio Button' with value 'option6' is disabled
    And the user validates that the 'Radio Group Radio Button' with value 'option7' is disabled

    # Step 2 - Click on 'Edit' button
    When the user clicks on the 'Edit Button'

    # Expected result - Radio buttons are enabled, option1 is checked and the other options are not checked
    Then the user validates that the 'Radio Group Radio Button' with value 'option2' is enabled
    And the user validates that the element 'Radio Group Radio Button' with value 'option2' is selected
    And the user validates that the 'Radio Group Radio Button' with value 'option1' is enabled
    And the user validates that the 'Radio Group Radio Button' with value 'option1' is not selected
    And the user validates that the 'Radio Group Radio Button' with value 'option3' is enabled
    And the user validates that the 'Radio Group Radio Button' with value 'option3' is not selected
    And the user validates that the 'Radio Group Radio Button' with value 'option4' is disabled
    And the user validates that the 'Radio Group Radio Button' with value 'option4' is not selected
    Then the user validates that the 'Radio Group Radio Button' with value 'option5' is enabled
    And the user validates that the 'Radio Group Radio Button' with value 'option5' is not selected
    And the user validates that the 'Radio Group Radio Button' with value 'option6' is disabled
    And the user validates that the 'Radio Group Radio Button' with value 'option6' is not selected
    And the user validates that the 'Radio Group Radio Button' with value 'option7' is enabled
    And the user validates that the 'Radio Group Radio Button' with value 'option7' is not selected
  
     # Step 3 - Click on 'option1' 
    When the user clicks on 'Radio Group Radio Button' with value 'option1'

    # Expected result -
    Then the user validates that the 'Radio Group Radio Button' with value 'option2' is not selected
    And the user validates that the 'Radio Group Radio Button' with value 'option3' is not selected
    And the user validates that the 'Radio Group Radio Button' with value 'option4' is not selected
    And the user validates that the 'Radio Group Radio Button' with value 'option5' is not selected
    And the user validates that the 'Radio Group Radio Button' with value 'option6' is not selected
    And the user validates that the 'Radio Group Radio Button' with value 'option7' is not selected

     # Step 4 - Click on 'option1' 
    When the user clicks on 'Radio Group Radio Button' with value 'option1'

    # Expected result -
    Then the user validates that the 'Radio Group Radio Button' with value 'option2' is not selected
    And the user validates that the 'Radio Group Radio Button' with value 'option3' is not selected
    And the user validates that the 'Radio Group Radio Button' with value 'option4' is not selected
    And the user validates that the 'Radio Group Radio Button' with value 'option5' is not selected
    And the user validates that the 'Radio Group Radio Button' with value 'option6' is not selected
    And the user validates that the 'Radio Group Radio Button' with value 'option7' is not selected

    # Step 5
    # Expected result -
    And the user validates that the 'Radio Group Radio Button' with value 'option4' is disabled
    And the user validates that the 'Radio Group Radio Button' with value 'option6' is disabled

    # Step 
    When the user press the 'Arrow Down' key on the 'Radio Group Radio Button' with value 'option1'
    Then the user validates that the 'Radio Group Radio Item' with value 'option2' is hovered over

    # Step 7
    When the user clicks on 'Radio Group Radio Item' with value 'option2'
    And the user press the 'Arrow Up' key on the 'Radio Group Radio Button' with value 'option2'
    Then the user validates that the 'Radio Group Radio Item' with value 'option1' is hovered over

    # Step 8
    When the user press the 'Space' key on the 'Radio Group Radio Button' with value 'option2'
    Then the user validates that the element 'Radio Group Radio Button' with value 'option1' is selected

    # Step 9
    When the user press the 'Space' key on the 'Radio Group Radio Button' with value 'option1'
    Then the user validates that the element 'Radio Group Radio Button' with value 'option1' is selected