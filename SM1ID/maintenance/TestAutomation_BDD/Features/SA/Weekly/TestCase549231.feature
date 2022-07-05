Feature: TestCase549231
	WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_077 - display info for standard rebate - unconditional and edit it

@TTC @TTC_Weekly @BDD_549231
Scenario: WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_077
	
	# Step 1
	Given the user navigates to the 'Rebates' page

	When the user creates a Rebate with Level: '<CustomerLevel>' Customer: '<Customer>' Classification: '<Classification>' Reason: '<Reason>' Target Type: '<TargetType>'
    And the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	And the user populates the Rebate mandatory fields with Data Source: '<CalculationBasisDataSource>' Payment Mode: '<PaymentMode>' Payment Frequency: '<PaymentFrequency>'
	And the user enters '<Description>' in field 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<FixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user moves the focus away from the element
	And the user enters '<Percentage>' in cell with column ' % ' and row containing text '0.0'

	# Step 2
	And the user clicks on side panel 'Products'
	And the user clicks on 'Trigger By Field Name' with value 'Calculation Basis Filter'
	And the user clicks on the 'Popup Add Button'
	And the user in popup 'Filter Maker' enters '<Attribute>' in cell with column 'Attribute' and row text ''
	And the user in popup 'Filter Maker' enters '<Operator>' in cell with column 'Operator' and row text '<Attribute>'
    And the user clicks on 'Popup Grid Trigger' with value 'LOGICALFILTERMAKERPOPUP'
    Then the user validates that the 'Popup' with value 'Selection' is displayed
    When the user clicks on 'Grid Checkbox' with value '<Value>'
    And the user clicks on 'Popup Ok Button' with value 'Selection'
	Then the user validates that the 'Popup' with value 'Filter Maker' is displayed
    When the user clicks on 'Popup Ok Button' with value 'Filter Maker'
    Then the user validates that the 'Popup' with value 'Save Filter (Required)' is displayed
	When the user enters '<FilterName>' in field 'Input By Label Name' with value 'Filter Name'
	And the user moves the focus away from the element
    And the user clicks on 'Popup Ok Button' with value 'Save Filter (Required)'
	And the user clicks on 'Side Panel Tab' with value 'Customers'
	And the user selects active scenario '<BeneficiaryLevel>' from dropdown list 'Beneficiary Level'
	And the user clicks on 'Trigger By Field Name' with value 'Hier Filter'
	And the user clicks on 'Element by SM1Id' with value 'ACTION_newFilterSet'
    Then the user validates that the 'Popup' with value 'Customer Hierarchy Filter' is displayed
	When the user clicks on 'Hier. level side panel' with value '<HierLevel>'
	And the user clicks on '<HierCustomer>' text on the grid
    And the user clicks on 'Popup Ok Button' with value 'Customer Hierarchy Filter'
    Then the user validates that the 'Popup' with value 'Filter Maker' is displayed
    When the user clicks on 'Popup Ok Button' with value 'Filter Maker'
	And the user enters '<FilterName1>' in field 'Input By Label Name' with value 'Filter Name'
	And the user moves the focus away from the element 
    And the user clicks on 'Popup Ok Button' with value 'Save Filter (Required)'	
	And the user clicks on 'Trigger By Field Name' with value 'Customer Filter'
	And the user in popup 'Filter Maker' enters '<Attribute1>' in cell with column 'Attribute' and row text ''
	And the user in popup 'Filter Maker' enters '<Operator>' in cell with column 'Operator' and row text '<Operator>'
	And the user in popup 'Filter Maker' enters '<Value1>' in cell with column 'Value' and row text '<Operator>'
    And the user clicks on 'Popup Ok Button' with value 'Filter Maker'
    Then the user validates that the 'Popup' with value 'Save Filter (Required)' is displayed
	When the user enters '<FilterName2>' in field 'Input By Label Name' with value 'Filter Name'
	And the user moves the focus away from the element
    And the user clicks on 'Popup Ok Button' with value 'Save Filter (Required)'

	# Step 3
	And the user clicks on side panel 'General Info'
	And the user clicks on the 'Agreement ID Increment Icon'
	When the user clicks on the 'Agreement Code Label'
    Then the user validates that the 'Input By Label Name' with value 'Agreement Code' is displayed
	When the user enters '<AgreementCode>' in field 'Input By Label Name' with value 'Agreement Code'
	And the user enters '<AgreementDescription>' in the 'Agreement Description field'
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
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Rebate description' has '<Description>' with row text '<Reason>'

	# Step 7
	When the user makes all coumns visible
	Then the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Rebate Header ID' has 'RebateCode' with row text '<Reason>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Rebate description' has '<Description>' with row text '<Reason>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Reason' has '<Reason>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Target Type' has '<TargetType>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Target' has '<Target>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Classification' has '<Classification>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Payment Modes' has '<PaymentMode>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Target Source' has '<CalculationBasisDataSource>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Beneficiary Level' has '<BeneficiaryLevel>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Hier Filter' contains '<FilterName1>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Customer Filter' contains '<FilterName2>' with row text '<Description>'
	And the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Customer Holder' has 'EC86217 - ALTRI NON ASSOCIATI' with row text '<Description>'

	# Step 8
	When the user clicks on 'RebateCode' text on the grid
	Then the user validates that the 'Element Background Color' with value '<OrangeCircleIcon>' is displayed
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Product' contains '<FilterName>' with row text '<Status>'
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Value' has '<ProductValue>' with row text '<Status>'
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Status' has '<Status>' with row text 'AGREE DOC_COND_076_ProdFILTER'
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Type Of Value' contains '<LumpSumLabel>' with row text '<Status>'
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Type Of Value' contains '<PercentageLabel>' with row text '<Status>'

	# Step 9
	When the user clicks on '<ProductValue>' text on the grid
    Then the user validates that the 'Popup' with value 'All Conditions' is displayed
	And the user validates that popup with sm1 ID 'LOGICALPOPUP' and name 'All Conditions' column 'Fixed amount' has '<FixedAmount>' with row text '0.00'
	And the user validates that popup with sm1 ID 'LOGICALPOPUP' and name 'All Conditions' column ' % ' has '<Percentage>' with row text '0.00'

	# Step 10
    When the user clicks on 'Popup Ok Button' with value 'All Conditions'

	# Step 10
	And the user clicks on 'Element by SM1Id' with value 'ACTION_edit'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed

	# Step 11
	When the user selects active scenario '<PaymentMode1>' from dropdown list 'Payment mode'

	# Step 12
	And the user changes the status to '<Status1>'

	# Step 13
	And the user clicks on the 'Close Tab'
    And the user clicks on 'Button' with value 'Save'

	# Step 14
	And the user makes all coumns visible
	And the user clicks on 'RebateCode' text on the grid
	Then the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Payment Modes' has '<PaymentMode1>' with row text '<Reason>'
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Status' has '<Status1Description>' with row text '<ProductValue>'

	Examples:
	| CustomerLevel | Customer | Classification | Reason           | TargetType    | CalculationBasisDataSource | PaymentMode     | PaymentFrequency | Description               | FixedAmount | Percentage | Attribute | Operator | Value | FilterName                    | BeneficiaryLevel | HierLevel | HierCustomer | FilterName1                   | Attribute1   | Value1 | FilterName2                   | AgreementCode            | AgreementDescription     | GrayCircleIcon | Target         | OrangeCircleIcon | ProductValue | LumpSumLabel | PercentageLabel | Status | PaymentMode1 | Status1 | Status1Description |
	| Level 4       | EC86217  | Supply         | Year End Bonuses | Unconditional | Sales volumes (pieces)     | Invoice payable | Six-monthly      | AGREE DOC_COND_077_REBATE | 2,000.00    | 1.00       | Brand     | In       | 01    | AGREE DOC_COND_077_ProdFILTER | Level 3          | Level 1   | EC87135      | AGREE DOC_COND_077_HierFILTER | Nielsen Area | AN1    | AGREE DOC_COND_077_CustFILTER | AGREE DOC_COND_077_AGREE | AGREE DOC_COND_077_AGREE | 909090         | Not aggregated | EA7400           | Details...   | Lump Sum     | Percentage      | Draft  | Credit note  | Confirm | Confirmed          |