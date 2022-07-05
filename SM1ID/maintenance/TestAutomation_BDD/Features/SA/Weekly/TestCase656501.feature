Feature: TestCase656501
	WEB_SA_BALANCE_BALANCE DETAILS_005 - Link to Matched CLaims - Promotions Nav (balance on claim)

@TTC @BDD_656501 @TTC_Weekly
Scenario: WEB_SA_BALANCE_BALANCE DETAILS_005
	
	# Step 1
	Given the user navigates to the 'Claims' page under division 'Claims'
	When the user creates a New Claim with Document Type: '<documentType>' Document Number: '<CustomerDocumentNo>' Level: '<level>' Customer: '<customer>' Amount: '<Amount>'
	And the user clicks on 'Button' with value 'Accept'
	Then the user validates that the 'Popup' with value 'Accept and Allocate' is displayed
	When the user clicks on 'Popup Ok Button' with value 'Accept and Allocate'
	And the user clicks on side panel 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Document ID' and saves it as 'DocumentID'
	And the user clicks on the 'Close Tab'

	# Step 2
	And the user navigates to the 'Balance Details' page

	# Step 3
	And the user filters the column by column name 'Document ID', Filter Type 'Equal', Value 'DocumentID'

	# Step 4
	And the user clicks on 'Button' with value 'Links' 
	And the user clicks on 'Menu Item Text' with value 'Matched Claims - Promotions'	
	Then the user validates that elements 'Basic Grid Rows' have loaded
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '0'

	# Step 5
	When the user clicks on the 'Close Tab'

	Examples: 
	| customer | Amount | CustomerDocumentNo  | documentType           | level   |
	| EC86212  | 300    | Claim_656501		  | REO - Customer Invoice | Level 3 |