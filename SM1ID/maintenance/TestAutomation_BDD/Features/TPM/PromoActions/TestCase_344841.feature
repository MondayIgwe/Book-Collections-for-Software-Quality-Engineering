Feature: TestCase_344841

@BDD_344841 @PROMO_Nightly @PromoActions @PromoActionsNightly
Scenario: TPM_SP_W_SMOKE_R80V1_0013 - Mass Copy
	#Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#1 Go to "Promo Action" navigator @DIVISION and create the following promotions:
	When the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUST>'
	And the user populates the cockpit with description: '<PROMODESC1>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTARTDATE>' sellOutEnd: '<SELLOUTENDDATE>' mechanics: '<MECH>'
	And the user clicks on the 'Cockpit Tab'
	And the user retrieves text from 'Action ID Textbox' and saves it as 'ActionId1'
	And the user adds a product with productLevel: 'Product' productCodes: '<PRODCODE>'
	And the user enters '<QTYESTIMATED>' on column name 'Estimated quantity' for product code '<PRODCODE>'
	And the user enters '<Leaflet>' on column name 'Leaflet' for product code '<PRODCODE>'
	And the user adds a product with productLevel: 'Display' productCodes: '<PRODDESC>'
	And the user enters '<DISPQTY>' on column name 'Display estimated quantity' for product code '<PRODDESC>'
	And the user enters '<Leaflet>' on column name 'Leaflet' for product code '<PRODDESC>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#second promo
	And the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUST2>'
	And the user populates the cockpit with description: '<PROMODESC2>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTARTDATE>' sellOutEnd: '<SELLOUTENDDATE>' mechanics: '<MECH>'
	And the user clicks on the 'Cockpit Tab'
	And the user retrieves text from 'Action ID Textbox' and saves it as 'ActionId2'
	And the user adds a product with productLevel: 'Product' productCodes: '<PRODCODE2>'

	And the user enters '<QTYESTIMATED>' on column name 'Estimated quantity' for product code '<PRODCODE2>'
	And the user enters '<Leaflet>' on column name 'Leaflet' for product code '<PRODCODE2>'
	And the user clicks on the 'Cockpit Tab'
	And the user changes the status to 'To be authorized'
	And the user changes the status to 'Confirm'
	And the user changes the status to 'Actual'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#third promo
	And the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUST3>'
	And the user populates the cockpit with description: '<PROMODESC3>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTARTDATE>' sellOutEnd: '<SELLOUTENDDATE>' mechanics: '<MECH>'
	And the user clicks on the 'Cockpit Tab'
	And the user retrieves text from 'Action ID Textbox' and saves it as 'ActionId3'
	And the user adds a product with productLevel: 'Product' productCodes: '<PRODCODE2>'
	And the user enters '<QTYESTIMATED>' on column name 'Estimated quantity' for product code '<PRODCODE2>'
	And the user enters '<Leaflet>' on column name 'Leaflet' for product code '<PRODCODE2>'
	And the user clicks on the 'Cockpit Tab'
	And the user changes the status to 'To be authorized'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#fourth promo
	And the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUST4>'
	And the user populates the cockpit with description: '<PROMODESC4>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTARTDATE>' sellOutEnd: '<SELLOUTENDDATE>' mechanics: '<MECH>'
	And the user clicks on the 'Cockpit Tab'
	And the user retrieves text from 'Action ID Textbox' and saves it as 'ActionId4'
	And the user adds a product with productLevel: 'Product' productCodes: '<PRODCODE2>'
	And the user enters '<QTYESTIMATED>' on column name 'Estimated quantity' for product code '<PRODCODE2>'
	And the user enters '<Leaflet>' on column name 'Leaflet' for product code '<PRODCODE2>'
	And the user clicks on the 'Cockpit Tab'
	And the user changes the status to 'Cancelled'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#2 Select @PROMODESC1 , @PROMODESC2, @PROMODESC3 and @PROMODESC4 promos having different statuses (e.g. Draft, Confirmed, Actual, Closed)
	And the user clicks on the 'Refresh Button'
	And the user checks the 'Grid CheckBox' with value 'ActionId1'
	And the user checks the 'Grid CheckBox' with value 'ActionId2'
	And the user checks the 'Grid CheckBox' with value 'ActionId3'
	And the user checks the 'Grid CheckBox' with value 'ActionId4'
	#Click on "Mass Copy"
	And the user clicks on the 'Promo Mass Copy Button'
	#- Units To Shift = MONTHS", "WEEKS", "DAYS"
	Then the user validates that the 'Units To Shift Combo' is present
	#When the user clicks on 'Generic Drop Down Trigger' with value 'Units to shift'
	When the user clicks on the 'Units To Shift Combo'
	Then the user validates that the 'List' with value '<unitsShift_1>' is present
	And the user validates that the 'List' with value '<unitsShift_2>' is present
	And the user validates that the 'List' with value '<unitsShift_3>' is present
	#SP_MASSCOPY_PERIODUNIT) @periodsShift
	And the user validates that the element 'Period To Shift Textbox' has text '<periodsShift>'
	When the user clicks on the 'Period To Shift Textbox'
	#Keep the day of the week = FALSE @keepDay
	Then the user validates that the checkbox 'Keep The Day CheckBox' is not Checked
	And the user validates that the 'Text in Grid' with value 'ActionId1' is present
	And the user validates that the 'Text in Grid' with value 'ActionId2' is present
	And the user validates that the 'Text in Grid' with value 'ActionId3' is present
	And the user validates that the 'Text in Grid' with value 'ActionId4' is present
	#Deselect all items from Mass Copy UI grid
	When the user clicks on 'Grid CheckBox' with value 'ActionId1'
	And the user clicks on 'Grid CheckBox' with value 'ActionId2'
	And the user clicks on 'Grid CheckBox' with value 'ActionId3'
	And the user clicks on 'Grid CheckBox' with value 'ActionId4'
	#Execute "Mass Copy"
	And the user clicks on the 'Execute Copy Button'
	#A warning is shown. Mass Copy is prevented.
	Then the user validates that the 'Text' with value 'At least one promotion must be selected in order to perform the copy.' is present
	#Select again some promos in the Mass Copy UI grid and set  - Units To Shift = Months - Period To Shift = 3 - Keep the day of the week = FALSE
	When the user clicks on 'Grid CheckBox' with value 'ActionId1'
	And the user clicks on 'Grid CheckBox' with value 'ActionId2'
	And the user clicks on 'Grid CheckBox' with value 'ActionId3'
	And the user clicks on 'Grid CheckBox' with value 'ActionId4'
	And the user enters '3' in the 'Period To Shift Textbox'
	#7 Execute "Mass Copy"
	And the user clicks on the 'Execute Copy Button'
	#have in the last 3 cols (Generated Action codes, Result,Anomalies) = ("ID of the created promo", "2 - Success", "")
	Then the user validates that column 'Copy result' has 'Success' with row text 'ActionId1'
	And the user validates that column 'Copy result' has 'Success' with row text 'ActionId2'
	And the user validates that column 'Copy result' has 'Success' with row text 'ActionId3'
	And the user validates that column 'Copy result' has 'Success' with row text 'ActionId4'
	Then the user validates that column 'Blocking Anomalies' has '' with row text 'ActionId1'
	And the user validates that column 'Blocking Anomalies' has '' with row text 'ActionId2'
	And the user validates that column 'Blocking Anomalies' has '' with row text 'ActionId3'
	And the user validates that column 'Blocking Anomalies' has '' with row text 'ActionId4'
	#Click on the ID of the created of 1 of the created promos Display Qty Est. = RESET Leaflet = KEEP
	When the user retrieves text from column 'Generated Action Code' with unique row text 'ActionId1' and saves it as 'GeneratedActionId1'
	And the user retrieves text from column 'Generated Action Code' with unique row text 'ActionId2' and saves it as 'GeneratedActionId2'
	And the user retrieves text from column 'Generated Action Code' with unique row text 'ActionId3' and saves it as 'GeneratedActionId3'
	And the user retrieves text from column 'Generated Action Code' with unique row text 'ActionId4' and saves it as 'GeneratedActionId4'
	And the user clicks on link on column 'Generated Action Code' with row text 'ActionId1'
	And the user clicks on the 'Products Tab'
	And the user clicks on the 'Product Grid Select Measures'
	And the user clicks on 'List' with value 'All'
	#TA5119.RESETONCOPYA = RESET are reset to the default value; (Display Qty EST)
	Then the user validates text contains '0' on column name 'Display estimated quantity' for product code '<PRODCODE>'
	#TA5119.RESETONCOPYA = KEEP are copied from the source promo (Leaflet)
	#And the user validates text does not contain '0.00' on column name 'Leaflet' for product code '<PRODCODE>'
	#9 Copied promos are shifted of 3 months respect to the source ones and have Draft soft status
	When the user clicks on the 'Close Tab'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Action code', Filter Type 'Like', Value 'GeneratedActionId1'
	Then the user validates that column 'Sell-in start' has '<COPY_SELLINSTART>' with row text 'GeneratedActionId1'
	When the user filters the column by column name 'Action code', Filter Type 'Like', Value 'GeneratedActionId2'
	Then the user validates that column 'Sell-in start' has '<COPY_SELLINSTART>' with row text 'GeneratedActionId2'
	When the user filters the column by column name 'Action code', Filter Type 'Like', Value 'GeneratedActionId3'
	Then the user validates that column 'Sell-in start' has '<COPY_SELLINSTART>' with row text 'GeneratedActionId3'
	When the user filters the column by column name 'Action code', Filter Type 'Like', Value 'GeneratedActionId4'
	Then the user validates that column 'Sell-in start' has '<COPY_SELLINSTART>' with row text 'GeneratedActionId4'

Examples:
	| DIVISION | CUST    | CONFLEV      | CUSTLEV | PROMODESC1 | SELLINSTART | REFYEAR | SELLINEND | COPY_SELLINSTART | COPY_SELLINEND | MECH    | PRODCODE | QTYESTIMATED | PRODDESC | DISPQTY | Leaflet | CUST2   | PROMODESC2 | PRODCODE2 | CUST3   | PROMODESC3 | CUST4   | PROMODESC4 | unitsShift_1 | unitsShift_2 | unitsShift_3 | periodsShift | KeepDay | MECH_FUND_INJ | SELLOUTSTARTDATE | SELLOUTENDDATE |
	| AUTOM2   | EC94440 | Holder Level | Level 2 | Draft      | d/m/y       | x/x/y   | d+10/m/y  | d/m+3/y          | d+10/m+3/y     | Leaflet | 021      | 100          | D001     | 50      | 100     | EC86262 | Actual     | 052       | EC86269 | Confirm    | EC86271 | Closed     | Days         | Weeks        | Months       | 12           | off     | Leaflet       |                  |                |