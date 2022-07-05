Feature: TestCase397396
		WEB_TPM_SA_REBATE_UI_003-Rebates_Navigator_with_agreement_columns

@TTC_Nightly @TTC @BBD_397396
Scenario: WEB_TPM_SA_REBATE_UI_003

	# Step 1
	Given the user navigates to the 'Rebates' page
	When the user creates a Rebate with Level: '<CustomerLevel>' Customer: '<CustomerCode>' Classification: '<Classification>' Reason: '<Reason>' Target Type: ''
	And the user populates the Rebate mandatory fields with Data Source: '<DataSource>' Payment Mode: '<PaymentMode>' Payment Frequency: '<PaymentFrequency>'
	And the user enters '<FixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'

	# Step 2
	And the user clicks on 'Side Panel Tab' with value 'General Info'
	And the user clicks on the 'Agreement ID Increment Icon'
	And the user clicks on the 'Agreement Code Label'
    Then the user validates that the 'Input By Label Name' with value 'Agreement Code' is displayed

	# Step 3
	When the user enters '<AgreementCode>' in field 'Input By Label Name' with value 'Agreement Code'
	And the user enters '<AgreementDescription>' in the 'Agreement Description field'
    And the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'

	# Step 4
	And the user clicks on the 'Save Button'

	# Step 5
	And the user clicks on the 'Close Tab'

	# Step 6 - 8
	And the user filters the column by column name 'Agreement Code', Filter Type 'Like', Value '<AgreementCode>'

	# Step 9
    Then the user validates that elements 'Rows' have loaded
	And the user validates that column 'Agreement Code' has '<AgreementCode>' with row text '<CustomerCode>'
	And the user validates that column 'Agreement ID' has 'AgreementID' with row text '<CustomerCode>'
	And the user validates that column 'Agreement Description' has '<AgreementDescription>' with row text '<CustomerCode>'
	
	Examples:
	| CustomerLevel | CustomerCode | Classification | Reason   | DataSource        | FixedAmount | PaymentMode     | PaymentFrequency | AgreementCode | AgreementDescription | ClassificationSm1ID | ReasonSm1ID | CalculationSm1ID  | PaymentModeSm1ID      | PaymentFrequencySM1ID   | RowNumber |
	| Level 4       | EC86217      | Supply         | Payments | Net sales revenue | 200         | Invoice payable | Monthly          | test_code     | the best test ever   | CLASSIFICATION      | REASON      | cmbCalcBaseSource | cmbPaymentModeCockpit | cmbPaymentSchemaCockpit | 2         |