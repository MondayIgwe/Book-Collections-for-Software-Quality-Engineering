Feature: TestCase540707
	WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_069 -  rebate tab -mass status change of master and child rebates

@TTC_Nightly @TTC @BDD_540707
Scenario: WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_069
	# Step 1
	Given the user navigates to the 'Agreements' page
	When the user creates a New Document with Level: '<CustomerLevel>' Customer: '<CustomerHolder>' Agreement Code: '<AgreementCode>' Agreement Description: '<AgreementDescription>'

	# Step 2
	Then the user validates that the 'Input By Label Name' with value 'Agreement ID' is displayed
	When the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'
	And the user clicks on 'Sub Tab Add Button' with value 'Rebate Header'
	Then the user validates that the 'Popup' with value 'New Rebate:' is displayed
    And the user validates that the 'Input By Label Name' with value 'Classification' is displayed
	When the user selects active scenario '<Classification>' from dropdown list 'Classification'
	And the user selects active scenario '<Reason>' from dropdown list 'Reason'
	When the user enters '<TargetType>' in field 'Input By Label Name' with value 'Target Type'
	And the user selects active scenario '<PaymentMode>' from dropdown list 'Payment Mode'
	When the user enters '<CalculationBasis>' in field 'Input By Label Name' with value 'Calculation Basis'
	When the user enters '<RebateDescription>' in field 'Input By Label Name' with value 'Description'
    And the user clicks on 'Input By Label Name' with value 'Reason'

	# Step 3
	And the user clicks on 'Sub Tab Add Button' with value 'Rebate Products:'
	And the user clicks on 'Hier. level side panel' with value '<ProductLevel>'
	And the user filters the column by column name 'Code', Filter Type 'Like', Value '<ProductCode>'
	And the user clicks on '<ProductCode>' text on the grid
    And the user clicks on 'Popup Ok Button SM1Id' with value 'Products'
	
	And the user in popup 'New Rebate:' enters '<LumpSum>' in cell with column 'Lump Sum' and row text '<ProductCode>'

    And the user clicks on 'Popup Ok Button' with value 'New Rebate:'
    And the user clicks on 'Button' with value 'Save'

	# Step 4
	And the user clicks on '<RebateDescription>' text on the grid

	# Step 5
	And the user clicks on 'Element by SM1Id' with value 'ACTION_massChange'

	#Step 6
    Then the user validates that the 'Button' with value 'Start' is displayed
    And the user validates that elements 'Basic Grid Rows' have loaded
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '1'
    And the user validates that the 'Text' with value '<RebateDescription>' is displayed
	When the user clicks on 'Generic Drop Down Trigger' with value 'Desired Transition'
	And the user clicks on 'List Containing' with value '<Transition>'

	# Step 7
	And the user clicks on 'Button' with value 'Start'
	Then the user validates that element: 'Element by SM1Id' with value: 'startButton' and attribute: 'aria-disabled' is in state: 'false'

	# Step 8
    Then the user validates that column 'Process Status' has '<ProcessStatus2>' with row text '<CustomerHolder>'
	And the user validates that column 'Process Status Description' has '<ProcessStatusDes>' with row text '<CustomerHolder>'
	And the user validates that column 'Result State' has '<Transition>' with row text '<CustomerHolder>'

	# Step 9
	When the user clicks on 'Button' with value 'Row Detail'
    And the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	Then the user validates that 'Input By Label Name' with value 'STATUS' has text '<Transition>'

	# Step 10
	When the user clicks on the 'Close Tab'

	# Step 11
    Then the user validates that the 'Button' with value 'Start' is displayed
	When the user clicks on the 'Close Tab'
	
	# Step 12
	When the user clicks on '<RebateDescription>' text on the grid
	Then the user validates that popup with sm1 ID 'cardRebateProducts' and name 'Rebate Products' column 'Status' has '<Transition>' with row text '<LumpSum>'

	# Step 13
	When the user clicks on the 'Close Tab'

	# Step 14
	And the user navigates to the 'Rebates' page
	And the user filters the column by column name 'Agreement ID', Filter Type 'Equal', Value 'AgreementID'

	# Step 15
	Then the user validates that the 'Text' with value '<Reason>' is displayed
	And the user validates on the Rebates Grid row: '1' and column: '8' has the text '<Transition>'
	And the user validates on the Rebates Grid row: '2' and column: '8' has the text '<Transition>'

	Examples: 
	| CustomerLevel | CustomerHolder | AgreementCode | AgreementDescription | Classification | Reason           | TargetType | PaymentMode     | CalculationBasis  | RebateDescription | ProductLevel | ProductCode | LumpSum | Transition | ProcessStatus | ProcessStatus2   | ProcessStatusDes |
	| Level 4       | EC86217        | CodeTC_540707 | DesTC_540707         | Supply         | Year End Bonuses | Brackets   | Invoice payable | Net sales revenue | RebateTC_540707   | Product      | 010         | 100     | Confirmed  | In Progress    | Process Finished | Success          |