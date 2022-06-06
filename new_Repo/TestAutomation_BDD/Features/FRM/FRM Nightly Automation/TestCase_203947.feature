Feature: TestCase_203947
	Validate date fields border colors in Ref docs summary page

@BDD_203947 @FRM_Nightly
Scenario: 203947_FRM_REFDOC_DATEPERIOD_001

    # Step 1 - 2 -Open reference docs navigator -> Open reference doc UI in read only and go on main tab
    Given the user navigates to the 'Reference Docs' page
    When the user opens the grid item in row '4'

    # Expected result - 
    # The date period field is disabled
    # CSS color is  c2c2c2
    Then the user validates that the 'Input By Label Name' with value 'Period' is disabled
	And the user validates that the 'border-left-color' property for 'Input Field Container By Label' with value 'Period' has a colour of 'c2c2c2'
    
    # Step 3 - View the document in Edit mode
    When the user clicks on 'Button' with value 'Edit'

    # Expected result 
    # The date period field is enabled
    # CSS color is 008fe1
    Then the user validates that the 'Input By Label Name' with value 'Period' is enabled
    And the user validates that the 'border-left-color' property for 'Input Field Container By Label' with value 'Period' has a colour of '008fe1'

    # Step 3 -
    # Fill in DATE 1 date picker with 11/01/2018 and lose focus
    # Fill in DATE 2 date picker with 08/09/2017 and lose focus
    When the user enters the characters '11/01/2018' in field 'Input By Label Name' with value 'Date 1'
    And the user moves the focus away from the element
    And the user enters the characters '11/01/2017' in field 'Input By Label Name' with value 'Date 2'
    And the user moves the focus away from the element

    # Expected result - the date period field is highlighted in red CSS color is ec232b
    Then the user validates that the 'border-left-color' property for 'Input Field Container By Label' with value 'Period' has a colour of 'ec232b'
