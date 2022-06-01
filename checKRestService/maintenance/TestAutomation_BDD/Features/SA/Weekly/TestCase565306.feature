Feature: TestCase565306
	WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_109 - Copied standard rebate is opened in edit mode

@TTC @TTC_Weekly @BDD_565306
Scenario: WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_109
	
	# Step 1
	Given the user navigates to the 'Rebates' page

	When the user creates a Rebate with Level: '<CustomerLevel>' Customer: '<CustomerHolder>' Classification: '<Classification>' Reason: '<Reason>' Target Type: '<TargetType>'
    And the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	And the user populates the Rebate mandatory fields with Data Source: '<DataSource>' Payment Mode: '<PaymentMode>' Payment Frequency: '<PaymentFrequency>'
	And the user enters '<RebateDescription>' in field 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<FixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on side panel 'General Info'
	And the user clicks on the 'Agreement ID Increment Icon'
	And the user clicks on the 'Agreement Code Label'
    Then the user validates that the 'Input By Label Name' with value 'Agreement Code' is displayed
	When the user enters '<AgreementCode>' in field 'Input By Label Name' with value 'Agreement Code'
    And the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	# Step 2
	And the user navigates to the 'Agreements' page
	And the user filters the column by column name 'Agreement ID', Filter Type 'Like', Value 'AgreementID'
	And the user clicks on 'Text in Grid' with value 'AgreementID'
	And the user clicks on 'Button' with value 'Edit'

	# Step 3
	When the user clicks on 'Text in Grid' with value '<RebateDescription>'

	# Step 4
	And the user clicks on 'Button' with value 'Mass Copy'

	# Step 5
	And the user clicks on 'Button' with value 'Execute'
	Then the user validates that column 'Copy Result' has 'OK' with row text 'RebateCode'

	# Step 6
	When the user clicks on the 'Close Tab'

	# Step 7
	And the user filters the column by column name 'Rebate Header ID', Filter Type 'Not Like', Value 'RebateCode'
	And the user retrieves text from column 'Rebate Header ID' with unique row text '<RebateDescription>' and saves it as 'copyRebateId'
	And the user clicks on '<RebateDescription>' text on the grid
	And the user clicks on 'Element by SM1Id' with value 'ACTION_edit'

	# Step 8
	Then the user validates that the 'Button' with value 'Save' is displayed
	And the user validates that 'Input By Label Name' with value 'Rebate code' has text 'copyRebateId'
	And the user validates that 'Input By Label Name' with value 'Holder' contains text '<CustomerHolder>'
	And the user validates that the 'Input By Label Name' with value 'Holder' is disabled
	And the user validates that 'Input By Label Name' with value 'Classification' contains text '<Classification>'
	And the user validates that the 'Input By Label Name' with value 'Classification' is disabled
	And the user validates that 'Input By Label Name' with value 'Reason' contains text '<Reason>'
	And the user validates that the 'Input By Label Name' with value 'Reason' is disabled
	And the user validates that 'Input By Label Name' with value 'Target Type' contains text '<TargetType>'
	And the user validates that the 'Input By Label Name' with value 'Target Type' is disabled
	And the user validates that 'Input By Label Name' with value 'DESCRIPTION' contains text '<RebateDescription>'
	And the user validates that the 'Input By Label Name' with value 'DESCRIPTION' is enabled
	And the user validates that 'Input By Label Name' with value 'Payment mode' contains text '<PaymentMode>'
	And the user validates that the 'Input By Label Name' with value 'Payment mode' is enabled
	And the user validates that 'Input By Label Name' with value 'Payment Frequency' contains text '<PaymentFrequency>'
	And the user validates that the 'Input By Label Name' with value 'Payment Frequency' is enabled
	And the user validates that 'Input By Label Name' with value 'Data source' contains text '<DataSource>'
	And the user validates that the 'Input By Label Name' with value 'Data source' is enabled
	And the user validates that 'Input By Label Name' with value 'STATUS' contains text '<Status>'
	And the user validates that the 'Input By Label Name' with value 'STATUS' is enabled

	Examples: 
	| CustomerLevel | CustomerHolder | Classification | Reason           | TargetType    | RebateDescription | DataSource        | PaymentMode | PaymentFrequency | FixedAmount | AgreementCode   | Status |
	| Level 4       | EC86217        | Supply         | Year End Bonuses | Unconditional | 565306_rebate     | Net sales revenue | Credit note | Monthly          | 1000        | 565306_agrement | Draft  |