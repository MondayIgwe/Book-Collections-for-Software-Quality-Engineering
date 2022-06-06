Feature: TestCase_594464

@BDD_594464 @PLAN_Nightly @PLAN @Regression_
Scenario: WEB_TPM_IBP_GRID_001-US582776 - AC1 - The first column of the aggregated grid is frozen
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
	Then the user validates that the 'Aggrid Column Header Name' with value 'M1' is displayed
	#Step 5
	And the user closes all pages without saving the work done where there is no pop up

	Examples:
	| DocProcessYear | DocShellModel  | DocWeek | DocMonth | SectionName					|  GridName           | DocumentID |
	| CBP_2020       | SHELL_DEMO2_2  | 6       | 2        | [GUIGWPLANDOC.SEC_P&L_DEMO2_2] | GRID_FR_P&L_DEMO2_2 | 131        | 