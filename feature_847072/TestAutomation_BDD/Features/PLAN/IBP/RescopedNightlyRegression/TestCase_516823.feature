Feature: TestCase_516823


@RESCOPED_BDD_516823 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_STRING_004-Split when Aggrule=DISTINCTCOUNT
	# Step 1 - Open IBP Document Navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Open @SectionName from the list of sections
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 4 - Open the filter "F_String2" at section level @Filter1, Deselect all the choices and select @FilterValue and Confirm the selection
	When the user changes the filter on Filter Name: '[F_STRING2]' to Filter Value: 'EC94101_4' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 5 - In @GridName, select @AggCell,@Customer and Insert @Value
	And the user enters the Text: 'Test (4)' on the Aggrid Grid Table Name: '<GridName>' at Row: '<CustomerFilters>' and Column: 'M1|STRING2'
	
	# Step 6 - The values of the cell@AggCell is updated with @Value and the cells below have the @Value
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<CustomerFilters>' and Column: 'M1|STRING2' and has the Text: 'Test (4)'
	
	# Step 7 - Press the button "Update", 
	When the user clicks on 'Button' with value 'UPDATE'

	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                 | CustomerFilters | MonthFilters | DocumentID | Value | GridName		|
	| CBP_2020       | SHELL_STRING  | 10      | 3        | [GUIGWPLANDOC.SEC_STRING_1] | EC94101_4       | M4           | 138        | 100   | GRID_FR_STRING_1|