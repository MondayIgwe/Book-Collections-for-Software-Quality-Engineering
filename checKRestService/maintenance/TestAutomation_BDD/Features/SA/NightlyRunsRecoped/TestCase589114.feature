Feature: TestCase589114
	WEB_SA_AGREEMENT_REBATES_017 - Mass status change through mass copy for MP and standard rebate

@TTC_Nightly @BDD_589114 @TTC
Scenario: WEB_SA_AGREEMENT_REBATES_017
	#Go to "Agreements" navigator
	Given the user navigates to the 'Agreements' page

	# Step 1
	When the user clicks on the 'Add Button'
	Then the user validates that the 'Popup' with value 'New Agreement' is displayed
	When the user clicks on 'Trigger By Field Name' with value 'Customer Holder'
	Then the user validates that the 'Popup' with value 'Customer Plan' is displayed
	When the user clicks on 'Hier. level side panel' with value '<CustomerLevel>'
	And the user clicks on '<CustomerHolder>' text on the grid
    And the user clicks on 'Popup Ok Button' with value 'Customer Plan'
	Then the user validates that the 'Popup' with value 'New Agreement' is displayed
	When the user enters '<AgreementCode>' in field 'Input By Label Name' with value 'Agreement Code'
	And the user enters '<AgreementDesc>' in field 'Input By Label Name' with value 'Agreement Description'
    And the user clicks on 'Popup Ok Button' with value 'New Agreement'
    Then the user validates that elements 'Basic Grid Rows' have loaded
    When the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'agreementID'

	# Step 2
	Then the user validates that the 'Sub Tab Add Button' with value 'Rebate Header' is displayed
	When the user clicks on 'Sub Tab Add Button' with value 'Rebate Header'
	Then the user validates that the 'Popup' with value 'New Rebate:' is displayed
    And the user validates that the 'Input By Label Name' with value 'Classification' is displayed
	When the user selects active scenario '<Classification>' from dropdown list 'Classification'
	And the user selects active scenario '<Reason>' from dropdown list 'Reason'
	And the user enters '<TargetType>' in field 'Input By Label Name' with value 'Target Type'
	And the user selects active scenario '<PaymentMode>' from dropdown list 'Payment Mode'
	And the user enters '<CalculationBasis>' in field 'Input By Label Name' with value 'Calculation Basis'
	And the user enters '<RebateDescription>' in field 'Input By Label Name' with value 'Description'
    And the user clicks on 'Input By Label Name' with value 'Reason'
	And the user clicks on 'Sub Tab Add Button' with value 'Rebate Products:'
	And the user clicks on 'Hier. level side panel' with value '<ProductLevel>'
	And the user filters the column by column name 'Code', Filter Type 'Like', Value '<ProductCode>'
	And the user clicks on '<ProductCode>' text on the grid
    And the user clicks on 'Popup Ok Button SM1Id' with value 'Products'
	
	And the user in popup 'New Rebate:' enters '<LumpSum>' in cell with column 'Lump Sum' and row text '<ProductCode>'

    And the user clicks on 'Popup Ok Button' with value 'New Rebate:'
    And the user clicks on 'Button' with value 'Save'

	# Step 3.
	And the user navigates to the 'Rebates' page
	And the user clicks on the 'Add Button'
	And the user clicks on the 'Customer Holder'
	And the user clicks on 'Hier. level side panel' with value '<CustomerLevel>'
	And the user filters the column by column name 'Customer code', Filter Type 'Like', Value '<CustomerHolder>'
	And the user clicks on '<CustomerHolder>' text on the grid
    And the user clicks on 'Popup Ok Button' with value 'Customer Holder'
    Then the user validates that the 'Popup' with value 'New Rebate' is displayed
    And the user validates that the 'Input By Label Name' with value 'Classification' is displayed
	When the user enters '<Classification>' in field 'Input By Label Name' with value 'Classification'
	And the user enters '<Reason>' in field 'Input By Label Name' with value 'Reason'
	And the user enters '<TargetType>' in field 'Input By Label Name' with value 'Target Type'
    And the user clicks on 'Input By Label Name' with value 'Reason'
    And the user clicks on 'Popup Ok Button' with value 'New Rebate'

    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	And the user clicks on the 'Calc Basis Data Source Trigger'
	And the user clicks on 'List Containing' with value '<CalculationBasis>'
	And the user enters '<PaymentMode>' in field 'Input By Label Name' with value 'Payment mode'
	And the user enters '<PaymentFrequency>' in field 'Input By Label Name' with value 'Payment Frequency'
    And the user clicks on 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<FixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on 'Side Panel Tab' with value 'General Info'
	And the user enters '<RebateDescription2>' in the 'Description field'
    And the user clicks on 'Button' with value 'Save'

	# Step 4
	And the user clicks on the 'Close Tab'
	And the user filters the column by column name 'Agreement ID', Filter Type 'Equal', Value 'agreementID'
	And the user retrieves text in cell with column 'Rebate code' and row text '<CustomerHolder>' and saves as 'RebateCode1'
	And the user filters the column by column name 'Rebate code', Filter Type 'Not Like', Value 'RebateCode1'
	And the user retrieves text in cell with column 'Rebate code' and row text '<CustomerHolder>' and saves as 'RebateCode2'
	And the user clears filter at column  'Rebate code'	
    And the user opens the filter at column 'Rebate code'
    And the user clicks on 'Filter Option' with value 'RebateCode'
    And the user clicks on 'Filter Option' with value 'RebateCode1'
    And the user clicks on 'Filter Option' with value 'RebateCode2'
    And the user clicks on 'Popup Ok Button' with value 'Column:Rebate code'
	And the user moves the focus to the 'Grid All Checkbox'
	And the user clicks on the 'Grid All Checkbox'

	# Step 5
	Then the user validates the 'Mass Copy' is enabled
	When the user clicks on the 'Mass Copy'

	# Step 6
	And the user clicks on 'Button' with value 'Execute'
	Then the user validates that element: 'Element by SM1Id' with value: 'EXECUTECOPY' and attribute: 'aria-disabled' is in state: 'true'

	# Step 7
    And the user validates that elements 'Basic Grid Rows' have loaded
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '3'
	When the user clicks on 'Sub Tab' with value 'Result Copy Rebates'

	# Step 8
	And the user clicks on the 'Mass Change Status'

	# Step 9
	Then the user validates that the 'Button' with value 'Start' is displayed
    And the user validates that elements 'Basic Grid Rows' have loaded
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '1'
    And the user validates that the 'Text' with value '<CustomerHolder>' is displayed

	# Step 10
	When the user clicks on 'Generic Drop Down Trigger' with value 'Desired Transition'
	And the user clicks on 'List Containing' with value '<desiredTransition>'

	# Step 11
	And the user clicks on 'Button' with value 'Start'
	Then the user validates that element: 'Element by SM1Id' with value: 'startButton' and attribute: 'aria-disabled' is in state: 'false'

	# Step 12
    Then the user validates that column 'Process Status' has '<ProcesStatus>' with row text '<CustomerHolder>'
	And the user validates that column 'Process Status Description' has '<processStatusDescription>' with row text '<CustomerHolder>'
	And the user validates that column 'Result State' has '<ResultState>' with row text '<CustomerHolder>'

	Examples:
	| CustomerLevel | CustomerHolder | AgreementCode | AgreementDesc      | Classification | Reason           | TargetType | PaymentMode     | CalculationBasis  | RebateDescription | ProductLevel | ProductCode | LumpSum | RebateDescription2    | PaymentFrequency | FixedAmount | desiredTransition | ProcesStatus     | processStatusDescription | ResultState |
	| Level 4       | EC86217        | 589114_code   | 589114_description | Supply         | Year End Bonuses | Brackets   | Invoice payable | Net sales revenue | 589114_rebate     | Brand        | 01          | 1000    | 589114_RebateStandard | End item         | 200         | 2 - Confirmed     | Process Finished | Success                  | Confirmed   |