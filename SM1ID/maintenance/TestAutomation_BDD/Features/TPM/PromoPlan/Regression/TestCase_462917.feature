Feature: TestCase_462917

@BDD_462917 @PROMO_Regression @PromoActions
Scenario: WEB_TPM_SP_PROMOPLANDOCUMENT_LINKS_001
	#1 Open Promo Plan Navigator
	Given the user navigates to the 'Promo plan' page

	#2 Open a Promo Plan for Customer @PPHOLDER(@REFYEAR)
	When the user filters the column by column name 'Customer Code', Filter Type 'Like', Value '<PPHOLDER>'
	And the user filters the column by column name 'Year of Reference', Filter Type 'Equal', Value '<REFYEAR>'
	And the user opens the grid item in row '1'
	#3 Click "Links" button from side menu
	And the user clicks on side panel 'Links'
	#Only "TPO" tab is present.
	Then the user validates that the 'Top Tab' with value 'TPO Session' is present
	And the user validates that the count for visible elements 'All Top Tabs' is '1'

Examples:
	| PPHOLDER | REFYEAR |
	| EC86163  | 2020    |