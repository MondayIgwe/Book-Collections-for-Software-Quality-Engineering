Feature: TestCase_451183

@BDD_451183 @PROMO_Nightly @FundsAndRules @FundsAndRulesNightly
Scenario: WEB_TPM_SP_FR_CONTRAINTS_MONEYFUNDGRID_001
	#2 Go to F&R navigator
	Given the user navigates to the 'Funds & Rules' page
	#3 Click on "ADD" - > 
	When the user clicks on the 'Add Button'
	And the user select value '<CONFIGURATIONID>' from dropdown list 'Configuration ID'
	#4 Click "OK"
	And the user clicks on 'Popup Ok button' with value '[New Fund&Rules]'
	#5 Go to "Constraints" tab
	And the user clicks on side panel 'Constraints'
	# In the constraints grid, the following cols are visible:IDCONSTRAINT -> always visible #MOVEMENTS (T3) •DTESTART -> always visible •DTEEND -> always visible•FUNDVALUE (T3)•FUNDNOTCOMMITTED (T3)•FUNDREMAINDER (T3)•FUNDRESERVE (T3)•FUNDUM (T3)
	Then the user validates that the 'Column Name' with value 'Code' is present
	And the user validates that the 'Column Name' with value 'Movements' is present
	And the user validates that the 'Column Name' with value 'Start Date' is present
	And the user validates that the 'Column Name' with value 'End Date' is present
	And the user validates that the 'Column Name' with value 'Fund value' is present
	And the user validates that the 'Column Name' with value 'Uncommitted Balance' is present
	And the user validates that the 'Column Name' with value 'Remaining balance' is present
	And the user validates that the 'Column Name' with value 'Fund reserve' is present
	And the user validates that the 'Column Name' with value 'Unit measure' is present
	#6 Close the document
	When the user clicks on the 'Close Tab'

	Examples:
		| CONFIGURATIONID  | 
		| 632 - Sales Fund |