Feature: TestCase_821647

@BDD_821647 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_APPLYVALUE_AGG_003 - Apply new value for a portion of cells in an aggregated grid
	#Step 1
	Given the user navigates to the 'IBP Documents' page
	#Step 2
	When the user filters the column by column name 'Process Year', 'Like', '<DocProcessYear>'
	And the user filters the column by column name 'Month', 'Equal', '<DocMonth>'
	And the user filters the column by column name 'Week', 'Equal', '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', 'Like', '<DocShellModel>'
	And the user clicks on '<DocumentID>' text on the grid
	#Step 3
	Then the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user is on the 'Shell Tab' page
	#Step 4
	When the user changes the filter on 'Customer Filter' to '<CustomerFilters>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '[FLT_MONTH]' to '<MonthFilters>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	#Step 5
	And the user enters the text '<Value>' on the Aggrid Grid table '<GridName>' at row: 'PRICE_PY' and column: 'M1'
	And the user enters the text '<Value>' on the Aggrid Grid table '<GridName>' at row: 'PRICE_PY' and column: 'M2'
	#Step 6
	Then the user validates on the Aggrid Grid table '<GridName>' at row: 'PRICE_PY' and column: 'M1' and has the text '<Value>'
	Then the user validates on the Aggrid Grid table '<GridName>' at row: 'PRICE_PY' and column: 'M2' and has the text '<Value>'
	#Step 7
	And the user clicks on 'Button' with value 'UPDATE'
	And the user closes all pages without saving the work done

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                    | DocumentID | CustomerFilters | MonthFilters | GridName                 | Value |
	| CBP_2020       | SHELL_DEMO2_2 | 6       | 2        | [GUIGWPLANDOC.SEC_P&L_DEMO2_2] | 131        | EC91603_4       | M1,M2        | GRID_FR_BASELINE_DEMO2_2 | 100   |