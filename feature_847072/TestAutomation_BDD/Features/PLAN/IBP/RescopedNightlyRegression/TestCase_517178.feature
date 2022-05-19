Feature: TestCase_517178
	Formula with Aggrule=DISTINCTCOUNT

@BDD_517178 @PLAN_Nightly @PLAN @Regression
Scenario: WEB_TPM_IBP_STRING_006
	# Step 1 - Go To 'IBP Documents' navigator
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

	# Step 4 - Open the filter "F_String2" at section level @Filter1, Deselect all the choices and select @FilterValue
	When the user changes the filter on Filter Name: '<Filter1>' to Filter Value: '<FilterValue>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 5 - In @GridName, select cell @Measure, @ProdCell1, @Customer, @Month and Insert @Value
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<FilterValue>' and Column: 'M1|STRING2'	
	
	# Step 6 - The values of the cell is @Value, the value of the aggregated cell @AggCell is @Value1
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<FilterValue>' and Column: 'M1|STRING2' and has the Text: 'X (4)'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC94721_4|103' and Column: 'T1|STRING2' and has the Text: '<Value1>'
	
	# Step 7 - Update and Close the document
	When the user closes all pages without saving the work done

	# Step 8 - Repeat step 2 to 6
	When the user clicks on '<DocumentID>' text on the grid
	And the user selects a section '<SectionName>' in IBP Summary Tab
	And the user changes the filter on Filter Name: '<Filter1>' to Filter Value: '<FilterValue>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

	# Step 9 - In @GridName, check the value of the cell related to the formula @Measure1, @ProdCell1, @Customer, @Month, The value is @Value2
	And the user enters the Text: '<Value2>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<FilterValue>' and Column: 'M1|STRING2'
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<FilterValue>' and Column: 'M1|STRING2' and has the Text: '1 (4)'
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC94721_4|103' and Column: 'T1|STRING2' and has the Text: '1 (1)'
	
	# Step 10 - Update and Close the document
	When the user clicks on 'Button' with value 'UPDATE'

	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                 | CustomerFilters | MonthFilters | Filter1     | FilterValue | GridName         | Measure | ProdCell | Month | Value | Value1 | Measure1        | Value2 | DocumentID |
	| CBP_2020       | SHELL_STRING  | 10      | 3        | [GUIGWPLANDOC.SEC_STRING_1] | EC94721_4       | M4           | [F_STRING2] | EC94721_4   | GRID_FR_STRING_1 | STRING2 | 103      | M1    | X     | X (1)  | STRING_FORMULA2 | 1      | 138        |