Feature: TestCase_517178

@BDD_517178 @PLAN_Nightly @PLAN @Regression
Scenario: WEB_TPM_IBP_STRING_006-Split when Aggrule=DISTINCTCOUNT
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
	When the user changes the filter on '<Filter1>' to '<FilterValue>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	#Step 5
	And the user enters the text '<Value>' on the Aggrid Grid table '<GridName>' at row: '<FilterValue>' and column: 'M1|STRING2'
	#Step 6
	Then the user validates on the Aggrid Grid table '<GridName>' at row: '<FilterValue>' and column: 'M1|STRING2' and has the text 'X (4)'
	Then the user validates on the Aggrid Grid table '<GridName>' at row: 'EC94721_4|103' and column: 'T1|STRING2' and has the text '<Value1>'
	#Step 7
	And the user closes all pages without saving the work done
	# Repeat step 2 to 6
	When the user clicks on '<DocumentID>' text on the grid
	Then the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user is on the 'Shell Tab' page
	When the user changes the filter on '<Filter1>' to '<FilterValue>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user enters the text '<Value2>' on the Aggrid Grid table '<GridName>' at row: '<FilterValue>' and column: 'M1|STRING2'
	Then the user validates on the Aggrid Grid table '<GridName>' at row: '<FilterValue>' and column: 'M1|STRING2' and has the text '1 (4)'
	Then the user validates on the Aggrid Grid table '<GridName>' at row: 'EC94721_4|103' and column: 'T1|STRING2' and has the text '1 (1)'
	And the user clicks on 'Button' with value 'UPDATE'
	And the user closes all pages without saving the work done

	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                 | CustomerFilters | MonthFilters | Filter1     | FilterValue | GridName         | Measure | ProdCell | Month | Value | Value1 | Measure1        | Value2 | DocumentID |
	| CBP_2020       | SHELL_STRING  | 10      | 3        | [GUIGWPLANDOC.SEC_STRING_1] | EC94721_4       | M4           | [F_STRING2] | EC94721_4   | GRID_FR_STRING_1 | STRING2 | 103      | M1    | X     | X (1)  | STRING_FORMULA2 | 1      | 138        |