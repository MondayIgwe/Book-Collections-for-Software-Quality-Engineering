Feature: TestCase_743767

@BDD_743767 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_ROLMEAS_MATRIX_002
	#Step 1
	Given the user navigates to the 'IBP Documents' page
	#Step 2
	When the user filters the column by column name 'Process Year', 'Like', '<DocProcessYear>'
	And the user filters the column by column name 'Month', 'Equal', '<DocMonth>'
	And the user filters the column by column name 'Document Shell Model', 'Like', '<DocShellModel>'
	And the user clicks on '<DocumentID>' text on the grid
	#Step 3
	Then the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user is on the 'Shell Tab' page
	#Step 4
	When the user changes the filter on '<FilterName>' to '<FirstValue>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	#Step 5
	And the user enters the text '<Value>' on the Aggrid Grid table '<GridName>' at row: 'EC86195_4|08_5|BASELINE' and column: 'M10'
	And the user enters the text '<Value>' on the Aggrid Grid table '<GridName>' at row: 'EC86195_4|08_5|BASELINE' and column: '2020'
	#Step 6
	Then the user validates on the Aggrid Grid table '<GridName>' at row: 'EC86195_4|08_5|BASELINE' and column: 'M10' and has the text '<Value>'
	And the user validates on the Aggrid Grid table '<GridName>' at row: 'EC86195_4|08_5|BASELINE' and column: '2020' and has the text '<Value>'
	#Step 7
	When the user clicks on 'Button' with value 'UPDATE'
	And the user closes all pages without saving the work done

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                       | FilterName          | FirstValue | GridName           | Value | Product | Meas1    | Year | Month1 | Meas2   | DocumentID |
	| CBP_2020       | SHELL_MATRIX3 | 99      | 99       | [GUIGWPLANDOC.SECTION_MATRIXNEW3] | [FLT_ROLMEAS_MONTH] | M10        | GRID_FR_MATRIXNEW3 | 500   | 08_5    | BASELINE | 2020 | M10    | TOT_VOL | 146        |