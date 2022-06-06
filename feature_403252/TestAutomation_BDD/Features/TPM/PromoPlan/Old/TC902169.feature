Feature: TestCase_902169
Restructuring of the Promo Plan UI buttons and toolbars

Scenario: WEB_TPM_SP_PROMO_PLAN_REDESIGN_US887451_AC1_001
AC_1
The following changes must be present in Promo Plan Calendar UI:
"New" option is a (+) button outside the Actions menu
Compare previous Year and Check anomalies are outside the Actions menu
Actions menu moved on the left
Base Scenario and Active scenario info moved on the left

	#Step 1
	Given the user has logged in with division '<DIVISION>'

	#Step 2
	When the user is on the 'Promo plan' page
	And the user filters the column by column name 'Promo Plan ID', 'like', '<PROMOPLANID>'
	And the user clicks on the link value '<PROMOPLANID>' on the grid

	#Step 3
	Then the user is on the 'Promo Plan Calendar Tab' page
	Then the 'New Button' is present
	And the 'Compare Previous Year Button' is present
	And the 'Check Anomalies Button' is present
	And the 'Actions Menu' is present
	And the 'Base Scenario Button' is present
	And the 'Active Scenario Button' is present

	Examples: 
	| DIVISION                                 | PROMOPLANID     |
	| XTEL TPM AUTOMATION - Global Group SM1V4 | C95E1F6413634E5 |