Feature: TestCase_615650


@BDD_615650 @PLAN_Weekly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_FORMULA_003-SOURCE Case3
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

	# Step 4 - Open filter @Filter on customer
	# Deselect all the choices
	# Select @Customer
	# Open filter @Filter1 on month
	# Deselect all the choices
	# Select @Month
	When the user changes the Combo Label: '<Filter1>' to Combo Label: '<Month>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the Combo Label: '<Filter>' to Combo Label: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

	# Step 5 - In @GridName, select @Measure, @ProdCell1, @Customer1, @Month
	# Edit @Value
	# Press the "Update" button
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer1>|<ProdCell1>' and Column: '<Month>|<Measure>'	

	# Step 6 - The value of @Measure, @ProdCell1, @Customer1, @Month is @Value
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer1>|<ProdCell1>' and Column: '<Month>|<Measure>' and has the Text: '<Value>'

	# Step 7 - Press on the "Update" button and Close document
	When the user clicks on the 'Calculation Update Button'
	And the user closes all pages without saving the work done

	# Step 8 - Select @SectionName1
	And the user clicks on the link with value '<DocumentID>' on the grid
	Then the user validates that the user is on the 'IBP Plan Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'IBP Plan Shell Tab' page

	# Open filter @Filter2 on customer
	# Deselect all the choices
	# Select @Customer
	When the user changes the Combo Label: '<Filter2>' to Combo Label: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

	# Step 9 - In @GridName1, check the value of @Measure1, @ProdCell1, @Customer, @Month
	# The value of @Measure1, @ProdCell1, @Customer, @Month is @Value1
	Then the user validates on the Aggrid Grid Table Name: '<GridName1>' at Row: '<Customer>|<ProdCell1>' and Column: '<Month>|<Measure1>' and has the Text: '<Value1>'

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName | SectionName1 | Filter                | Filter1            | Filter2               | FirstValue | GridName         | GridName1        | Customer  | Customer1 | Month | DocumentID | Measure | Measure1 | ProdCell1 | Value  | Value1    |
	| CBP_2020       | SHELL_SOURCE  | 15      | 4        | SC_SOURCE3B | SC_SOURCE3   | [FLT_SOURCE_PLANTO3B] | [FLT_SOURCE_MONTH] | [FLT_SOURCE_PLANTO3A] | M10        | GRID_FR_SOURCE3B | GRID_FR_SOURCE3A | EC86553_1 | EC99999_6 | M1    | 139        | MEAS11  | MEAS10   | 100       | 100.00 | 15,988.00 |
