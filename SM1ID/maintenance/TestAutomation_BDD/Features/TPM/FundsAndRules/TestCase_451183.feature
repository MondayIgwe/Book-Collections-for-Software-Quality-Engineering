Feature: TestCase_451183

@BDD_451183 @PROMO_Nightly @FundsAndRules @FundsAndRulesNightly
Scenario: WEB_TPM_SP_FR_CONTRAINTS_MONEYFUNDGRID_001
	#2 Go to F&R navigator
	Given the user navigates to the 'Funds & Rules' page
	#3 Click on "ADD" - > 
	When the user clicks on the 'Add Button'
	And the user select value '<CONFIGURATIONID>' from the combo 'Configuration Id Combo'
	#4 Click "OK"
	And the user clicks on the 'OK Button'
	#5 Go to "Constraints" tab
	And the user clicks on the 'Constraints Tab'
	# In the constraints grid, the following cols are visible:IDCONSTRAINT -> always visible #MOVEMENTS (T3) •DTESTART -> always visible •DTEEND -> always visible•FUNDVALUE (T3)•FUNDNOTCOMMITTED (T3)•FUNDREMAINDER (T3)•FUNDRESERVE (T3)•FUNDUM (T3)
	And The user is on the 'Constraints Columns' page
	Then the user validates that the 'Constraint Id Column' is visible
	And the user validates that the 'Movements Column' is visible
	And the user validates that the 'Start Date Column' is visible
	And the user validates that the 'End Date Column' is visible
	And the user validates that the 'Fund Value Column' is visible
	And the user validates that the 'Uncommitted Balance Column' is visible
	And the user validates that the 'Remaining balance Column' is visible
	And the user validates that the 'Fund reserve Column' is visible
	And the user validates that the 'Unit measure Column' is visible
	And the user validates that the 'Family Column' is visible
	#6 Close the document
	When The user is on the '' page
	And the user clicks on the 'Close Tab'

	Examples:
		| CONFIGURATIONID  | 
		| 632 - Sales Fund |