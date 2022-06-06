Feature: TestCase_642627

@BDD_642627 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_AGGREGATION_ROL_MEAS_NOTAGG_006-US425392-AC4-Example 1
	#Step 1
	Given the user navigates to the 'IBP Documents' page
	#Step 2
	When the user filters the column by column name 'Process Year', 'Like', '<DocProcessYear>'
	And the user filters the column by column name 'Month', 'Equal', '<DocMonth>'
	And the user filters the column by column name 'Document Shell Model', 'Like', '<DocShellModel>'
	And the user filters the column by column name 'Week', 'Equal', '<DocWeek>'
	#Step 3
	And the user clicks on '<DocumentID>' text on the grid
	#Step 4
	Then the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user is on the 'Shell Tab' page
	#Step 5
	When the user changes the filter on '<FLT_Rolmeas_Customer>' to '<Customer>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<FLT_Rolmeas_Month>' to '<Month>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<FLT_Rolmeas_Month>' to '<Month1>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<FLT_Rolmeas_Prod>' to '<ProdCell>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<FLT_Rolmeas_Meas>' to '<Measure>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	#Step 6
	And the user enters the text '<Value>' on the Aggrid Grid table '<GridName>' at row: 'EC94101_4|07_5|MEAS1_ROL' and column: '<Month1>'
	#Step 7
	Then the user validates on the Aggrid Grid table '<GridName>' at row: 'EC94101_4|07_5|MEAS1_ROL' and column: '<Month1>' and has the text '<Value>'
	#Step 8
	And the user clicks on 'Button' with value 'UPDATE'
	#Step 9
	Then the user closes all pages without saving the work done

	
Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName       | DocumentID  | Customer  | Month | Month1 | FLT_Rolmeas_Customer | FLT_Rolmeas_Prod   |  FLT_Rolmeas_Month   | FLT_Rolmeas_Meas    | Measure   | GridName               | ProdCell | Block | BlockType | Value | Quarter | Year |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | SC_ROLMEAS_NOTAGG | 142         | EC94101_4 | M1    | M2     | [FLT_ROLMEAS_CUST]   | [FLT_ROLMEAS_PROD] |  [FLT_ROLMEAS_MONTH] | [FLT_ROLMEAS_MEAS2] | MEAS1_ROL | GRID_FR_ROLMEAS_NOTAGG | 07_5     | Block | Cell(s)   | 55    | T1      | 2020 |

