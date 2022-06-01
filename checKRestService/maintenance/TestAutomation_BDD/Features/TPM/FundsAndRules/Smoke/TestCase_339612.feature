Feature: TestCase_339612

@BDD_339612 @PROMO_Regression @FundsAndRules @PROMO_Smoke
Scenario: TPM_FR_W_SMOKE_R81V1_0008 - Copy single F&R
	#Step 1 - Open @FUND_1
	Given the user navigates to the 'Funds & Rules' page
	#Ste 2 - Select @FUND_1
	When the user filters the column by column name 'Funds & Rules code', Filter Type 'Like', Value '<FUND_1>'
	And the user filters the column by column name 'Funds & Rules', Filter Type 'Like', Value '<FUNDS&RULES>'
	And the user retrieves text from column 'Status' with unique row text 'Status' and saves it as 'Status1'
	And the user retrieves text from column 'Funds & Rules Contractor' with unique row text 'Funds & Rules Contractor' and saves it as 'CustomerNodes'
	And the user clicks on 'Grid CheckBox' with value '<FUND_1>'
	And the user clicks on 'Text' with value '<FUND_1>'
	Then the user validates that 'Input By Label Name' with value 'Status' has text 'Status1'
	When the user clicks on side panel 'Constraints'
	And the user retrieves text from column '% Rate Fund' with unique row text '% Rate Fund' and saves it as '%RateFund1'
	And the user retrieves text from column 'Uncommitted Balance' with unique row text 'Uncommitted Balance' and saves it as 'UncommittedBalance1'
	And the user retrieves text from column 'Remaining balance' with unique row text 'Remaining balance' and saves it as 'RemainingBalance1'
	And the user retrieves text from column 'Fund reserve' with unique row text 'Fund reserve' and saves it as 'FundReserve1'
	And the user clicks on the 'Close Tab'
	#Step 3 - Copy @FUND_1
	And the user clicks on 'Button' with value 'Copy Funds & Rules'
	Then the user validates that 'Input By Label Name' with value 'Configuration ID' has text '<CONFIGURATION>'
	When the user clicks on 'Popup Button' with value 'OK'
	#Step 4 - Confirm information in the CreationPopup
	When the user clicks on side panel 'Constraints'
	Then the user validates that column 'Fund Source Value' has '0.0000' with row text '<FUNDSOURCEVALUE>'
	And the user validates that column '% Rate Fund' has '%RateFund1' with row text '<%_Rate_Fund>'
	And the user validates that column 'Remaining balance' has '0.0000' with row text '<Remaining_Balance>'
	And the user validates that column 'Fund reserve' has '0.0000' with row text '<Fund_Reserve>'
	And the user validates that column 'Uncommitted Balance' has '0.0000' with row text '<Uncommitted_Balance>'
	When the user clicks on side panel 'Customer nodes'
	And the user retrieves text from table with unique column 'Customer code' column 'Customer code' with row number '1' and saves it as 'CustomerCode1'
	And the user retrieves text from table with unique column 'Customer code' column 'Customer code' with row number '2' and saves it as 'CustomerCode2'
	And the user retrieves text from table with unique column 'Customer code' column 'Customer code' with row number '3' and saves it as 'CustomerCode3'

	Then the user validates that 'CustomerNodes' text contains 'CustomerCode1'
	Then the user validates that 'CustomerNodes' text contains 'CustomerCode2'
	Then the user validates that 'CustomerNodes' text contains 'CustomerCode3'


Examples:
	| FUND_1 | CONFIGURATION         | FUNDS&RULES               | FUNDSOURCEVALUE | %_Rate_Fund | Uncommitted_Balance | Remaining_Balance | Fund_Reserve |
	| 1      | 633 - Rate Based Fund | TPM_FR_W_SMOKE_R81V1_0008 | 0.0000          | 2.00        | 750.0000            | 750.0000          | 200.0000     |