Feature: TestCase_573256

@BDD_573256 @PROMO_Nightly @noSellOutDate @PromoPlan @PromoPlanNightly
Scenario: WEB_TPM_SP_PROMODOCUMENT_TOOLBAR_PROMOPLANSCENARIOS_001
	#Go to Promo Plan Navigator
	Given the user has logged in with division '<DIVISION>'
	When the user navigates to the 'Promotional actions' page
	And the user removes all promotions with description '<DESCPROMO>' and customer '<CUSTOMER>'
	And the user navigates to the 'Promo plan' page
	#Open promo plan related to @CUSTOMER(@YEAR) = EC86232 (2020)
	And the user filters the column by column name 'Customer Code', Filter Type 'Like', Value '<CUSTOMER>'
	And the user filters the column by column name 'Year of Reference', Filter Type 'Equal', Value '<REFYEAR>'
	And the user opens the grid item in row '1'
	#3. Switch Promo plan document to Edit
	And the user clicks on the 'Edit Button'
	#remove old scenarios
	And the user removes old promo scenarios
	#4. Open Actions menu\Update Description
	And the user clicks on the Action 'Change Scenario Description Action Link'
	#5 Set in the popup: Selected Scenario = @SOURCESCENARIOID = 1  Description = @BASESCENARIODESC  = "Base Scenario"
	And the user select value containing '<SOURCESCENARIOID>' from the combo 'Selected Scenario Update Combo'
	And the user enters '<BASESCENARIODESC>' in the 'Popup Scenario Description'
	And the user clicks on the 'OK Button'
	#6 Open Actions menu\Add new scenario
	And the user clicks on the Action 'Add New Scenario Action Link'
	And the user enter text '<SCENARIODESC>' on the field with label 'Scenario Description'
	And the user clicks on the 'OK Button'
	#From filters menu set as active @BASESCENARIODESC
	And the user clicks on the 'Filter Button'
	And the user selects active scenario '<BASESCENARIODESC>' from dropdown list 'Active Scenario'
	And the user clicks on the 'Filter Apply Button'
	#9 Open Actions menu\New
	#10 In the Creation popup CONTRACTOR =  @CUSTOMER Conf. Level = Holder Level Coverage = @CUSTLEVEL  Click OK
	And the user creates a Promo with customerHLevel: '<CUSTLEVEL>' customerCode: '<CUSTOMER>'
	And the user populates the cockpit with description: '<DESCPROMO>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<MECH>'

	And the user adds a product with productLevel: '<PRODLVL>' productCodes: '<PRODCODE1>'
	And the user adds a product with productLevel: '<PRODLVL>' productCodes: '<PRODCODE2>'

	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#Promo is shown in the calendar (NATIONAL TIER) with 2 bars related to added @PRODS: having these description: @PRODDESCR
	Then the user validates that product code '<PRODNAME1>' is under tier 'National'
	And the user validates that product code '<PRODNAME2>' is under tier 'National'
	#12 From the Promo Plan Calendar,  Open in Edit mode the promotion
	And the user validates that the 'Calendar Promo Plan' with value '<DESCPROMO>' is present
	When the user opens promo by description '<DESCPROMO>'
	And the user clicks on the 'Edit Button'
	#13 Click on "Promo Plan Scenarios" in the toolbar
	And the user clicks on the 'Promo Plan Scenario Button'
	#14 Deselect "Scenario 2". (This step id done differently in 8.1 and 8.2)
	And the user clicks on 'Selection Popup Checkbox Contains' with value '<SCENARIODESC>'
	#15 Click OK in the pop-up  "PromoPlan Scenario"
	And the user clicks on the 'OK Button'
	#Save and close the promo Promo is shown in the calendar with 2 bars related to added @PRODS
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#17 Open Filter Panel and change Active Scenario to "Scenario 2" Filter- Active Scenario combo- select "Scenario 2". Click "Apply"
	And the user clicks on the 'Filter Button'
	And the user selects active scenario '<SCENARIODESC>' from dropdown list 'Active Scenario'
	And the user clicks on the 'Filter Apply Button'
	Then the user validates that the 'Calendar Promo Plan' with value '<DESCPROMO>' is not present
	#18 Open Filter Panel and change Active Scenario to "Base Scenario" Filter- Active Scenario combo- select Base Scenario. Click "Apply"
	When the user clicks on the 'Filter Button'
	And the user selects active scenario '<BASESCENARIODESC>' from dropdown list 'Active Scenario'
	And the user clicks on the 'Filter Apply Button'
	Then the user validates that the 'Calendar Promo Plan' with value '<DESCPROMO>' is present
	When the user clicks on the 'Close Tab'

	Examples:
		| DIVISION                                 | CUSTOMER | REFYEAR  | BASESCENARIODESC | SOURCESCENARIOID | SCENARIODESC | CUSTLEVEL | DESCPROMO        | SELLINSTART | SELLINEND  | SELLOUTSTART | SELLOUTEND | MECH     | PRODLVL | PRODCODE1 | PRODCODE2 | PRODNAME1            | PRODNAME2               |
		| XTEL TPM AUTOMATION - Global Group SM1V4 | EC86232  | x/x/2020 | Base Scenario    | 1 -              | Scenario 2   | Level 3   | test_573256_desc | 01/11/2020  | 15/11/2020 |              |            | TPR in % | Product | 001       | 002       | BACCO ALBANA 0,75 lt | PRESTIGE ALBANA 0,75 lt |