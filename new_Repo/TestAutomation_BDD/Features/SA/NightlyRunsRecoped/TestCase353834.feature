Feature: TestCase353834
	WEB_SA_BALANCE_MATCHED CLAIMS-PROMOTIONS_BALANCE_005 - Create Balance from 'Matched Claims - Promotion' using last claim rows

@TTC_Nightly @TCC @BDD_353834
Scenario: WEB_SA_BALANCE_MATCHED_CLAIMS_PROMOTIONS_BALANCE_005
	# Step 1 Precondition1: Case1: Create two Promotions:
	Given the user navigates to the 'Promotional actions' page
	When the user creates a Promo '<CUSTLEV>' '<customer>'
	And the user populates the cockpit '<description>' '<SELLINSTART>' '<SELLINEND>' '<SELLOUTSTARTDATE>' '<SELLOUTENDDATE>' '<mechanic>'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Top Tab' with value 'Header info'
	And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode1'
	And the user adds a product '<productLevel>' '<product>'
	And the user enters '<measure>' on column name '<mechanic>' for product code '<product>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user changes the status to 'To be authorized'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	When the user navigates to the 'Promotional actions' page
	When the user creates a Promo '<CUSTLEV>' '<customerB>'
	And the user populates the cockpit '<descriptionB>' '<SELLINSTART>' '<SELLINEND>' '<SELLOUTSTARTDATE>' '<SELLOUTENDDATE>' '<mechanic>'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Top Tab' with value 'Header info'
	And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode2'
	And the user adds a product '<productLevel>' '<Product2>'
	And the user adds a product '<productLevel>' '<Product1>'
	And the user enters '<measureProduct1>' on column name '<mechanic>' for product code '<Product1>'
	And the user enters '<measureProduct2>' on column name '<mechanic>' for product code '<Product2>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user changes the status to 'To be authorized'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#2 Precondition2 Create a REO claim
	When the user navigates to the 'Claims' page under division'Claims'
	When the user creates a New Claim '<CustomerDocNr1>' '<CUSTLEV>' '<customer>' '<amount>'
	And the user clicks on 'Side Panel Tab' with value 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Document ID' and saves it as 'ClaimDocumentID'
	And the user clicks on 'Side Panel Tab' with value 'Matchings'
	And the user selects action 'Match To Generic Amounts' 'Match To Payable Amounts'
	And the user opens the Grid Settings Menu option: 'Remove Filter' in the 'Select Payable Amount' pop up table
	And the user filters the column by column name 'Payable Amount Logical Key', 'Like', 'ActionCode1'
	And the user clicks on 'Grid Checkbox Containing' with value 'ActionCode1'
	And the user clicks on 'Popup Button' with value 'OK'
	And the user clicks on 'Button' with value 'Assign'
	And the user clicks on 'Popup Button' with value 'OK'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#3 Precondition3 Create a REO claim for the @customerB
	When the user navigates to the 'Claims' page under division'Claims'
	When the user creates a New Claim '<CustomerDocNr1>' '<CUSTLEV>' '<customerB>' '<amountB>'
	And the user clicks on 'Side Panel Tab' with value 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Document ID' and saves it as 'ClaimDocumentID2'
	And the user clicks on 'Side Panel Tab' with value 'Matchings'
	And the user selects action 'Match To Generic Amounts' 'Match To Payable Amounts'
	And the user opens the Grid Settings Menu option: 'Remove Filter' in the 'Select Payable Amount' pop up table
	And the user filters the column by column name 'Payable Amount Logical Key', 'Like', 'ActionCode2'
	And the user clicks on 'Popup All Checkbox By Name' with value 'Select Payable Amount'
	And the user clicks on 'Popup Button' with value 'OK'
	And the user enters '<amountToMatchPromo2a>' in grid cell with column 'Amount to match' and row text '<Product1>' in popup 'Matching finalization'
	And the user enters '<amountToMatchPromo2b>' in grid cell with column 'Amount to match' and row text '<Product2>' in popup 'Matching finalization'
	And the user clicks on 'Popup Button' with value 'OK'
	And the user clicks on the 'Close Tab'
	#4 Access the 'Matched Claims - Promotions' navigator
	When the user navigates to the 'Matched Claims - Promotions' page
	#5 Select the rows of the case 1. from preconditions (One row from Promo1, one row from Promo2)
	When the user clicks on 'Grid Checkbox' with value 'ActionCode1'
	And the user clicks on 'Grid Checkbox' with value 'ActionCode2'
	#6 Click on the 'Balance' button
	And the user clicks on 'Button Link' with value 'Balance'
	#The user is in the finalization pop-up inside a new balance document @FinalizationPopupTitle
	Then 'Popup Title' text contains '<FinalizationPopupTitle>'
	#7 Check the rows
	And the user validates that the 'Grid Checkbox Containing' with value 'ActionCode1' is present
	And the user validates that the 'Grid Checkbox Containing' with value 'ActionCode2' is present
	#8 Check the 'Balance %' It is set to 100% @balancePercentageValue
	And the user validates that popup '<FinalizationPopupTitle>' column 'Balance Percentage' has '<balancePercentageValue>' with row text 'ActionCode1'
	And the user validates that popup '<FinalizationPopupTitle>' column 'Balance Percentage' has '<balancePercentageValue>' with row text 'ActionCode2'
	#Select both rows and modify the @Percent to 50 
	When the user clicks on 'Popup All Checkbox By Name' with value 'Finalization'
	And the user selects action 'Percentage' '50%'
	#The row from Promo1 has: -  Amount to Balance = (@amount - @measure ) * @percent / 100 = 25 - Balance percent = @Percent -Aggregate attribut 1 (Promo ID) = ID of the Promo 1
	Then the user validates that popup '<FinalizationPopupTitle>' column 'Amount to Balance' has '25.00' with row text 'ActionCode1'
	And the user validates that popup '<FinalizationPopupTitle>' column 'Balance Percentage' has '50' with row text 'ActionCode1'
	And the user validates that popup '<FinalizationPopupTitle>' column 'Promo Description' has '<description>' with row text 'ActionCode1'
	And the user validates that popup '<FinalizationPopupTitle>' column 'Balanced Amount' has '0.00' with row text 'ActionCode1'
	And the user validates that popup '<FinalizationPopupTitle>' column 'Deviation' has '25.00' with row text 'ActionCode1'
	And the user validates that popup '<FinalizationPopupTitle>' column 'Customer code' has '<customer>' with row text 'ActionCode1'
	And the user validates that popup '<FinalizationPopupTitle>' column 'ABS OPA' has '50.00' with row text 'ActionCode1'
	And the user validates that popup '<FinalizationPopupTitle>' column 'Absolute Amount to Balance' has '25.00' with row text 'ActionCode1'
	#The rows from Promo2 have:
	Then the user validates that popup '<FinalizationPopupTitle>' column 'Amount to Balance' has '0.00' with row text 'ActionCode2'
	And the user validates that popup '<FinalizationPopupTitle>' column 'Balance Percentage' has '50' with row text 'ActionCode2'
	And the user validates that popup '<FinalizationPopupTitle>' column 'Promo Description' has '<descriptionB>' with row text 'ActionCode2'
	And the user validates that popup '<FinalizationPopupTitle>' column 'Balanced Amount' has '0.00' with row text 'ActionCode2'
	And the user validates that popup '<FinalizationPopupTitle>' column 'Deviation' has '100.00' with row text 'ActionCode2'
	And the user validates that popup '<FinalizationPopupTitle>' column 'Customer code' has '<customerB>' with row text 'ActionCode2'
	And the user validates that popup '<FinalizationPopupTitle>' column 'ABS OPA' has '200.00' with row text 'ActionCode2'
	And the user validates that popup '<FinalizationPopupTitle>' column 'Absolute Amount to Balance' has '100.00' with row text 'ActionCode2'
	#10 Check the @TotalBalanceAmount in the Header of the grid
	And the user validates that 'Input By Label Name' with value 'Total Balance Amount' has text '<TotalBalanceAmount>'
	#Click 'OK' in the pop-up 
	When the user clicks on 'Popup Button' with value 'OK'
	#12 Check the balance document grid
	And the user retrieves text from element 'Input By Label Name' with value 'Balance ID' and saves it as 'BalanceID'
	Then the user validates that column 'Amount' has '25.00' with row number '1'
	And the user validates that column 'Balanced %' has '<Percent>' with row number '1'
	And the user validates that column 'Balance type' has '<BalanceType1>' with row number '1'
	And the user validates that column 'Beneficiary' has '<customer>' with row number '1'
	And the user validates that column 'Promo ID' has 'ActionCode1' with row number '1'
	#The rows from Promo2 have: Row1:
	And the user validates that column 'Amount' has '50.00' with row number '2'
	And the user validates that column 'Balanced %' has '<Percent>' with row number '2'
	And the user validates that column 'Balance type' has '<BalanceType1>' with row number '2'
	And the user validates that column 'Beneficiary' has '<customerB>' with row number '2'
	And the user validates that column 'Promo ID' has 'ActionCode2' with row number '2'
	#Row2:
	And the user validates that column 'Amount' has '50.00' with row number '3'
	And the user validates that column 'Balanced %' has '<Percent>' with row number '3'
	And the user validates that column 'Balance type' has '<balanceType2>' with row number '3'
	And the user validates that column 'Beneficiary' has '<customerB>' with row number '3'
	And the user validates that column 'Promo ID' has 'ActionCode2' with row number '3'
	#14 Check the Amount in the Header of the grid
	And the user validates that 'Input By Label Name' with value 'AMOUNT' has text '<TotalBalanceAmount>'
	#Check the fields in the Header of the document
	And the user validates that 'Input By Label Name' with value 'Year' has text '<SELLINSTARTYEAR>'
	And the user validates that the 'Input By Label Name' with value 'Customer' is empty
	And the user validates that 'Input By Label Name' with value 'Supplier' contains text '<supplier>'
	And the user validates that 'Input By Label Name' with value 'Status' has text 'New'
	#16 Close the document 
	When the user clicks on the 'Close Tab'
	Then the 'Alert Dialog Message Box' is not present
	And the user is on the 'Matched Claims - Promotions' page
	#17 Close the 'Matched Claims -Promotions' navigator and Access the 'Balances' navigator
	When the user clicks on the 'Close Tab'
	And the user navigates to the 'Balances' page by sm1-id 'BALANCE'
	#18 Check for the newly created balance document
	Then the user validates that the 'Text in Grid' with value 'BalanceID' is displayed
	#19 Close the 'Balances' navigator.
	When the user clicks on the 'Close Tab'
	#20 Close the Application.
	When the user clicks on the 'Close Tab'
	Examples:
		| CUSTLEV | customer | CustomerDocNr1 | supplier | description                           | product | productLevel | mechanic | measure | customerB | descriptionB                           | Product1 | Product2 | measureProduct1 | measureProduct2 | status           | status2 | amount | amountToMatchPromo1 | amountB | amountToMatchPromo2a | amountToMatchPromo2b | FinalizationPopupTitle | balancePercentageValue | Percent | amountToMatch | TotalBalanceAmount | BalanceType1     | balanceType2     | MatchedCPNavigator          | BalancesNavigator | SELLINSTARTYEAR | SELLINSTART | SELLINEND | SELLOUTSTARTDATE | SELLOUTENDDATE |
		| Level 0 | EC13085  | 353834#2       | EC86190  | MATCHED CLAIMS-PROMOTIONS_BALANCE_005 | 010     | Product      | Display  | 200.00  | EC13094   | MATCHED CLAIMS-PROMOTIONS_BALANCE_005B | 011      | 012      | 100.00          | 200.00          | TO BE AUTHORIZED | CONFIRM | 250.00 | 250.00              | 300.00  | 200.00               | 100.00               | Finalization           | 100                    | 50      | 250.00        | 25.00              | Negative balance | Positive balance | Matched Claims - Promotions | Balances          | x/x/y           |d/m/y       | d+10/m/y  |                  |                |