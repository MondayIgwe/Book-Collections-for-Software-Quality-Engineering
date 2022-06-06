Feature: TestCase492902
	WEB_SA_CLAIM_CLAIM DOCUMENT_MATCHINGS_032 - Single match - assign button with OPA <= 0 

@TTC @BDD_492902 
Scenario: WEB_SA_CLAIM_CLAIM DOCUMENT_MATCHINGS_032
	
	# step 1
	Given the user changes division to '<division>'

	When the user navigates to the 'Rebates' page

	# Step 2 : Create a rebate document1
	When the user creates a Rebate '<CustomerLevel>' '<Customer>' '<classification>' '<reason>' '<targettype>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	And the user populates the Rebate mandatory data '<dataSource>' '<paymentMode>' '<paymentFrequency>'
	When the user enters '<description>' in field 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<fixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on 'Side Panel Tab' with value 'General Info'
    And the user clicks on the 'Status Arrow Icon'
    And the user clicks on 'Radio Button' with value '<status>'
    And the user clicks on 'Popup Ok Button' with value 'Change Status'
	
	#Create a rebate document2
	And the user navigates to the 'Rebates' page
	And the user creates a Rebate '<CustomerLevel>' '<Customer>' '<classification>' '<reason>' '<targettype>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode1'
	And the user populates the Rebate mandatory data '<dataSource>' '<paymentMode>' '<paymentFrequency>'
	When the user enters '<Description1>' in field 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<fixedAmount1>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on 'Side Panel Tab' with value 'General Info'
    And the user clicks on the 'Status Arrow Icon'
    And the user clicks on 'Radio Button' with value '<status>'
    And the user clicks on 'Popup Ok Button' with value 'Change Status'
	
	#Create a rebate document3
	And the user navigates to the 'Rebates' page
	And the user creates a Rebate '<CustomerLevel>' '<Customer>' '<classification>' '<reason>' '<targettype>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode2'
	And the user populates the Rebate mandatory data '<dataSource>' '<paymentMode>' '<paymentFrequency>'
	When the user enters '<description2>' in field 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<fixedAmount1>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on 'Side Panel Tab' with value 'General Info'
    And the user clicks on the 'Status Arrow Icon'
    And the user clicks on 'Radio Button' with value '<status>'
    And the user clicks on 'Popup Ok Button' with value 'Change Status'

	# Step 3
	When the user navigates to the 'Calculation Session' page
	And the user runs a calculation '<LIQ>' on reabte 'RebateCode'
	And the user runs a calculation '<LIQ>' on reabte 'RebateCode1'
	And the user runs a calculation '<RAT>' on reabte 'RebateCode2'

	# Step 4
	And the user navigates to the 'Claims' page under division'Claims'
	And the user creates a New Claim '<CustomerDocument>' '<CustomerLevel>' '<Customer>' '<Amount>'
	And the user clicks on 'Button' with value 'Match To'
	And the user clicks on 'Menu Item Text' with value 'Match to rebate'
    And the user clicks on 'Grid Checkbox' with value 'RebateCode'
    And the user clicks on 'Grid Checkbox' with value 'RebateCode1'
    And the user clicks on 'Popup Ok Button' with value 'Select Rebates'
	And the user in popup 'Matching finalization' enters '<AmountToMatch>' in cell with column 'Amount to match' and row text '<opa1>'
	And the user in popup 'Matching finalization' enters '<AmountToMatch1>' in cell with column 'Amount to match' and row text '<opa2>'
    And the user clicks on 'Popup Ok Button' with value 'Matching finalization'
	And the user clicks on the 'Close Tab'

	# Step 5
	And the user creates a New Claim '<CustomerDocument2>' '<CustomerLevel>' '<Customer>' '<Amount2>'

	# Step 6
	And the user clicks on 'Button' with value 'Match To'
	And the user clicks on 'Menu Item Text' with value 'Match to rebate'

	# Step 7
    And the user clicks on 'Grid Checkbox' with value 'RebateCode'
    And the user clicks on 'Grid Checkbox' with value 'RebateCode1'
    And the user clicks on 'Grid Checkbox' with value 'RebateCode2'
    And the user clicks on 'Popup Ok Button' with value 'Select Rebates'

	# Step 8
	And the user clicks on 'Button' with value 'Assign'
	Then the user validates that popup 'Matching finalization' column 'Amount to match' has '<AmountToMatch2>' with row text 'RebateCode'
	And the user validates that popup 'Matching finalization' column 'Amount to match' has '<AmountToMatch3>' with row text '<opa50>'
	And the user validates that popup 'Matching finalization' column 'Amount to match' has '<AmountToMatch4>' with row text '<opa0>'
	And the user validates that the 'Popup Ok Button' with value 'Matching finalization' is enabled

	# Step 9
    When the user clicks on 'Popup Ok Button' with value 'Matching finalization'

	# Step 10
	Then the user validates that column 'Amount' has '<AmountToMatch2>' with row text '<description>'
	And the user validates that column 'Rebate code' has 'RebateCode' with row text '<description>'
	Then the user validates that column 'Amount' has 'AmountToMatch3' with row text '<description>'
	And the user validates that column 'Rebate code' has 'RebateCode1' with row text '<description1>'

	Examples:
	| division                                 | Customer | CustomerLevel | classification | reason           | targettype    | description          | fixedAmount | dataSource        | paymentMode     | paymentFrequency | status  | Description1         | fixedAmount1 | description2         | transition | LIQ				| RAT			 | DocumentType | CustomerDocument | Amount | AmountToMatch | opa1   | AmountToMatch1 | opa2   | CustomerDocument2 | DocumentDate | Amount2 | opa0 | AmountToMatch2 | opa50 | AmountToMatch3 | AmountToMatch4 | reasonCode |
	| XTEL SFA AUTOMATION - Global Group SM1V4 | EC86217  | Level 4       | Supply         | Year End Bonuses | Unconditional | Test_Matchings_032_1 | 100         | Net sales revenue | Invoice payable | Monthly          | Confirm | Test_Matchings_032_2 | 150          | Test_Matchings_032_3 | Confirm    | LIQ - Settlements | RAT - Accruals | REO          | Claim A          | 300    | 100           | 100.00 | 200.00         | 150.00 | Claim C           | Today        | 500     | 0.00 | 200.00         | -50.00 | 300.00         | 0.00           | SAR1       |