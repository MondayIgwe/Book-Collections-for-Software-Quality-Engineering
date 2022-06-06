Feature: TestCase_278517

@RESCOPED_BDD_278517 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_APPLYVALUE_005-Apply percentage at aggregated level
	#Step 1
	Given the user navigates to the 'IBP Documents' page
	#Step 2
	When the user filters the column by column name 'Process Year', 'Like', '<DocProcessYear>'
	And the user filters the column by column name 'Month', 'Equal', '<DocMonth>'
	And the user filters the column by column name 'Document Shell Model', 'Like', '<DocShellModel>'
	And the user filters the column by column name 'Week', 'Equal', '<DocWeek>'
	And the user clicks on '<DocumentID>' text on the grid
	#Step 3
	Then the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user is on the 'Shell Tab' page
	#Step 4
	When the user changes the filter on '[F_MEASURE3]' to '<CustomerFilters>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '[F_MEASURE4]' to '<MonthFilters>' and filters with 'User Code', 'Like' in the IBP Shell Tab	
	#Step 5
	And the user enters the text '-15' on the Aggrid Grid table '<GridName>' at row: '<CustomerFilters>' and column: 'M4|MEASUR5'
	#Step 6
	Then the user validates on the Aggrid Grid table 'GRID_FR_MEASURES_1' at row: '<CustomerFilters>' and column: 'M4|MEASUR5' and has the text '-15'
	#Step 7
	And the user clicks on 'Button' with value 'UPDATE'
	And the user closes all pages without saving the work done

Examples:
	| DocProcessYear | DocShellModel  | DocWeek | DocMonth | SectionName    | CustomerFilters | MonthFilters | DocumentID |
	| CBP_2020       | SHELL_MEASURES | 1       | 1        | SEC_MEASURES_1 | EC94100_4       | M4           | 132        |