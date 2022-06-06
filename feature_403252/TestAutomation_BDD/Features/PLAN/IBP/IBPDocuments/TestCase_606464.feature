Feature: TestCase_606464

@BDD_606464 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_SPLIT_ROL_MEAS_002
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
	When the user changes the filter on '<Filter>' to '<Customer>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<Filter1>' to '<Category>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<Filter3>' to '<Month>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<Filter3>' to '<Month1>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<Filter3>' to '<Month2>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	
	#Step 6
	And the user enters the text '<Value>' on the Aggrid Grid table '<GridName>' at row: 'EC91603_4|08_5|MEAS1_ROL' and column: 'M3'
	
	#Step 7 
	Then the user validates on the Aggrid Grid table '<GridName>' at row: 'EC91603_4|08_5|MEAS1_ROL' and column: 'M3' and has the text '<Value>'

	#Step 8
	When the user clicks on 'Button' with value 'UPDATE'
	And the user closes all pages without saving the work done

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | DocumentID | SectionName       | Filter             | Filter1            | Filter2             | Filter3             | Customer  | Category | Month | Month1 | Month2 | GridName               | Measure   | Measure1  | Measure3   | Measure4  | Measure5  | Year | Value | Value1 | Value2 | Value3 | Value4 | Value5 | Value6 |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | 142        | SC_ROLMEAS_NOTAGG | [FLT_ROLMEAS_CUST] | [FLT_ROLMEAS_PROD] | [FLT_ROLMEAS_MEAS2] | [FLT_ROLMEAS_MONTH] | EC91603_4 | 08_5     | M1    | M2     | M3     | GRID_FR_ROLMEAS_NOTAGG | MEAS1_ROL | MEAS2_ROL | MEAS15_ROL | MEAS5_ROL | MEAS6_ROL | 2020 | 333   | 111.11 | 111.11 | -685   | 222.22 | -574.77 | 76,208.12 |
