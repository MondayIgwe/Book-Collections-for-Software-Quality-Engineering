Feature: TestCase_846635

@BDD_846635 @PLAN_Weekly @PLAN @Regression
Scenario: WEB_TPM_IBP_Multihierarchy_AggRules_001
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

	# Step 7 - Open the filter defined for measures @FILTERPROD,Select @PROD, Deselect all choices
	When the user changes the filter on Filter Name: '<FILTERPROD>' to Filter Value: '<PROD>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 8 - In @GridName, select the cell @AggCell and Insert is @Value
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'ORDER_DISC' and Column: 'EC87135_1|WM5'
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'ORDER_DISC|SPW2_043' and Column: 'EC87135_1|WM5'
	
	# Step 9 - Validate that the values in @AggCell, @AggCell2 is @Value
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'ORDER_DISC' and Column: 'EC87135_1|WM5' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'ORDER_DISC|SPW2_043' and Column: 'EC87135_1|WM5' and has the Text: '<Value>'

	# Step 10 - Update and Close the document
	When the user clicks on 'Button' with value 'UPDATE'

	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName					     | FILTERPROD      | PROD     | GridName         | Value | DocumentID |
	| CBPMH_2020     | SHELL_MADAMH5 | 2       | 1        | [GUIGWPLANDOC.SECTION77_MADAMH1] | [FLT_FR77PROD3] | SPW2_043 | GRID_FR77_MADAMH | 100   | 148        |