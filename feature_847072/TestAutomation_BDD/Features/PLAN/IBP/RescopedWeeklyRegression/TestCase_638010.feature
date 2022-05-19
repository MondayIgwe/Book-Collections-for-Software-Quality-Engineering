Feature: TestCase_638010

@BDD_638010 @PLAN_Weekly @PLAN @Regression
Scenario: WEB_TPM_IBP_APPLY_VALUE_ROL_MEAS_AGG_007-US425392-AC5-Example 1
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
	When the user clicks on '<DocumentID>' text on the grid

	# Step 3 - Select @SectionName from the list of sections
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 4 - Open @Filter1, @Filter2, on customer, Deselect all options, Select @Customer, @Month, Press on the "OK" button
	When the user changes the filter on Filter Name: '<Filter1>' to Filter Value: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter2>' to Filter Value: '<Month>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab 

	# Step 5 - In the @GridName, select the cell @Measure, @ProdCell, @Month
	# Right-click on the cell @Measure, @ProdCell, @Month, Select @ApplyValue
	# Step 8  - The available options: Apply selected value, Apply New value, Apply percentage, # Apply absolute are disabled. 
	Then the user validates that the 'Apply value > Selected value' on the Aggrid Grid table at row: '07_5|MEAS15_ROL' and column: '<Month>' is disabled

	# Step 10 - Update and Close the document
	When the user closes all pages without saving the work done
	
	# Step 11 - Validate grid is visible before closing the browser
	Then the user validates that the 'Grid Name' with value 'GridContainer' is visible

	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName    | Filter1            | Filter2             | Month | ProdCell | Customer  | GridName            | Measure   | AppplyValue | DocumentID |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | SC_ROLMEAS_AGG | [FLT_ROLMEAS_CUST] | [FLT_ROLMEAS_MONTH] | M2    | 07_5     | EC91603_4 | GRID_FR_ROLMEAS_AGG | MEAS4_ROL | Apply value | 142        |