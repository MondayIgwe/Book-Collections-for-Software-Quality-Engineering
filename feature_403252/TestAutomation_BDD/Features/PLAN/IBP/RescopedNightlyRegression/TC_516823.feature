Feature: TestCase_516823


@RESCOPED_BDD_516823 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_STRING_004-Split when Aggrule=DISTINCTCOUNT
	#Step 1
	Given the user navigates to the 'IBP Documents' page
	#Step 2
	When the user filters the column by column name 'Process Year', 'Like', '<DocProcessYear>'
	And the user filters the column by column name 'Month', 'Equal', '<DocMonth>'
	And the user clicks on '<DocumentID>' text on the grid
	#Step 3
	Then the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user is on the 'Shell Tab' page
	#Step 4
	When the user changes the filter on '[F_STRING2]' to 'EC94101_4' and filters with 'User Code', 'Like' in the IBP Shell Tab
	#Step 5
	And the user enters the text 'Test (4)' on the Aggrid Grid table '<GridName>' at row: '<CustomerFilters>' and column: 'M1|STRING2' 
	#Step 6
	Then the user validates on the Aggrid Grid table '<GridName>' at row: '<CustomerFilters>' and column: 'M1|STRING2' and has the text 'Test (4)'
	#Step 7
	When the user clicks on 'Button' with value 'UPDATE'
	And the user closes all pages without saving the work done

	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                 | CustomerFilters | MonthFilters | DocumentID | Value | GridName		|
	| CBP_2020       | SHELL_STRING  | 10      | 3        | [GUIGWPLANDOC.SEC_STRING_1] | EC94101_4       | M4           | 138        | 100   | GRID_FR_STRING_1|