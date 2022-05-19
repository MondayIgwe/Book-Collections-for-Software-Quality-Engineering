Feature: TestCase_643123

@BDD_643123 @PLAN_Nightly @PLAN
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
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 4 - Open @FLT_ROLMEAS_CUST filter set on customer, @FLT_ROLMEAS_MONTH set on month, @MEAS1, @Measure Deselect all options, Select @Customer,@Month1, @Month2
	When the user changes the filter on Filter Name: '<FLT_Rolmeas_Customer>' to Filter Value: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<FLT_Rolmeas_Month>' to Filter Value: '<Month1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<FLT_Rolmeas_Month>' to Filter Value: '<Month2>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<FLT_Rolmeas_Meas2>' to Filter Value: '<Meas1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<FLT_Rolmeas_Meas2>' to Filter Value: '<Measure>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 5 - Right-click on the cells @MEAS1, @Customer, @ProdCell, @Month1
	And the user right clicks on the Aggrid Grid table at Row: 'EC93849_4|07_5|MEAS2_ROL' and Column: '<Month2>' and Selects: 'Block > Cell(s)'
	And the user right clicks on the Aggrid Grid table at Row: 'EC93849_4|07_5|MEAS2_ROL' and Column: '<Month2>' and Selects: 'Apply value > New value'
	
	# Step 6 - Check if the options are disabled
	Then the user validates that the 'Apply value > New value' on the Aggrid Grid table at row: 'EC93849_4|07_5|MEAS2_ROL' and column: 'M6' is disabled

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName       | DocumentID | Customer  | Month1 | Month2 | FLT_Rolmeas_Customer | FLT_Rolmeas_Month   | FLT_Rolmeas_Meas2   | Meas1    | Measure   | GridName               | ProdCell | Block | BlockType | ApplyValue  | Quarter |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | SC_ROLMEAS_NOTAGG | 142        | EC93849_4 | M5     | M6     | [FLT_ROLMEAS_CUST]   | [FLT_ROLMEAS_MONTH] | [FLT_ROLMEAS_MEAS2]  | MEAS1_ROL| MEAS2_ROL | GRID_FR_ROLMEAS_NOTAGG | 07.5     | Block | Cell(s)   | Apply value | T2      |