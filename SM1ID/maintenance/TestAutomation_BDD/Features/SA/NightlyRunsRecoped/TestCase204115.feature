Feature: TestCase204115
	WEB_SA_AGREEMENT_REBATES_007 - Run "Accruals update"

@TTC_Nightly @TTC @BDD_20411
Scenario: WEB_SA_AGREEMENT_REBATES_007

	# Step 1
	Given the user navigates to the 'Rebates' page

	When the user creates a Rebate with Level: '<level>' Customer: '<customer>' Classification: '<classification>' Reason: '<reason>' Target Type: '<targettype>'
    Then the user validates that the 'Rebates Code Textbox' is present
    When the user retrieves text from 'Rebates Code Textbox' and saves it as 'RebateCode'
	And the user enters '<fixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user populates the Rebate mandatory fields with Data Source: '<dataSource>' Payment Mode: '<paymentMode>' Payment Frequency: '<paymentFrequency>'
    And the user clicks on the 'Status Trigger Icon'
    And the user clicks on 'Radio Button' with value '<status>'
    And the user clicks on the 'OK Button'

	# Step 2
	When the user navigates to the 'Rebates' page

	# Step 3
	And the user filters the column by column name 'Rebate code', Filter Type 'Like', Value 'RebateCode'
    And the user clicks on '<customer>' text on the grid

	# Step 4
    And the user clicks on the 'Gui Update Button'

	# Step 5
    And the user clicks on the 'Accruals update Menu Item'

	# Step 6
	When the user navigates to the 'Calculation Session' page

	# Step 7
	And the user filters the column by column name 'Document typology', Filter Type 'Like', Value '<CalculationSessionType>'		
	And the user retrieves text from column 'Session Code' with unique row text '<CalculationSessionType>' and saves it as 'sessionCode'
	Then the user validates that column 'Document typology' has '<CalculationSessionType>' with row text '<CalculationStatus>'

	# Step 8
	When the user retrieves text from column 'Month' with unique row text '<CalculationSessionType>' and saves it as 'monthValue'
	And the user retrieves text from column 'Calculation year' with unique row text '<CalculationSessionType>' and saves it as 'yearValue'
	And the user clicks on the 'Add Button'
    Then the user validates that the 'Popup' with value 'New Calculation Session' is displayed
	And the user validates that the element 'Month Textbox' has text 'monthValue'
	And the user validates that the element 'Year Textbox' has text 'yearValue'
	When the user clicks on the 'Cancel Button'

	# Step 9
    And the user clicks on 'sessionCode' text on the grid
	Then the user validates that column 'Options' contains 'RebateCode' with row text '<CalculationStatus>' 

	# Step 10
	And the user validates that column 'Calculation Session' contains '<CalculationStatus>' with row text 'RebateCode' 

	# Step 11
	When the user clicks on column '<CalcResultsPopup>' with row text 'RebateCode'
	Then the user validates that column 'Fixed Amount' has '<fixedAmount>' with row text '<customer>' 

	# Step 12
	When the user clicks on the 'Close Tab'
    Then the user validates that the 'Text' with value '<CalculationStatus>' is displayed

	# Step 13
	When the user clicks on the 'Close Tab'

	Examples: 
	| customer | level   | classification | reason           | targettype    | fixedAmount | dataSource        | paymentMode     | paymentFrequency | status  | CalculationSessionType | CalculationStatus      | CalcResultsPopup    | CalcSessNavigator   |
	| EC86206  | Level 3 | Supply         | Year End Bonuses | Unconditional | 500.00      | Net sales revenue | Invoice payable | Monthly          | Confirm | Accruals               | Completed with Success | Calculation Results | Calculation Session |