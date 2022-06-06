Feature: TestCase_536253

@BDD_517178 @PLAN_Nightly @PLAN @Regression
Scenario: WEB_TPM_IBP_SPLIT_002-AGGRRULE=SUM and SPLIT=EMPTY
	# Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page
	#Step 1
	When the user filters the column by column name 'Process Year', 'Like', '<DocProcessYear>'
	And the user filters the column by column name 'Month', 'Equal', '<DocMonth>'
	And the user filters the column by column name 'Document Shell Model', 'Like', '<DocShellModel>'
	And the user filters the column by column name 'Week', 'Equal', '<DocWeek>'
	#Step 2
	And the user clicks on '<DocumentID>' text on the grid
	#Step 3
	Then the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user is on the 'Shell Tab' page
	#Step 4
	When the user changes the filter on '<Filter1>' to '<Customer>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<Filter2>' to '<Month>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	#Step 5
	And the user enters the text '<Value>' on the Aggrid Grid table '<GridName>' at row: '<Customer>' and column: 'M2|MEASUR2'
	#Step 6
	Then the user validates on the Aggrid Grid table '<GridName>' at row: '<Customer>' and column: 'M2|MEASUR2' and has the text '<Value>'
	#Step 7
	And the user clicks on 'Button' with value 'UPDATE'
	And the user closes all pages without saving the work done

	Examples:
	| DocProcessYear | DocShellModel  | DocWeek | DocMonth | SectionName    | Filter1      | Filter2      | Customer  | Month | GridName           | Value | Measure | ProdCell | Value1 | DocumentID |
	| CBP_2020       | SHELL_MEASURES | 1       | 1        | SEC_MEASURES_1 | [F_MEASURE3] | [F_MEASURE4] | EC91603_4 | M2    | GRID_FR_MEASURES_1 | 459   | MEASUR2 | 100      | 114    |   132      |