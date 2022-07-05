Feature: TestCase545640
	WEB_SA_BALANCE_BALANCES_002 - Balances Nav - Remove balances 'on Claim'

@mytag
Scenario: WEB_SA_BALANCE_BALANCES_002
	
	# Step 1
	Given the user navigates to the 'Claims' page under division'Claims'
	When the user creates a New Claim with Document Type: '<DocumentType>' Document Number: '<CustomerDocument>' Level: '<Level>' Customer: '<Customer>' Amount: '<Amount>'
	And the user clicks on 'Button' with value 'Accept'
	Then the user validates that the 'Popup' with value 'Accept and Allocate' is displayed
	When the user clicks on 'Popup Ok Button' with value 'Accept and Allocate'
	And the user clicks on 'Side Panel Tab' with value 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Document ID' and saves it as 'DocumentID'
	And the user clicks on 'Side Panel Tab' with value 'Matchings'
	And the user retrieves text in cell with column 'Balance ID' and row text 'VAT CODE 1' and saves as 'BalanceID'
	And the user clicks on the 'Close Tab'
	
	# Step 2
	And the user navigates to the 'Balances' page

	# Step 3	
	And the user clicks on 'Grid Checkbox' with value 'BalanceID'

	# Step 4
	And the user clicks on 'Button' with value 'Remove'
	Then the user validates that the 'Alert Dialog Message Box' is displayed

	# Step 5
	When the user clicks on the 'Alert Dialog Yes Button'

	# Step 6
	Then the user validates that 'Success Toast Message' text contains '<toastMessage>'

	# Step 7
	When the user filters the column by column name 'Balances', Filter Type 'Like', Value 'BalanceID'
	And the user retrieves count of 'Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '0'

	# Step 8
	When the user navigates to the 'Balance Details' page
	And the user filters the column by column name 'Balance ID', Filter Type 'Equal', Value 'BalanceID'
	And the user retrieves count of 'Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '0'

	# Step 9
	When the user navigates to the 'Claims' page under division'Claims'
	And the user filters the column by column name 'Document ID', Filter Type 'Like', Value 'DocumentID'
	And the user clicks on 'DocumentID' text on the grid
	And the user clicks on 'Side Panel Tab' with value 'Matchings'
	Then the user validates that the grid has the checkbox cell marked as 'true' in the 'Not Matched row' column with row value of 'VAT CODE 1'
	And the user validates that column 'Amount' contains '<Amount>' with row text 'VAT CODE 1'

	Examples: 
	| CustomerDocument | DocumentType | Customer | Level   | Amount | toastMessage                 |
	| Claim_545640     | REO          | EC86216  | Level 3 | 333.00 | Balance successfully removed |