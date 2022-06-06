Feature: TestCase_637886

@RESCOPED_BDD_637886 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_FILTERS_ROL_MEAS_NOTAGG_002
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
	When the user changes the filter on '[FLT_ROLMEAS_CUST]' to 'EC86195_4' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '[FLT_ROLMEAS_PROD]' to '07_5' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '[FLT_ROLMEAS_MEAS2]' to 'MEAS2_ROL' and filters with 'User Code', 'Like' in the IBP Shell Tab
	#Step 5
	And the user closes all pages without saving the work done where there is no pop up

	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName       | CustomerFilters | MonthFilters | DocumentID |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | SC_ROLMEAS_NOTAGG | EC86195_4       | M4           | 142        |