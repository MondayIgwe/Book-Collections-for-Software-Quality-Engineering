Feature: TestCase_200119
	Validate D2 textarea field

@BBD_TC200119 @FRM_Nightly
Scenario: FRM_REFDOC_TEXTAREA_007

    # Navigate to the Reference Docs page
    Given the user navigates to the 'Reference Docs' page
    When the user clicks on the 'Add Button'
    And the user clicks on the 'Date 1 Calendar Trigger Icon'
    And the user clicks on the 'Today Button'
    And the user clicks on the 'Date 2 Calendar Trigger Icon'
    And the user clicks on the 'Today Button'
    And the user clicks on the 'OK Button'

    # Enter letters in the D2 field
    And the user enters '<Letters>' in the 'D2 Textarea'
    Then the user validates that the element 'D2 Textarea' has text '<Letters>'
    
    # Clear the D2 field
    When the user clears text on the 'D2 Textarea'
    Then the user validates the 'D2 Textarea' has no text

    # Enter numbers in the D2 field 
    When the user enters '<Numbers>' in the 'D2 Textarea'
    Then the user validates that the element 'D2 Textarea' has text '<Numbers>'
    
    # Clear the D2 field
    When the user clears text on the 'D2 Textarea'
    Then the user validates the 'D2 Textarea' has no text

    # Enter uppercase letters in the D2 field 
    When the user enters '<Uppercase>' in the 'D2 Textarea'
    Then the user validates that the element 'D2 Textarea' has text '<Uppercase>'
    
    # Clear the D2 field
    When the user clears text on the 'D2 Textarea'
    Then the user validates the 'D2 Textarea' has no text

    # Enter symbols in the D2 field 
    When the user enters '<Symbols>' in the 'D2 Textarea'
    Then the user validates that the element 'D2 Textarea' has text '<Symbols>'
    
    # Clear the D2 field
    When the user clears text on the 'D2 Textarea'
    Then the user validates the 'D2 Textarea' has no text


	Examples: 
	| Letters    | Numbers  | Symbols                | Uppercase | 
	| Letters    | 1254629  | !@##$&&*()#***@@:;{}[] | UPPERCASE | 