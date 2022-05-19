Feature: TestCase765973
	WEB_SA_AGREEMENT_AGREEMENTS_004 - AC_1 - mass copy - select/unselect row behavior

@TTC_Nightly @TTC @BDD_765975
Scenario: WEB_SA_AGREEMENT_AGREEMENTS_004
	Given the user navigates to the 'Rebates' page
	
	# Step 1
	When the user creates a Rebate with Level: '<CustomerLevel>' Customer: '<Customer>' Classification: '<Classification>' Reason: '<Reason>' Target Type: '<TargetType>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	And the user selects active scenario '<CalculationBasis>' from dropdown list 'Data source'
	And the user selects active scenario '<PaymentMode>' from dropdown list 'Payment mode'
	And the user enters '<Description>' in field 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<FixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on 'Side Panel Tab' with value 'General Info'
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
    And the user clicks on 'AgreementID' text on the grid
    And the user clicks on 'Button' with value 'Edit'
    And the user clicks on 'Sub Tab' with value 'REBATES'
	And the user clicks on 'Sub Tab Add Button' with value 'Rebate Header'
	And the user selects active scenario '<Classification>' from dropdown list 'Classification'
	And the user selects active scenario '<Reason>' from dropdown list 'Reason'
	And the user enters '<TargetType>' in field 'Input By Label Name' with value 'Target Type'
	And the user clicks on 'Input By Label Name' with value 'Classification'
	And the user selects active scenario '<CalculationBasis>' from dropdown list 'Calculation Basis'
	And the user selects active scenario '<PaymentMode>' from dropdown list 'Payment Mode'
	And the user clicks on 'Element by SM1Id' with value 'ACTION_all-filters'
	And the user in popup 'Rebate Products:' enters '<LumpSum>' in cell with column 'Lump Sum' and row text 'All Products'
    And the user clicks on 'Popup Ok Button' with value 'New Rebate:'
    And the user filters the column by column name 'Rebate Header ID', Filter Type 'Not Like', Value 'RebateCode'
	And the user retrieves text in cell with column 'Rebate Header ID' and row text '<Reason>' and saves as 'MPRebateID'
	And the user clicks on 'Button' with value 'Save'
    And the user clicks on 'Sub Tab' with value 'PROMOTIONS'
	And the user clicks on 'Sub Tab Add Button' with value 'Promo Header'
    Then the user validates that the 'Popup' with value 'New Promotion' is displayed
    When the user clicks on 'Popup Ok Button' with value 'New Promotion'
	And the user enters '<Description>' in field 'Input By Label Name' with value 'Description'
    And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionID'
	And the user clicks on the 'MechanicsViewAllButton'
    And the user clicks on 'Mechanics CheckBox' with value '<Mechanic>'
	And the user clicks on 'Side Panel Tab' with value 'Products'
	And the user clicks on the 'Add Button'
	And the user clicks on 'Hier. level side panel' with value '<ProductLevel>'
	And the user clicks on 'Customer Code table' with value '<ProductCode>'
    And the user clicks on 'Popup Ok Button' with value 'Product'
    And the user enters '<Measure>' on column name '<Mechanic>' for product code '<ProductCode>'
	And the user clicks on 'Button' with value 'Save'
    And the user clicks on the 'Close Tab'
    Then the user validates that the 'Sub Tab Add Button' with value 'Promo Header' is displayed
	When the user clicks on 'Button' with value 'Save'
    And the user clicks on the 'Close Tab'

	#step 3 & 4
    Then the user validates that the 'Sub Tab Add Button' with value 'Promo Header' is not present
	And the user validates that elements 'Basic Grid Rows' have loaded
	When the user retrieves count of 'Basic Grid Rows' with value '' and saves it as 'RowCountNew'
	Then the user validates that the element 'RowCountNew' is equal to '1'
    When the user clicks on 'Grid Checkbox' with value 'AgreementID'
    And the user clicks on the 'Grid All Checkbox'
	And the user checks that grid row is selected and clicks Mass copy '<AgreementCode>'

	# step 5
	When the user clicks on the 'Grid All Checkbox'
    Then the user validates that the 'Selected Row' with value 'AgreementID' is not present

	# step 6
	When the user clicks on 'Element by SM1Id' with value 'TAB_REBATES'
    Then the user validates that the 'Selected Row' with value 'MPRebateID' is not present
    And the user validates that the 'Selected Row' with value 'RebateCode' is not present

	# step 7
	When the user clicks on 'Element by SM1Id' with value 'TAB_PROMOTIONS'
    Then the user validates that the 'Selected Row' with value 'ActionID' is not present

	# step 8
	When the user clicks on 'Element by SM1Id' with value 'TAB_AGREEMENTS'

	# step 9
    And the user clicks on 'Grid Checkbox' with value 'AgreementID'

	# step 10
	And the user clicks on 'Element by SM1Id' with value 'TAB_REBATES'
	And the user clicks on 'Grid All Checkbox Index' with value '2'
	And the user clicks on 'Grid All Checkbox Index' with value '2'
    Then the user validates that the 'Selected Row' with value 'MPRebateID' is present
    And the user validates that the 'Selected Row' with value 'RebateCode' is present

	# step 11
	When the user clicks on 'Element by SM1Id' with value 'TAB_PROMOTIONS'
	And the user clicks on 'Grid All Checkbox Index' with value '3'
	And the user clicks on 'Grid All Checkbox Index' with value '3'
    Then the user validates that the 'Selected Row' with value 'ActionID' is present

	# step 12
	When the user clicks on 'Grid All Checkbox Index' with value '3'

	# step 13
	And the user clicks on 'Element by SM1Id' with value 'TAB_AGREEMENTS'
    Then the user validates that the 'Selected Row' with value 'AgreementID' is present

	Examples:
	| CustomerLevel | Customer		 | Classification | Reason           | TargetType   | Description            | CalculationBasis  | FixedAmount | PaymentMode     | AgreementCode    | LumpSum | Mechanic | ProductLevel | ProductCode | Measure |
	| Level 4       | EC86217        | Supply         | Year End Bonuses | Unconditional| 765973_standard_rebate | Net sales revenue | 1000        | Invoice payable | 765973_agreement | 500     | Leaflet  | Product      | 001         | 750     |