Feature: TestCase657376
		WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_116 - Promotions tab - open a promo

@TTC_Nightly @BDD_657376 @TTC
Scenario: WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_116
	#Go to "Agreements" navigator
	Given the user navigates to the 'Agreements' page

	# Step1: Create a document
	When the user clicks on the 'Add Button'
	Then the user validates that the 'Popup' with value 'New Agreement' is displayed
	When the user clicks on 'Trigger By Field Name' with value 'Customer Holder'
	Then the user validates that the 'Popup' with value 'Customer Plan' is displayed
	When the user clicks on 'Hier. level side panel' with value '<CustomerLevel>'
	And the user filters the column by column name 'Customer Code', 'Like', '<CustomerHolder>'
	And the user clicks on '<CustomerHolder>' text on the grid
    And the user clicks on 'Popup Ok Button' with value 'Customer Plan'
	Then the user validates that the 'Popup' with value 'New Agreement' is displayed
	When the user enters '<AgreementCode>' in field 'Input By Label Name' with value 'Agreement Code'
	And the user enters '<AgreementDescription>' in field 'Input By Label Name' with value 'Agreement Description'
    And the user clicks on 'Popup Ok Button' with value 'New Agreement'
    Then the user validates that elements 'Rows' have loaded

	# Step2:
	Then the user validates that the 'Status Trigger' is displayed
    When the user clicks on 'Sub Tab' with value 'PROMOTIONS'
	Then the user validates that the 'Sub Tab Add Button' with value 'Promo Header' is displayed
	When the user clicks on 'Sub Tab Add Button' with value 'Promo Header'
	Then the user validates that the 'Popup' with value 'New Promotion' is displayed
    When the user clicks on 'Popup Ok Button' with value 'New Promotion'
	Then the user validates that the 'Input By Label Name' with value 'Description' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	When the user populates the cockpit '<PromoDescription>' 'd/m/y' 'd+3/m/y' 'd/m/y' 'd+3/m/y' '<Mechanic>'
    When the user clicks on 'Sub Tab' with value 'Header info'
    When the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'PromoId'
	When the user adds a product '<ProductLevel>' '<ProductCode>'
    Then the user validates that elements 'Rows' have loaded
    When the user enters '<Measure>' on column name '<Mechanic>' for product code '<ProductCode>'

	#step 3
	When the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	Then the user validates that the 'Sub Tab Add Button' with value 'Promo Header' is displayed
	Then the user validates that column 'Code' has 'ActionId' with row text '<PromoDescription>'
	Then the user validates that column 'Description' has '<PromoDescription>' with row text 'ActionId'

	#step 4&5
    When the user clicks on 'ActionId' text on the grid

	#step 6	 
	Then the user validates that the 'Input By Label Name' with value 'Description' is displayed
	And the user validates that 'Input By Label Name' with value 'Description' has text '<PromoDescription>'
	And the user validates that 'Input By Label Name' with value 'Action Id' has text 'ActionId'
	And the user validates that 'Input By Label Name' with value 'Customer holder' contains text '<CustomerHolder>'
	And the user validates that 'Input By Label Name' with value 'Customer holder' contains text '<CustomerLevel>'

	Then the user validates that the date field 'Sell In Date' has 'd/m/y'
	And the user validates that the date field 'Sell In End Date' has 'd+3/m/y'
	And the user validates that the date field 'Sell Out Start Date' has 'd/m/y'
	And the user validates that the date field 'Sell Out End Date' has 'd+3/m/y'

	
	When the user clicks on 'Side Panel Tab' with value 'Products'
    Then the user validates that elements 'Rows' have loaded
	And the user validates text '<Mechanic>' on column name 'Promotional Mechanics' for product code '<ProductCode>'
	And the user validates text '<Measure>' on column name '<Mechanic>' for product code '<ProductCode>'
	And the user validates that the 'Product Grid Cell Contains' with value '<ProductCode>' is displayed

	When the user clicks on 'Side Panel Tab' with value 'General info'
    When the user clicks on 'Sub Tab' with value 'Header info'
	And the user validates that 'Input By Label Name' with value 'Action code' has text 'PromoId'

	Examples:
	| CustomerLevel | CustomerHolder | AgreementCode        | AgreementDescription        | PromoDescription | Mechanic | ProductCode | Measure		| ProductLevel |
	| Level 4       | EC86217        | 657376_AgreementCode | 657376_AgreemnetDescription | 657376_Promotion | Leaflet  | 059         | 1,500.00    | Product      |