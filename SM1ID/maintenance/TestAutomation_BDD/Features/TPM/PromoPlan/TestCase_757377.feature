Feature: TestCase_757377

@BDD_757377 @PROMO_Regression @PromoPlan @PromoPlan
Scenario: WEB_TPM_SP_PROMOPLAN_SHARED_SEGMENTATION_US692437_AC3_003
	#Step 1 Login to the app on the @DIVISION
	Given the user has logged in with division '<DIVISION>'

	#Step 2 Go to Promo Plan Navigator
	When the user navigates to the 'Promo plan' page

	#3 Open the @PPHOLDER with @REFYEAR 
	When the user filters the column by column name 'Customer Code', Filter Type 'Like', Value '<PPHOLDER>'
	And the user filters the column by column name 'Year of Reference', Filter Type 'Equal', Value '<REFYEAR>'
	#The default scenario is the "Common Base"
	#Then the user validates that the 'Base Scenario' with value 'Common Base' is present
	Then the user validates that column 'Base Scenario' has '1 - Common Base Scenario' with row text '<PPHOLDER>'
	When the user clicks on link on column 'Promo Plan ID' with row text '<PPHOLDER>'
	
	#Step 4 Switch it to Edit mode
	Then the user validates that the Loading Mask is not present
	When the user clicks on 'Button' with value 'Edit'
	#Then the user validates that the 'Base Scenario' with value 'Common Base' is present
	Then the user validates that the 'Text' with value 'Base Scenario: 1 - Common Base Scenario' is present

	#Step 5 Close the @PPHOLDER
	When the user clicks on the 'Close Tab'

Examples:
	| DIVISION                               | PPHOLDER | REFYEAR |
	| XTEL AUTOMATION 4 - Global Group SM1V4 | EC94431  | x/x/y   |