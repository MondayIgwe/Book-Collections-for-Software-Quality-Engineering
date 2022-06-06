Feature: TestCase_573258

@BDD_573258 @PROMO_Nightly @PromoActions
Scenario: WEB_TPM_SP_PROMOPLANDOCUMENT_ACTIONS_REMOVESCENARIO_001
	#Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	When the user removes all promotions with description '<DESCR_1>' and customer '<CUST>'
	And the user navigates to the 'Promotional actions' page
	And the user removes all promotions with description '<DESCR_2>' and customer '<CUST>'

	#Step 1
	And the user creates a Promo '<CUSTLEV>' '<CUST>'
	And the user populates the cockpit '<DESCR_1>' '<SELLINSTART>' '<SELLINEND>' '<SELLOUTSTART>' '<SELLOUTEND>' '<MECHANICS>'
	And the user adds a product '<PRODUCTSLEVEL>' '<PROD>'
	And the user adds a product '<PRODUCTSLEVEL>' '<PROD2>'
	And the user enters '<QTYESTIMATED>' on column name 'Estimated quantity' for product code '<PROD>'
	And the user enters '<QTYESTIMATED2>' on column name 'Estimated quantity' for product code '<PROD2>'
	And the user enters '<DISC_PERC>' on column name '% Cut Price' for product code '<PROD>'
	And the user enters '<DISC_PERC2>' on column name '% Cut Price' for product code '<PROD2>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'Promo1_ID'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#2 Access the Promo Plan Calendar related to @PPHOLDER (@REFYEAR).
	And the user navigates to the 'Promo plan' page
	And the user filters the column by column name 'Customer Code', 'Like', '<PPHOLDER>'
	And the user filters the column by column name 'Year of Reference', 'Equal', '<REFYEAR>'
	And the user clicks on 'Indexed Row Link' with value '1'
	#3. Click "Edit" button
	And the user clicks on 'Button' with value 'Edit'
	#remove old scenarios
	And the user removes old promo scenarios
	#4.Click "Actions" button\Add New Scenario
	And the user clicks on the Promo Action 'Add New Scenario'
	#5 Set in the popup "Source Scenario" = @BASESCENARIO "1 - " (Base Scenario) "Description" = @DESCR_NONBASE_SCENARIO Click OK
	And the user select value containing '<BASESCENARIO>' from dropdown list 'Source Scenario'
	And the user enter text '<DESCR_NONBASE_SCENARIO>' on the field with label 'Scenario Description'
	And the user clicks on 'Popup Ok Button' with value 'Add Scenario'
	#6 Click on Promo @DESCR_1
	And the user opens promo by description '<DESCR_1>'
	#7 Change Sell-in/out end date by increasing it of 1 week @SELLINEND_1 @SELLOUTEND_1 Change promo description = @DESCR_2 = "PROMO 2" and save promo
	And the user selects validity period '<SELLINSTART>' '<SELLINEND_1>' on the 'Sell In Date' field
	And the user selects validity period '<SELLOUTSTART>' '<SELLOUTEND_1>' on the 'Sell Out Start Date' field

	And the user enters '<DESCR_2>' in field 'Input By Label Name' with value 'Description'
	And the user clicks on the 'Save Button'
	#8 Click on "Promo Plan Scenarios" button in the toolbar In the assignation popup "PROMO 2" is linked only to @DESCR_NONBASE_SCENARIO
	And the user clicks on the 'Promo Plan Scenario Button'
	Then 'Active Scenario Description Cell' text contains '<DESCR_NONBASE_SCENARIO>'
	#9 Close popup
	When the user clicks on 'Popup Ok Button' with value 'Scenarios Selection'
	#10 Get $Promo2_ID
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'Promo2_ID'
	#11 Save and Close promo
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#12 Click "Actions" button
	#13 Click "Remove Existing Scenario" button The "Remove Scenario" pop up window is present. 
	#@REMOVESCENARIOPOPUP Base scenario is not in the list of the possible scenarios to be removed.
	And the user clicks on the Promo Action 'Remove Existing Scenario'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Scenario to be deleted'
	Then the user validates that the 'List Containing' with value '<BASESCENARIO>' is not present
	#@DESCR_NONBASE_SCENARIO is instead present in the list.
	#14 Select @DESCR_NONBASE_SCENARIO from the "Select scenario to remove" field
	When the user select value containing '<DESCR_NONBASE_SCENARIO>' from dropdown list 'Scenario to be deleted'
	#15 Click "OK" button
	And the user clicks on 'Popup Ok Button' with value 'Remove Scenario'
	#16 Close Promo Plan
	And the user clicks on the 'Close Tab'
	#17 Go to Promo Actions Nav.
	And the user navigates to the 'Promotional actions' page
	#18 Search for $Promo1_ID It is presents
	And the user filters the column by column name 'Action Id', 'Equal', 'Promo1_ID'
	Then the user validates that the 'Text' with value '<CUST>' is present
	#Search for $Promo2_ID it is not present
	When the user filters the column by column name 'Action Id', 'Equal', 'Promo2_ID'
	And the user clicks on the 'Close Tab'


	Examples:
		| CUST    | CONFIRMATIONLEVHOLDER | CUSTLEV | DESCR_1 | SELLINSTART | REFYEAR  | SELLINEND    | SELLOUTSTART | SELLOUTEND   | MECHANICS | PRODUCTSLEVEL | PROD | PROD2 | QTYESTIMATED | QTYESTIMATED2 | DISC_PERC | DISC_PERC2 | PPHOLDER | BASESCENARIO | DESCR_NONBASE_SCENARIO      | SELLINEND_1 | SELLOUTEND_1 | DESCR_2 | REMOVESCENARIOPOPUP |
		| EC86248 | Holder level          | Level 3 | PROMO 1 | d/06/2020   | x/x/2020 | d+10/06/2020 | d+8/06/2020  | d+18/06/2020 | TPR in %  | Product       | 001  | 002   | 100          | 200           | 1         | 2          | EC86248  | 1 -          | This is a Non-Base Scenario | d+7/06/2020 | d+17/06/2020 | PROMO 2 | Remove Scenario     |