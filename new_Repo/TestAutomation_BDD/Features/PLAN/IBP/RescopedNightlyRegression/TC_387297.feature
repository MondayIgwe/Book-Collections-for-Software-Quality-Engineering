Feature: TC_387297

@RESCOPED_BDD_387297 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_FILTERS_Propagation_007-CASE 7
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
	When the user changes the filter on '[FILTER_PLANTO]' to '<CustomerFilter1>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '[FILTER_GROUP1]' to '<CustomerFilter2>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	#Step 5
	And the user enters the text 'Test' on the Aggrid Grid table '<GridName>' at row: '<CustomerFilter2>' and column: 'W1|M_TEST1' 
	#Step 6
	Then the user validates that the Aggrid Table with the value '<CustomerFilter2>' is displayed in IBP
	And the user validates that the Aggrid Table with the value '<CustomerFilter1>' is not displayed in IBP
	#Step 7
	And the user closes all pages without saving the work done where there is no pop up

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName | CustomerFilter1 | CustomerFilter2 | DocumentID |
	| CBP_2020       | SHELL_FILTERS | 17      | 4        | SC_FILTERS1 | EC86550_1       | EC93849_4       | 143        |