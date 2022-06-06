Feature: TestCase489590
	WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_002 - Create Unconditional rebate from product level row on saving

@TTC_Nightly @TTC @BDD_489590
Scenario: WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_002
	# Step 1
	Given the user navigates to the 'Agreements' page
	When the user creates a New Document '<CustomerLevel>' '<CustomerHolder>' '<AgreementCode>' '<AgreementDescription>'
    And the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'

	# Step 2
	Then the user validates that the 'Sub Tab Add Button' with value 'Rebate Header' is displayed
	When the user clicks on 'Sub Tab Add Button' with value 'Rebate Header'
	Then the user validates that the 'Popup' with value 'New Rebate:' is displayed

	# Step 3
    Then the user validates that the 'Input By Label Name' with value 'Classification' is displayed
	And the user selects active scenario '<Classification>' from dropdown list 'Classification'
	And the user selects active scenario '<Reason>' from dropdown list 'Reason'
	When the user enters '<TargetType>' in field 'Input By Label Name' with value 'Target Type'
	And the user selects active scenario '<PaymentMode>' from dropdown list 'Payment Mode'
	When the user enters '<CalculationBasis>' in field 'Input By Label Name' with value 'Calculation Basis'
	When the user enters '<RebateDescription>' in field 'Input By Label Name' with value 'Description'
    And the user clicks on 'Input By Label Name' with value 'Reason'

	# Step 4
	And the user clicks on 'Sub Tab Add Button' with value 'Rebate Products:'

	# Step 5
	And the user clicks on 'Hier. level side panel' with value '<ProductLevel>'
	And the user filters the column by column name 'Code', 'Like', '<ProductCode>'
	And the user clicks on '<ProductCode>' text on the grid
    And the user clicks on 'Popup Ok Button SM1Id' with value 'Products'

	# Step 6
	And the user in popup 'New Rebate:' enters '<Percentage1>' in cell with column '%' and row text '<ProductCode>'
	And the user clicks on 'Popup Ok Button' with value 'New Rebate:'
	And the user retrieves text in cell with column 'Rebate Header ID' and row text '<Reason>' and saves as 'RebateCode'

	# Step 7
	And the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Text' with value 'Please wait, the process will be completed soon' is displayed
	And the user validates that the 'Toast Message Field' is displayed
	
	# Step 8
	When the user clicks on '<RebateDescription>' text on the grid
	Then the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Status' has '<productStatus>' with row text '<LumpSum>'

	# Step 9
	When the user navigates to the 'Rebates' page
	And the user filters the column by column name 'Agreement ID', 'Equal', 'AgreementID'
	And the user filters the column by column name 'Rebate code', 'Not Like', 'RebateCode'
	And the user retrieves text in cell with column 'Rebate code' and row text '<RebateDescription>' and saves as 'ChildRebateCode'

	# Step 10
	And the user clicks on 'ChildRebateCode' text on the grid
	And the user clicks on 'Text' with value 'ChildRebateCode'
	
	# Step 11
	Then the user validates that 'Input By Label Name' with value 'Target Type' has text '<TargetType>'
	And 'Input By Label Name' text with value 'Holder' contains '<CustomerHolder>'
	And 'Input By Label Name' text with value 'Holder' contains '<CustomerLevel>'
	And the user validates that 'Input By Label Name' with value 'Data source' has text '<CalculationBasis>'
	And the user validates that 'Input By Label Name' with value 'DESCRIPTION' has text '<RebateDescription>'
	And the user validates that 'Input By Label Name' with value 'STATUS' has text '<productStatus>'
	And the user validates that 'Input By Label Name' with value 'Payment mode' has text '<PaymentMode>'
	And the user validates that 'Input By Label Name' with value 'Payment Frequency' has text '<PaymentFrequency>'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column ' % ' has '<Percentage1>' with row text '0.00'
	# check dates
	And 'Start Date' text with value 'Rebate validity' contains '<startDate>'
	And 'End Date' text with value 'Rebate validity' contains '<endDate>'
	And 'Start Date' text with value 'CALCULATION BASIS VALIDITY' contains '<startDate>'
	And 'End Date' text with value 'CALCULATION BASIS VALIDITY' contains '<endDate>'

	# Step 12
	And the user validates that the 'Text' with value 'Hier. Customers: ALL' is displayed
	And the user validates that the 'Text' with value 'Customers: ALL' is displayed
	And the user validates that the 'Text Containing' with value 'PRESTIGE RIESLING 0.75 lt' is displayed

	# Step 13
	And the user validates that the 'Grid Column' with value '%' is displayed
	And the user validates that the 'Grid Column' with value 'Fixed amount' is displayed
	And the user validates that the 'Grid Column' with value 'Amount/Qty' is displayed

	# Step 14
    And the user clicks on 'Side Panel Tab' with value 'General Info'
	And the user validates that 'Input By Label Name' with value 'Agreement ID' has text 'AgreementID'
	And the user validates that 'Input By Label Name' with value 'Agreement Description' has text '<AgreementDescription>'
	And the user validates that 'Input By Label Name' with value 'Agreement Code' has text '<AgreementCode>'

	# Step 15
    And the user clicks on 'Side Panel Tab' with value 'Payment Schedule'
	And the user validates that popup with sm1 ID 'cardSettlements' and name 'Payment Schedule' column 'Date' has '<Date>' with row text '0.00'
	And the user validates that popup with sm1 ID 'cardSettlements' and name 'Payment Schedule' column 'Installment Type' has 'Final settlement' with row text '0.00'

	# Step 16
    When the user clicks on 'Side Panel Tab' with value 'Products'
	Then the user validates that elements 'Basic Grid Rows' have loaded
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '3'
	And the user validates that popup with sm1 ID 'cardGridInfo' and name '' column 'Product Code' has '<ProductCode>' with row text '<ProductCode>'

	# Step 17
	When the user navigates to the 'Rebates' page
	And the user filters the column by column name 'Rebate code', 'Like', 'RebateCode'
	And the user clicks on 'RebateCode' text on the grid
	Then the user validates that 'Input By Label Name' with value 'Target Type' has text '<TargetType>'
	And 'Input By Label Name' text with value 'Holder' contains '<CustomerHolder>'
	And 'Input By Label Name' text with value 'Holder' contains '<CustomerLevel>'
	And the user validates that 'Input By Label Name' with value 'Data source' has text '<CalculationBasis>'
	And the user validates that 'Input By Label Name' with value 'DESCRIPTION' has text '<RebateDescription>'
	And the user validates that 'Input By Label Name' with value 'STATUS' has text '<productStatus>'
	And the user validates that 'Input By Label Name' with value 'Payment mode' has text '<PaymentMode>'
	And the user validates that 'Input By Label Name' with value 'Payment Frequency' has text '<PaymentFrequency>'
	And 'Start Date' text with value 'Rebate validity' contains '01/01/2022'
	And 'End Date' text with value 'Rebate validity' contains '<Date>'
	And 'Start Date' text with value 'CALCULATION BASIS VALIDITY' contains '01/01/2022'
	And 'End Date' text with value 'CALCULATION BASIS VALIDITY' contains '<Date>'

	# Step 18
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column ' % ' has '0.00' with row text '0.00'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Fixed amount' has '0.00' with row text '0.00'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Amount/Qty' has '0.00' with row text '0.00'

	Examples: 
	| CustomerLevel | CustomerHolder | AgreementCode     | AgreementDescription   | Classification | Reason           | TargetType    | PaymentMode     | CalculationBasis  | RebateDescription     | ProductLevel | ProductCode | Percentage1 | PaymentFrequency | productStatus | ProcessStatus2   | ProcessStatusDes | startDate | endDate | Date       |
	| Level 4       | EC86217        | SA_AGREEMENT_CODE | SA_AGREEMENT_AGREEMENT | Supply         | Year End Bonuses | Unconditional | Invoice payable | Net sales revenue | Rebate_description002 | Product      | 016         | 10.00       | End item         | Draft         | Process Finished | Success          | 01/01     | 12/31   | 12/31/2022 |