Feature: TestCase_344842

@BDD_344842 @PROMO_Nightly @PromoActions @PromoActionsNightly
Scenario: TPM_SP_W_SMOKE_R80V1_0014 - Mechanics Selection
	#Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#Step 1
	When the user creates a Promo with customerHLevel: '<CUSTOMERLVL>' customerCode: '<CUSTOMER>'
	And the user populates the cockpit with description: '<PROMODESC1>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTARTDATE>' sellOutEnd: '<SELLOUTENDDATE>' mechanics: ''
	And the user clicks on the 'Save Button'
	#2 Switch to Edit and go to General Info\Mechanics tab
	And the user clicks on side panel 'General info'
	#3 In the Mechanics panel, select more than one mechanic [@MECH] belonging to different configured Mechanic Groups. (Don't choose the mechanic configured for the fund injection [@MECH_FUND_INJ], see Initial Conditions)
	And the user clicks on 'Mechanics CheckBox' with value '<MECH1>'
	And the user clicks on 'Mechanics CheckBox' with value '<MECH2>'
	And the user clicks on 'Mechanics CheckBox' with value '<MECH3>'
	#4In the product Grid, add some products [@PROD, @PRODUCT_LEVEL]
	And the user adds a product with productLevel: '<PRODUCT_LEVEL>' productCodes: '<PROD1>'
	And the user adds a product with productLevel: '<PRODUCT_LEVEL>' productCodes: '<PROD2>'
	And the user clicks on the 'Product Grid Select Measures'
	And the user clicks on 'List' with value 'All'
	# Products are added in the Product Grid. All selected mechanics are automatically enabled for each added product.
	Then the user validates text contains '<MECH1>' on column name 'Promotional Mechanics' for product code '<PROD1>'
	And the user validates text contains '<MECH2>' on column name 'Promotional Mechanics' for product code '<PROD1>'
	And the user validates text contains '<MECH3>' on column name 'Promotional Mechanics' for product code '<PROD1>'
	And the user validates text contains '<MECH1>' on column name 'Promotional Mechanics' for product code '<PROD2>'
	And the user validates text contains '<MECH2>' on column name 'Promotional Mechanics' for product code '<PROD2>'
	And the user validates text contains '<MECH3>' on column name 'Promotional Mechanics' for product code '<PROD2>'
	# Measures related to the mechanics are shown in the columns of the product grid. [@MEAS_MECH @MEAS_MECH_ID]
	And the user validates that the 'Column' with value '<MEAS_MECH>' is present
	And the user validates that the 'Column' with value '<MEAS_MECH2>' is present
	And the user validates that the 'Column' with value '<MEAS_MECH3>' is present
	And the user validates that the 'Element by SM1Id' with value '<MEAS_MECH_ID>' is present
	And the user validates that the 'Element by SM1Id' with value '<MEAS_MECH_ID2>' is present
	And the user validates that the 'Element by SM1Id' with value '<MEAS_MECH_ID3>' is present
	#5 In the Mechanics panel, deselect one of the selected Mechanics [Def. Cut Price in %] and confirm the choice.
	When the user clicks on side panel 'General info'
	And the user clicks on 'Mechanics CheckBox' with value '<MECH3>'
	And the user clicks on the 'Alert Dialog Yes Button'
	#In the Product Grid, the Mechanic is disabled for all products and the Measures related to the removed Mechanic are hidden. [Def. % Cost and % Def. Cut Price]
	And the user clicks on side panel 'Products'
	Then the user validates that the 'Column' with value '<MEAS_MECH>' is not present
	And the user validates that the 'Column' with value '<MEAS_MECH3>' is not present
	#6 In the Mechanics panel, select a new Mechanic [Leaflet] configured for the fund injection) but choose to don't enable it for all product
	When the user clicks on side panel 'General info'
	And the user clicks on 'Mechanics CheckBox' with value '<MECH_FUND_INJ>'
	And the user clicks on the 'Alert Dialog No Button'
	#In the Product Grid, the Mechanic is disabled for all product rows and the Measures related to the disabled Mechanic are cleared
	And the user clicks on side panel 'Products'
	Then the user validates text does not contain '<MECH_FUND_INJ>' on column name 'Promotional Mechanics' for product code '<PROD2>'
	And the user validates that column name '<MEAS_READONLY>' for product code '<PROD1>' validation: 'is not' editable
	And the user validates that the 'Element by SM1Id' with value '<LF_COST>' is not present
	#7 At Product Grid row level, enable the new selected mechanic [MECH_FUND_INJ] for a product.
	When the user opens the trigger on product column 'Promotional Mechanics' and Row with value '<PROD1>'
	And the user clicks on 'PopUp Grid CheckBox' with value 'LF'
	And the user clicks on 'Popup Button' with value 'OK'
	#The editable Measures related to enabled mechanic are writable [Leaflet] and the read-only Measures [@MEAS_READONLY] are shown but they are not modifiable
	Then the user validates that column name '<MEAS_READONLY>' for product code '<PROD1>' validation: 'is not' editable
	And the user validates that column name '<MECH_FUND_INJ>' for product code '<PROD1>' validation: 'is' editable
	#8 Enable the deselected mechanic for another product [Def. Cut Price in %]
	When the user clicks on side panel 'General info'
	And the user clicks on 'Mechanics CheckBox' with value '<MECH3>'
	And the user clicks on the 'Alert Dialog No Button'
	And the user clicks on side panel 'Products'
	And the user opens the trigger on product column 'Promotional Mechanics' and Row with value '<PROD2>'
	And the user clicks on 'PopUp Grid CheckBox' with value 'DCP'
	And the user clicks on 'Popup Button' with value 'OK'
	#The editable Measures related to enabled mechanic are writable [MEAS_MECH3] and the read-only Measures are shown but they are not modifiable
	Then the user validates that column name '<MEAS_MECH3>' for product code '<PROD2>' validation: 'is' editable
	#9 Edit cost measures [Leaflet] related to the new enabled mechanic. Go the "Funds" tab. [@MEAS_VALUE_PROD]
	When the user enters '<MEAS_VALUE_PROD>' on column name 'Leaflet' for product code '<PROD1>'
	And the user clicks on top panel 'Funds'
	#The injection updating is not performed: The fund configured to be consumed by the specific mechanic is not injected. [@FUND]
	Then the user validates that the 'Text in Grid' with value '<FUND>' is not present
	#10 Press the Refresh button on the Funds tab
	When the user clicks on 'Button Link' with value 'Calculate'
	#The injection updating is performed: The fund configured to be consumed by the specific mechanic is injected.
	And the user closes all pages without saving the work done where there is no pop up

Examples:
	| IDACTION | MECH1    | MECH2   | MECH3               | MECH_FUND_INJ | MECH_FUND_INJ_ID | PROD1 | PROD2 | PRODUCT_LEVEL | MEAS_MECH   | MEAS_MECH2 | MEAS_MECH3       | MEAS_MECH_ID         | MEAS_MECH_ID2 | MEAS_MECH_ID3 | MEAS_READONLY    | MEAS_READONLY2   | MEAS_VALUE_PROD | FUND | CUSTOMERLVL | CUSTOMER | SELLINSTART | SELLINEND | SELLOUTSTARTDATE | SELLOUTENDDATE | PROMODESC1                |
	| 4526     | TPR in % | Hostess | Def. Cut Price in % | Leaflet       | LF_COST          | 008   | 011   | Product       | Def. % Cost | Demo       | % Def. Cut Price | ESTIMATEDDEFDISCPERC | DEMO_COST     | DEF_DISC_PERC | Total Promo Cost | % Def. Cut Price | 40              | 884  | Level 3     | EC86221  | d+1/m/y     | d+7/m/y   |                  |                | TPM_SP_W_SMOKE_R80V1_0014 |