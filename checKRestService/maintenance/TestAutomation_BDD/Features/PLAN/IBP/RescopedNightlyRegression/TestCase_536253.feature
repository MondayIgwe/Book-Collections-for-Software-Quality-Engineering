Feature: TestCase_536253
	AGGRRULE=SUM and SPLIT=EMPTY

@BDD_517178 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_SPLIT_002
	# Step 1 - Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Select the @SectionName from the list of sections
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page
	
	# Step 4 - Open filter on customer "F_MEASURE3", "F_MEASURE4", @Filter1, @Filter2, Deselect all the choises, Select @Customer and @Month
	When the user changes the filter on Filter Name: '<Filter1>' to Filter Value: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter2>' to Filter Value: '<Month>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 5 - In @GridName, select @AggCell (at the aggregate level), Set @Value
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>' and Column: 'M2|MEASUR2'
	
	# Step 6 - The value of @AggCell is @Value The values of the cell @Measure, @ProdCell1, @Customer, @Month is @Value1
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>' and Column: 'M2|MEASUR2' and has the Text: '<Value>'
	
	# Step 7 - Update and Close the document
	When the user clicks on 'Button' with value 'UPDATE'

	Examples:
	| DocProcessYear | DocShellModel  | DocWeek | DocMonth | SectionName    | Filter1      | Filter2      | Customer  | Month | GridName           | Value | Measure | ProdCell | Value1 | DocumentID |
	| CBP_2020       | SHELL_MEASURES | 1       | 1        | SEC_MEASURES_1 | [F_MEASURE3] | [F_MEASURE4] | EC91603_4 | M2    | GRID_FR_MEASURES_1 | 459   | MEASUR2 | 100      | 114    |   132      |