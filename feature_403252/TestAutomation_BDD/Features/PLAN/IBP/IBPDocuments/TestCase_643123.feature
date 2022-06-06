Feature: TestCase_643123

@BDD_643123 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_APPLY_VALUE_ROL_MEAS_NOTAGG_009-US425392-AC6-Example 1
	#Step 1
	Given the user navigates to the 'IBP Documents' page
	#Step 2
	When the user filters the column by column name 'Process Year', 'Like', '<DocProcessYear>'
	And the user filters the column by column name 'Month', 'Equal', '<DocMonth>'
	And the user filters the column by column name 'Week', 'Equal', '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', 'Like', '<DocShellModel>'
	#Step 3
	And the user clicks on '<DocumentID>' text on the grid
	#Step 4
	Then the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user is on the 'Shell Tab' page
	#Step 5
	When the user changes the filter on '<FLT_Rolmeas_Customer>' to '<Customer>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<FLT_Rolmeas_Month>' to '<Month1>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<FLT_Rolmeas_Month>' to '<Month2>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<FLT_Rolmeas_Meas2>' to '<Meas1>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<FLT_Rolmeas_Meas2>' to '<Measure>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	#Step 6
	And the user right clicks on the Aggrid Grid table at row: 'EC93849_4|07_5|MEAS2_ROL' and column: '<Month2>' and selects 'Block > Cell(s)'
	And the user right clicks on the Aggrid Grid table at row: 'EC93849_4|07_5|MEAS2_ROL' and column: '<Month2>' and selects 'Apply value > New value'
	#Step 7 
	Then the user validates that the 'Apply value > New value ' on the Aggrid Grid table at row: 'EC93849_4|07_5|MEAS2_ROL' and column: 'M6' is disabled

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName       | DocumentID | Customer  | Month1 | Month2 | FLT_Rolmeas_Customer | FLT_Rolmeas_Month   | FLT_Rolmeas_Meas2   | Meas1    | Measure   | GridName               | ProdCell | Block | BlockType | ApplyValue  | Quarter |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | SC_ROLMEAS_NOTAGG | 142        | EC93849_4 | M5     | M6     | [FLT_ROLMEAS_CUST]   | [FLT_ROLMEAS_MONTH] | [FLT_ROLMEAS_MEAS2]  | MEAS1_ROL| MEAS2_ROL | GRID_FR_ROLMEAS_NOTAGG | 07.5     | Block | Cell(s)   | Apply value | T2      |