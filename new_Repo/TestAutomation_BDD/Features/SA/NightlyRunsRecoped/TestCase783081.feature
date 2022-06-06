Feature: TestCase783081
	WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CUSTOMERS_001- AC1 - Refresh of the Conditions list

@TTC_Nightly @TTC @BDD_783081
Scenario: WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CUSTOMERS_001
	Given the user navigates to the 'Rebates' page

	# Step 1
	When the user clicks on the 'Add Button'
	And the user clicks on the 'Customer Holder'
	And the user clicks on 'Hier. level side panel' with value '<CustomerLevel>'
	And the user clicks on 'Customer Code table' with value '<CustomerHolder>'
    And the user clicks on 'Popup Ok Button' with value 'Customer Holder'
    Then the user validates that the 'Popup' with value 'New Rebate' is displayed
    Then the user validates that the 'Input By Label Name' with value 'Classification' is displayed
	When the user enters '<Classification>' in field 'Input By Label Name' with value 'Classification'
	When the user enters '<Reason>' in field 'Input By Label Name' with value 'Reason'
	When the user enters '<TargetType>' in field 'Input By Label Name' with value 'Target Type'
    And the user clicks on 'Input By Label Name' with value 'Reason'
    And the user clicks on 'Popup Ok Button' with value 'New Rebate'
    Then the user is on the 'Summary Tab' page
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	When the user enters '<CalculationBasis>' in field 'Input By Label Name' with value 'Data source'
	When the user enters '<PaymentMode>' in field 'Input By Label Name' with value 'Payment mode'
	When the user enters '<PaymentFrequency>' in field 'Input By Label Name' with value 'Payment Frequency'
	When the user enters '<StandardRebateDescription>' in field 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<FixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on 'Side Panel Tab' with value 'General Info'
	And the user clicks on the 'Agreement ID Increment Icon'
	And the user clicks on the 'Agreement Code Label'
    Then the user validates that the 'Input By Label Name' with value 'Agreement Code' is displayed
	When the user enters '<AgreementDescription>' in the 'Agreement Description field'
    When the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	#step 2
	When the user navigates to the 'Agreements' page
    And the user filters the column by column name 'Agreement ID', 'Like', 'AgreementID'
    And the user clicks on 'AgreementID' text on the grid
    And the user clicks on 'Button' with value 'Edit'
    And the user clicks on 'Sub Tab' with value 'REBATES'
	And the user clicks on 'Sub Tab Add Button' with value 'Rebate Header'
	And the user selects active scenario '<Classification>' from dropdown list 'Classification'
	And the user selects active scenario '<Reason>' from dropdown list 'Reason'
	And the user selects active scenario '<TargetType>' from dropdown list 'Target Type'
	And the user selects active scenario '<PaymentMode>' from dropdown list 'Payment Mode'
	And the user selects active scenario '<CalculationBasis>' from dropdown list 'Calculation Basis'
	When the user enters '<MPRebateDescription>' in field 'Input By Label Name' with value 'Description'
	And the user clicks on 'Sub Tab Add Button' with value 'Rebate Products:'
    Then the user validates that the 'Text' with value 'Product' is present
	When the user clicks on 'Hier. level side panel' with value '<ProductLevel>'
	And the user clicks on 'Grid Checkbox' with value '<ProductCode>'
	And the user clicks on 'Grid Checkbox' with value '<ProductCode1>'
    And the user clicks on 'Popup Ok Button SM1Id' with value 'Products'
	And the user in popup 'New Rebate:' enters '<LumpSum>' in cell with column 'Lump Sum' and row text '<ProductCode>'
	And the user in popup 'New Rebate:' enters '<Percentage>' in cell with column '%' and row text '<ProductCode1>'
    And the user clicks on 'Popup Ok Button' with value 'New Rebate:'

	#step 3
	When the user clicks on 'Side Panel Tab' with value 'Customers'

	#step 4
    And the user clicks on 'Button' with value 'Refresh'

	#step5
	Then the user validates that popup with sm1 ID 'conditionsSection' and name 'Condition List' column 'Value' has '<FixedAmount>' with row text '<StandardRebateDescription>'
	And the user validates that popup with sm1 ID 'conditionsSection' and name 'Condition List' column 'Rebate description' has '<StandardRebateDescription>' with row text '<FixedAmount>'

	#step 6
	When the user clicks on 'Button' with value 'Save'

	#step 7
    And the user clicks on 'Button' with value 'Refresh'
    Then the user validates that the 'Text' with value 'Value' is present
	Then the user validates that popup with sm1 ID 'conditionsSection' and name 'Condition List' column 'Value' has '<LumpSum>' with row text '<ProductCode>'
	Then the user validates that popup with sm1 ID 'conditionsSection' and name 'Condition List' column 'Value' has '<Percentage>' with row text '<ProductCode1>'
	Then the user validates that popup with sm1 ID 'conditionsSection' and name 'Condition List' column 'Rebate description' has '<MPRebateDescription>' with row text '<ProductCode>'
	Then the user validates that popup with sm1 ID 'conditionsSection' and name 'Condition List' column 'Rebate description' has '<MPRebateDescription>' with row text '<ProductCode1>'

	#step 8
	When the user clicks on 'RebateCode' text on the grid
	Then the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Rebate description' has '<StandardRebateDescription>' with row text 'RebateCode'
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Value' has '<FixedAmount>' with row text 'Draft'

	#step 9
	When the user clicks on '<MPRebateDescription>' text on the grid
	Then the user validates that the 'Loading Mask' is not present
	Then the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Value' has '<LumpSum>' with row text '<ProductCode>'
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Value' has '<Percentage>' with row text '<ProductCode1>'
	
	Examples:
    | Classification | Reason           | TargetType | CustomerLevel | CustomerHolder | FixedAmount | PaymentMode     | PaymentFrequency | StandardRebateDescription | MPRebateDescription | ProductLevel | ProductCode | ProductCode1 | AgreementDescription | LumpSum | CalculationBasis  | Percentage |
    | Supply         | Year End Bonuses | Brackets   | Level 3       | EC86212        | 555         | Invoice payable | Monthly          | Standard_783081           | MP_783081           | Product      | 011         | 012          | Agreement_783081_des | 100     | Net sales revenue | 50%         |