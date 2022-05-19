Feature: TestCase_847072

@BDD_847072 @PLAN_Weekly @PLAN @Regression
Scenario: WEB_TPM_IBP_Multihierarchy_AggRules_003
	# Step 1 - Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	When the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Select @SectionName from the list of sections
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 7 - Open the filter defined for measures @FILTER1, @FILTERPROD ,Select @PROD, Deselect all choices, Select @MEAS, @PROD1,@PROD2
	When the user changes the filter on Filter Name: '<FILTER1>' to Filter Value: '<MEAS>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<FILTERPROD>' to Filter Value: '<PROD1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<FILTERPROD>' to Filter Value: '<PROD2>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 8 - In @GridName, select the cell @AggCell,@AggCell2,@AggCell3 Insert @Value,@Value
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86507_1|030' and Column: 'MEAS_MH5|WM4'
	And the user enters the Text: '<Value2>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86507_1|031' and Column: 'MEAS_MH5|WM4'
	
	# Step 9 - Validate The value of @AggCell,@AggCell2, @AggCell3 is @Value,@Value2,Value3
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86507_1|030' and Column: 'MEAS_MH5|WM4' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86507_1|031' and Column: 'MEAS_MH5|WM4' and has the Text: '<Value2>'

	# Step 10 - Update and Close the document
	When the user clicks on 'Button' with value 'UPDATE'

	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                    | FILTER1        | FILTERPROD        | MEAS     | PROD1 | PROD2 | GridName        | Value | Value2 | Value3 | DocumentID |
	| CBPMH_2020     | SHELL_MADAMH1 | 6       | 2        | [GUIGWPLANDOC.SECTION_MADAMH1] | [FLT_FR11MEAS] | [FLT_PRODASSONEW] | MEAS_MH5 | 030   | 031   | GRID_FR_MADAMH1 | 5     | 8      | 100    | 147        |