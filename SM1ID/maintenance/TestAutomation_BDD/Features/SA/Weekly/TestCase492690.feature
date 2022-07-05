Feature: TestCase492690
	WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_005 - Create Brackets rebate from 'all products row' on saving

@TTC @TTC_Weekly @BDD_492690 @TestPipeline
Scenario: WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_005
	
	# Step 1
	Given the user navigates to the 'Agreements' page
	When the user creates a New Document with Level: '<CustomerLevel>' Customer: '<CustomerHolder>' Agreement Code: '<AgreementCode>' Agreement Description: '<AgreementDescription>'
	And the user retrieves text from element 'Input by Label Name' with value 'Agreement ID' and saves it as 'AgreementID'
	And the user selects validity period from: '<StartDate>' to: '<EndDate>' on the 'Validity Period Start Date' field

	# Step 2
	And the user clicks on 'Sub Tab Add Button' with value 'Rebate Header'

	# Step 3
	And the user populates the New Rebate Details Classification: '<Classification>' Reason: '<Reason>' Target Type: '<TargetType>' Payment Mode: '<PaymentMode>' Calculation Basis: '<CalculationBasis>' Description: '<Description1>'
	And the user selects active scenario '<TargetSource>' from dropdown list 'Target Source'
	And the user selects active scenario '<BeneficiaryLevel>' from dropdown list 'Beneficiary Level'

	# Step 4
	And the user clicks on 'Element by SM1Id' with value 'ACTION_all-filters'

	# Step 5
	And the user clicks on 'All Products' text on the grid
	And the user clicks on 'Element by SM1Id' with value 'ACTION_addThresholds'

	# Step 6
	And the user in popup 'All Conditions' enters '<threshold1>' in cell with column 'Threshold' and row text '0.00'
	And the user in popup 'All Conditions' enters '<Percentage>' in cell with column ' % ' and row text 'Threshold1'
	And the user clicks on the 'Add Button'
	And the user in popup 'All Conditions' enters '<threshold2>' in cell with column 'Threshold' and row text '-99.00'
	And the user in popup 'All Conditions' enters '<Lumpsum>' in cell with column 'Fixed amount' and row text 'Threshold2'
    And the user clicks on 'Popup Ok Button' with value 'All Conditions'
    And the user clicks on 'Popup Ok Button' with value 'New Rebate:'

	# Step 7
	And the user clicks on the 'Save Button'
	Then the user validates that the 'Text Containing' with value 'Please wait, the process will be completed soon' is displayed
    Then the user validates that 'Toast Message Field' text contains 'Agreement document successfully saved'

	# Step 8
	When the user clicks on '<Description1>' text on the grid
	And the user retrieves text in cell with column 'Rebate Header ID' and row text '<Reason>' and saves as 'RebateCode'
	Then the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Status' has '<productStatus>' with row text 'All Products'

	# Step 9
	When the user navigates to the 'Rebates' page
	And the user filters the column by column name 'Agreement ID', Filter Type 'Equal', Value 'AgreementID'
	And the user filters the column by column name 'Rebate code', Filter Type 'Not Like', Value 'RebateCode'
	And the user retrieves text in cell with column 'Rebate code' and row text '<RebateDescription>' and saves as 'ChildRebateCode'

	# Step 10
	And the user clicks on 'ChildRebateCode' text on the grid	
	And the user clicks on 'Text' with value 'ChildRebateCode'

	# Step 11
	Then the user validates that 'Input by Label Name' text with value 'Classification' contains '<Classification>'
	And the user validates that 'Input by Label Name' text with value 'Reason' contains '<Reason>'
	And the user validates that 'Input by Label Name' text with value 'Target Type' contains '<TargetType>'
	And the user validates that 'Input by Label Name' text with value 'Holder' contains '<CustomerLevel>'
	And the user validates that 'Input by Label Name' text with value 'DESCRIPTION' contains '<Description1>'
	And the user validates that 'Input by Label Name' text with value 'STATUS' contains '<productStatus>'
	And the user validates that 'Input by Label Name' text with value 'Payment mode' contains '<PaymentMode>'
	And the user validates that 'Input by Label Name' text with value 'Payment Frequency' contains '<PaymentFrequency>'
	And the user validates that 'Checkbox By Label' with value 'Same filters on Target' is marked as: 'true'
	Then the user validates that 'Start Date' text with value 'Rebate validity' contains '<StartDate>'
	And the user validates that 'End Date' text with value 'Rebate validity' contains '<EndDate>'
	And the user validates that 'Start Date' text with value 'CALCULATION BASIS VALIDITY' contains '<StartDate>'
	And the user validates that 'End Date' text with value 'CALCULATION BASIS VALIDITY' contains '<EndDate>'
	And the user validates that 'Start Date' text with value 'Target' contains '<StartDate>'
	And the user validates that 'End Date' text with value 'Target' contains '<EndDate>'
	And the user validates that the element 'Target Data Source Input' has text '<TargetSource>'
	And the user validates that the element 'Calc Basis Data Source Input' has text '<CalculationBasis>'

	# Step 12
	And the user validates that 'Target Section Product' text contains 'ALL'
	And the user validates that 'Calc Basis Product' text contains 'ALL'

	# Step 13
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Threshold' has '<threshold1>' with row text '<Percentage>'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column ' % ' has '<Percentage>' with row text '<threshold1>'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Threshold' has '<threshold2>' with row text '<Lumpsum>'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Fixed amount' has '<Lumpsum>' with row text '<threshold2>'

	# Step 14
	When the user clicks on side panel 'General Info'
	Then the user validates that 'Input by Label Name' text with value 'Agreement ID' contains 'AgreementID'
	And the user validates that 'Input by Label Name' text with value 'Agreement Code' contains '<AgreementCode>'
	And the user validates that 'Input by Label Name' text with value 'Agreement Description' contains '<AgreementDescription>'

	# Step 15
	When the user clicks on side panel 'Payment Schedule'
	Then the user validates that from table with unique column 'Amount Value' column 'Date' has '<EndDate>' with row text '<InstalmentType>'
	And the user validates that from table with unique column 'Amount Value' column 'Installment Type' has '<InstalmentType>' with row text '<EndDate>'

	# Step 16
	When the user clicks on side panel 'Products'
	And the user clicks on the 'Refresh Button'
	Then the user validates that elements 'Rows' have loaded
	When the user retrieves count of 'Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '0'

	When the user clicks on 'Top Tab' with value 'Target Basis'
	And the user clicks on the 'Refresh Button'
	Then the user validates that elements 'Rows' have loaded
	When the user retrieves count of 'Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '0'

	# Step 17
	When the user clicks on side panel 'Customers'
	Then the user validates that 'Input by Label Name' text with value 'Beneficiary Level' contains '<BeneficiaryLevel>'
	When the user clicks on 'Top Tab' with value 'Target Basis'
	Then the user validates that 'Input by Label Name' text with value 'Target Level' contains '<BeneficiaryLevel>'

	# Step 18
	When the user navigates to the 'Rebates' page
	And the user filters the column by column name 'Rebate code', Filter Type 'Like', Value 'RebateCode'
	And the user clicks on 'RebateCode' text on the grid	
	And the user clicks on 'Text' with value 'RebateCode'
	Then the user validates that 'Input by Label Name' text with value 'Classification' contains '<Classification>'
	And the user validates that 'Input by Label Name' text with value 'Reason' contains '<Reason>'
	And the user validates that 'Input by Label Name' text with value 'Target Type' contains '<TargetType>'
	And the user validates that 'Input by Label Name' text with value 'DESCRIPTION' contains '<Description1>'
	And the user validates that 'Input by Label Name' text with value 'Payment mode' contains '<PaymentMode>'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Threshold' has '0.00' with row text '0.00'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column ' % ' has '0.00' with row text '0.00'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Fixed amount' has '0.00' with row text '0.00'
	And the user validates that 'Target Section Product' text contains 'ALL'
	And the user validates that 'Calc Basis Product' text contains 'ALL'
	And the user validates that the element 'Target Data Source Input' has text '<TargetSource>'
	And the user validates that the element 'Calc Basis Data Source Input' has text '<CalculationBasis>'


	Examples: 
	| CustomerLevel | CustomerHolder | AgreementCode          | AgreementDescription   | StartDate | EndDate | Classification | Reason           | TargetType | PaymentMode | CalculationBasis  | TargetSource           | Description1       | BeneficiaryLevel | threshold1 | Percentage | threshold2 | Lumpsum | message                                         | productStatus | PaymentFrequency | Labels                                | InstalmentType   |
	| Level 4       | EC86217        | SA_AGREEMENT_AGREEMENT | SA_AGREEMENT_AGREEMENT | 05/02/y   | 11/10/y | Supply         | Year End Bonuses | Brackets   | Credit note | Net sales revenue | Sales volumes (pieces) | Rebate_Description | Level 3          | -100.00    | 5.00       | 200.00     | 500.00  | Please wait, the process will be completed soon | Draft         | End item         | Threshold, % ,Fixed amount,Amount/Qty | Final settlement |