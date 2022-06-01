Feature: TestCase559282
	WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_095 - Promo tab - only target for the current agreement are visible in the selector (Standard Rebate)

@TTC @TTC_Weekly @BDD_559282
Scenario: WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_095

	# Step 1
	Given the user navigates to the 'Rebates' page
	When the user creates a Rebate with Level: '<CustomerLevel>' Customer: '<CustomerHolder>' Classification: '<Classification>' Reason: '<Reason>' Target Type: '<TargetType>'
	And the user populates the Rebate mandatory fields with Data Source: '<TargetSource>' Payment Mode: '<PaymentMode>' Payment Frequency: '<PaymentFrequency>'
	And the user enters '<RebateDescription>' in field 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<FixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on side panel 'General Info'
	And the user clicks on the 'Agreement ID Increment Icon'
	And the user clicks on the 'Agreement Code Label'
    Then the user validates that the 'Input By Label Name' with value 'Agreement Code' is displayed
	When the user enters '<AgreementCode>' in field 'Input By Label Name' with value 'Agreement Code'
	And the user enters '<AgreementDescription>' in the 'Agreement Description field'
    And the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'
	And the user clicks on the 'Save Button'
	And the user clicks on side panel 'Customers'
	And the user clicks on the 'Refresh Button'
	When the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	# Step 2
	And the user creates a Rebate with Level: '<CustomerLevel>' Customer: '<CustomerHolder>' Classification: '<Classification>' Reason: '<Reason>' Target Type: '<TargetType>'
	And the user populates the Rebate mandatory fields with Data Source: '<TargetSource>' Payment Mode: '<PaymentMode>' Payment Frequency: '<PaymentFrequency>'
	And the user enters '<RebateDescription2>' in field 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<FixedAmount2>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on side panel 'General Info'
	And the user clicks on the 'Agreement ID Increment Icon'
	And the user clicks on the 'Agreement Code Label'
    Then the user validates that the 'Input By Label Name' with value 'Agreement Code' is displayed
	When the user enters '<AgreementCode2>' in field 'Input By Label Name' with value 'Agreement Code'
	And the user enters '<AgreementDescription2>' in the 'Agreement Description field'
    And the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID1'
	And the user clicks on the 'Save Button'
	And the user clicks on side panel 'Customers'
	And the user clicks on the 'Refresh Button'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	# Step 3
	And the user navigates to the 'Agreements' page
	And the user clicks on 'Text in Grid' with value 'AgreementID'
	And the user clicks on 'Button' with value 'Edit'
	And the user clicks on top panel 'PROMOTIONS'
	And the user clicks on 'Sub Tab Add Button' with value 'Promo Header'
	Then the user validates that the 'Popup Ok Button' with value 'New Promotion' is displayed
	When the user clicks on 'Popup Ok Button' with value 'New Promotion'
	And the user populates the cockpit with description: '<PromoDescription>' sellInStart: '<StartDate>' sellInEnd: '<EndDate>' sellOutStart: '<StartDate>' sellOutEnd: '<EndDate>' mechanics: '<Mechanic>'
    And the user adds products with productLevel: '<ProductLevel>' productCodes: '<ProductCode>'
    And the user enters '<Measure>' on column name '<Mechanic>' for product code '<ProductCode>'
	And the user clicks on side panel 'Participants'
	Then the user validates that elements 'Basic Grid Rows' have loaded
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '17'
	When the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	# Step 4
    Then the user validates that the 'Button' with value 'Add Link to Target' is displayed
	When the user clicks on 'Text in Grid' with value '<PromoDescription>'
	And the user clicks on 'Button' with value 'Add Link to Target'
    Then the user validates that the 'Popup' with value 'Select Target' is displayed
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '4'

	# Step 5
	When the user clicks on 'Button' with value 'Cancel'

	# Step 6
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	# Step 7
	And the user clicks on 'Text in Grid' with value 'AgreementID1'
	And the user clicks on 'Button' with value 'Edit'
	And the user clicks on top panel 'PROMOTIONS'
	And the user clicks on 'Sub Tab Add Button' with value 'Promo Header'
	Then the user validates that the 'Popup Ok Button' with value 'New Promotion' is displayed
	When the user clicks on 'Popup Ok Button' with value 'New Promotion'
	And the user populates the cockpit with description: '<PromoDescription2>' sellInStart: '<StartDate>' sellInEnd: '<EndDate>' sellOutStart: '<StartDate>' sellOutEnd: '<EndDate>' mechanics: '<Mechanic>'
    And the user adds products with productLevel: '<ProductLevel>' productCodes: '<ProductCode>'
    And the user enters '<Measure>' on column name '<Mechanic>' for product code '<ProductCode>'
	And the user clicks on side panel 'Participants'
	Then the user validates that elements 'Basic Grid Rows' have loaded
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '17'
	When the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	# Step 8
    Then the user validates that the 'Button' with value 'Add Link to Target' is displayed
	When the user clicks on 'Text in Grid' with value '<PromoDescription2>'
	And the user clicks on 'Button' with value 'Add Link to Target'
    Then the user validates that the 'Popup' with value 'Select Target' is displayed
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '4'

	# Step 9
	When the user clicks on 'Button' with value 'Cancel'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	Examples: 
	| CustomerLevel | CustomerHolder | Classification | Reason           | TargetType | RebateDescription | CalculationBasis | TargetSource      | PaymentMode     | PaymentFrequency | FixedAmount | AgreementCode   | AgreementDescription | RebateDescription2 | FixedAmount2 | AgreementCode2   | AgreementDescription2 | StartDate | EndDate | PromoDescription | Mechanic | ProductCode | Measure | PromoDescription2 | ProductLevel |
	| Level 3       | EC86215        | Supply         | Year End Bonuses | Brackets   | REB_DES_559282    | Sales volumes    | Net sales revenue | Invoice payable | Monthly          | 500         | AGG_CODE_559280 | AGG_DES_559282       | REB2_DES_559282    | 600          | AGG2_CODE_559280 | AGG2_DES_559282       | 10/12/y   | 31/12/y | PROMO_559282     | Display  | 007         | 500     | PROMO2_559282     | Product      |