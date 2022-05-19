Feature: TestCase405415
	WEB_SA_AGREEMENT_REBATES_014 - Rebate Mass Copy - Create new agreement on False

@TTC @TTC_Weekly @BDD_405415
Scenario: WEB_SA_AGREEMENT_REBATES_014
	# Step 1
	Given the user navigates to the 'Rebates' page
	
	When the user creates a Rebate with Level: '<CUSTLEV>' Customer: '<CUSTOMER>' Classification: '<CLASSIFICATION>' Reason: '<REASON>' Target Type: '<TARGET_TYPE>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	And the user populates the Rebate mandatory fields with Data Source: '<CALCULATION_BASIS>' Payment Mode: '<PAY_MODE>' Payment Frequency: '<PAY_FREQ>'
	And the user clicks on side panel 'General Info'
    Then the user validates that the 'Input By Label Name' with value 'Agreement Code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID0'
	And the user clicks on 'Button' with value 'Save'
	And the user clicks on the 'Close Tab'

	# Step 2
	And the user creates a Rebate with Level: '<CUSTLEV>' Customer: '<CUSTOMER>' Classification: '<CLASSIFICATION1>' Reason: '' Target Type: '<TARGET_TYPE>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode1'
	And the user populates the Rebate mandatory fields with Data Source: '<CALCULATION_BASIS>' Payment Mode: '<PAY_MODE>' Payment Frequency: '<PAY_FREQ>'
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
	And the user creates a Rebate with Level: '<CUSTLEV>' Customer: '<CUSTOMER>' Classification: '<CLASSIFICATION1>' Reason: '' Target Type: '<TARGET_TYPE>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode2'
	And the user populates the Rebate mandatory fields with Data Source: '<CALCULATION_BASIS>' Payment Mode: '<PAY_MODE>' Payment Frequency: '<PAY_FREQ>'
	And the user selects validity period from: '<StartDate>' to: '<EndDate>' on the 'Small Letter Rebate validity Period' field

	# Step 5
	And the user clicks on side panel 'General Info'
	And the user clicks on 'Trigger By Field Name' with value 'Agreement ID'
	Then the user validates that the 'Popup' with value 'Select the  Agreements' is displayed
	When the user clicks on 'Text in Grid' with value 'AgreementID'
	When the user clicks on 'Popup Ok Button' with value 'Select the  Agreements'
	When the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	# Step 6
	And the user creates a Rebate with Level: '<CUSTLEV>' Customer: '<CUSTOMER1>' Classification: '<CLASSIFICATION1>' Reason: '' Target Type: '<TARGET_TYPE>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode3'
	And the user populates the Rebate mandatory fields with Data Source: '<CALCULATION_BASIS>' Payment Mode: '<PAY_MODE>' Payment Frequency: '<PAY_FREQ>'
	And the user selects validity period from: '<StartDate>' to: '<EndDate>' on the 'Small Letter Rebate validity Period' field

	# Step 7
	And the user clicks on side panel 'General Info'
	And the user clicks on the 'Agreement ID Increment Icon'
	And the user clicks on the 'Agreement Code Label'
    Then the user validates that the 'Input By Label Name' with value 'Agreement Code' is displayed
	When the user enters '<AGR_CODE1>' in field 'Input By Label Name' with value 'Agreement Code'
	And the user enters '<AGR_CODE>' in the 'Agreement Description field'
    And the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID1'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	# Step 8
	And the user clicks on the 'Refresh button'
	And the user clicks on 'Grid Checkbox' with value 'RebateCode'
	And the user clicks on 'Grid Checkbox' with value 'RebateCode1'
	And the user clicks on 'Grid Checkbox' with value 'RebateCode2'
	And the user clicks on 'Grid Checkbox' with value 'RebateCode3'

	# Step 9
	And the user clicks on the 'Mass Copy'
	Then the user validates that the 'Checkbox By Label' with value 'Create New Agreement' is displayed
	And the user validates that 'Checkbox By Label' with value 'Create New Agreement' is marked as: 'false'

	# Step 10
	When the user clicks on 'Button' with value 'Execute'

	# Step 11
	Then the user validates that column 'Copy Result' has '<COPY_RESULT>' with row text 'RebateCode'
	And the user validates that column 'Copy Result' has '<COPY_RESULT>' with row text 'RebateCode1'
	And the user validates that column 'Copy Result' has '<COPY_RESULT>' with row text 'RebateCode2'
	And the user validates that column 'Copy Result' has '<COPY_RESULT>' with row text 'RebateCode3'
	When the user retrieves text from column 'Copy Rebate Id' with unique row text 'RebateCode1' and saves it as 'RebateCode1Copy'
	And the user retrieves text from column 'Copy Rebate Id' with unique row text 'RebateCode2' and saves it as 'RebateCode2Copy'
	And the user retrieves text from column 'Copy Rebate Id' with unique row text 'RebateCode3' and saves it as 'RebateCode3Copy'

	# Step 12
	And the user clicks on 'Top Tab' with value 'Result Copy Rebates'

	# Step 13
	Then the user validates that from table with unique column 'Original Rebate Id' column 'Status' has '<STATUS>' with row text 'RebateCode'
	And the user validates that from table with unique column 'Original Rebate Id' column 'Status' has '<STATUS>' with row text 'RebateCode1'
	And the user validates that from table with unique column 'Original Rebate Id' column 'Status' has '<STATUS>' with row text 'RebateCode2'
	And the user validates that from table with unique column 'Original Rebate Id' column 'Status' has '<STATUS>' with row text 'RebateCode3'

	# Step 14
	Then the user validates that from table with unique column 'Original Rebate Id' column 'Agreement ID' has 'AgreementID0' with row text 'RebateCode'
	And the user validates that from table with unique column 'Original Rebate Id' column 'Agreement Code' has ' ' with row text 'RebateCode'
	And the user validates that from table with unique column 'Original Rebate Id' column 'Agreement Description' has ' ' with row text 'RebateCode'
	And the user validates that from table with unique column 'Original Rebate Id' column 'Agreement ID' has 'AgreementID' with row text 'RebateCode1'
	And the user validates that from table with unique column 'Original Rebate Id' column 'Agreement Code' has '<AGR_CODE>' with row text 'RebateCode1'
	And the user validates that from table with unique column 'Original Rebate Id' column 'Agreement Description' has '<AGR_CODE>' with row text 'RebateCode1'
	And the user validates that from table with unique column 'Original Rebate Id' column 'Agreement ID' has 'AgreementID' with row text 'RebateCode2'
	And the user validates that from table with unique column 'Original Rebate Id' column 'Agreement Code' has '<AGR_CODE>' with row text 'RebateCode2'
	And the user validates that from table with unique column 'Original Rebate Id' column 'Agreement Description' has '<AGR_CODE>' with row text 'RebateCode2'
	And the user validates that from table with unique column 'Original Rebate Id' column 'Agreement ID' has 'AgreementID1' with row text 'RebateCode3'
	And the user validates that from table with unique column 'Original Rebate Id' column 'Agreement Code' has '<AGR_CODE1>' with row text 'RebateCode3'
	And the user validates that from table with unique column 'Original Rebate Id' column 'Agreement Description' has '<AGR_CODE>' with row text 'RebateCode3'

	# Step 15
	When the user navigates to the 'Agreements' page
	And the user filters the column by column name 'Agreement ID', Filter Type 'Like', Value 'AgreementID'
	And the user clicks on 'AgreementID' text on the grid
	And the user opens the filter at column 'Rebate Header ID'
	Then the user validates that the 'Filter Option' with value 'RebateCode1' is displayed
	And the user validates that the 'Filter Option' with value 'RebateCode1Copy' is displayed
	And the user validates that the 'Filter Option' with value 'RebateCode2' is displayed
	And the user validates that the 'Filter Option' with value 'RebateCode2Copy' is displayed
	When the user clicks on 'Popup Button' with value 'Cancel'
	And the user clicks on the 'Close Tab'
	And the user filters the column by column name 'Agreement ID', Filter Type 'Like', Value 'AgreementID1'
	And the user clicks on 'AgreementID1' text on the grid
	And the user opens the filter at column 'Rebate Header ID'
	Then the user validates that the 'Filter Option' with value 'RebateCode3' is displayed
	And the user validates that the 'Filter Option' with value 'RebateCode3Copy' is displayed
	When the user clicks on 'Popup Button' with value 'Cancel'
	And the user clicks on the 'Close Tab'


	Examples: 
	| CUSTOMER | CUSTOMER1 | CUSTLEV | CLASSIFICATION | CLASSIFICATION1          | REASON           | REASON1             | TARGET_TYPE | TARGET_TYPE1  | PAY_FREQ | CALCULATION_BASIS | StartDate | EndDate | UiName    | PAY_MODE    | AGR_CODE | AGR_CODE1 | VALIDITYFrom | VALIDITYTo | VALIDITYFrom1 | VALIDITYTo1 | COPY_RESULT | STATUS |
	| EC86206  | EC86212   | Level 3 | Supply         | International allowances | Year End Bonuses | International terms | Brackets    | Unconditional | End item | Net sales revenue | 01/03/y   | 31/08/y | Mass Copy | Credit note | 405415_1 | 405415_2  | 01/01/Y      | 12/31/Y    | 03/01/Y       | 08/31/Y     | OK          | Draft  |