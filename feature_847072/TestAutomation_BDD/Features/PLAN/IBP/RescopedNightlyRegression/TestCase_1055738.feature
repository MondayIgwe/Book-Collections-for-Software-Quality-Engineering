Feature: TestCase_1055738

@RESCOPED_BDD_1055738 @PLAN_Nightly @PLAN @Regression
Scenario: WEB_TPM_IBP_FILTERS_Propagation_007-CASE 7
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

	# Step 5 - Open @Filter1, Deselect all the choices, Click on "OK" button
	When the user changes the filter on Filter Name: '<Filter1>' to Filter Value: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 6 - The @GridName is not shown
	Then the user validates that the 'Grid Name' with value '<GridName>' is not present
	
Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName | Filter1        | Filter2         | Customer  |  GridName       | MonthFilters| DocumentID |
	| CBP_2020       | SHELL_FILTERS | 17      | 4        | SC_FILTERS  | [FILTER_WEEK1] | [FILTER_GROUP1] | W10       |  GRID_FR_FILTER |M4           | 143        |