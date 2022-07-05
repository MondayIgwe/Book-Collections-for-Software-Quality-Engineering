Feature: TestCase_461186

@BDD_461186 @PROMO_Nightly @FundsAndRules @FundsAndRulesNightly
Scenario: WEB_TPM_SP_FR_GUIDELINES
	#2 Go to F&R navigator
	Given the user navigates to the 'Funds & Rules' page
	#Step 3 -6
	When the user creates a new fund and rules with configuration ID: '<CONFIGURATION_ID>' BRCustomerLevel: '<CUST_LEVEL>' Description: '<DESCRIPTION >' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' productGroup: '<PRODUCT_GROUPS>' rateFundSource: '<RATEFUNDSOURCE>'
	#7 Go to "Constraints" tab
	And the user clicks on the 'Constraints Tab'
	#In the constraints grid, the following cols are visible:
	And The user is on the 'Constraints Columns' page
	Then the user validates that the 'Constraint Id Column' is visible
	And the user validates that the 'Start Date Column' is visible
	And the user validates that the 'End Date Column' is visible
	And the user validates that the 'Max Incidence Column' is visible
	And the user validates that the 'Min Incidence Column' is visible
	And the user validates that the 'Promo Amountly Column' is visible
	And the user validates that the 'Max Actions Column' is visible
	And the user validates that the 'Min Actions Column' is visible
	And the user validates that the 'Min Roi Column' is visible
	And the user validates that the 'Sell-in Days Column' is visible
	And the user validates that the 'Sell-out Days Column' is visible
	And the user validates that the 'Contiguos Sell-in Days Column' is visible
	And the user validates that the 'Product Column' is visible
	And the user validates that the 'Family Column' is visible
	#8 Close the F&R document
	When The user is on the '' page
	And the user clicks on the 'Close Tab'

	Examples:
		| CONFIGURATION_ID | CUST_LEVEL | DESCRIPTION   | SELLINSTART | SELLINEND | PRODUCT_GROUPS | RATEFUNDSOURCE |
		| 629 - KPI        | Level 3    | Funds & Rules | d+30/m/y    | d+60/m/y  |                |                |