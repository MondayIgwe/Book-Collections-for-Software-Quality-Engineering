Feature: TestCase454642
	WEB_SA_BALANCE_MATCHED CLAIMS_BALANCE_002 - Create a balance for generic promo rows with different customer

@TTC_Nightly @TTC @BDD_454642
Scenario: WEB_SA_BALANCE_MATCHED CLAIMS_BALANCE_002
	
	# Step 1
	Given the user navigates to the 'Promotional actions' page

	When the user creates a Promo '<CustomerLevel>' '<customer>'
	And the user populates the cockpit '<description1>' '<SellInStart>' '<SellInEnd>' '' '' '<mechanic>'
	And the user adds products '<prodLevel>' '<product>'
    And the user enters '<measure>' on column name 'Leaflet' for product code '<product>'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Sub Tab' with value 'Header info'
    And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode'
	And the user clicks on 'Side Panel Tab' with value 'Workflow'
    Then the user validates that the 'Trigger By Field Name' with value 'Current status' is displayed
    When the user clicks on 'Trigger By Field Name' with value 'Current status'
    And the user clicks on 'Radio Button' with value 'To be authorized'
    And the user clicks on 'Popup Ok Button' with value 'Change Status'
    And the user clicks on 'Trigger By Field Name' with value 'Current status'
    And the user clicks on 'Radio Button' with value 'Confirm'
    And the user clicks on 'Popup Ok Button' with value 'Change Status'

	# Step 2
	And the user clicks on the 'Close Tab'
	When the user creates a Promo '<CustomerLevel2>' '<customerB>'
	And the user populates the cockpit '<description2>' '<SellInStart>' '<SellInEnd>' '' '' '<mechanicB>'
	And the user adds products '<prodLevel>' '<productB>'
    And the user enters '<measureB>' on column name 'Display' for product code '<product>'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Sub Tab' with value 'Header info'
    And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode1'
	And the user clicks on 'Side Panel Tab' with value 'Workflow'
    Then the user validates that the 'Trigger By Field Name' with value 'Current status' is displayed
    When the user clicks on 'Trigger By Field Name' with value 'Current status'
    And the user clicks on 'Radio Button' with value 'To be authorized'
    And the user clicks on 'Popup Ok Button' with value 'Change Status'
    And the user clicks on 'Trigger By Field Name' with value 'Current status'
    And the user clicks on 'Radio Button' with value 'Confirm'
    And the user clicks on 'Popup Ok Button' with value 'Change Status'

	# Step 3
	And the user navigates to the 'Claims' page under division'Claims'
	And the user creates a New Claim 'test case 454642' '<CustomerLevel2>' '<customerB>' '<amount>'
	And the user clicks on 'Side Panel Tab' with value 'Summary'
    And the user retrieves text from element 'Input By Label Name' with value 'Document ID' and saves it as 'DocumentID'
	And the user clicks on 'Side Panel Tab' with value 'Matchings'
	And the user clicks on 'Button' with value 'Match To Generic Amounts'
	And the user clicks on 'Menu Item Text' with value 'Match To Promo ID'
	Then the user validates that the 'Popup' with value 'Select Promotions' is displayed
	And the user filters the column by column name 'Action Code', 'Like', 'ActionCode1'
	And the user clicks on 'Popup Checkbox' with value 'ActionCode1'
    And the user clicks on 'Popup Ok Button' with value 'Select Promotions'
	Then the user validates that the 'Popup' with value 'Matching finalization' is displayed
	And the user validates that 'Input By Label Name' with value 'Amount to match' contains text '<amount>'
	And the user clicks on 'Button' with value 'Assign'
	When the user in popup 'Matching finalization' Clicks cell with column 'Last Claim' and row text '<description1>'
    And the user clicks on 'Popup Ok Button' with value 'Matching finalization'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	And the user clicks on 'Element by SM1Id' with value 'ACTION_LASTCLAIM'

	# Step 4
	And the user navigates to the 'Matched Claims' page
	And the user selects opens the filter at column 'Action Code'
	And the user clicks on 'Filter Option' with value 'ActionCode'
	And the user clicks on 'Filter Option' with value 'ActionCode1'
    And the user clicks on 'Popup Ok Button' with value 'Column:Action Code'
	And the user clicks on 'Grid Checkbox' with value 'ActionCode'
	And the user clicks on 'Grid Checkbox' with value 'ActionCode1'

	# Step 5
    And the user clicks on 'Button' with value 'Balance'

	# Step 6
	Then the user validates that elements 'Basic Grid Rows' have loaded
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '3'
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'Balance Percentage' has '100' with row text '200'
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'Balance Percentage' has '100' with row text '300'

	# Step 7
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'Amount to Balance' has '-200.00' with row text 'ActionCode'
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'Payable Amount Description' has '<description1>' with row text 'ActionCode'
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'Customer code' has '<customer>' with row text 'ActionCode'
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'Aggregate attribute 1 (Promo ID)' has 'ActionCode' with row text '200'
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'Promo Mechanics Code' has '<mechanicCode1>' with row text 'ActionCode'
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'Start Date' has '<SellInStart>' with row text 'ActionCode'
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'End Date' has '<SellInEnd>' with row text 'ActionCode'

	# Step 8
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'Amount to Balance' has '100.00' with row text 'ActionCode1'
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'Payable Amount Description' has '<description2>' with row text 'ActionCode1'
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'Customer code' has '<customerB>' with row text 'ActionCode1'
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'Aggregate attribute 1 (Promo ID)' has 'ActionCode1' with row text '300.00'
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'Promo Mechanics Code' has '<mechanicCode2>' with row text 'ActionCode1'
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'Start Date' has '<SellInStart>' with row text 'ActionCode1'
	And the user validates that popup with sm1 ID 'LOGICALBALANCEFINALIZATIONPOPUP' and name 'Finalization' column 'End Date' has '<SellInEnd>' with row text 'ActionCode1'

	# Step 9
	And the user validates that 'Input By Label Name' with value 'Total Balance Amount' contains text '-100.00' 

	# Step 10
    And the user clicks on 'Popup Ok Button' with value 'Finalization'

	# Step 11
	Then the user validates that elements 'Basic Grid Rows' have loaded
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '2'

	# Step 12
	And the user validates that column 'Amount' has '<measure>' with row text 'ActionCode'
	And the user validates that column 'Balanced %' has '100' with row text 'ActionCode'
	And the user validates that column 'Balance type' contains '<positiveType>' with row text 'ActionCode'
	And the user validates that column 'Beneficiary' has '<customer>' with row text 'ActionCode'
	And the user validates that column 'Promo ID' has 'ActionCode' with row text '<measure>'
	And the user validates that column 'Mechanic' has '<mechanic>' with row text 'ActionCode'
	And the user validates that column 'Promo Description' has '<description1>' with row text 'ActionCode'

	# Step 13
	And the user validates that column 'Amount' has '100.00' with row text 'ActionCode1'
	And the user validates that column 'Balanced %' has '100' with row text 'ActionCode1'
	And the user validates that column 'Balance type' contains '<negativeType>' with row text 'ActionCode1'
	And the user validates that column 'Beneficiary' has '<customerB>' with row text 'ActionCode1'
	And the user validates that column 'Promo ID' has 'ActionCode1' with row text '<measure1>'
	And the user validates that column 'Mechanic' has '<mechanicB>' with row text 'ActionCode1'
	And the user validates that column 'Promo Description' has '<description2>' with row text 'ActionCode1'

	# Step 14
	And the user validates that 'Input By Label Name' with value 'AMOUNT' contains text '-100.00' 

	# Step 15
	And the user validates that 'Input By Label Name' with value 'Year' has text 'x/x/y' 
	And the user validates that the 'Input By Label Name' with value 'Customer' is empty
	And the user validates that the 'Input By Label Name' with value 'Supplier' is empty
	And the user validates that 'Input By Label Name' with value 'Status' contains text 'New' 
    When the user retrieves text from element 'Input By Label Name' with value 'Balance ID' and saves it as 'BalanceID'

	# Step 16
	When the user clicks on the 'Close Tab'
	Then the user validates that the 'Button' with value 'Balance' is displayed

	# Step 17
	When the user clicks on the 'Close Tab'
	And the user navigates to the 'Balances' page
	Then the user validates that column 'Amount' has '-100.00' with row text 'BalanceID'

	# Step 18
	When the user clicks on the 'Close Tab'

	Examples: 
	| customer | CustomerLevel | description1    | product | mechanic | measure | status    | prodLevel | customerB | description2    | productB | mechanicB | measureB | amount | FinalizationPopup | mechanicCode1 | mechanicCode2 | positiveType | negativeType | SellInStart | SellInEnd | CustomerLevel2 |
	| EC91600  | Level 1       | Promo_1_balance | 060     | Leaflet  | 200.00  | Confirmed | Product   | EC86279   | Promo_2_balance | 061      | Display   | 300.00   | 400    | finalization      | LF            | DP            | Positive     | Negative     | d-3/m/y     | d+4/m/y   | Level 2        |