Feature: TestCase_455365

@BDD_455365 @PROMO_Regression @FundsAndRules
Scenario: WEB_TPM_SP_FRDOCUMENT_RATEBASEDFUND_001
	#Step 1 Go to F&R navigator
	Given the user navigates to the 'Funds & Rules' page
	#2 Click "Add" button from the toolbar
	When the user clicks on the 'Add Button'
	#"New Funds&Rules" popup is displayed
	Then the user validates that the 'Popup' with value '[New Fund&Rules]' is displayed
	#3 From the "Configuration ID" drop down menu select @CONFIGURATIONID = Rate Based Fund
	When the user select value '<CONFIGURATIONID>' from dropdown list 'Configuration ID'
	#The system accepts the selection
	Then the user validates that 'Input By Label Name' with value 'Configuration ID' has text '<CONFIGURATIONID>'
	#4 Click "OK" button
	When the user clicks on 'Popup Ok Button' with value '[New Fund&Rules]'
	#The Summary tab for the new Funds & Rules document is displayed with a combo field named "Rate Fund Source" where it is possible to select data source (populated by SP_RATEFUNDSOURCE qtab)(single selection)
	Then the user validates that 'Input By Label Name' with value 'Configuration ID' has text '<CONFIGURATIONID>'
	When the user select value 'SOURCE1 - NETAMOUNT' from dropdown list 'Rate Fund Source'
	Then the user validates that 'Input By Label Name' with value 'Rate Fund Source' has text 'SOURCE1 - NETAMOUNT'
	#5 Click on "Constraints" tab from the sidemenu
	When the user clicks on side panel 'Constraints'
	#The grid contains the following columns:
	Then the user validates that the 'Column Name' with value 'Code' is present
	And the user validates that the 'Column Name' with value 'Movements' is present
	And the user validates that the 'Column Name' with value 'Start Date' is present
	And the user validates that the 'Column Name' with value 'End Date' is present
	And the user validates that the 'Column Name' with value 'Fund Source Value' is present
	And the user validates that the 'Column Name' with value '% Rate Fund' is present	
	And the user validates that the 'Column Name' with value 'Uncommitted Balance' is present
	And the user validates that the 'Column Name' with value 'Remaining balance' is present
	And the user validates that the 'Column Name' with value 'Fund reserve' is present
	And the user validates that the 'Column Name' with value 'Unit measure' is present
	#In the toolbar next to "Copy Constraints" button the "Calculate" button is shown
	And the user validates that the 'Button Link' with value 'Calculate' is present

	
Examples:
	| CONFIGURATIONID       |
	| 633 - Rate Based Fund |