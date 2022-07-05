Feature: TestCase_784621

@BDD_784621 @PROMO_Regression @PromoPlan @PromoPlanN
Scenario: WEB_TPM_SP_SALESPROMOTION_PROMOPLAN_SHARED_SEGMENTS_MANUAL_ASSOCIATION_AC1_001
	#Step 1 Login to the app on @DIVISION on @USER_GROUP
	Given the user has logged in with division '<DIVISION>'

	#Step 2 Go to Promo Plan Navigator
	When the user navigates to the 'Promo plan' page

	#Step 3 Open in edit mode the responsibility matrix for @PPHOLDER for @REFYEAR
	And the user filters the column by column name 'Customer Code', Filter Type 'Like', Value '<PPHOLDER>'
	And the user filters the column by column name 'Year of Reference', Filter Type 'Equal', Value '<REFYEAR>'
	And the user clicks on 'Text' with value '<PPHOLDER>'
	And the user clicks on the 'Segment Responsibility'
	And the user clicks on 'Button' with value 'Edit'

	#Step 4 Set the @USER responsible for @SEGMENT1 at @PRODLEV family 
	And the user select value '<PRODLEV>' from dropdown list 'Product Level'
	And the user assigns segments to user in responsibility matrix with description: '<SEGMENT1>'

	#Step 5 Save and close the Responsibility Matrix
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	#Step 6 Open in Edit mode the @PPHOLDER on @REFYEAR
	And the user filters the column by column name 'Customer Code', Filter Type 'Like', Value '<PPHOLDER>'
	And the user filters the column by column name 'Year of Reference', Filter Type 'Equal', Value '<REFYEAR>'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	#The @SCENARIO displayed is the Common one (in the Toolbar the Active scenario is scenario "1")
	Then the user validates that 'Active Scenario' text contains '<SCENARIO>'

	#Step 7 Click on Filters funnel (to open the filters menu)
	When the user clicks on the 'Filter Button'
	#The active scenario is  Scenario "1"
	Then the user validates that 'Input By Label Name' with value 'Active Scenario' has text '1 - Common Base Scenario'

	#Step 8 Close the Promo Plan
	When the user clicks on the 'Close Tab'
	And the user clicks on the 'Close Tab'

	

Examples:
	| DIVISION                               | USER_GROUP | PPHOLDER | REFYEAR | USER | SEGMENT1 | PRODLEV | SCENARIO                                |
	| XTEL AUTOMATION 4 - Global Group SM1V4 | TODO2      | EC94431  | x/x/y   |      | RUM      | Family  | ACTIVE SCENARIO: 1 - COMMON BASE SCENARIO |
        