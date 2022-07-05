Feature: TestCase_594464
	AC1 - The first column of the aggregated grid is frozen

@BDD_594464 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_GRID_001-US582776
	# Step 1 - Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Select the document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Select the @SectionName from the list of sections
	Then the user validates that the user is on the 'IBP Plan Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'IBP Plan Shell Tab' page

	# Step 4 - In @GridName, The first column of the grid (related to the description/code of the dimensions) is displayed
	Then the user validates that the 'Aggrid Column Header Name' with value 'M1' is displayed

	Examples:
	| DocProcessYear | DocShellModel  | DocWeek | DocMonth | SectionName					|  GridName           | DocumentID |
	| CBP_2020       | SHELL_DEMO2_2  | 6       | 2        | [GUIGWPLANDOC.SEC_P&L_DEMO2_2] | GRID_FR_P&L_DEMO2_2 | 131        | 