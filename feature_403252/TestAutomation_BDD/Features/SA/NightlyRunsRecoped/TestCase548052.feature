Feature: TestCase548052
	WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_076 - display info for standard rebate - brackets and edit it

@TTC_Nightly @TTC @BDD_548052
Scenario: TC548052 - WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_076
	
	# Step 1
	Given the user navigates to the 'Rebates' page

	When the user creates a Rebate '<CustomerLevel>' '<Customer>' '<Classification>' '<Reason>' '<TargetType>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	And the user populates the Rebate mandatory data '<CalculationBasis>' '<PaymentMode>' '<PaymentFrequency>'
	And the user enters 'Sales volumes (pieces)' in the 'Tagret Data Source Field'
	And the user enters '<Description>' in field 'Input By Label Name' with value 'DESCRIPTION'
	
	#Step 2
	And the user enters '<Threshold1>' in cell with column 'Threshold' and row containing text '0.0'
	And the user clicks on 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<AmountQty1>' in cell with column 'Amount/Qty' and row containing text '0.0'
	And the user clicks on 'Input By Label Name' with value 'DESCRIPTION'
	And the user clicks on 'Text' with value 'for each 1'
    Then the user validates that the 'Popup' with value 'For each quantity' is displayed
	When the user enters '<ForEach1>' in field 'Input By Label Name' with value 'For each'
    And the user clicks on 'Popup Ok Button' with value 'For each quantity'
	And the user clicks on the 'Add Button'
	And the user enters '<Threshold2>' in cell with column 'Threshold' and row containing text '51.0'
	And the user clicks on 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<AmountQty2>' in cell with column 'Amount/Qty' and row containing text '<Threshold2>'
	And the user clicks on 'Input By Label Name' with value 'DESCRIPTION'
	And the user clicks on 'Text' with value 'for each 1'
    Then the user validates that the 'Popup' with value 'For each quantity' is displayed
	When the user enters '<ForEach2>' in field 'Input By Label Name' with value 'For each'
    And the user clicks on 'Popup Ok Button' with value 'For each quantity'
   
	And the user clicks on 'Side Panel Tab' with value 'Products'
	And the user clicks on 'Trigger By Field Name' with value 'Calculation Basis Filter'
	And the user clicks on the 'Popup Add Button'
	And the user in popup 'Filter Maker' enters '<Attribute>' in cell with column 'Attribute' and row text ''
	And the user in popup 'Filter Maker' enters '<Operator>' in cell with column 'Operator' and row text '<Attribute>'
    And the user clicks on 'Popup Grid Trigger' with value 'LOGICALFILTERMAKERPOPUP'
    Then the user validates that the 'Popup' with value 'Selection' is displayed
    When the user clicks on 'Grid Checkbox' with value '<Value>'
    And the user clicks on 'Popup Ok Button' with value 'Selection'
	Then the user validates that the 'Popup' with value 'Selection' is not present
    And the user clicks on 'Popup Ok Button' with value 'Filter Maker'
    Then the user validates that the 'Popup' with value 'Save Filter (Required)' is displayed
	When the user enters 'AGREE DOC_COND_076_ProdFILTER' in field 'Input By Label Name' with value 'Filter Name'
	And the user moves the focus away from the element
    And the user clicks on 'Popup Ok Button' with value 'Save Filter (Required)'

	And the user clicks on 'Side Panel Tab' with value 'Customers'
	And the user clicks on 'Trigger By Field Name' with value 'Hier Filter'
	And the user clicks on 'Element by SM1Id' with value 'ACTION_newFilterSet'
    Then the user validates that the 'Popup' with value 'Customer Hierarchy Filter' is displayed
	When the user clicks on 'Hier. level side panel' with value '<HierLevel>'
	And the user clicks on '<HierCustomer>' text on the grid
    And the user clicks on 'Popup Ok Button' with value 'Customer Hierarchy Filter'
    Then the user validates that the 'Popup' with value 'Customer Hierarchy Filter' is not present
    And the user clicks on 'Popup Ok Button' with value 'Filter Maker'
	When the user enters 'AGREE DOC_COND_076_HierFILTER' in field 'Input By Label Name' with value 'Filter Name'
	And the user moves the focus away from the element
    And the user clicks on 'Popup Ok Button' with value 'Save Filter (Required)'
	
	Then the user validates that the 'CheckBox Filter CalcBasis' is displayed

	# Step 3
	And the user clicks on 'Side Panel Tab' with value 'General Info'
	And the user clicks on the 'Agreement ID Increment Icon'
	And the user clicks on the 'Agreement Code Label'
    Then the user validates that the 'Input By Label Name' with value 'Agreement Code' is displayed
	When the user enters 'AGREE DOC_COND_076_AGREE' in field 'Input By Label Name' with value 'Agreement Code'
	And the user enters 'AGREE DOC_COND_076_AGREE' in the 'Agreement Description field'
    And the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'

	# Step 4
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	# Step 5
	And the user navigates to the 'Agreements' page

	# Step 6
	And the user clicks on 'AgreementID' text on the grid
    And the user clicks on 'Button' with value 'Edit'
    Then the user validates that the 'Input By Label Name' with value 'Agreement ID' is displayed
	Then the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Rebate description' has '<Description>' with row text '<Reason>'
    
	# Step 7
	When the user makes all coumns visible

	Then the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Rebate Header ID' has 'RebateCode' with row text '<Reason>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Rebate description' has '<Description>' with row text '<Reason>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Reason' has '<Reason>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Target Type' has '<TargetType>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Target' has '<Target>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Classification' has '<Classification>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Payment Modes' has '<PaymentMode>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Calculation Basis' has '<CalculationBasis>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Target Source' has 'Sales volumes (pieces)' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Beneficiary Level' has '<CustomerLevel>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Hier Filter' contains 'AGREE DOC_COND_076_HierFILTER' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Customer Filter' has '<CustFilter>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Customer Holder' has 'EC86217 - ALTRI NON ASSOCIATI' with row text '<Description>'
	
	# Step 8
	When the user clicks on 'RebateCode' text on the grid
	Then the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Product' contains 'AGREE DOC_COND_076_ProdFILTER' with row text '<Status>'
	Then the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Value' has '10 / 3' with row text '<Status>'
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Status' has '<Status>' with row text 'AGREE DOC_COND_076_ProdFILTER'
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Type Of Value' has 'Amount/Qty 2' with row text '<Status>'

	# Step 9
	When the user clicks on '10 / 3' text on the grid
    Then the user validates that the 'Popup' with value 'All Conditions' is displayed
	And the user validates that popup with sm1 ID 'LOGICALPOPUP' and name 'All Conditions' column 'Threshold' has '<Threshold1>' with row text 'for each 2'
	And the user validates that popup with sm1 ID 'LOGICALPOPUP' and name 'All Conditions' column 'Threshold' has '<Threshold2>' with row text 'for each 3'
    When the user clicks on 'Popup Ok Button' with value 'All Conditions'
	
	# Step 10
	And the user clicks on 'Element by SM1Id' with value 'ACTION_edit'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed

	# Step 11
	When the user clicks on the 'Same Filters Checkbox'

	# Step 12
	And the user clicks on 'Side Panel Tab' with value 'Products'
	Then the user validates that 'Input By Label Name' with value 'Calculation Basis Filter' contains text 'AGREE DOC_COND_076_ProdFILTER'
	When the user clicks on the 'Calculation Basic Filter Clear'
	Then the user validates that 'Input By Label Name' with value 'Calculation Basis Filter' contains text 'No filter'

	# Step 13
	When the user clicks on 'Side Panel Tab' with value 'Summary'
    Then the user validates that the 'Element by SM1Id' with value 'CHKFLGSAMEFILTER' is displayed
	When the user enters '<Percentage>' in cell with column ' % ' and row containing text '<Threshold2>'

	# Step 14
	And the user clicks on the 'Save Button'

	# Step 15
	And the user clicks on the 'Close Tab'
    Then the user validates that the 'Element by SM1Id' with value 'ACTION_edit' is displayed

	# Step 16
	When the user clicks on 'RebateCode' text on the grid
    Then the user validates that the 'Element Background Color' with value '008FE1' is displayed
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Target' has '<Target1>' with row text 'AGREE DOC_COND_076_REBATE'
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Product' has '<AllProducts>' with row text '<Status>'
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Value' contains '<ProductValue>' with row text '<Status>'
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Type Of Value' has 'Amount/QtyPercentage 2' with row text '<Status>'

	# Step 17
	When the user clicks on 'Details...' text on the grid
	Then the user validates that popup with sm1 ID 'LOGICALPOPUP' and name 'All Conditions' column 'Threshold' has '<Threshold1>' with row text 'for each 2'
	And the user validates that popup with sm1 ID 'LOGICALPOPUP' and name 'All Conditions' column 'Threshold' has '<Threshold2>' with row text '<Percentage>'
    When the user clicks on 'Popup Ok Button' with value 'All Conditions'


	Examples: 
	| CustomerLevel | Customer | Classification | Reason           | TargetType | CalculationBasis  | PaymentMode     | PaymentFrequency | Threshold1 | AmountQty1 | ForEach1 | Threshold2 | AmountQty2 | ForEach2 | Attribute | Operator | Value | HierLevel | HierCustomer | GrayCircleIcon | Target         | CustFilter | OrangeCircleIcon | counter | Status | Percentage | BlueCircleIcon | Target1    | AllProducts  | ProductValue |
	| Level 4       | EC86217  | Supply         | Year End Bonuses | Brackets   | Net sales revenue | Invoice payable | Monthly          | 50.00      | 50.00      | 2.00     | 75.00      | 10.00      | 3.00     | Brand     | In       | 01    |  Level 1  | EC87135      |      909090    | Not aggregated | ALL        | ea7400           | 2       | Draft  | 1.00       | 008fe1         | Aggregated | All Products | Details      |