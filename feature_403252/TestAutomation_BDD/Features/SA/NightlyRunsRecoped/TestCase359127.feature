Feature: TestCase359127
	WEB_SA_BALANCE_BALANCE DOCUMENT_002 - Editability in status NEW

@TTC_Nightly @TTC @BBD_359127
Scenario: WEB_SA_BALANCE_BALANCE DOCUMENT_002
    
    # Step 1 - 3
	Given the user navigates to the 'Balances' page
    When user creates a new balance '<Level>' '<Customer>' '' ''
    Then the user validates that the 'Button' with value 'Selector' is displayed
    And the user validates that the 'Input By Label Name' with value 'Balance ID' is displayed
    And the user validates that the 'Input By Label Name' with value 'Year' is displayed
    And the user validates that the 'Input By Label Name' with value 'Customer' is displayed
    And the user validates that the 'Input By Label Name' with value 'Supplier' is displayed

    # Step 4
	When the user clicks on 'Trigger By Field Name' with value 'Status'
    Then the user validates that the 'Button' with value 'Cancel' is displayed
    And the user validates that there are 'Status Row' element '<Number>' displayed and contains '<Status>'

    # Step 5
	When the user clicks on 'Button' with value 'Cancel'
    Then the user validates that the 'Button' with value 'Selector' is displayed

    # Step 6
	When the user clicks on 'Button' with value 'Selector'
    Then the user validates the 'Amount Payable Selector Option' is enabled
    And the user validates the 'Promo Selector Option' is enabled

    # Step 7
    When the user clicks on 'Side Panel Tab' with value 'Summary'
    Then the user validates that the 'Input By Label Name' with value 'Currency' is displayed
    And the user validates that the 'Input By Label Name' with value 'Description' is enabled

    # Step 8
    And the user validates that the 'Input By Label Name' with value 'Currency' is enabled
    And the user validates that the 'Input By Label Name' with value 'ON BEHALF OF' is disabled
    And the user validates that the 'Input By Label Name' with value 'MODIFIED BY' is disabled
    And the user validates that the 'Input By Label Name' with value 'LATEST MODIFICATION DATE' is disabled
    And the user validates that the 'Input By Label Name' with value 'CREATED BY' is disabled
    And the user validates that the 'Input By Label Name' with value 'Creation Date' is disabled
    
	Examples:
    | Level   | Customer | Option         | SelectOption            | Status         | Number |
    | Level 4 | EC86217  | TO BE APPROVED | Payable Amount Selector | TO BE APPROVED | 1      |