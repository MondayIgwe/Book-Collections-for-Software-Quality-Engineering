Feature: TestCase_614828

@BDD_614828 @PROMO_Regression @PromoPlan
Scenario: WEB_TPM_SP_PROMOPLAN_NEW_SCENARIO_ACTIVE_US589113_AC1_OFF_001
	#Step 1 Login to App with @DIVISION (as Normal user)
	Given the user has logged in with division '<DIVISION>'

	#Step 2 Go to Promo Plan Navigator
	When the user navigates to the 'Promo plan' page

	#Step 3 Select the Promo Plan for @CUSTOMER and @REFYEAR
	When the user filters the column by column name 'Customer Code', Filter Type 'Like', Value '<CUSTOMER>'
	And the user filters the column by column name 'Year of Reference', Filter Type 'Equal', Value '<REFYEAR>'

	#Step 4 Open the selected Promo Plan
	And the user opens the grid item in row '1'

	#Step 5 Click on 'Edit' button
	And the user clicks on 'Button' with value 'Edit'

	#Step 6 Click on 'Actions'
	And the user clicks on the 'Actions Button'

	#Step 7 Click on 'Add New Scenario Action'
	And the user clicks on the Action 'Add New Scenario Action'
	#Step 8 Create new Scenario with:
	And the user enter text '<SCENDESC1>' on the field with label 'Scenario Description'

	#Step 9 Click on 'OK'
	And the user clicks on the 'OK Button'
	#Check that the 'Active Scenario:' = @SCENDESC1
	Then the user validates that 'Active Scenario' text contains '<SCENDESC1>'
	When the user clicks on the 'Close Tab'
	And the user clicks on the 'Close Tab'

	Examples:
		| DIVISION                                 | CUSTOMER | REFYEAR | SOURCESCEN | SCENDESC1          |
		| XTEL TPM AUTOMATION - Global Group SM1V4 | EC86224  | 2021    | 1 -        | Scen1_US589113_OFF |
