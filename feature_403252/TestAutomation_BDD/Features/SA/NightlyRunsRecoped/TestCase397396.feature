Feature: TestCase397396
		WEB_TPM_SA_REBATE_UI_003-Rebates_Navigator_with_agreement_columns

@TTC_Nightly @TTC @BBD_397396
Scenario: WEB_TPM_SA_REBATE_UI_003

	# Step 1
	Given the user navigates to the 'Rebates' page
	When the user clicks on the 'Add Button'
	And the user clicks on the 'Customer Holder'
	And the user clicks on 'Hier. level side panel' with value '<CustomerLevel>'
	And the user filters the column by column name 'Customer code', 'Like', '<CustomerCode>'
	And the user clicks on '<CustomerCode>' text on the grid
	And the user clicks on 'Popup Ok Button' with value 'Customer Holder'
    Then the user validates that the 'Popup' with value 'New Rebate' is displayed
    And the user validates that the 'Input By Label Name' with value 'Classification' is displayed
	When the user selects active scenario '<Classification>' from dropdown list 'Classification'
	And the user selects active scenario '<Reason>' from dropdown list 'Reason'
    And the user clicks on 'Input By Label Name' with value 'Reason'
	And the user clicks on 'Popup Ok Button' with value 'New Rebate'
	And the user selects active scenario '<DataSource>' from dropdown list 'Data source'
	And the user selects active scenario '<PaymentMode>' from dropdown list 'Payment mode'
	And the user selects active scenario '<PaymentFrequency>' from dropdown list 'Payment Frequency'
	And the user enters '<FixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on 'Side Panel Tab' with value 'General Info'
	And the user clicks on the 'Agreement ID Increment Icon'
	And the user clicks on the 'Agreement Code Label'
    Then the user validates that the 'Input By Label Name' with value 'Agreement Code' is displayed
	When the user enters '<AgreementCode>' in field 'Input By Label Name' with value 'Agreement Code'
	And the user enters '<AgreementDescription>' in the 'Agreement Description field'
    And the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	When the user filters the column by column name 'Agreement Code', 'Like', '<AgreementCode>'
    Then the user validates that elements 'Rows' have loaded
	And the user validates that column 'Agreement Code' has '<AgreementCode>' with row text '<CustomerCode>'
	And the user validates that column 'Agreement ID' has 'AgreementID' with row text '<CustomerCode>'
	And the user validates that column 'Agreement Description' has '<AgreementDescription>' with row text '<CustomerCode>'
	
	Examples:
	| CustomerLevel | CustomerCode | Classification | Reason   | DataSource        | FixedAmount | PaymentMode     | PaymentFrequency | AgreementCode | AgreementDescription | ClassificationSm1ID | ReasonSm1ID | CalculationSm1ID  | PaymentModeSm1ID      | PaymentFrequencySM1ID   | RowNumber |
	| Level 4       | EC86217      | Supply         | Payments | Net sales revenue | 200         | Invoice payable | Monthly          | test_code     | the best test ever   | CLASSIFICATION      | REASON      | cmbCalcBaseSource | cmbPaymentModeCockpit | cmbPaymentSchemaCockpit | 2         |