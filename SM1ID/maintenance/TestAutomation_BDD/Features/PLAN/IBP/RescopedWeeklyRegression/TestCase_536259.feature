Feature: TestCase_536259

@BDD_536259 @PLAN_Weekly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_SPLIT_009-AGGRRULE=MAX and SPLIT=MEAS
	# Step 1 - Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '132' on the grid

	# Step 3 - Select the @SectionName from the list of sections
	Then the user validates that the page with 'Toolbar Page Name' with value 'Summary' is loaded
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the page with 'Toolbar Page Name' with value 'Shell' is loaded
	
	# Step 4 - Open filter on customer "F_MEASURE3" @Filter1
	# Deselect all the choices
	# Select @Customer
	# Open filter on month "F_MEASURE4" @Filter2
	# Deselect all the choices
	# Select @Month
	When the user changes the filter on Filter Name: '<Filter1>' to Filter Value: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter2>' to Filter Value: '<Month>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 5 - In @GridName, select @AggCell (at the aggregate level), Set @Value
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>' and Column: '<Month>|<Measure>'

	# Step 6 - The value of @AggCell (at the aggregate level) is @Value
	# The value of the cell @Measure, @ProdCell1, @Customer, @Month is @Value
	# The values of the cell @Measure, @ProdCell2, @Customer, @Month is empty
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>' and Column: '<Month>|<Measure>' and has the Text: '<Value>'
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<ProdCell1>' and Column: '<Month>|<Measure>' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<ProdCell2>' and Column: '<Month>|<Measure>' and has the Text: '<>'
	
	# Step 7 - Update and Close the document
	When the user clicks on the 'Calculation Update Button'

	Examples:
	| DocProcessYear | DocShellModel  | DocWeek | DocMonth | SectionName    | Filter1      | Filter2      | Customer  | Month | GridName           | Value | Value1 | AggCell    | Measure | ProdCell1 | ProdCell2 |
	| CBP_2020       | SHELL_MEASURES | 1       | 1        | SEC_MEASURES_2 | [F_MEASURE3] | [F_MEASURE4] | EC95054_4 | M2    | GRID_FR_MEASURES_2 | 90    | 3      | M2,MEASUR9 | MEASUR9 | 101       | 103       |