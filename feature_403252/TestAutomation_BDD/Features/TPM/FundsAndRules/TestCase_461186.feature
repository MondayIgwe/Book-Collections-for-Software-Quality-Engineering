Feature: TestCase_461186

@BDD_461186 @PROMO_Nightly @FundsAndRules
Scenario: WEB_TPM_SP_FR_GUIDELINES
	#2 Go to F&R navigator
	Given the user navigates to the 'Funds & Rules' page
	#Step 3 -6
	When the user creates a new fund and rules '<CONFIGURATION_ID>' '<CUST_LEVEL>' '<DESCRIPTION>' '<SELLINSTART>' '<SELLINEND>' '<PRODUCT_GROUPS>' '<RATEFUNDSOURCE>'
	#7 Go to "Constraints" tab
	And the user clicks on 'Side Panel Tab' with value 'Constraints'
	# In the constraints grid, the following cols are visible:IDCONSTRAINT -> always visible #MOVEMENTS (T3) •DTESTART -> always visible •DTEEND -> always visible•FUNDVALUE (T3)•FUNDNOTCOMMITTED (T3)•FUNDREMAINDER (T3)•FUNDRESERVE (T3)•FUNDUM (T3)
	Then the user validates that the 'Column Name' with value 'Code' is present
	And the user validates that the 'Column Name' with value 'Movements' is present
	And the user validates that the 'Column Name' with value 'Start Date' is present
	And the user validates that the 'Column Name' with value 'End Date' is present
	And the user validates that the 'Column Name' with value 'Maximal discount' is present
	And the user validates that the 'Column Name' with value 'Minimal discount' is present
	And the user validates that the 'Column Name' with value 'Promo Amount' is present
	And the user validates that the 'Column Name' with value 'Max number action' is present
	And the user validates that the 'Column Name' with value 'Min number action' is present
	And the user validates that the 'Column Name' with value 'Min. ROI' is present
	And the user validates that the 'Column Name' with value 'Sell-in days' is present
	And the user validates that the 'Column Name' with value 'Sell-out days' is present
	And the user validates that the 'Column Name' with value 'Contiguous sell-in days' is present
	And the user validates that the 'Column Name' with value 'Family' is present
	And the user validates that the 'Column Name' with value 'Product' is present
	#8 Close the F&R document
	When the user clicks on the 'Close Tab'

	Examples:
		| CONFIGURATION_ID | CUST_LEVEL | DESCRIPTION   | SELLINSTART | SELLINEND | PRODUCT_GROUPS | RATEFUNDSOURCE |
		| 629 - KPI        | Level 3    | Funds & Rules | d+30/m/y    | d+60/m/y  |                |                |