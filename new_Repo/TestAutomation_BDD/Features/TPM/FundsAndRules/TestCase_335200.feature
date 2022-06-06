Feature: TestCase_335200

@BDD_335200 @PROMO_Nightly @FundsAndRules
Scenario: TPM_FR_W_SMOKE_R81V1_0006 - Movement Panel
	#Go to "Fund & Rules" navigator
	Given the user navigates to the 'Funds & Rules' page
	#2 Open  @FUND_1
	When the user clicks on 'Text' with value '<FUND_1>'
	#3 Switch To "Edit" mode
	And the user clicks on 'Button' with value 'Edit'
	#4 Go to "Constraints" Page
	And the user clicks on 'Side Panel Tab' with value 'Constraints'
	#5 Open "Movevents Panel"
	And the user clicks on the 'Open Folder Icon'
	#top header fields are shown: - Remaining Balance [Readonly]  -Uncommitted Balance [Readonly]  - Fund Reserve [Readonly] 
	Then the user validates that the 'Input By Label Name' with value 'Remaining balance' is present
	And the user validates that the 'Input By Label Name' with value 'Uncommitted Balance' is present
	And the user validates that the 'Input By Label Name' with value 'Fund reserve' is present
	#The Movements Grid contains the following columns:Date of Movement, Type of Movement, Reason, Action ID, Value, Transfer ID Fund, Transfer ID Constraint
	And the user validates that the 'Column' with value 'Date of movement' is present
	And the user validates that the 'Column' with value 'Type of movement' is present
	And the user validates that the 'Column' with value 'Reason' is present
	And the user validates that the 'Column' with value 'Action Id' is present
	And the user validates that the 'Column' with value 'Value' is present
	And the user validates that the 'Column' with value 'Transfer ID Fund' is present
	And the user validates that the 'Column' with value 'Transfer ID Constraint' is present
	#6 Create a new movement:"Deposit (V)" with Value = 100 @depositName @depositValue @reason
	When the user creates a new movement with type '<depositName>' value '<depositValue>' reason '<reason>'
	#In the Movements Panel, Remaining Balance=  1100, Uncommitted balance = 1100, Fund Reserve = 0. The new movement is added in the  Movements Grid
	Then the user validates that 'Input By Label Name' with value 'Remaining balance' has text '1,100.0000'
	And the user validates that 'Input By Label Name' with value 'Uncommitted Balance' has text '1,100.0000'
	And the user validates that 'Input By Label Name' with value 'Fund reserve' has text '0.0000'
	#7 Create a new movement: "Withdrawal (P)" with Value = 200 @withdrawalName @withdrawalValue
	When the user creates a new movement with type '<withdrawalName>' value '<withdrawalValue>' reason '<reason>'
	#In the Movements Panel, Remaining Balance=  900, Uncommitted balance = 900, Fund Reserve = 0. The new movement is added in the  Movements Grid
	Then the user validates that 'Input By Label Name' with value 'Remaining balance' has text '900.0000'
	And the user validates that 'Input By Label Name' with value 'Uncommitted Balance' has text '900.0000'
	And the user validates that 'Input By Label Name' with value 'Fund reserve' has text '0.0000'
	#8 Create a new movement: "Reserve (R)" with Value = 100 @reserveName @reserveValue
	When the user creates a new movement with type '<reserveName>' value '<reserveValue>' reason '<reason>'
	#In the Movements Panel, Remaining Balance=  900, Uncommitted balance = 900, Fund Reserve = 100. The new movement is added in the  Movements Grid
	Then the user validates that 'Input By Label Name' with value 'Remaining balance' has text '900.0000'
	And the user validates that 'Input By Label Name' with value 'Uncommitted Balance' has text '900.0000'
	And the user validates that 'Input By Label Name' with value 'Fund reserve' has text '100.0000'
	#9 Create a new movement: "Reserve to deposit (D)" with Value = 100 @depReserveName @depReserveValue
	When the user creates a new movement with type '<depReserveName>' value '<depReserveValue>' reason '<reason>'
	#In the Movements Panel, Remaining Balance=  1000, Uncommitted balance = 1000, Fund Reserve = 0. The new movement is added in the  Movements Grid
	Then the user validates that 'Input By Label Name' with value 'Remaining balance' has text '1,000.0000'
	And the user validates that 'Input By Label Name' with value 'Uncommitted Balance' has text '1,000.0000'
	And the user validates that 'Input By Label Name' with value 'Fund reserve' has text '0.0000'
	#10 Take note of all data and movements that are in the panel and close the Movements Panel
	When the user retrieves count of 'Popup Grid Rows' with value 'Movements' and saves it as 'RowCount'
	And the user clicks on 'Popup Button' with value 'OK'
	#11 Open again Movements Panel -> All information previously shown are kept.
	And the user clicks on the 'Open Folder Icon'
	And the user retrieves count of 'Popup Grid Rows' with value 'Movements' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCount' is equal to 'RowCountNew'
	Then the user validates that popup 'Movements' column 'Value' has '1,000.0000' with row text 'Opening fund ID 1'
	And the user validates that popup 'Movements' column 'Value' has '100.0000' with row text 'Deposit Reservation'
	And the user validates that popup 'Movements' column 'Value' has '200.0000' with row text 'Withdrawal'
	And the user validates that popup 'Movements' column 'Value' has '100.0000' with row text 'Reservation'
	#12 Save and Close the document
	When the user clicks on 'Popup Button' with value 'OK'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#13 Open again @FUND_1 
	And the user clicks on 'Text' with value '<FUND_1>'
	#14 Switch To Edit
	And the user clicks on 'Button' with value 'Edit'
	#15 Open "Movevents Panel" -> All information previously shown are kept.
	And the user clicks on 'Side Panel Tab' with value 'Constraints'
	And the user clicks on the 'Open Folder Icon'
	# All information previously shown are kept.
	Then the user validates that popup 'Movements' column 'Value' has '1,000.0000' with row text 'Opening fund ID 1'
	And the user validates that popup 'Movements' column 'Value' has '100.0000' with row text 'Deposit Reservation'
	And the user validates that popup 'Movements' column 'Value' has '200.0000' with row text 'Withdrawal'
	And the user validates that popup 'Movements' column 'Value' has '100.0000' with row text 'Reservation'
	#16 Close the Movements Panel
	When the user clicks on 'Popup Button' with value 'Cancel'
	#17 Close the document
	And the user clicks on the 'Close Tab'

	Examples:
		| FUND_1 | depositName | depositValue | reason | withdrawalName | withdrawalValue | reserveName | reserveValue | depReserveName      | depReserveValue |
		| 21     | Deposit     | 100          | TEST   | Withdrawal     | 200             | Reservation | 100          | Deposit Reservation | 100                     |