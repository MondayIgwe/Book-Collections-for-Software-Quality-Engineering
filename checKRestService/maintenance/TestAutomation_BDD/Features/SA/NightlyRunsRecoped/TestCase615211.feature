Feature: TestCase615211
	WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_PAYMENT SCHEDULE_003 - row not present after removal of the master rebate

@TTC_Nightly @TTC @BDD_615211
Scenario: WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_PAYMENT SCHEDULE_003
	
	# Step 1
	Given the user navigates to the 'Agreements' page
	
	When the user creates a New Document with Level: '<CustomerLevel>' Customer: '<CustomerHolder>' Agreement Code: '<AgreementCode>' Agreement Description: ''
	Then the user validates that the 'Input By Label Name' with value 'Agreement ID' is displayed
	When the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'

	# Step 2
	And the user clicks on 'Sub Tab Add Button' with value 'Rebate Header'
	When the user populates the New Rebate Details Classification: '<Classification>' Reason: '<Reason>' Target Type: '<TargetType>' Payment Mode: '<PaymentMode>' Calculation Basis: '<CalculationBasis>' Description: '<RebateDescription>'

	# Step 3
	And the user clicks on 'Element by SM1Id' with value 'ACTION_all-filters'
	And the user in popup 'New Rebate:' enters '<Lumpsum>' in cell with column 'Lump Sum' and row text 'All Products'
	And the user clicks on 'Sub Tab Add Button' with value 'Rebate Products'
	And the user clicks on 'Hier. level side panel' with value '<productLevel>'
	And the user clicks on 'Grid Checkbox' with value '<productCode>'
    And the user clicks on 'Popup Ok Button SM1Id' with value 'Products'
	And the user in popup 'New Rebate:' enters '<Percentage>' in cell with column '%' and row text '<productCode>'

	# Step 4
	And the user clicks on the 'Expend Panel Icon'

	# Step 5
	And the user selects active scenario '<value>' from dropdown list 'Payment Frequency'
    And the user clicks on 'Popup Ok Button' with value 'New Rebate:'

	# Step 6
	And the user clicks on the 'Save Button'
	And the user retrieves text in cell with column 'Rebate Header ID' and row text '<Description>' and saves as 'RebateCode'
	And the user clicks on the 'Close Tab'

	# Step 7
	And the user clicks on the 'Refresh Button'
	And the user clicks on 'AgreementID' text on the grid
	And the user clicks on 'Button' with value 'Edit'

	# Step 8
	And the user clicks on 'RebateCode' text on the grid
	And the user clicks on '<Lumpsum>' text on the grid
	And the user clicks on 'Delete Icon' with value 'cardRebateProducts'
	Then the user validates that the 'Alert Dialog Message Box' is displayed
	When the user clicks on the 'Alert Dialog Yes Button'
	And the user clicks on the 'Save Button'

	# Step 9
	And the user clicks on 'Side Panel Tab' with value 'Payment Schedule'
	Then the user validates that elements 'Basic Grid Rows' have loaded
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '2'
	And the user validates that popup with sm1 ID 'agreementPayment' and name 'Payment Schedule' column 'Payment mode' has '<PaymentMode>' with row text 'RebateCode'
	And the user validates that popup with sm1 ID 'agreementPayment' and name 'Payment Schedule' column 'Payment frequency' has '<value>' with row text 'RebateCode'
	And the user validates that popup with sm1 ID 'agreementPayment' and name 'Payment Schedule' column 'Latest Installment' has '' with row text 'RebateCode'
	And the user validates that popup with sm1 ID 'agreementPayment' and name 'Payment Schedule' column 'Next Installment' has '28/02/y' with row text 'RebateCode'
	And the user validates that popup with sm1 ID 'agreementPayment' and name 'Payment Schedule' column 'Final Installment' has '31/12/y' with row text 'RebateCode'


	# Step 10
	When the user clicks on 'Details...' text on the grid
	Then the user validates that the 'Popup' with value 'Payment Schedule' is displayed
	And the user validates that 'Input By Label Name' with value 'Payment Mode' has text '<PaymentMode>'
	And the user validates that 'Input By Label Name' with value 'Payment frequency' has text '<value>'
	
	And the user validates that elements 'Basic Grid Rows' have loaded
	When the user retrieves count of 'Rows By SM1ID' with value 'LOGICALPOPUP' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '<number>'

	
	And the user validates that popup with sm1 ID 'LOGICALPOPUP' and name 'Payment Schedule' column 'Installment Type' has '<InstallmentType>' with row text '31/12/y'
	And the user validates that popup with sm1 ID 'LOGICALPOPUP' and name 'Payment Schedule' column 'Installment Type' has '<InstallmentType2>' with row text '30/11/y'

	# Step 11
    When the user clicks on 'Popup Cancel Button' with value 'Payment Schedule'
	And the user clicks on 'Side Panel Tab' with value 'Conditions' until 'Delete Icon' with value 'cardRebatesHeader' is present

	# Step 12
	And the user clicks on 'RebateCode' text on the grid
	And the user clicks on 'Delete Icon' with value 'cardRebatesHeader'
	Then the user validates that the 'Alert Dialog Message Box' is displayed
	When the user clicks on the 'Alert Dialog Yes Button'

	# Step 13
	And the user clicks on 'Side Panel Tab' with value 'Payment Schedule'
	Then the user validates that elements 'Basic Grid Rows' have loaded
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '1'

	# Step 14
	When the user clicks on the 'Save Button'

	Examples: 
	| CustomerLevel | CustomerHolder | AgreementCode | Classification | Reason           | TargetType | PaymentMode     | CalculationBasis  | RebateDescription | Lumpsum | productLevel | productCode | Percentage | value   | number | InstallmentType  | number1 | InstallmentType2       |
	| Level 3       | EC86206        | TC_615211     | Supply         | Year End Bonuses | Brackets   | Invoice payable | Net sales revenue | Rebate_615211     | 3000    | Product      | 011         | 20         | Monthly | 12     | Final settlement | 11      | Installment on Account |