Feature: TestCase360165
	WEB_SA_BALANCE_BALANCE DOCUMENT_004 - Balance Editability in Status CON and SNT

@TTC @BDD_630165 @TTC_Weekly
Scenario: WEB_SA_BALANCE_BALANCE DOCUMENT_004
	
	# Step 1 & 2
	Given the user navigates to the 'Balances' page
	When user creates a new balance with Customer Level: '<Level>' Customer: '<customer>' Balance Year: '' Supplier: ''

	# Step 3
	Then the user validates that the 'Input By Label Name' with value 'Balance ID' is disabled
	And the user validates that the 'Input By Label Name' with value 'Year' is disabled
	And the user validates that the 'Input By Label Name' with value 'Customer' is disabled
	And the user validates that the 'Input By Label Name' with value 'Supplier' is disabled
	And the user validates that the 'Input By Label Name' with value 'AMOUNT' is disabled

	# Step 4
	When the user clicks on 'Generic Drop Down Trigger' with value 'Status'
	Then the user validates that the 'Popup' with value 'Change Status' is displayed
	And the user validates that there are 'Status Row' element '1' displayed and contains 'TO BE APPROVED'

	# Step 5
	When the user clicks on 'Button' with value 'Cancel'

	# Step 6
	And the user clicks on 'Button' with value 'Selector'
    Then the user validates that the 'Menu Item Text' with value 'Payable Amount Selector' is enabled
	And the user validates that the 'Menu Item Text' with value 'Promo Selector' is enabled

	# Step 7
	When the user clicks on side panel 'Summary'
	Then the user validates that 'Input By Label Name' with value 'Description' is editable

	# Step 8
    And the user validates that the 'Input By Label Name' with value 'Currency' is enabled
    And the user validates that the 'Input By Label Name' with value 'ON BEHALF OF' is disabled
    And the user validates that the 'Input By Label Name' with value 'MODIFIED BY' is disabled
    And the user validates that the 'Input By Label Name' with value 'LATEST MODIFICATION DATE' is disabled
    And the user validates that the 'Input By Label Name' with value 'CREATED BY' is disabled
    And the user validates that the 'Input By Label Name' with value 'Creation Date' is disabled

	# Step 9
	When the user changes the status to '<status1>'
	And the user changes the status to '<status2>'
	And the user changes the status to '<option>'
	Then the user validates that the 'Input By Label Name' with value 'Description' is disabled

	# Step 10
	When the user clicks on 'Generic Drop Down Trigger' with value 'Status'
	Then the user validates that there are 'Status Row' element '0' displayed and contains '<status1>'
	When the user clicks on 'Button' with value 'Cancel'

	Examples: 
	| customer | status1        | status2 | option | SelectorOptions         | SelectorOptions2 | Level   |
	| EC86217  | To be Approved | Approve | Send   | Payable Amount Selector | Promo Selector   | Level 4 |