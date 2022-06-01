Feature: TestCase_291893

@BDD_291893 @PROMO_Regression @PromoActions @PROMO_Smoke
Scenario: TPM_SP_W_SMOKE_R80V1_0006 - Add and Remove Products
	# Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#1 open promo navigator and select a promo in draft
	When the user creates a Promo with customerHLevel: 'Level 2' customerCode: '<CUST>'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<MECH>'

	#2 add a single product @productCode
	And the user clicks on side panel 'Products'
	And the user adds a product with productLevel: 'Product' productCodes: '<productCode>'
	Then the user validates that the 'Grid CheckBox' with value '<productCode>' is not present

	#3 add a familiy of products @familyCode
	When the user adds a product with productLevel: 'Family' productCodes: '<familyCode>'
	Then the user validates that the 'Grid CheckBox' with value '<familyName>' is present

	#4 add a display @displayCode
	When the user adds a product with productLevel: 'Display' productCodes: '<displayCode>'
	Then the user validates that the 'Grid CheckBox' with value '<displayName>' is present

	#5 remove a single product @productName
	When the user unchecks the 'Grid CheckBox' with value '<displayName>'
	And the user clicks on the 'Save Button'
	And the user clicks on 'Grid CheckBox' with value '<productName>'
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
	Then the user validates that the 'Grid CheckBox' with value '<productName>' is not present

	#6 remove a family of products @familyName
	When the user clicks on 'Grid CheckBox' with value '<familyName>'
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
	Then the user validates that the 'Grid CheckBox' with value '<familyName>' is not present

	#7 remove a family of products @displayName
	When the user clicks on 'Grid CheckBox' with value '<displayName>'
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
	Then the user validates that the 'Grid CheckBox' with value '<displayName>' is not present

	Examples:
		| CUST    | DESCRIPTION | SELLINSTART | SELLINEND | SELLOUTSTART | SELLOUTEND | MECH    | productCode | familyCode | displayCode | productName                      | familyName  | displayName             |
		| EC86283 | Products    | d/m/y       | d+7/m/y   | d/m/y        | d+7/m/y    | Leaflet | 052         | 07         | D001        | 052 - MIRENE VINHO VERDE 0.75 lt | 07 - GRAPPA | D001 - DISPLAY COCKTAIL |