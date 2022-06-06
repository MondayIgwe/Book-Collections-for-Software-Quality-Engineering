Feature: TestCase_200119
	Validate D2 textarea field

@BBD_TC200119 @FRM_Nightly
Scenario: FRM_REFDOC_TEXTAREA_007

    # Navigate to the Reference Docs page
    Given the user navigates to the 'Reference Docs' page
    When the user clicks on the 'Add Button'
    And the user clicks on the 'Date 1 Calendar Icon'
    And the user clicks on the 'Today Button'
    And the user clicks on the 'Date 2 Calendar Icon'
    And the user clicks on the 'Today Button'
    And the user clicks on 'Popup Ok Button' with value 'Reference Doc Detail Popup'

    # Enter letters in the D2 field
    And the user enters '<Letters>' in field 'Input By Label Name' with value 'D2'
     Then the user validates that 'Input By Label Name' with value 'D2' has text '<Letters>'
    
    # Clear the D2 field
    When the user clears the text on the 'Input By Label Name' with value 'D2'
    Then the user validates that the 'Input By Label Name' with value 'D2' has no text

    # Enter numbers in the D2 field 
    When the user enters '<Numbers>' in field 'Input By Label Name' with value 'D2'
    Then the user validates that 'Input By Label Name' with value 'D2' has text '<Numbers>'
    
    # Clear the D2 field
    When the user clears the text on the 'Input By Label Name' with value 'D2'
    Then the user validates that the 'Input By Label Name' with value 'D2' has no text

    # Enter uppercase letters in the D2 field 
    When the user enters '<Uppercase>' in field 'Input By Label Name' with value 'D2'
    Then the user validates that 'Input By Label Name' with value 'D2' has text '<Uppercase>'
    
    # Clear the D2 field
    When the user clears the text on the 'Input By Label Name' with value 'D2'
    Then the user validates that the 'Input By Label Name' with value 'D2' has no text

    # Enter symbols in the D2 field 
    When the user enters '<Symbols>' in field 'Input By Label Name' with value 'D2'
    Then the user validates that 'Input By Label Name' with value 'D2' has text '<Symbols>'
    
    # Clear the D2 field
     When the user clears the text on the 'Input By Label Name' with value 'D2'
    Then the user validates that the 'Input By Label Name' with value 'D2' has no text


	Examples: 
	| Letters    | Numbers  | Symbols                | Uppercase | 
	| Letters    | 1254629  | !@##$&&*()#***@@:;{}[] | UPPERCASE | 