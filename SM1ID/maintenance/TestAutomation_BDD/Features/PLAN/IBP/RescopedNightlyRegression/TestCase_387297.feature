Feature: TestCase_387297

@RESCOPED_387297_BDD_ @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_FILTERS_Propagation_007-CASE 7
	# Step 1 - Open IBP Document Navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, @DocWeek, @DocMonth, @DocProcessYear 
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Select @SectionName from the list of sections
	Then the user validates that the user is on the 'IBP Plan Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'IBP Plan Shell Tab' page

	# Step 4 - Open @Filter1, @Filter2  at shell level, Deselect all the choices, Select @Customer, @Customer1 and Press "OK"
	When the user changes the Combo Label: '<Filter1>' to Combo Label: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the Combo Label: '<Filter2>' to Combo Label: '<Customer1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

	# Step 5 - In @GridName, check the value displayed in the first column based on the choise done in the filters 
	Then the user validates that the 'Aggrid Column Header' with value 'M_TEST1 - M_TEST' is displayed
	
Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName | Filter1         | Filter2         | Customer  | Customer1 | GridName         | MonthFilters| DocumentID |
	| CBP_2020       | SHELL_FILTERS | 17      | 4        | SC_FILTERS1 | [FILTER_PLANTO] | [FILTER_GROUP1] | EC86550_1 | EC93849_4 | GRID_FR_FILTERS1 |M4           | 143        |