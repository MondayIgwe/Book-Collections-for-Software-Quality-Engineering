Feature: TestCase_846640

@BDD_846640 @PLAN_Weekly @PLAN @Regression
Scenario: WEB_TPM_IBP_Multihierarchy_AggRules_002
	# Step 1 - Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on '<DocumentID>' text on the grid

	# Step 3 - Select @SectionName from the list of sections
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 4 - Open the filter defined for measures @FILTER1 - @MEAS
	When the user changes the filter on Filter Name: '<Filter1>' to Filter Value: '<MEAS>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 7 - Open the filter defined for measures @FILTERPROD - PROD1
	And the user changes the filter on Filter Name: '<FilterProd>' to Filter Value: '<Prod1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 8 - In @GridName, select the cell @AggCell2 and Insert is @Value2
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86507_1' and Column: 'MEAS_MH10|WM1'
	And the user enters the Text: '<Value2>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86507_1|042' and Column: 'MEAS_MH10|WM2'
	
	# Step 9 - Validate values that the values in @AggCell2 is @Value2
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86507_1|042' and Column: 'MEAS_MH10|WM2' and has the Text: '<Value2>'
	
	# Step 10 - Open the filter defined for measures @FILTERPROD  PROD2
	When the user changes the filter on Filter Name: '<FilterProd>' to Filter Value: '<Prod2>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 11 - In @GridName, select the cell @AggCell3, AggCell4, AggCell5 and Insert @Value3
	And the user enters the Text: '<Value3>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86507_1' and Column: 'MEAS_MH10|WM2'
	And the user enters the Text: '<Value3>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86507_1|043' and Column: 'MEAS_MH10|WM2'
	
	# Step 10 - Validate values that the values in @AggCell3, AggCell4, AggCell5 is @Values3
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86507_1' and Column: 'MEAS_MH10|WM2' and has the Text: '<Value3>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86507_1|043' and Column: 'MEAS_MH10|WM2' and has the Text: '<Value3>'
	
	# Step 11 - Update and Close the document
	When the user clicks on 'Button' with value 'UPDATE'
	And the user closes all pages without saving the work done
	
	# Step 12 - Validate grid is visible before closing the browser
	Then the user validates that the 'Grid Name' with value 'GridContainer' is visible
	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName					   | Filter1        | MEAS      | FilterProd        | Prod1 | Prod2 | Customer  | GridName        | Value | Value2 | Value3 | DocumentID |
	| CBPMH_2020     | SHELL_MADAMH1 | 6       | 2        | [GUIGWPLANDOC.SECTION_MADAMH1] | [FLT_FR11MEAS] | MEAS_MH10 | [FLT_PRODASSONEW] | 042   | 043   | EC91603_4 | GRID_FR_MADAMH1 | 459   | 5      |  5     | 147        |