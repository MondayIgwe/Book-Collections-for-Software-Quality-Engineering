Feature: TestCase_645612

@SFA_Nightly @BDD_645612
Scenario: WEB_SFA_SF_BUDGET_039_BALANCE_ADJUSTMENT_POPUP_CONFIRMATION
	Given the user navigates to the 'Budget Group' page
	#1 Create new Budget group:
	When the user removes all items by column 'Budget Group Description' 'Like' '<BdgGroupDescription>'
	And the user adds a new budget group where Budget Group Code is retrieved, Topology: '<TypologyValue>', Owner Level: '<OwnerLevel>',Description: '<BdgGroupDescription>', Measure Unit: '<MeasureUnit>'
	And the user retrieves text from element 'Input By Label Name' with value 'Code' and saves it as 'BudgetCode'
	And the user clicks on 'Side Panel Tab' with value 'Owners'
	And the user clicks on 'Grid Checkbox' with value '<OwnerCode>'
	And the user clicks on 'Grid Checkbox' with value '<OwnerCode2>'
	And the user clicks on 'Grid Checkbox' with value '<OwnerCode3>'
	When the user clicks and enters '<DefInitialValue>' into the 'Initial Value' column in the Owners Tab in row numbwr '1'
	When the user clicks and enters '<DefInitialValue2>' into the 'Initial Value' column in the Owners Tab in row numbwr '2'
	When the user clicks and enters '<DefInitialValue3>' into the 'Initial Value' column in the Owners Tab in row numbwr '3'
	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	When the user changes the status to 'Validate'
	Then the user validates that 'Input By Label Name' with value 'Current status' has text 'Valid'
	When the user closes the page and saves the work done
	#2 Open Budget Detail navigator and filter Description column with @BdgGroupDescription
	And the user navigates to the 'Budget Detail' page
	And the user filters the column by column name 'Description', 'Like', '<BdgGroupDescription>'
	And the user clicks on the 'Grid All Checkbox'
	And the user clicks on 'Button' with value 'Adjust balance'
	Then the user validates that popup 'Budget Adjustment' column 'Current Balance' has '<DefInitialValue>' with row text '<OwnerCode>'
	And the user validates that popup 'Budget Adjustment' column 'Current Balance' has '<DefInitialValue2>' with row text '<OwnerCode2>'
	And the user validates that popup 'Budget Adjustment' column 'Current Balance' has '<DefInitialValue3>' with row text '<OwnerCode3>'
	When the user clicks on 'Popup Cancel Button' with value 'Budget Adjustment'
	#3 Click on Adjust balance button
	And the user clicks on 'Button' with value 'Adjust balance'
	And the user enters '<DefInitialValue>' in field 'Input By Label Name' with value 'New Balance'
	And the user clicks on 'Popup Ok Button' with value 'Budget Adjustment'
	Then the user validates that the 'Success Toast Message' is visible
	#4 Refresh navigator
	And the user clicks on the 'Refresh Button'
	Then the user validates that the 'Basic Multigrid' multigrid has the value '<DefInitialValue>' in the 'Initial Value' column in the row number '1'
	And the user validates that the 'Basic Multigrid' multigrid has the value '<DefInitialValue2>' in the 'Initial Value' column in the row number '2'
	And the user validates that the 'Basic Multigrid' multigrid has the value '<DefInitialValue3>' in the 'Initial Value' column in the row number '3'

	#5 Select all rows -> Open Budget Movements navigator from links.
	When the user clicks on the 'Grid All Checkbox'
	And the user clicks on 'Button' with value 'Links'
	And the user clicks on 'Menu Item Text' with value 'Budget Movements'
	#Operation type=@ADJUSTMENT for 3 records 
	Then the user validates that the 'Basic Multigrid' multigrid has the value '<ADJUSTMENT>' in the 'Operation Type' column in the row number '1'
	And the user validates that the 'Basic Multigrid' multigrid has the value '<ADJUSTMENT>' in the 'Operation Type' column in the row number '2'
	And the user validates that the 'Basic Multigrid' multigrid has the value '<ADJUSTMENT>' in the 'Operation Type' column in the row number '3'
	#Operation date=today for 3 records
	And the user validates that the 'Basic Multigrid' multigrid contains the date value 'd/m/y' in the 'Operation Date' column in the row number '1'
	And the user validates that the 'Basic Multigrid' multigrid contains the date value 'd/m/y' in the 'Operation Date' column in the row number '2'
	And the user validates that the 'Basic Multigrid' multigrid contains the date value 'd/m/y' in the 'Operation Date' column in the row number '3'
	#Document key is null
	And the user validates that the 'Basic Multigrid' multigrid has the value '<DocumentKey>' in the 'Dockey' column in the row number '1'
	And the user validates that the 'Basic Multigrid' multigrid has the value '<DocumentKey>' in the 'Dockey' column in the row number '2'
	And the user validates that the 'Basic Multigrid' multigrid has the value '<DocumentKey>' in the 'Dockey' column in the row number '3'
	#Made by column is populated with the current logged user.
	And  the user validates that the 'Basic Multigrid' multigrid contains the username currently logged in in the 'Made By' column in the row number '1'
	And  the user validates that the 'Basic Multigrid' multigrid contains the username currently logged in in the 'Made By' column in the row number '2'
	And  the user validates that the 'Basic Multigrid' multigrid contains the username currently logged in in the 'Made By' column in the row number '3'
	#USR1 has Operation value=@Movement [0]
	Then the user validates that the 'Basic Multigrid' multigrid has the value '<Movement>' in the 'Operation Value' column in the row number '1'
	And the user validates that the 'Basic Multigrid' multigrid has the value '<Movement2>' in the 'Operation Value' column in the row number '2'
	And the user validates that the 'Basic Multigrid' multigrid has the value '<Movement3>' in the 'Operation Value' column in the row number '3'
	
	Examples:
		| TypologyValue | OwnerLevelValue | MeasureUnitValue | BdgGroupDescription   | OwnerCode   | OwnerCode2   | OwnerCode3 | DefInitialValue | DefInitialValue2 | DefInitialValue3 | MessageOK                                   | ADJUSTMENT         | Movement | Movement2 | Movement3 | WARN_MSG                         | DocumentKey |
		| Discounts     | Sales rep       | PACKS            | WEB_SFA_SF_BUDGET_039 | AANASTASIEI | AANASTASIEI1 | ACAR       | 100.00          | 150.00           | 200.00           | Adjustment successful in 3/3 budget details | Balance Adjustment | 0.00     | -50.00    | -100.00   | All new budget balance will be 0 |              |