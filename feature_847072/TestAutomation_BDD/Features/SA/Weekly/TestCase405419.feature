Feature: TestCase405419
	WEB_SA_AGREEMENT_REBATES_018 - Mass Copy - 'Create new agreement' flagged when change the Customer Holder

@TTC @TCC_Weekly @BDD_405419
Scenario: WEB_SA_AGREEMENT_REBATES_018
	
	# Step 1
	Given the user navigates to the 'Rebates' page
	
	When the user creates a Rebate with Level: '<CUSTLEV>' Customer: '<CUSTOMER>' Classification: '<CLASSIFICATION>' Reason: '<REASON>' Target Type: '<TARGET_TYPE>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	And the user populates the Rebate mandatory fields with Data Source: '<DATASOURCE>' Payment Mode: 'Debit note' Payment Frequency: '<PAY_FREQ>'
	And the user clicks on 'Button' with value 'Save'
	And the user clicks on the 'Close Tab'

	# Step 2
	And the user creates a Rebate with Level: '<CUSTLEV>' Customer: '<CUSTOMER1>' Classification: '<CLASSIFICATION1>' Reason: '' Target Type: '<TARGET_TYPE>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode1'
	And the user populates the Rebate mandatory fields with Data Source: '<DATASOURCE>' Payment Mode: 'Debit note' Payment Frequency: '<PAY_FREQ>'
	And the user selects validity period from: '<StartDate>' to: '<EndDate>' on the 'Small Letter Rebate validity Period' field

	# Step 3
	And the user clicks on side panel 'General Info'
	And the user clicks on the 'Agreement ID Increment Icon'
	And the user clicks on the 'Agreement Code Label'
    Then the user validates that the 'Input By Label Name' with value 'Agreement Code' is displayed
	When the user enters '<AGR_CODE>' in field 'Input By Label Name' with value 'Agreement Code'
	And the user enters '<AGR_CODE>' in the 'Agreement Description field'
    And the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	# Step 4
	And the user clicks on the 'Refresh button'
	And the user clicks on 'Grid Checkbox' with value 'RebateCode'
	And the user clicks on 'Grid Checkbox' with value 'RebateCode1'

	# Step 5
	And the user clicks on the 'Mass Copy'
	Then the user validates that the 'Checkbox By Label' with value 'Create New Agreement' is displayed

	# Step 6
	When the user clicks on 'Trigger Open Dropdown' with value 'Customer holder'
	And the user clicks on 'Hier. level Side Panel' with value '<CUSTLEV>'
	And the user filters the column by column name 'Customer code', Filter Type 'Like', Value 'EC86158'
	And the user clicks on 'Text in Grid' with value 'EC86158'
	And the user clicks on 'Popup Ok Button' with value 'New Customer'

	# Step 7
	Then the user validates that 'Checkbox By Label' with value 'Create New Agreement' is marked as: 'true'
	And the user validates that the 'Checkbox By Label' with value 'Create New Agreement' is disabled

	Examples: 
	| CUSTOMER | CUSTOMER1 | CUSTLEV | CLASSIFICATION | CLASSIFICATION1          | REASON           | TARGET_TYPE | PAY_FREQ | DATASOURCE        | StartDate | EndDate |  AGR_CODE | UiName    |
	| EC86200  | EC86196   | Level 3 | Supply         | International allowances | Year End Bonuses | Brackets    | End item | Net sales revenue | 01/03/y   | 31/08/y | 405419_1  | Mass Copy |