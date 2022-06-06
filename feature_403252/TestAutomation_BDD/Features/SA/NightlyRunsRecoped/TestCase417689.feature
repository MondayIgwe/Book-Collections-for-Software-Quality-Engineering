Feature: TestCase417689
	WEB_SA_CLAIM_CLAIM DOCUMENT_MATCHINGS_003_Match a customer REO to one generic Promo with an overspending

@TTC @BDD_417689 @TTC_Nightly
Scenario: WEB_SA_CLAIM_CLAIM DOCUMENT_MATCHINGS_003
	
	# Step 1
	Given the user navigates to the 'Claims' page under division 'Claims'
	When the user creates a New Claim '' 'Cust_417689' '<customerLevel>' '<customer>' '<Amount>'
	And the user clicks on 'Side Panel Tab' with value 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Document ID' and saves it as 'DocumentID'

	# Step 2
	And the user navigates to the 'Promotional actions' page
	And the user creates a Promo '<customerLevel>' '<customer>'
	And the user populates the cockpit '' 'd/m/y' 'd/m/y' '' '' '<mechanics>'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Top Tab' with value 'Header info'
	And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode'
	And the user adds products '<productLevel>' '<product>'
	And the user enters '<measure1>' on column name 'Leaflet' for product code '<product>'
	And the user enters '<measure2>' on column name 'Display' for product code '<product>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user changes the status to 'To be authorized'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	# Step 3
	And the user navigates to the 'Claims' page under division 'Claims'

	# Step 4
	And the user clicks on 'DocumentID' text on the grid

	# Step 5
	And the user clicks on 'Button' with value 'Edit'

	# Step 6
	And the user clicks on 'Button' with value 'Match To Generic Amounts'

	# Step 7
	And the user clicks on 'Menu Item Text' with value 'Match To Promo ID'
	Then the user validates that the 'Popup' with value 'Select Promotions' is displayed

	# Step 8
	When the user filters the column by column name 'Action Code', 'Like', 'ActionCode'

	# Step 9
	And the user clicks on 'Grid CheckBox Containing' with value 'ActionCode'

	# Step 10
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the 'Popup' with value 'Matching finalization' is displayed

	# Step 11
	When the user clicks on 'Button' with value 'Assign'
	Then the user validates that 'Input By Label Name' with value 'Delta Open Amount' has text '0.00'

	# Step 12
	When the user clicks on 'Popup Button' with value 'OK'

	# Step 13	
	Then the user validates that the grid has the checkbox cell marked as 'false' in the 'Not Matched row' column with row value of '<promoMech1Code>'
	And the user validates that column 'Amount' has '375.00' with row text '<promoMech1Code>'
	And the user validates that column 'Beneficiary' contains '<customer>' with row text '<promoMech1Code>'
	And the user validates that column 'Action Code' contains 'ActionCode' with row text '<promoMech1Code>'
	And the user validates that column 'Promo Mechanics Code' contains '<promoMech1Code>' with row text '1'

	# Step 14
	Then the user validates that the grid has the checkbox cell marked as 'false' in the 'Not Matched row' column with row value of '<promoMech2Code>'
	And the user validates that column 'Amount' has '125.00' with row text '<promoMech2Code>'
	And the user validates that column 'Beneficiary' contains '<customer>' with row text '<promoMech2Code>'
	And the user validates that column 'Action Code' contains 'ActionCode' with row text '<promoMech2Code>'
	And the user validates that column 'Promo Mechanics Code' contains '<promoMech2Code>' with row text '125.00'

	# Step 15
	When the user clicks on the 'Close Tab'

	# Step 16
	Then the user clicks on the 'Refresh Button'

	# Step 17
	When the user filters the column by column name 'Document ID', 'Like', 'DocumentID'
	Then the user validates that column 'Matched Amount' contains '<Amount>' with row text 'DocumentID'

	# STep 18
	When the user navigates to the 'Matched Claims - Promotions' page

	# Step 19
	When the user filters the column by column name 'Action Code', 'Like', 'ActionCode'
	Then the user validates that the grid has the checkbox cell marked as 'true' in the 'Pending Matching' column with row value of 'ActionCode'

	Examples: 
	| customer | Amount | product | productLevel | mechanics		 | measure1 | measure2 | Status           | Status1 | pageTitle        | promoMech1Code | promoMech2Code | customerLevel |
	| EC86212  | 500    | 061     | Product      | Leaflet,Display   | 100      | 300      | To Be Authorized | Confirm | Customer Invoice | DP             | LF             | Level 3       |