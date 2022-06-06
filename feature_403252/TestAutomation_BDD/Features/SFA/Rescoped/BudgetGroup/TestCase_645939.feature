Feature: TestCase_645939

@BDD_645939 @SFA_Nightly @SFA_Rerun
Scenario: WEB_SFA_SF_BUDGET_036_TRANSFER_POPUP_CONFIRMATION
	Given the user navigates to the 'Budget Group' page
	When the user adds a new budget group where Budget Group Code is retrieved, Topology: 'Discounts', Description: 'WEB_SFA_SF_BUDGET_036', Default Initial Value: '1000'
	And the user selects Budget Group Owners and retrieves the usernames: 'Anca Anastasiei, ANCA ANASTASIEI(MOBILE), Antonino Caridi'

	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Current status'
	
	And the user clicks on 'Radio Button' with value 'Validate'
	And the user clicks on 'Popup Button' with value 'OK'

	Then the user closes the page and saves the work done
	When the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Code', 'Like' retrieved value

	And the user clicks on 'Div Text in Grid' with value 'Discounts'
	And the user clicks on the 'Links Button'

	And the user clicks on 'Text' with value 'Budget Detail'
	And the user clicks on 'Contains Div Text in Grid' with value 'User0'

	And the user clicks on 'Button Link' with value 'Transfer'
	And the user clicks on the 'Add Button'

	And the user opens the 'Budget detail' pop-up Grid Settongs Menu option: 'Columns'
	And the user filter the pop up menu: 'Columns Settings' by column name 'Caption', 'Like', 'Budget group code'
	And the user clicks on 'Columns Settings' pop up table where 'Caption' column has the value:'Budget group code' and the checkbox is in column:'Visible' is turned:'on'
	And the user clicks on 'Popup Ok Button' with value 'Columns Settings'

	And the user clicks on 'Generic Pop Up Refresh Button' with value 'Budget detail'
	And the user filters the pop up menu: 'Budget detail' by column name 'Budget group code', 'Like', retieved value
	And the user clicks on 'Select Row Checkbox' with value one 'Budget detail' and value two '1'

	And the user clicks on 'Select Row Checkbox' with value one 'Budget detail' and value two '2'
	And the user clicks on 'Popup Ok Button' with value 'Budget detail'

	Then the user validates that the 'Div Text in Grid' with value 'User1' is displayed
	And the user validates that the 'Div Text in Grid' with value 'User2' is displayed

	And the user validates that 'Input By Label Name' with value 'Remaining balance' has text '1000.00'
	When the user clicks and enters the text '200' in the 'Budget Transfer Budget Destination' multigrid table in the '' column name: 'Transfer value' in row number: '1'
	And the user moves the focus to 'Input By Label Name' with value 'Remaining balance'
	And the user clicks on 'Input By Label Name' with value 'Remaining balance'

	And the user clicks and enters the text '100' in the 'Budget Transfer Budget Destination' multigrid table in the '' column name: 'Transfer value' in row number: '2'
	And the user moves the focus to 'Input By Label Name' with value 'Remaining balance'
	And the user clicks on 'Input By Label Name' with value 'Remaining balance'
	Then the user validates that the 'Budget Transfer Budget Destination' singlegrid contains '1,200.00' in the 'New balance' column in the row number '1' with an offset of '1'
	
	And the user validates that the 'Budget Transfer Budget Destination' singlegrid contains '1,100.00' in the 'New balance' column in the row number '2' with an offset of '1'
	And the user validates that 'Input By Label Name' with value 'Remaining balance' has text '700.00'

	When the user clicks on 'Popup Ok Button' with value 'Budget Transfer'
	Then the user validates that the 'Toast Message Field' is displayed

	And the user validates that 'Selected Index Row' with value '1' is marked as: 'true'
	When the user clicks on the 'Refresh Button'

	Then the user validates that the 'Basic Multigrid' multigrid has the value '700.00' in the 'Assigned Value' column in the row number '1'
	And the user validates that the 'Basic Multigrid' multigrid has the value '1,200.00' in the 'Assigned Value' column in the row number '2'
	And the user validates that the 'Basic Multigrid' multigrid has the value '1,100.00' in the 'Assigned Value' column in the row number '3'

	And the user validates that the 'Basic Multigrid' multigrid has the value '700.00' in the 'Balance' column in the row number '1'
	And the user validates that the 'Basic Multigrid' multigrid has the value '1,200.00' in the 'Balance' column in the row number '2'
	And the user validates that the 'Basic Multigrid' multigrid has the value '1,100.00' in the 'Balance' column in the row number '3'

	When the user clicks on 'Contains Div Text in Grid' with value 'User0'
	And the user clicks on the 'Links Button'

	And the user clicks on 'Text' with value 'Budget Movements'
	Then the user is on the 'Budget Movements' page

	And the user validates that the 'Basic Multigrid' multigrid has the value 'Manual movement' in the 'Operation Type' column in the row number '1'
	And the user validates that the 'Basic Multigrid' multigrid has the value 'Manual movement' in the 'Operation Type' column in the row number '2'
	And the user validates that the 'Basic Multigrid' multigrid has the value 'Initialization' in the 'Operation Type' column in the row number '3'

	And the user validates that the 'Basic Multigrid' multigrid has the value '-200.00' in the 'Operation Value' column in the row number '1'
	And the user validates that the 'Basic Multigrid' multigrid has the value '-100.00' in the 'Operation Value' column in the row number '2'
	And the user validates that the 'Basic Multigrid' multigrid has the value '1,000.00' in the 'Operation Value' column in the row number '3'

	And the user validates that the 'Basic Multigrid' multigrid has the value '' in the 'Dockey' column in the row number '1'
	And the user validates that the 'Basic Multigrid' multigrid has the value '' in the 'Dockey' column in the row number '2'
	And the user validates that the 'Basic Multigrid' multigrid has the value '' in the 'Dockey' column in the row number '3'

	And the user closes all pages without saving the work done where there is no pop up
	
	When the user clicks on the 'Refresh Button'
	And the user keys in the 'shift' key
	And the user clicks on 'Contains Div Text in Grid' with value 'User1'
	And the user clicks on 'Contains Div Text in Grid' with value 'User2'
	And the user keys out the 'shift' key

	And the user clicks on the 'Links Button'
	And the user clicks on 'Text' with value 'Budget Movements'
	Then the user is on the 'Budget Movements' page

	And the user validates that the 'Basic Multigrid' multigrid has the value 'Manual movement' in the 'Operation Type' column in the row number '1'
	And the user validates that the 'Basic Multigrid' multigrid has the value 'Manual movement' in the 'Operation Type' column in the row number '2'

	And the user validates that the 'Basic Multigrid' multigrid has the value 'Initialization' in the 'Operation Type' column in the row number '3'
	And the user validates that the 'Basic Multigrid' multigrid has the value 'Initialization' in the 'Operation Type' column in the row number '4'

	And the user validates that the 'Basic Multigrid' multigrid has the value '200.00' in the 'Operation Value' column in the row number '1'
	And the user validates that the 'Basic Multigrid' multigrid has the value '100.00' in the 'Operation Value' column in the row number '2'
	And the user validates that the 'Basic Multigrid' multigrid contains the date value 'd/m/y' in the 'Operation Date' column in the row number '2'

	And the user validates that the 'Basic Multigrid' multigrid contains the username currently logged in in the 'Made By' column in the row number '1'
	And the user validates that the 'Basic Multigrid' multigrid contains the username currently logged in in the 'Made By' column in the row number '2'
	And the user validates that the 'Basic Multigrid' multigrid contains the username currently logged in in the 'Made By' column in the row number '3'
	And the user validates that the 'Basic Multigrid' multigrid contains the username currently logged in in the 'Made By' column in the row number '4'

	And the user closes all pages without saving the work done where there is no pop up
	And the user closes all pages without saving the work done where there is no pop up
	And the user closes all pages without saving the work done where there is no pop up