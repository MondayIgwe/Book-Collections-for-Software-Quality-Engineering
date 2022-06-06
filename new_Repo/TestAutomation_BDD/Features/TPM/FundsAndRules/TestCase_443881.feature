Feature: TestCase_443881

@BDD_443881 @PROMO_Nightly @FundsAndRules
Scenario: WEB_TPM_SP_ANOM_GL_KPI_NUMERICS_001
	#Step 1
	Given the user navigates to the 'Funds & Rules' page
	#Step 2 - Create a Confirmed BR_01 having
	When the user creates a new fund and rules '<CONFIGURATIONID>' '<BRCUSTOMERLEVEL>' '<DESCRIPTION>' '<STARTSELLIN>' '<ENDSELLIN>' '<CategoryA>' '<RATEFUNDSOURCE>'
	And the user clicks on 'Side Panel Tab' with value 'Constraints'
	And user adds a 'Max number action' constraint with value '1' '' '' ''
	And the user clicks on 'Side Panel Tab' with value 'Summary'
	And the user changes the status to 'Confirm'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#3. Create a Promo in Draft with
	And the user navigates to the 'Promotional actions' page
	And the user removes all promotions with description '<DESCRIPTION>' and customer '<CUSTOMER>'
	And the user creates a Promo '<CUSTLEV>' '<CUSTOMER>'
	And the user populates the cockpit '<DESCRIPTION>' '<STARTSELLIN>' '<ENDSELLIN>' '<SELLOUTSTART>' '<SELLOUTEND>' '<MECHENIC>'
	And the user adds a product '<PRODLVL>' '<PRODUCT>'
	And the user clicks on the 'Save Button'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Alert Dialog Yes Button' if it exists
	#4 Go to Promo Navigator
	And the user clicks on the 'Refresh Button'
	#5. Open the created Promo in edit mode
	And the user filters the column by column name 'Action Id', 'Equal', 'ActionId'
	And the user clicks on 'Indexed Row Link' with value '1'
	And the user clicks on 'Button' with value 'Edit'
	#6 Check the Cockpit - > The number of  single products is higher than @nrOfProducts
	Then the user validates that the number of products is higher than '<nrOfProducts>'
	#7 Go to the "Business Rules" tab. -> KPI is injected and selected. (if it is not selected click on the checkbox to select it and save it)
	When the user clicks on 'Side Panel Tab' with value 'Products'
	And the user clicks on 'Top Tab' with value 'Business Rules'
	And the user clicks on 'Grid CheckBox Containing' with value '<DESCRIPTION>'
	And the user clicks on the 'Save Button'
	Then the user validates that the 'Side Panel Tab' with value 'General info' is present
	When the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Top Tab' with value 'Header info'
	And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode'
	#8 Click on "Copy Promo" button inside the promo
	And the user clicks on the 'Promo Copy Button'
	#9 Click OK in the Creation Popup keeping all information got from the source one.
	And the user clicks on 'Popup Ok Button' with value 'Copy Promotion'
	#10 Go to Workflow\Anomalies tab and Revaluate anomalies.
	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	And the user clicks on the 'ReEvaluate Anomalies Button'
	#GL_KPI_NUMERICS (Guide line: KPI Numerics anomaly) anomaly is displayed and the first 100 rows with the details for product and delivery point are shown.
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	And the user filters the column by column name 'Description', 'Like', '<DescriptionAnomaly>'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	And the user filters the column by column name 'Conflicting Action', 'Like', 'ActionCode'
	Then the user validates that the number of anomalies is equal to '<NrOfAnomalies>'
	#11 Go to the Product Grid
	When the user clicks on 'Side Panel Tab' with value 'Products'
	And the user clicks on 'Top Tab' with value 'Products'
	#12 Remove @FAM2 = 02 so the number of SKUs is lower than 100.
	And the user clicks on 'Grid CheckBox Containing' with value '<FAM2>'
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
	#13 Go to Workflow\Anomalies tab and Revaluate anomalies.
	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	And the user clicks on the 'ReEvaluate Anomalies Button'
	#Number of displayed rows is less than @NrOfAnomalies, so the grid  shows all N anomalies where N = #S (ship-to customers) * #P (products) > 100.
	Then the user validates that the number of anomalies is equal to '<NrOfAnomalies>'
	When the user clicks on the 'Close Tab'

	Examples:
		| CONFIGURATIONID | BRCUSTOMERLEVEL | CUSTLEV | CUSTOMER | DESCRIPTION             | STARTSELLIN | ENDSELLIN | SELLOUTSTART | SELLOUTEND | MECHENIC | PRODLVL | PRODUCT                                                                 | nrOfProducts | DescriptionAnomaly               | FAM2             | NrOfAnomalies | CategoryA | RATEFUNDSOURCE |
		| 629 - KPI       | 5 - Level 5     | Level 3 | EC86235  | NUMERICS Anomaly Test 1 | d+1/m/y     | d+4/m/y   |              |            | Leaflet  | Family  | 01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24 | 100          | Guide line: KPI Numerics anomaly | 02 - ITALIAN RED | 100           |           |                |