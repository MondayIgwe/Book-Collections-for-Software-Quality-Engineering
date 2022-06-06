Feature: TestCase_335200
	Views a specific fund and Rule,
	Adds movements and validates the added movements,
	Then closes and reopens the new fund to validate that the added data is still present.

Scenario: Test Case : 335200
	#Step 1 
	Given the user is on the 'Funds & Rules' page
	#Step 2
	When the user clicks on the 'Funds & Rules code' column link value '<Fund_1>' on the grid
	#Step 3
	And the user clicks the edit button
	#Step 4
	And the user is on the 'Summary Tab' page
	And the user clicks on the 'Constraints Tab'
	Then the user is on the 'Constraints Tab Container' page
	#Step 5
	And the user clicks on the 'Movement panel folder'
	# Validation 
	And the user validates that 'Remaining Balance Textfield' is read-only 
	And the user validates that 'Uncommitted Balance Textfield' is read-only 
	And the user validates that 'Fund Reserve Textfield' is read-only 
	And the user validates the 'Movements Grid Headings' grid headings '<MovementPanelHeading>'

	# Step 6
	When the user creates a New Movement '<DepositName>' '<DepositValue>' '<Reason>'
	# Validation
	Then 'Remaining Balance Textfield' is populated with '1100'
	And 'Uncommitted Balance Textfield' is populated with '1100'
	And 'Fund Reserve Textfield' is populated with '0'
	And the user validates the movement is added '<DepositName>' '<DepositValue>' '<Reason>'
	# Step 7
	When the user creates a New Movement '<WithdrawalName>' '<WithdrawalValue>' '<Reason>'
	# Validation
	Then 'Remaining Balance Textfield' is populated with '900'
	And 'Uncommitted Balance Textfield' is populated with '900'
	And 'Fund Reserve Textfield' is populated with '0'
	And the user validates the movement is added '<WithdrawalName>' '<WithdrawalValue>' '<Reason>'
	# Step 8
	When the user creates a New Movement '<ReserveName>' '<ReserveValue>' '<Reason>'
	# Validation
	Then 'Remaining Balance Textfield' is populated with '900'
	And 'Uncommitted Balance Textfield' is populated with '900'
	And 'Fund Reserve Textfield' is populated with '100'
	And the user validates the movement is added '<ReserveName>' '<ReserveValue>' '<Reason>'
	# Step 9
	When the user creates a New Movement '<DepReserveName>' '<DepReserveValue>' '<Reason>'
	# Validation
	Then 'Remaining Balance Textfield' is populated with '1000'
	And 'Uncommitted Balance Textfield' is populated with '1000'
	And 'Fund Reserve Textfield' is populated with '0'
	And the user validates the movement is added '<DepReserveName>' '<DepReserveValue>' '<Reason>'
	# Step 10
	When the user gets the number of rows from 'Movements Popup Rows'
	And the user clicks on the 'Movements Popup OK Button'
	# Validation
	Then the user validates 'Movements Popup Close Button' is not visible
	# Step 11
	When the user clicks on the 'Movement panel folder'
	# Validation
	Then the user validates the number of rows from 'Movements Popup Rows'
	# Step 12
	When the user clicks on the 'Movements Popup OK Button'
	And the user clicks 'Save' and 'Close'
	#Step 13
	When the user clicks on the link value '<Fund_1>' on the grid
	#Step 14
	And the user clicks the edit button
	Then the user is on the 'Summary Tab' page
	And the user clicks on the 'Constraints Tab'
	Then the user is on the 'Constraints Tab Container' page
	# Step 15
	And the user clicks on the 'Movement panel folder'
	# Validation
	Then the user validates the number of rows from 'Movements Popup Rows'
	# Step 16
	Then the user clicks on the 'Movements Popup Close Button'
	# Step 17
	Then the user clicks on 'Close' button on the toolbar
	

	Examples: 
	| Fund_1  | MovementPanelHeading																						   | DepositName   | DepositValue | Reason | WithdrawalName | WithdrawalValue | ReserveName | ReserveValue | DepReserveName      | DepReserveValue |
	| 21      | DTEMOVEMENT;CODMOVEMENTTYPE;DESREASON;IDACTIONNUM;MOVEMENTVALUE;TRANSFER_IDCHECKSET;TRANSFER_IDCONSTRAINT      | Deposit       | 100          | TEST   | Withdrawal     | 200             | Reservation | 100          | Deposit Reservation | 100		       |