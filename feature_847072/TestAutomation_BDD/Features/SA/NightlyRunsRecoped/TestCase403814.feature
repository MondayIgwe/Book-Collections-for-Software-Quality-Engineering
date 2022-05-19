Feature: TestCase403814
	WEB_SA_AGREEMENT_REBATE DOCUMENT_GENERAL INFO_002 - Link to an existing agreement and change the validity - OK

@TTC_Nightly @TTC @BDD_403814
Scenario: WEB_SA_AGREEMENT_REBATE DOCUMENT_GENERAL INFO_002

	# Step 1
	Given the user navigates to the 'Rebates' page
	When the user creates a Rebate with Level: '<Level>' Customer: '<Customer>' Classification: '<Classification>' Reason: '<Reason>' Target Type: '<Target>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	And the user populates the Rebate mandatory fields with Data Source: '' Payment Mode: '<Pay_Mode>' Payment Frequency: '<Pay_Freq>'
	When the user selects validity period from: '<StartDate>' to: '<EndDate>' on the 'Small Letter Rebate validity Period' field
	And the user enters '<Lumpsum>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	# Step 2
	And the user creates a Rebate with Level: '<Level>' Customer: '<Customer>' Classification: '<Classification>' Reason: '<Reason>' Target Type: '<Target>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode1'
	And the user populates the Rebate mandatory fields with Data Source: '' Payment Mode: '<Pay_Mode>' Payment Frequency: '<Pay_Freq>'
	And the user selects validity period from: '<StartDate1>' to: '<EndDate1>' on the 'Small Letter Rebate validity Period' field

	# Step 3
	And the user clicks on 'Side Panel Tab' with value 'General Info'
	And the user clicks on the 'Agreement ID Increment Icon'
	And the user clicks on the 'Agreement Code Label'
    Then the user validates that the 'Input By Label Name' with value 'Agreement Code' is displayed
	When the user enters '<AGR_CODE>' in field 'Input By Label Name' with value 'Agreement Code'
	And the user enters '<AGR_CODE>' in the 'Agreement Description field'
    And the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	# Step 4
	And the user filters the column by column name 'Rebate code', Filter Type 'Like', Value 'RebateCode'
	And the user clicks on 'Text in Grid' with value 'RebateCode'
	And the user clicks on 'Button' with value 'Edit'

	# Step 5
	And the user clicks on 'Side Panel Tab' with value 'General Info'

	# Step 6
	And the user clicks on the 'Agreement Selector Trigger'
	Then the user validates that the 'Popup' with value 'Select the  Agreements' is displayed	
	When the user clicks on 'Text in Grid' with value 'AgreementID'
    And the user clicks on 'Popup Ok Button' with value 'Select the  Agreements'
	Then the user validates that the 'Popup' with value 'Select the  Agreements' is not present
	And the user validates that 'Input By Label Name' with value 'Agreement ID' contains text 'AgreementID'
	And the user validates that 'Input By Label Name' with value 'Agreement Code' contains text '<AGR_CODE>'
	And the user validates that 'Input By Label Name' with value 'Agreement Description' contains text '<AGR_CODE>'

	# Step 7
	When the user selects validity period from: '<StartDate2>' to: '<EndDate2>' on the 'General Rebate Validity Period' field

	# Step 8
	Then the user validates that 'Input By Label Name' with value 'Agreement ID' contains text 'AgreementID'
	And the user validates that 'Input By Label Name' with value 'Agreement Code' contains text '<AGR_CODE>'
	And the user validates that 'Input By Label Name' with value 'Agreement Description' contains text '<AGR_CODE>'

	# Step 9
    And the user validates that the 'Input By Label Name' with value 'Agreement Code' is disabled
    And the user validates that the 'Input By Label Name' with value 'Agreement Description' is disabled

	# Step 10
	And the user validates the 'Agreement ID Increment Icon' is enabled

	# Step 11
	When the user clicks on the 'Agreement Selector Trigger'
	Then the user validates that the 'Popup' with value 'Select the  Agreements' is displayed	

	# Step 12
    When the user clicks on 'Popup Cancel Button' with value 'Select the  Agreements'
	Then the user validates that the 'Popup' with value 'Select the  Agreements' is not present
    When the user clicks on 'Button' with value 'Save'

	# Step 13
	And the user navigates to the 'Agreements' page

	# Step 14
	And the user filters the column by column name 'Agreement Code', Filter Type 'Like', Value '<AGR_CODE>'
	And the user clicks on 'Text in Grid' with value 'AgreementID'
	Then the user validates that popup with sm1 ID 'cardRebatesHeader' and name 'Rebate Header' column 'Rebate Header ID' has 'RebateCode' with row text '<Reason>'
	When the user clicks on 'Text in Grid' with value 'RebateCode'
	Then the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Product' has '<AllProducts>' with row text '<Lumpsum>'

	Examples: 
	| Level   | Customer | Classification | Reason       | Target       | StartDate | EndDate | Pay_Mode    | Pay_Freq | Lumpsum | AGR_CODE | AllProducts  | StartDate1 | EndDate1 | StartDate2 | EndDate2 |
	| Level 3 | EC86200  | Local budget   | Local budget | Local budget | 01/03/y   | 01/08/y | Credit note | End item | 1000    | 403814   | All Products | 01/01/y    | 01/11/y  | 02/01/y    | 09/01/y  |