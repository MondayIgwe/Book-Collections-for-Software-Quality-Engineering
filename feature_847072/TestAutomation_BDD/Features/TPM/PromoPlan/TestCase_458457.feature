Feature: TestCase_458457

@BDD_458457 @PROMO_Nightly @PromoPlan @PromoPlanNightly
Scenario: WEB_TPM_SP_PROMOPLANDOCUMENT_FILTERPANEL_ACTIVESCENARIO_001
	#Go to Promo Plan Navigator
	Given the user navigates to the 'Promotional actions' page
	When the user removes all promotions with description '<DESCR_NATIONAL>' and customer '<PPHOLDER>'
	And the user navigates to the 'Promo plan' page
	#Select the Promo Plan for @CUSTOMER and @REFYEAR
	Then the user validates that the 'First Row' is present
	When the user filters the column by column name 'Customer Code', Filter Type 'Like', Value '<PPHOLDER>'
	And the user filters the column by column name 'Year of Reference', Filter Type 'Equal', Value '<REFYEAR>'
	And the user opens the grid item in row '1'
	#From Promo Plan Document, Actions\new Create a new Promo with:
	When the user creates a Promo with customerHLevel: '<PPHOLDERLEV>' customerCode: '<PPHOLDER>'
	And the user populates the cockpit with description: '<DESCR_NATIONAL>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<MECHANICS>'
	And the user adds a product with productLevel: '<PRODLVL>' productCodes: '<PROD1>'
	And the user adds a product with productLevel: '<PRODLVL>' productCodes: '<PROD2>'

	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Close Tab'
	#2 Open Promo Plan Navigator
	#Open Promo Plan for customer @PPHOLDER (@REFYEAR)
	And the user opens the grid item in row '1'
	#Click on Edit
	And the user clicks on 'Button' with value 'Edit'
	#delete other scenarios
	And the user removes old promo scenarios
	#5 From Actions\Add New Scenario, create  a new scenario (Source: 1- (Base) @DESCR_SCENARIO: "Scenario 2") Click OK
	And the user clicks on the Promo Action 'Add New Scenario'
	And the user enter text '<DESCR_SCENARIO>' on the field with label 'Scenario Description'
	And the user clicks on the 'OK Button'
	#6 Click "Filters" button. in the side popup, The filters menu is present and Base scenario field is not editable and the active scenario field is editable and has selected the @DESCR_SCENARIO
	And the user clicks on the 'Filter Button'
	Then the user validates the 'Base Scenario Textbox' is disabled
	#7 Click on "Active Scenario" field
	#8 Select the alternative scenario "Scenario 2" 
	When the user selects active scenario '<SCENARIO_TO_SELECT>' from dropdown list 'Active Scenario'
	And the user clicks on 'Button' with value 'Apply'
	Then the user validates that 'Active Scenario' text contains '<SCENARIO_TO_SELECT>'
	#10 From Actions\Remove, Remove one of the Draft promo of the Base Scenario. Click OK in the confirmation popup. Promo is removed by calendar view
	When the user clicks on 'Calendar Promo Plan' with value '<DESCR_NATIONAL>'
	And the user clicks on the Promo Action 'Delete'
	And the user clicks on the 'Alert Dialog Yes Button'
	Then the user validates that the 'Calendar Promo Plan' with value '<DESCR_NATIONAL>' is not present
	#11 Click "Filters" button
	When the user clicks on the 'Filter Button'
	#12 Click on "Active Scenario" field
	#13 Select the @BASE_SCENARIO base scenario "1 - " 
	And the user selects active scenario '<BASE_SCENARIO>' from dropdown list 'Active Scenario'
	#14 Click "Apply" button Side popup is closed The Calendar view displays the alternative scenario information. Promo previously deleted now is still visible.
	And the user clicks on 'Button' with value 'Apply'
	Then the user validates that the 'Calendar Promo Plan' with value '<DESCR_NATIONAL>' is present
	When the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Close Tab'

	Examples:
		| PPHOLDER | CONFIRMATIONLEVHOLDER | PPHOLDERLEV | DESCR_NATIONAL       | SELLINSTART | SELLINEND  | SELLOUTSTART | SELLOUTEND | REFYEAR  | MECHANICS | PRODLVL | PROD1 | PROD2 | DESCR_SCENARIO | SCENARIO_TO_SELECT | BASE_SCENARIO |
		| EC93906  | Holder level          | Level 3     | DRAFT NATIONAL PROMO | 16/06/2021  | 26/06/2021 |              |            | x/x/2021 | TPR in %  | Product | 002   | 070   | Scenario 2     | Scenario 2         | 1 -           |