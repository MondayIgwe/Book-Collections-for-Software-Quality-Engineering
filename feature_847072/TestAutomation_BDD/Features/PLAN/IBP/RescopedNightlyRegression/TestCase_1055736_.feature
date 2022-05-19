Feature: TestCase_1055736

@RESCOPED_BDD_1055736 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_FILTERS_Propagation_006-CASE 6
	# Step 1 - Open IBP Document Navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, @DocWeek, @DocMonth, @DocProcessYear 
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'

	# Step 3 - Expected - Document opens correctly
	Then the user validates that column 'Process Year' contains '<DocProcessYear>' with row text '<DocProcessYear>'
	And the user validates that column 'Month' contains '<DocMonth>' with row text '<DocMonth>'
	And the user validates that column 'Document Shell Model' contains '<DocShellModel>' with row text '<DocShellModel>'
	And the user validates that column 'Week' contains '<DocWeek>' with row text '<DocWeek>'
	When the user clicks on the link with value '<DocumentID>' on the grid

	# Step 4 - Select @SectionName from the list of sections
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 5 - Open @Filter1, @Filter2 at shell level, Deselect all the choises Select @Customer,@Customer1
	When the user changes the filter on Filter Name: '[FILTER_PLANTO]' to Filter Value: '<CustomerFilter1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '[FILTER_GROUP1]' to Filter Value: '<CustomerFilter2>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 6 - Insert values 
	And the user enters the Text: 'Test' on the Aggrid Grid Table Name: '<GridName>' at Row: '<CustomerFilter2>' and Column: 'W1|M_TEST1' 
	
	# Step 7 - In @GridName, check the value displayed in the first column based, @Customer2,@Customer is not displayed
	Then the user validates that the Aggrid Table with the value '<CustomerFilter2>' is displayed in IBP
	And the user validates that the Aggrid Table with the value '<CustomerFilter1>' is not displayed in IBP

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName | CustomerFilter1 | CustomerFilter2 | DocumentID |
	| CBP_2020       | SHELL_FILTERS | 17      | 4        | SC_FILTERS1 | EC86550_1       | EC93849_4       | 143        |