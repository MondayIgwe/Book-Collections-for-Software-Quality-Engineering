Feature: TestCase_458045

@BDD_458045 @PROMO_Nightly @PromoPlan @PromoPlanNightly
Scenario: WEB_TPM_SP_PROMOPLANDOCUMENT_DRAGDROP_CREATENEW_PROMO_001
	#1 Promo National inside current PromoPlan (Draft)  @DIVISION
	Given the user has logged in with division '<DIVISION>'
	When the user navigates to the 'Promotional actions' page
	And the user removes all promotions with description '<DESCR_NATIONAL2>' and customer '<PPHOLDER>'
	And the user removes all promotions with description '<DESCR_NATIONAL>' and customer '<PPHOLDER>'
	And the user navigates to the 'Promo plan' page
	#Select the Promo Plan for @CUSTOMER and @REFYEAR
	Then the user validates that the 'First Row' is present
	When the user filters the column by column name 'Customer Code', Filter Type 'Like', Value '<PPHOLDER>'
	And the user filters the column by column name 'Year of Reference', Filter Type 'Equal', Value '<REFYEAR>'
	And the user opens the grid item in row '1'
	Then the user validates that the Loading Mask is not present
	#From Promo Plan Document, Actions\new Create a new Promo with:
	When the user creates a Promo with customerHLevel: '<PPHOLDERLEV>' customerCode: '<PPHOLDER>'
	And the user populates the cockpit with description: '<DESCR_NATIONAL>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<MECH>'
	
	And the user adds a product with productLevel: '<PRODLEVEL>' productCodes: '<PRODCODE>'
	And the user adds a product with productLevel: '<PRODLEVEL>' productCodes: '<PRODCODE2>'

	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Close Tab'
	#2 Open Promo Plan Navigator
	#3Open Promo Plan for customer @PPHOLDER (@REFYEAR)
	And the user navigates to the 'Promo plan' page
	Then the user validates that the 'First Row' is present
	When the user filters the column by column name 'Customer Code', Filter Type 'Like', Value '<PPHOLDER>'
	And the user filters the column by column name 'Year of Reference', Filter Type 'Equal', Value '<REFYEAR>'
	And the user opens the grid item in row '1'
	#4 Place the mouse on National tier and using Drag&Drop select a period
	Then the user validates that the Loading Mask is not present
	When the user clicks on 'Zoom Out Button' until 'Year Quarter' with value 'Q3' and value '1' is present
	And the user selects a period on promo plan calendar for product '<DESC>' from year '2020' quarter 'Q1' to year '2020' quarter 'Q2'
	#The "New Promotion" window is displayed and the "Confirmation Level" is not editable meaning that Template/Delegations promotions can not be created.
	Then the user validates that the 'Popup' with value 'New Promotion' is present
	And the user validates that the 'Input By Label Name' with value 'Confirmation level' is disabled
	When the user clicks on 'Popup Ok Button' with value 'New Promotion'
	#The contractor is @PPHOLDER
	Then the user validates that the Loading Mask is not present
	And the user validates that 'Input By Label Name' with value 'Customer holder' contains text '<PPHOLDER>'
	#The cockpit of the new promotion is displayed and the sellin and sellout are filled in according to the drag&drop period
	And the user validates that 'Validity Period Start Date' is in quarter 'Q1'
	And the user validates that 'Validity Period End Date' is in quarter 'Q2'
	And the user validates that 'Validity Period Start Date' text contains '2020'
	And the user validates that 'Validity Period End Date' text contains '2020'
	#Add Description, mechanics and products to the promo:
	When the user enters '<DESCR_NATIONAL2>' in field 'Input By Label Name' with value 'Description'
	And the user clicks on side panel 'General info'
	And the user clicks on 'Mechanics CheckBox' with value '<MECH>'
	And the user adds a product with productLevel: '<PRODLEVEL>' productCodes: '<PRODCODE>'
	And the user adds a product with productLevel: '<PRODLEVEL>' productCodes: '<PRODCODE2>'
	And the user clicks on 'Close Tab' with value '' until 'Alert Dialog Yes Button' with value '' is present
	And the user clicks on the 'Alert Dialog Yes Button'
	#The promotion is present in the promo plan calendar
	Then the user validates that the Loading Mask is not present
	And the user validates that the 'Calendar Promo Plan' with value '<DESCR_NATIONAL2>' is present
	
	Examples:
		| DIVISION                                 | PPHOLDER | CONFLEV      | PPHOLDERLEV | DESCR_NATIONAL       | DESCR_NATIONAL2          | SELLINSTART | REFYEAR  | SELLINEND    | MECH     | PRODCODE | PRODCODE2 | PRODLEVEL | DESC                       | DESC2                     | SELLOUTSTART | SELLOUTEND |
		| XTEL TPM AUTOMATION - Global Group SM1V4 | EC94002  | Holder Level | Level 3     | DRAFT NATIONAL PROMO | NEW DRAFT NATIONAL PROMO | d/06/2020   | x/x/2020 | d+20/06/2020 | TPR in % | 052      | 053       | Product   | MIRENE VINHO VERDE 0.75 lt | MIRENE VINHO VERDE 1.5 lt |              |            |