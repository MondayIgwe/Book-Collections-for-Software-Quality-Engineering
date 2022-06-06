Feature: TestCase204117
	WEB_SA_AGREEMENT_REBATES_006 - Run "Projections update"

@TTC_Nightly @TTC @BDD_204117
Scenario: WEB_SA_AGREEMENT_REBATES_006
	
	# Step 1
	Given the user navigates to the 'Rebates' page
	
	When the user creates a Rebate '<level>' '<customer>' '<classification>' '<reason>' '<targettype>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	And the user enters '<fixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user populates the Rebate mandatory data '<dataSource>' '<paymentMode>' '<paymentFrequency>'
    And the user clicks on the 'Status Arrow Icon'
    And the user clicks on 'Radio Button' with value '<status>'
    And the user clicks on 'Popup Ok Button' with value 'Change Status'

	# Step 2
	When the user navigates to the 'Rebates' page

	# Step 3
	And the user filters the column by column name 'Rebate code', 'Like', 'RebateCode'
    And the user clicks on '<customer>' text on the grid

	# Step 4
	And the user clicks on 'Button' with value 'Update'

	# Step 5
	And the user clicks on 'Menu Item Text' with value 'Projections update'

	# Step 6
	When the user navigates to the 'Calculation Session' page

	# Step 7
	And the user filters the column by column name 'Document typology', 'Like', '<CalculationSessionType>'		
	And the user retrieves text from column 'Session Code' with unique row text '<CalculationStatus>' and saves it as 'sessionCode'
	Then the user validates that column 'Document typology' contains '<CalculationSessionType>' with row text '<CalculationStatus>'

	# Step 8
	When the user retrieves text from column 'Month' with unique row text '<CalculationStatus>' and saves it as 'monthValue'
	When the user retrieves text from column 'Calculation year' with unique row text '<CalculationStatus>' and saves it as 'yearValue'
	And the user clicks on the 'Add Button'
    Then the user validates that the 'Popup' with value 'New Calculation Session' is displayed
	And the user validates that 'Input By Label Name' with value 'Month' has text 'monthValue'
	And the user validates that 'Input By Label Name' with value 'Year' has text 'yearValue'
	When the user clicks on 'Button' with value 'Cancel'

	# Step 9
    And the user clicks on 'sessionCode' text on the grid
	Then the user validates that column 'Options' contains 'RebateCode' with row text '<CalculationStatus>' 

	# Step 10
	And the user validates that column 'Calculation Session' contains '<CalculationStatus>' with row text 'RebateCode' 

	# Step 11
	When the user clicks on the 'Close Tab'
    Then the user validates that the 'Text' with value '<CalculationStatus>' is displayed

	# Step 12
	When the user clicks on the 'Close Tab'

	Examples: 
	| customer | level   | classification | reason           | targettype    | fixedAmount | dataSource        | paymentMode     | paymentFrequency | status  | CalculationSessionType | CalculationStatus      | CalcResultsPopup    | CalcSessNavigator   |
	| EC86206  | Level 3 | Supply         | Year End Bonuses | Brackets      | 3000.00     | Net sales revenue | Invoice payable | Monthly          | Confirm | Projected period       | Completed with Success | Calculation Results | Calculation Session |