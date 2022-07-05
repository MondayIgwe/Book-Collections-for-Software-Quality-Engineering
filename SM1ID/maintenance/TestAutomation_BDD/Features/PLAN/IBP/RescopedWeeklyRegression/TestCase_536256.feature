Feature: TestCase_536256

@BDD_536256 @PLAN_Weekly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_SPLIT_005-AGGRRULE=AVG with no weight and SPLIT=EMPTY
	# Step 1 - Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Select the @SectionName from the list of sections
	Then the user validates that the user is on the 'IBP Plan Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'IBP Plan Shell Tab' page
	
	# Step 4 - Open filter on customer "F_MEASURE3" @Filter1
	# Deselect all the choices
	# Select @Customer
	# Open filter on month "F_MEASURE4" @Filter2
	# Deselect all the choices
	# Select @Month
	When the user changes the Combo Label: '<Filter1>' to Combo Label: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the Combo Label: '<Filter2>' to Combo Label: '<Month>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

	# Step 5 - In @GridName, select @AggCell (at the aggregate level), Set @Value
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>' and Column: '<Month>|<Measure>'

	# Step 6 - The value of @AggCell (at the aggregate level) is @Value
	# The value of the cell @Measure, @ProdCell1, @Customer, @Month is @Value1
	# The value of the the cell @Measure, @ProdCell2, @Customer, @Month is @Value1
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>' and Column: '<Month>|<Measure>' and has the Text: '<Value>'
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<ProdCell1>' and Column: '<Month>|<Measure>' and has the Text: '<Value1>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<ProdCell2>' and Column: '<Month>|<Measure>' and has the Text: '<Value1>'
	
	# Step 7 - Update and Close the document
	When the user clicks on the 'Calculation Update Button'

	Examples:
	| DocProcessYear | DocShellModel  | DocWeek | DocMonth | SectionName    | Filter1      | Filter2      | Customer  | Month | GridName           | Value | Value1 | AggCell    | Measure | ProdCell1 | ProdCell2 | DocumentID |
	| CBP_2020       | SHELL_MEASURES | 1       | 1        | SEC_MEASURES_1 | [F_MEASURE3] | [F_MEASURE4] | EC94100_4 | M2    | GRID_FR_MEASURES_1 | 23    | 3      | M2,MEASUR5 | MEASUR2 | 101       | 103       | 132        |