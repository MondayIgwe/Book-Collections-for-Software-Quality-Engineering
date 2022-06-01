Feature: TestCase444495
	WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_004_ New MP rebate pop up - Beneficiary fields

@TTC_Nightly @TTC @BDD_444495 @Pipeline
Scenario: WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_004
	
	# Step 11
	Given the user navigates to the 'Agreements' page
	When the user creates a New Document with Level: '<Level>' Customer: '<Customer>' Agreement Code: '' Agreement Description: ''
    And the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'

	# Step 2
	Then the user validates that the 'Sub Tab Add Button' with value 'Rebate Header' is displayed
	When the user clicks on 'Sub Tab Add Button' with value 'Rebate Header'
	Then the user validates that the Loading Mask is not present
	And the user validates that the 'Popup' with value 'New Rebate:' is displayed
	And the user validates that 'Input By Label Name' with value 'Beneficiary Level' has text '<Level>'

	# Step 3
    And the user validates that the 'Input By Label Name' with value 'Hier Filter' is enabled
	And the user validates that 'Input By Label Name' with value 'Hier Filter' has text 'No filter'

	# Step 4
    And the user validates that the 'Input By Label Name' with value 'Customer Filter' is enabled
	And the user validates that 'Input By Label Name' with value 'Customer Filter' has text 'No filter'

	# Step 5 
	When the user clicks on 'Trigger By Field Name' with value 'Customer Holder'
	Then user validates that table 'Hier. level Rows' with value '' contain '<CustomerLevels>'
	When the user clicks on 'Popup Cancel Button' with value 'Customer Plan'

	# Step 6
	And the user clicks on 'Trigger By Field Name' with value 'Hier Filter'
	Then the user validates that the 'Popup' with value 'Filter Maker' is displayed

	# Step 7
	When the user clicks on 'Element by SM1Id' with value 'ACTION_newFilterSet'

	# Step 8 - 10	
	When the user retrieves count of 'Popup Filtered Rows Column Name' with value 'Customer code' and saves it as 'RowCountNew'
	Then the user validates that the 'Loading Mask' is not present
	And the user validates that the element 'RowCountNew' is equal to '1'

	# Step 11
	When the user clicks on 'Hier. level Side Panel' with value 'Level 5'
	Then the user validates that the page with 'Popup Filtered Rows Column Name' with value 'Customer code' is loaded
	When the user retrieves count of 'Popup Filtered Rows Column Name' with value 'Customer code' and saves it as 'RowCountNew'
	Then the user validates that the 'Loading Mask' is not present
	And the user validates that the element 'RowCountNew' is equal to '0'
	
	# Step 12
	When the user clicks on 'Hier. level Side Panel' with value 'Level 1'
	Then user validates that table 'Popup Filtered Rows Column Name' with value 'Customer code' contain '<CustomerLevel1>'

	# Step 13
	When the user clicks on 'Grid Checkbox' with value '<Customer_1>'
	And the user clicks on 'Grid Checkbox' with value '<Customer_2>'
	And the user clicks on 'Popup Ok Button' with value 'Customer Hierarchy Filter'

	# Step 14
	Then the user validates that popup with sm1 ID 'LOGICALPRIZECUSTOMERFILTERMAKERPOPUP' and name 'Filter Maker' column 'ATTRIBUTE' has 'Code Node 1' with row text '<Customer_2>'
	And the user validates that popup with sm1 ID 'LOGICALPRIZECUSTOMERFILTERMAKERPOPUP' and name 'Filter Maker' column 'Operator' has 'In' with row text '<Customer_2>'
	And the user validates that popup with sm1 ID 'LOGICALPRIZECUSTOMERFILTERMAKERPOPUP' and name 'Filter Maker' column 'Value' has 'EC87003;EC87087' with row text '<Operator>'

	# Step 15
	When the user clicks on 'Popup Ok Button' with value 'Filter Maker'

	# Step 16
	Then the user validates that the Loading Mask is not present
	And the user validates that the 'Popup' with value 'Save Filter (Required)' is displayed
	When the user enters '<Filter_Name_1>' in field 'Input By Label Name' with value 'Filter Name'
	And the user moves the focus away from the element
	When the user clicks on 'Popup Ok Button' with value 'Save Filter (Required)'
	Then the user validates that the Loading Mask is not present
	And the user validates that the 'Popup' with value 'Save Filter (Required)' is not present

	# Step 17
	And the user validates that 'Input By Label Name' text with value 'Hier Filter' contains '<Filter_Name_1>'

	# Step 18
	When the user clicks on 'Trigger By Field Name' with value 'Customer Filter'
	Then the user validates that the Loading Mask is not present
	And the user validates that the 'Popup' with value 'Filter Maker' is displayed

	# Step 19
	When the user in popup 'Filter Maker' enters '<ATTRIBUTE>' in cell with column 'Attribute' and row text ''
	And the user in popup 'Filter Maker' enters '<Operator>' in cell with column 'Operator' and row text '<ATTRIBUTE>'

	# Step 20
	When the user clicks on 'Popup Ok Button' with value 'Filter Maker'
	Then the user validates that the Loading Mask is not present
	And the user validates that the 'Popup' with value 'Save Filter (Required)' is displayed

	# Step 21
	When the user enters '<Filter_Name_2>' in field 'Input By Label Name' with value 'Filter Name'
	And the user moves the focus away from the element
	When the user clicks on 'Popup Ok Button' with value 'Save Filter (Required)'
	Then the user validates that 'Input By Label Name' text with value 'Customer Filter' contains '<Filter_Name_2>'
	
	Examples: 
	| Level   | Customer | Level5 | Level1 | CustomerLevel1                  | Customer_1 | Customer_2 | ATTRIBUTE    | Operator | Filter_Name_1     | Filter_Value_2                                | Filter_Name_2      | CustomerLevels													 |
	| Level 4 | EC86217  | 5      | 1      | EC87003,EC87087,EC87135,EC87150 | EC87003    | EC87087    | Nielsen Area | Equal    | Filter name_test1 | AN1 - LOMBARDY/PIEDMONT/LIGURIA/VALLE D'AOSTA | Filter name test_2 | Customer,Level 0,Level 1,Level 2,Level 3,Level 4,Level 5,Level 6 |