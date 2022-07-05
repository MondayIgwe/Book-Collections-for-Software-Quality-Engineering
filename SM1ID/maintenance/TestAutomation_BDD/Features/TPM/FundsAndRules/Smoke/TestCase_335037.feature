Feature: TestCase_335037

@BDD_335037 @PROMO_Regression @FundsAndRules @PROMO_Smoke
Scenario: TPM_FR_W_SMOKE_R81V1_0002 - F&R Creation Popup
	#Step 1 - Go to "Fund & Rules" navigator
	Given the user navigates to the 'Funds & Rules' page
	#2 Create a New F&R
	When the user clicks on the 'Add Button'
	#A Creation popup is opened. The mandatory field "Configuration ID" is shown empty (no prefiltered value)
	Then the user validates that the 'Popup' with value '[New Fund&Rules]' is displayed
	Then the user validates that the 'Mandatory Icon' with value 'Configuration ID' is displayed
	#3 Open combo
	When the user clicks on 'Generic Drop Down Trigger' with value 'Configuration ID' until 'List' with value '<FR_CONFID1>' is present
	#The list of all available Configuration ID(s) is shown. In particular, @FR_CONFID1 is in the list, @FR_CONFID2 is not in the list.
	Then the user validates that the 'List' with value '<FR_CONFID1>' is present
	And the user validates that the 'List' with value '<FR_CONFID2>' is not present
	#4 Select FR_CONFID1
	When the user clicks on 'List' with value '<FR_CONFID1>'
	#5 In the popup, click on "Cancel" button
	When the user clicks on 'Popup Cancel Button' with value '[New Fund&Rules]'
	#No F&R document is created. "Fund&Rules" nav. is shown
	Then the user validates that the 'Input By Label Name' with value 'Configuration ID' is not displayed
	And the user validates that the 'Column' with value 'Funds & Rules' is displayed

Examples:
	| FR_CONFID1       | FR_CONFID2           |
	| 632 - Sales Fund | 721 - Sales Revenues |