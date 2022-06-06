Feature: TestCase507616
	WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_051 - Save an agreement after editing of a rebate folder NEW

@TTC_Nightly @TTC @BDD_507616
Scenario: WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_051

	# Step 1
	Given the user navigates to the 'Agreements' page
	
	When the user creates a New Document '<CustomerLevel>' '<CustomerHolder>' '' ''
	Then the user validates that the 'Input By Label Name' with value 'Agreement ID' is displayed
	When the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'
	And the user populates the New Rebate Details '<Classification>' '<Reason>' '<TargetType>' '<PaymentMode>' 'Net sales revenue' 'RebateFolder_051'

	# Step 2
	And the user clicks on 'Sub Tab Add Button' with value 'Rebate Products:'
	And the user clicks on 'Hier. level side panel' with value '<ProductLevel>'
    And the user clicks on 'Grid Checkbox' with value '<ProductCode>'
    And the user clicks on 'Grid Checkbox' with value '<ProductCode2>' 
	And the user clicks on 'Popup Ok Button SM1Id' with value 'Products'	
	And the user in popup 'New Rebate:' enters '<Percentage1a>' in cell with column '%' and row text '<ProductCode>'
	And the user in popup 'New Rebate:' enters '<Percentage2a>' in cell with column '%' and row text '<ProductCode2>'

	# Step 3
	And the user clicks on 'Popup Ok Button' with value 'New Rebate:'
    
	# Step 4
	And the user retrieves text in cell with column 'Rebate Header ID' and row text 'RebateFolder_051' and saves as 'MasterRebateCode'
	And the user clicks on 'RebateFolder_051' text on the grid
	And the user clicks on 'Element by SM1Id' with value 'ACTION_edit'

	# Step 5
	And the user selects active scenario '<TargetType2>' from dropdown list 'Target Type'
	And the user selects active scenario 'Sales volumes (pieces)' from dropdown list 'Calculation Basis'
	And the user enters 'Sales volumes (pieces)' in field 'Input By Label Name' with value 'Target Source'
	And the user selects active scenario '<BeneficiaryLevel>' from dropdown list 'Beneficiary Level'
	And the user enters 'newDescription_051' in field 'Input By Label Name' with value 'Description'
	And the user moves the focus away from the element
	And the user selects validity period '01/02/y' '30/11/y' on the 'New Rebate Validity Period Trigger' field

	# Step 6
	And the user clicks on 'Generic Drop Down Trigger' with value 'Hier Filter'
	And the user clicks on 'Element by SM1Id' with value 'ACTION_newFilterSet'
	And the user clicks on 'Hier. level side panel' with value '<BeneficiaryLevel>'
	And the user clicks on 'Hier. level side panel' with value '<Filtering>'
	And the user clicks on '<CustomerCode>' text on the grid
	And the user clicks on 'Popup Ok Button' with value 'Customer Hierarchy Filter'
	And the user clicks on 'Popup Ok Button' with value 'Filter Maker'
	And the user enters '<FilterName>' in field 'Input By Label Name' with value 'Filter Name'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Ok Button' with value 'Save Filter (Required)'

	# Step 7
	And the user clicks on the 'Expend Panel Icon'
	And the user selects validity period '01/06/y' '30/11/y' on the 'Calc Basis Validity Period' field
	And the user selects validity period '01/01/y' '30/06/y' on the 'Target Validity Period' field
	# set dates

	# Step 8
	And the user in popup 'New Rebate:' Clicks cell with column 'Product' and row text '<ProductCode2>'
	And the user clicks on 'Element by SM1Id' with value 'ACTION_remove'
	Then the user validates that the 'Alert Dialog Button' with value 'OK' is displayed
	When the user clicks on 'Alert Dialog Button' with value 'OK'

	# Step 9
	And the user clicks on 'Element by SM1Id' with value 'ACTION_all-filters'

	# Step 10
	And the user in popup 'New Rebate:' Clicks cell with column 'Product' and row text '<AllProducts>'
	And the user clicks on 'Element by SM1Id' with value 'ACTION_addThresholds'
	Then the user validates that the 'Popup Ok Button' with value 'All Conditions' is displayed
	When the user in popup 'All Conditions' enters '<threshold3a>' in cell with column 'Threshold' and row text '0.00'
	And the user in popup 'All Conditions' enters '<Percentage3a>' in cell with column ' % ' and row text '<threshold3a>'
	And the user clicks on the 'Add Button'
	And the user in popup 'All Conditions' enters '<threshold3b>' in cell with column 'Threshold' and row text '31.00'
	And the user in popup 'All Conditions' enters '<Percentage3b>' in cell with column ' % ' and row text '<threshold3b>'
	And the user clicks on 'Popup Ok Button' with value 'All Conditions'

	# Step 11
	And the user in popup 'New Rebate:' Clicks cell with column 'Product' and row text '<ProductCode>'
	And the user clicks on 'Element by SM1Id' with value 'ACTION_addThresholds'
	Then the user validates that the 'Popup Ok Button' with value 'All Conditions' is displayed
	When the user in popup 'All Conditions' enters '<threshold4a>' in cell with column 'Threshold' and row text '0.00'
	And the user in popup 'All Conditions' enters '<Percentage4>' in cell with column ' % ' and row text '<threshold4a>'
	And the user clicks on the 'Add Button'
	And the user in popup 'All Conditions' enters '<threshold4b>' in cell with column 'Threshold' and row text '41.00'
	And the user in popup 'All Conditions' enters '<Amount_qtyb>' in cell with column 'Amount/Qty' and row text '<threshold4b>'
	And the user clicks on 'Popup Ok Button' with value 'All Conditions'

	# Step 12
	And the user clicks on 'Element by SM1Id' with value 'ACTION_target'

	# Step 13
	And the user clicks on 'Checkbox By Label' with value 'Aggregated'
	And the user selects active scenario '<targetLevel>' from dropdown list 'Target Level'

	# Step 14
	And the user clicks on 'Popup Ok Button' with value 'Target'
	And the user clicks on 'Popup Ok Button' with value 'New Rebate'

	# Step 15
	And the user clicks on 'Button' with value 'Save'

	# Step 16
	And the user navigates to the 'Rebates' page	
	And the user filters the column by column name 'Agreement ID', 'Equal', 'AgreementID'
	Then the user validates that elements 'Rows' have loaded
	When the user retrieves count of 'Popup Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '4'

	# Step 17
	When the user filters the column by column name 'Rebate code', 'Not Like', 'MasterRebateCode'
	And the user retrieves text in cell with column 'Rebate code' and row text 'newDescription_051' and saves as 'ChildRebateCode'
	And the user filters the column by column name 'Rebate code', 'Not Like', 'ChildRebateCode'
	And the user retrieves text in cell with column 'Rebate code' and row text 'newDescription_051' and saves as 'ChildRebateCode1'
	And the user clears filter at column  'Agreement ID'
	And the user filters the column by column name 'Rebate code', 'Like', 'ChildRebateCode'
	And the user clicks on link on column 'Rebate code' with row text 'newDescription_051'
	
	Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Threshold' has '<threshold3a>' with row text '<Percentage3a>'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column ' % ' has '<Percentage3a>' with row text '<threshold3a>'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Threshold' has '<threshold3b>' with row text '<Percentage3d>'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column ' % ' has '<Percentage3b>' with row text '<threshold3b>'

	# check child 2
	When the user clicks on the 'Close Tab'
	And the user filters the column by column name 'Rebate code', 'Like', 'ChildRebateCode1'
	And the user clicks on link on column 'Rebate code' with row text 'newDescription_051'
	
	Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
	Then the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Threshold' has '<threshold4a>' with row text '<Percentage4>'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column ' % ' has '<Percentage4>' with row text '<threshold4a>'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Threshold' has '<threshold4b>' with row text '<AmountQtyb>'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Amount/Qty' has '<Amount_qtyb>' with row text '<threshold4b>'
	
	# Step 18
	When the user clicks on the 'Close Tab'
	And the user filters the column by column name 'Rebate code', 'Like', 'MasterRebateCode'
	And the user clicks on link on column 'Rebate code' with row text 'newDescription_051'

	Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Threshold' has '0.00' with row text '0.00'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Amount/Qty' has '0.00' with row text '0.00'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column ' % ' has '0.00' with row text '0.00'
	And the user validates that popup with sm1 ID 'CARD_RANGES' and name 'Benefit' column 'Fixed amount' has '0.00' with row text '0.00'
	And the user validates that 'Input By Label Name' with value 'Target Type' contains text '<TargetType2>'
	And the user validates that 'Input By Label Name' with value 'Data source' contains text 'Sales volumes (pieces)'
	And the user validates that 'Input By Label Name' with value 'DESCRIPTION' contains text 'newDescription_051'
	And the user validates that 'Start Date' with value 'Target' contains text '01/01/y'
	And the user validates that 'End Date' with value 'Target' contains text '30/06/y'
	And the user validates that 'Start Date' with value 'CALCULATION BASIS VALIDITY' contains text '01/06/y'
	And the user validates that 'End Date' with value 'CALCULATION BASIS VALIDITY' contains text '30/11/y'

	Examples: 
	| CustomerLevel | CustomerHolder | Classification | Reason           | TargetType    | PaymentMode     | ProductLevel | ProductCode | ProductCode2 | Percentage1a | Percentage2a | TargetType2 | startDay | startMonth | endDay | endMonth | BeneficiaryLevel | HierLevel | Filtering | CustomerCode | FilterName     | startMonth2 | endMonth2 | startMonth3 | AllProducts  | threshold3a | Percentage3a | threshold3b | Percentage3b | threshold4a | Percentage4 | threshold4b | Amount_qtyb | targetLevel |
	| Level 4       | EC86185        | Supply         | Year End Bonuses | Unconditional | Invoice payable | Product      | 010         | 011          | 10           | 20           | Brackets    | 01       | 02         | 30     | 11       | Level 3          | Level 3   | Included  | EC86184      | HierFilter_051 | 01          | 06        | 06          | All Products | 30.00       | 30.00        | 3,000.00    | 50.00        | 40.00       | 40.00       | 4,000.00    | 400.00      | Level 5     |