Feature: TestCase_821647

@BDD_821647 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_APPLYVALUE_AGG_003 - Apply new value for a portion of cells in an aggregated grid
	# Step 1 - Go to 'IBP Documents' Navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Select the document containing an aggregated grid with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Open @section with an aggregated grid
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 4 - Open @Filter1,@Filter2, Select @Cust,@Month1, @Month2
	When the user changes the filter on Filter Name: 'Customer Filter' to Filter Value: '<CustomerFilters>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '[FLT_MONTH]' to Filter Value: '<MonthFilters>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 5 - Insert @Value1 in the pop-up, Press on the "OK" button
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'PRICE_PY' and Column: 'M1'
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'PRICE_PY' and Column: 'M2'
	
	# Step 6 - @AggCell value is @Value1
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'PRICE_PY' and Column: 'M1' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'PRICE_PY' and Column: 'M2' and has the Text: '<Value>'
	
	# Step 7 - Update and Close the document without saving
	When the user clicks on 'Button' with value 'UPDATE'

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                    | DocumentID | CustomerFilters | MonthFilters | GridName                 | Value |
	| CBP_2020       | SHELL_DEMO2_2 | 6       | 2        | [GUIGWPLANDOC.SEC_P&L_DEMO2_2] | 131        | EC91603_4       | M1,M2        | GRID_FR_BASELINE_DEMO2_2 |	0   |