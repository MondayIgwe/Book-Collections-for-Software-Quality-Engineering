Feature: TestCase_626823

@BDD_626823 @PROMO_Regression @PromoPlan @PromoPlan
Scenario: WEB_TPM_SP_PROMOACTION_SAVE_PROMPT_PROMOPLAN_SCENARIOS_BUTTON_AC1_OFF_002
	#Step 1 Login to App with @DIVISION (as Normal user)
	Given the user has logged in with division '<DIVISION>'

	#Step 2 Go to Promo Plan navigator
	When the user navigates to the 'Promo plan' page

	#Step 3 Select the Promo Plan for @CUSTOMER and @REFYEAR
	And the user filters the column by column name 'Customer Code', Filter Type 'Like', Value '<CUSTOMER>'
	And the user filters the column by column name 'Year of Reference', Filter Type 'Equal', Value '<REFYEAR>'

	#Step 4 Open the selected Promo Plan
	And the user opens the grid item in row '1'

	#Step 5 Click on 'Edit' button
	And the user clicks on 'Button' with value 'Edit'

	#Step 6 Click on 'Actions'
	And the user clicks on 'Button' with value 'Actions'

	#Step 7 Click on 'Add New Scenario Action'
	And the user clicks on 'Text' with value 'Add New Scenario Action'
	
	#Step 8 Create new Scenario with: Scenario Description = @SCENDESC1
	And the user enter text '<SCENDESC1>' on the field with label 'Scenario Description'
	
	#Step 9 Click on 'OK'
	And the user clicks on 'Popup Button' with value 'OK'

	#Step 10 Click on 'Actions'
	And the user clicks on 'Button' with value 'Actions'

	#Step 11 Click on 'New' / Step 12 Create a New Promo with:
	And the user creates a Promo with customerHLevel: '<CUSTLEVEL>' customerCode: '<CUSTOMER>'
	And the user populates the cockpit with description: '<DESCPROMO>' sellInStart: '<SELLINSTART1>' sellInEnd: '<SELLINEND1>' sellOutStart: '<SELLOUTSTART1>' sellOutEnd: '<SELLOUTEND1>' mechanics: '<MECH>'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user adds a product with productLevel: '<PROMOPRODLEVEL>' productCodes: '<PRODCODE>'

	#Step 13 Save the Promo
	And the user clicks on the 'Save Button'

	#Step 14 Modify the below fields:
	And the user clicks on side panel 'Cockpit'
	And the user selects validity period from: '<SELLINSTART2>' to: '<SELLINEND2>' on the 'Validity Period Start Date' field
	And the user selects validity period from: '<SELLOUTSTART2>' to: '<SELLOUTEND2>' on the 'Validity Period Start Date' field


	#Step 15 Click on @PRBUTTON
	And the user clicks on the 'Promo Plan Scenario Button'
	#Check that a popup is shown with 2 options:@OPTION1 and @OPTION2
	Then the user validates that the 'Alert Dialog Message Box' is present
	And the user validates that the 'Alert Dialog Ok Button' is displayed
	And the user validates that the 'Alert Dialog Cancel Button' is displayed

	#Step 16 Click on @OPTION2
	When the user clicks on 'Button' with value '<OPTION2>'
	#Check that the popup is closed with no further action
	Then the user validates that the 'Alert Dialog Message Box' is not present

	#Step 17 Click on @PRBUTTON
	When the user clicks on the 'Promo Plan Scenario Button'
	
	#Step 18 Click on @OPTION1
	And the user clicks on 'Button' with value '<OPTION1>'
	#Check that the Promo is saved and then the Reassignment popup is automatically opened.
	Then the user validates that the 'Popup' with value 'Scenarios Selection' is present
	When the user closes all pages without saving the work done

Examples:
	| DIVISION                                 | CUSTOMER | REFYEAR | SCENDESC1             | CONFLEVEL    | CUSTLEVEL | DESCPROMO           | SELLINSTART1 | SELLINEND1 | SELLOUTSTART1 | SELLOUTEND1 | MECH    | PROMOPRODLEVEL | PRODCODE | PROMOACID | SELLINSTART2 | SELLINEND2 | SELLOUTSTART2 | SELLOUTEND2 | PRBUTTON           | OPTION1 | OPTION2 |
	| XTEL TPM AUTOMATION - Global Group SM1V4 | EC86206  | x/x/y   | Scen_US587320_AC1_OFF | Holder Level | Level 3   | Pr_US587320_AC1_OFF | d+5/m/y      | d+15/m/y   | d+5/m/y       | d+15/m/y    | Leaflet | Product        | 066      |           | d+10/m/y     | d+20/m/y   | d+10/m/y      | d+20/m/y    | PromoPlan Scenario | OK      | Cancel  |
