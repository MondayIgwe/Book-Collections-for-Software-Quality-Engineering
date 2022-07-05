Feature: TestCase657376
		WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_116 - Promotions tab - open a promo

@TTC_Nightly @BDD_657376 @TTC
Scenario: WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_116
	#Go to "Agreements" navigator
	Given the user navigates to the 'Agreements' page

	# Step1: Create a document
	When the user creates a New Document with Level: '<CustomerLevel>' Customer: '<CustomerHolder>' Agreement Code: '<AgreementCode>' Agreement Description: '<AgreementDescription>'
    Then the user validates that elements 'Rows' have loaded

	# Step2:
	Then the user validates that the 'Status Trigger Icon' is displayed
    When the user clicks on 'Sub Tab' with value 'PROMOTIONS'
	Then the user validates that the 'Sub Tab Add Button' with value 'Promo Header' is displayed
	When the user clicks on 'Sub Tab Add Button' with value 'Promo Header'
	Then the user validates that the 'Popup' with value 'New Promotion' is displayed
    When the user clicks on 'Popup Ok Button' with value 'New Promotion'
	Then the user validates that the 'Input By Label Name' with value 'Description' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user populates the cockpit with description: '<PromoDescription>' sellInStart: 'd/m/y' sellInEnd: 'd+3/m/y' sellOutStart: 'd/m/y' sellOutEnd: 'd+3/m/y' mechanics: '<Mechanic>'
    And the user clicks on 'Sub Tab' with value 'Header info'
    And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'PromoId'
	And the user adds a product with productLevel: '<ProductLevel>' productCodes: '<ProductCode>'
    Then the user validates that elements 'Rows' have loaded
    When the user enters '<Measure>' on column name '<Mechanic>' for product code '<ProductCode>'

	#step 3
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	Then the user validates that the 'Sub Tab Add Button' with value 'Promo Header' is displayed
	And the user validates that column 'Code' has 'ActionId' with row text '<PromoDescription>'
	And the user validates that column 'Description' has '<PromoDescription>' with row text 'ActionId'

	#step 4&5
    When the user clicks on 'ActionId' text on the grid

	#step 6	 
	Then the user validates that the 'Input By Label Name' with value 'Description' is displayed
	And the user validates that 'Input By Label Name' with value 'Description' has text '<PromoDescription>'
	And the user validates that 'Input By Label Name' with value 'Action Id' has text 'ActionId'
	And the user validates that 'Input By Label Name' with value 'Customer holder' contains text '<CustomerHolder>'
	And the user validates that 'Input By Label Name' with value 'Customer holder' contains text '<CustomerLevel>'

	And the user validates that the date field 'Sell In Date' has 'd/m/y'
	And the user validates that the date field 'Sell In End Date' has 'd+3/m/y'
	And the user validates that the date field 'Sell Out Start Date' has 'd/m/y'
	And the user validates that the date field 'Sell Out End Date' has 'd+3/m/y'

	
	When the user clicks on 'Side Panel Tab' with value 'Products'
    Then the user validates that elements 'Rows' have loaded
	And the user validates text '<Mechanic>' on column name 'Promotional Mechanics' for product code '<ProductCode>'
	And the user validates text '<Measure>' on column name '<Mechanic>' for product code '<ProductCode>'
	And the user validates that the 'Product Grid Cell Contains' with value '<ProductCode>' is displayed

	When the user clicks on 'Side Panel Tab' with value 'General info'
    And the user clicks on 'Sub Tab' with value 'Header info'
	Then the user validates that 'Input By Label Name' with value 'Action code' has text 'PromoId'

	Examples:
	| CustomerLevel | CustomerHolder | AgreementCode        | AgreementDescription        | PromoDescription | Mechanic | ProductCode | Measure		| ProductLevel |
	| Level 4       | EC86217        | 657376_AgreementCode | 657376_AgreemnetDescription | 657376_Promotion | Leaflet  | 059         | 1,500.00    | Product      |