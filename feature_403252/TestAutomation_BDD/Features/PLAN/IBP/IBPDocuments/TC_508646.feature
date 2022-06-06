Feature: TestCase_508646

@BDD_508646 @PLAN_Nightly @PLAN
Scenario: 508646_BDD_WEB_TPM_IBP_FILTERS - Filter on shell-001
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
	When the user changes the filter on 'Customer Filter' to '<CustomerFilter>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '[FLT_MONTH]' to '<MonthFilters>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	#Step 5
	Then the user validates that the Aggrid Grid has the Top Column Header '<FilterValue1>' in IBP
	And the user closes all pages without saving the work done where there is no pop up


    Examples: 
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                    | DocumentID | CustomerFilter | MonthFilters | FilterValue1 |
	| CBP_2020       | SHELL_DEMO2_2 | 6       | 2        | [GUIGWPLANDOC.SEC_P&L_DEMO2_2] | 131        | EC91603_4      | M1,M2        | M1           |