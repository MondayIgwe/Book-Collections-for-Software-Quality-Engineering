Feature: TestCase_615640


@BDD_615640 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_FORMULA_001-SOURCE Case1
	#Step 1
	Given the user navigates to the 'IBP Documents' page
	#Step 2
	When the user filters the column by column name 'Process Year', 'Like', '<DocProcessYear>'
	And the user filters the column by column name 'Month', 'Equal', '<DocMonth>'
	And the user filters the column by column name 'Process Year', 'Like', '<DocProcessYear>'
	#Step 3
	And the user clicks on '<DocumentID>' text on the grid
	#Step 3
	Then the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user is on the 'Shell Tab' page
	#Step 4
	When the user changes the filter on '<Filter1>' to '<Month>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<Filter>' to '<Customer>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<Filter2>' to '<Measure1>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<Filter2>' to '<Measure2>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<Filter2>' to '<Measure3>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	#Step 5
	Then the user closes all pages without saving the work done where there is no pop up

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName | Filter               | Filter1            | Filter2            | FirstValue | GridName        | Customer  | Customer1 | Product | Meas1    | Year | Month | Meas2   | DocumentID | Measure | Measure1 | Measure2 | Measure3 | ProdCell1 | Value  | Value1   | Value2   | Value3   |
	| CBP_2020       | SHELL_SOURCE  | 15      | 4        | SC_SOURCE1  | [FLT_SOURCE_PLANTO1] | [FLT_SOURCE_MONTH] | [FLT_SOURCE_MEAS1] | M10        | GRID_FR_SOURCE1 | EC86550_1 | EC91603_4 | 08_5    | BASELINE | 2020 | M1    | TOT_VOL | 139        |  MEAS3  | MEAS2    | MEAS4    | MEAS5    | 100       | 100.02 | 2,475.60 | 2,575.62 | 2,375.58 |
