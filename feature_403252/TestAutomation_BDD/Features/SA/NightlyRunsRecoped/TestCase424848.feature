Feature: TestCase424848
	WEB_SA_CLAIM_CLAIMS_MULTI-MATCH_009_Match multiple REO to multiple generic Promo-Mechanics

@mytag
Scenario: WEB_SA_CLAIM_CLAIMS_MULTI_MATCH_009

	# Step 1
	Given the user navigates to the 'Claims' page under division'Claims'

	When the user creates a New Claim '' 'WEB_SA_CLAIM_CLAIMS_MULTI_MATCH_009#1' '<level>' '<customer>' '<amount1>'
	And the user clicks on 'Side Panel Tab' with value 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Document ID' and saves it as 'DocumentID'
	And the user clicks on the 'Close Tab'

	# Step 2
	And the user creates a New Claim '' 'WEB_SA_CLAIM_CLAIMS_MULTI_MATCH_009#2' '<level>' '<customer>' '<amount2>'
	And the user clicks on 'Side Panel Tab' with value 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Document ID' and saves it as 'DocumentID1'
	And the user clicks on the 'Close Tab'

	# Step 3
	And the user navigates to the 'Promotional actions' page
	And the user creates a Promo '<level>' '<customer>'
	And the user populates the cockpit '' 'd-3/m/y' 'd+3/m/y' '' '' '<mechanics>'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Top Tab' with value 'Header info'
	And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode'
	And the user adds products '<prodLevel>' '<products>'
	And the user enters '<meas1>' on column name 'Leaflet' for product code '<prod1>'
	And the user enters '<meas3>' on column name 'Loyalty Card' for product code '<prod1>'
	And the user enters '<meas2>' on column name 'Leaflet' for product code '<prod2>'
	And the user enters '<meas4>' on column name 'Loyalty Card' for product code '<prod2>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user changes the status to 'To be authorized'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	# Step 4
	And the user navigates to the 'Claims' page under division 'Claims'

	# Step 5
	And the user clicks on 'Grid CheckBox Containing' with value 'DocumentID'
	And the user clicks on 'Grid CheckBox Containing' with value 'DocumentID1'

	# Step 6
	And the user clicks on 'Button' with value 'Match'
	Then the user validates that 'Input By Label Name' with value 'Claim Total Open Amount' has text '1,137.77'

	# Step 7
	And the user validates that 'Input By Label Name' with value '[GUICLAIMMULTIMATCHPOPUP.numRemainingOpenTotalAmount]' has text '1,137.77'

	# Step 8
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '3'

	# Step 9
	When the user clicks on 'Button' with value 'Next'

	# Step 10 - 11
	And the user selects active scenario 'Match to Agg2 (Promo-Mech)' from dropdown list 'Match To'

	# Step 12
	And the user clicks on 'Button' with value 'Next'

	# Step 13
	And the user filters the column by column name 'Action Code', 'Like', 'ActionCode'
	And the user clicks on 'Grid CheckBox' with value 'Loyalty Card'
	And the user clicks on 'Grid CheckBox' with value 'Leaflet'

	# Step 15
	And the user clicks on 'Button' with value 'Next'

	# Step 17
	And the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '9'

	# Step 18
	And the user clicks on 'Button' with value 'Assign'
	Then the user validates that 'Input By Label Name' with value 'Delta Open Amount' has text '0.00'

	# Step 19
	Then the user validates that the 'Finalization Grid' singlegrid contains the value '591.61' in the 'Amount to match' column in the row number '1'

	# Step20
	Then the user validates that the 'Finalization Grid' singlegrid contains the value '546.16' in the 'Amount to match' column in the row number '2'

	# Step 21
	When the user clicks on 'Button' with value 'Next'

	# Step 22
	And the user clicks on 'Button' with value 'Confirm'

	# Step 23
	Then the user validates that the 'Alert Dialog Message Box' is present
	When the user clicks on the 'Alert Dialog Yes Button'

	# Step 24
	And the user clicks on the 'Refresh Button'
	And the user retrieves text from column 'Net amount' with unique row text 'DocumentID' and saves it as 'ClaimAmount1'
	And the user retrieves text from column 'Net amount' with unique row text 'DocumentID1' and saves it as 'ClaimAmount2'
	Then user validates that '1137.77' has value of 'ClaimAmount1' 'plus' 'ClaimAmount2'

	# Step 25
	When the user navigates to the 'Matched Claims - Promotions' page
	And the user filters the column by column name 'Action Code', 'Like', 'ActionCode'
	Then the user validates that the grid has the checkbox cell marked as 'true' in the 'Pending Matching' column with row value of 'ActionCode'

	Examples: 
	| customer | level   | amount1 | amount2 | prod1 | prod2 | prodLevel | meas1 | meas2  | meas3  | meas4 | status    | planTo  | mechanics            | products |
	| EC86277  | Level 2 | 605.91  | 531.86  | 059   | 068   | Product   | 480.5 | 111.11 | 345.66 | 200.5 | Confirmed | EC86217 | Leaflet,Loyalty Card | 059,068  |