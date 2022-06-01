Feature: TestCase_600716 

@BDD_600716  @PLAN_Weekly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_SPLIT_ROL_MEAS_001
	# Step 1 - Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear
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

	# Step 3 - Select @SectionName from the list of sections
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 4 - Open filter @Filter1, @Filter2, @Filter3 on customer, category, measure, Deselect all the choises, Select @Customer,@Category Open filter @Filter1 on category, Press on the "OK" button
	When the user changes the filter on Filter Name: '<Filter2>' to Filter Value: '<Category>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter3>' to Filter Value: '<Measure1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter3>' to Filter Value: '<Measure3>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter1>' to Filter Value: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter3>' to Filter Value: '<Measure2>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

	# Step 5 - In @GridName, set @Value1 for @ProdCell, MEAS1, @Quarter, 
	And the user enters the Text: '<Value1>' on the Aggrid Grid Table Name: '<GridName>' at Row: '08_5|MEAS2_ROL' and Column: '<Month>'	

	# Step 6 - In @GridName, set @Value2 for @ProdCell, MEAS2, @Quarter
	And the user enters the Text: '<Value2>' on the Aggrid Grid Table Name: '<GridName>' at Row: '08_5|MEAS2_ROL' and Column: '<Quarter>'	
	And the user enters the Text: '<Value3>' on the Aggrid Grid Table Name: '<GridName>' at Row: '08_5|MEAS2_ROL' and Column: '<Year>'	

	# Step 7 - Press the button "Update"
	When the user clicks on 'Button' with value 'UPDATE'

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | DocumentID | SectionName    | Filter1            | Filter2            | Filter3             | Customer  | Category | Month | GridName            | Measure1  | Measure2  | Measure3  | Measure4  | Measure5  | Year | Value1 | Value2 | ProdCell | Quarter | Value3 |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | 142        | SC_ROLMEAS_AGG | [FLT_ROLMEAS_CUST] | [FLT_ROLMEAS_PROD] | [FLT_ROLMEAS_MEAS1] | EC86195_4 | 08_5     | M1    | GRID_FR_ROLMEAS_AGG | MEAS1_ROL | MEAS2_ROL | MEAS3_ROL | MEAS5_ROL | MEAS6_ROL | 2020 | 50     | 20     | 08_5     | T1      | 70     |
