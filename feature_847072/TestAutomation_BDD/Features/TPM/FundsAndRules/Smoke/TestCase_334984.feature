Feature: TestCase_334984

@BDD_334984 @PROMO_Regression @FundsAndRules @PROMO_Smoke
Scenario: TPM_FR_W_SMOKE_R81V1_0001 - Open F&R
	#Step 1 - Go to "Fund & Rules" navigator
	Given the user navigates to the 'Funds & Rules' page
	#2 Select F&R with code = @FR_ID and get the following info: Configuration ID, Validity Period, WF Status, F&R code, Description
	When the user filters the column by column name 'Funds & Rules code', Filter Type 'Like', Value '<FR_ID>'
	And the user retrieves text from column 'Configuration' with unique row text 'TPM_FR_W_SMOKE_R81V1_0012' and saves it as 'Configuration'
	And the user retrieves text from column 'Start Date' with unique row text 'TPM_FR_W_SMOKE_R81V1_0012' and saves it as 'StartDate'
	And the user retrieves text from column 'End Date' with unique row text 'TPM_FR_W_SMOKE_R81V1_0012' and saves it as 'EndDate'
	And the user retrieves text from column 'Status' with unique row text 'TPM_FR_W_SMOKE_R81V1_0012' and saves it as 'Status'
	And the user retrieves text from column 'Funds & Rules code' with unique row text 'TPM_FR_W_SMOKE_R81V1_0012' and saves it as 'FundsRulesCode'
	And the user retrieves text from column 'Funds & Rules' with unique row text 'TPM_FR_W_SMOKE_R81V1_0012' and saves it as 'Description'
	And the user opens the grid item in row '1'
	#3 Open selected F&R document
	Then the user validates that the Loading Mask is not present
	And the user validates that 'Input By Label Name' with value 'Configuration ID' has text 'Configuration'
	And the user validates that the element 'Validity Period Start Date' has text 'StartDate'
	And the user validates that the element 'Validity Period End Date' has text 'EndDate'
	And the user validates that 'Input By Label Name' with value 'Status' has text 'Status'
	And the user validates that 'Input By Label Name' with value 'Funds & Rules code' has text 'FundsRulesCode'
	And the user validates that 'Input By Label Name' with value 'Description' has text 'Description'
	#4
	When the user closes all pages without saving the work done


Examples:
	| FR_ID |
	| 30    |
