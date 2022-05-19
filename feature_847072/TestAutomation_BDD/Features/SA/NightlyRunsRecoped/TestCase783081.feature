Feature: TestCase783081
	WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CUSTOMERS_001- AC1 - Refresh of the Conditions list

@TTC_Nightly @TTC @BDD_783081
Scenario: WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CUSTOMERS_001
	Given the user navigates to the 'Rebates' page

	# Step 1
	When the user creates a Rebate with Level: '<CustomerLevel>' Customer: '<CustomerHolder>' Classification: '<Classification>' Reason: '<Reason>' Target Type: '<TargetType>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	And the user populates the Rebate mandatory fields with Data Source: '<CalculationBasis>' Payment Mode: '<PaymentMode>' Payment Frequency: '<PaymentFrequency>'
	And the user enters '<StandardRebateDescription>' in field 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<FixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on 'Side Panel Tab' with value 'General Info'
	And the user clicks on the 'Agreement ID Increment Icon'
	And the user clicks on the 'Agreement Code Label'
    Then the user validates that the 'Input By Label Name' with value 'Agreement Code' is displayed
	When the user enters '<AgreementDescription>' in the 'Agreement Description field'
    And the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	#step 2
	And the user navigates to the 'Agreements' page
    And the user filters the column by column name 'Agreement ID', Filter Type 'Like', Value 'AgreementID'
    And the user clicks on 'AgreementID' text on the grid
    And the user clicks on 'Button' with value 'Edit'
    And the user clicks on 'Sub Tab' with value 'REBATES'
	When the user populates the New Rebate Details Classification: '<Classification>' Reason: '<Reason>' Target Type: '<TargetType>' Payment Mode: '<PaymentMode>' Calculation Basis: '<CalculationBasis>' Description: '<MPRebateDescription>'
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
	And the user validates that popup with sm1 ID 'conditionsSection' and name 'Condition List' column 'Value' has '<LumpSum>' with row text '<ProductCode>'
	And the user validates that popup with sm1 ID 'conditionsSection' and name 'Condition List' column 'Value' has '<Percentage>' with row text '<ProductCode1>'
	And the user validates that popup with sm1 ID 'conditionsSection' and name 'Condition List' column 'Rebate description' has '<MPRebateDescription>' with row text '<ProductCode>'
	And the user validates that popup with sm1 ID 'conditionsSection' and name 'Condition List' column 'Rebate description' has '<MPRebateDescription>' with row text '<ProductCode1>'

	#step 8
	When the user clicks on 'RebateCode' text on the grid
	Then the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Rebate description' has '<StandardRebateDescription>' with row text 'RebateCode'
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Value' has '<FixedAmount>' with row text 'Draft'

	#step 9
	When the user clicks on '<MPRebateDescription>' text on the grid
	Then the user validates that the 'Loading Mask' is not present
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Value' has '<LumpSum>' with row text '<ProductCode>'
	And the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Value' has '<Percentage>' with row text '<ProductCode1>'
	
	Examples:
    | Classification | Reason           | TargetType | CustomerLevel | CustomerHolder | FixedAmount | PaymentMode     | PaymentFrequency | StandardRebateDescription | MPRebateDescription | ProductLevel | ProductCode | ProductCode1 | AgreementDescription | LumpSum | CalculationBasis  | Percentage |
    | Supply         | Year End Bonuses | Brackets   | Level 3       | EC86212        | 555         | Invoice payable | Monthly          | Standard_783081           | MP_783081           | Product      | 011         | 012          | Agreement_783081_des | 100     | Net sales revenue | 50%         |