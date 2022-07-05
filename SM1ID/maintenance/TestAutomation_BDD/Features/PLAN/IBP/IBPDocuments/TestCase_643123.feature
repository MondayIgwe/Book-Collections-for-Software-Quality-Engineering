Feature: TestCase_643123

@BDD_643123 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_APPLY_VALUE_ROL_MEAS_NOTAGG_009-US425392-AC6-Example 1
	# Step 1 - Go to 'IBP Documents' Navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open the document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Open the @Section Name
	Then the user validates that the user is on the 'IBP Plan Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'IBP Plan Shell Tab' page

	# Step 4 - Open @FLT_ROLMEAS_CUST filter set on customer, @FLT_ROLMEAS_MONTH set on month, @MEAS1, @Measure Deselect all options, Select @Customer,@Month1, @Month2
	When the user changes the Combo Label: '<FLT_Rolmeas_Customer>' to Combo Label: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the Combo Label: '<FLT_Rolmeas_Meas2>' to Combo Label: '<Meas1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the Combo Label: '<FLT_Rolmeas_Meas2>' to Combo Label: '<Measure>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the Combo Label: '<FLT_Rolmeas_Month>' to Combo Label: '<Month2>,<Month1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

	
	# Step 5 - Right-click on the cells @MEAS1, @Customer, @ProdCell, @Month1
	And the user right clicks on the Aggrid Grid table at Row: '<Customer>|<ProdCell>|<Measure>' and Column: '<Quarter>' and Selects: 'Apply value > New value'

	# Step 6 - Validate pop-up containing an editing field appears. The pop-up contains 2 buttons: OK and Cancel.
	Then the user validates that the 'Text Containing' with value 'Value' is displayed
	And the user validates that the 'Popup Ok Button' with value 'Value' is displayed
	And the user validates that the 'Popup Cancel Button' with value 'Value' is displayed
	
	# Step 7 - Insert Value and Press on "OK" button 
	When the user enters '<Value>' into the Aggrid context 'Value' pop up menu

	# Step 8 - Right-click on the cells @MEAS1, @Customer, @ProdCell, @Month1
	And the user right clicks on the Aggrid Grid table at Row: '<Customer>|<ProdCell>|<Measure>' and Column: '<Month2>' and Selects: '<Block> > <BlockType>'
	
	# Step 9 - Check if the options are disabled
	Then the user validates that the '<ApplyValue> > <ApplyType>' on the Aggrid Grid table at row: '<Customer>|<ProdCell>|<Measure>' and column: '<Month2>' is disabled

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName       | DocumentID | Customer  | Month1 | Month2 | FLT_Rolmeas_Customer | FLT_Rolmeas_Month   | FLT_Rolmeas_Meas2   | Meas1     | Measure   | GridName               | ProdCell | Block | BlockType | ApplyValue  | ApplyType | Quarter |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | SC_ROLMEAS_NOTAGG | 142        | EC93849_4 | M5     | M6     | [FLT_ROLMEAS_CUST]   | [FLT_ROLMEAS_MONTH] | [FLT_ROLMEAS_MEAS2] | MEAS1_ROL | MEAS2_ROL | GRID_FR_ROLMEAS_NOTAGG | 07_5     | Block | Cell(s)   | Apply value | New value | T2		|