Feature: TestCase_278517
	Apply percentage at aggregated level

@RESCOPED_BDD_278517 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_APPLYVALUE_005
	# Step 1 - Open IBP Document Navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Select the document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Select the @SectionName from the list of sections
	Then the user validates that the user is on the 'IBP Plan Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'IBP Plan Shell Tab' page

	# Step 4 - Open filter on customer "F_MEASURE3" @Filter1,"F_MEASURE4" @Filter2,  Deselect all the choises, Select @Customer,
	When the user changes the Combo Label: '[F_MEASURE3]' to Combo Label: '<CustomerFilters>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the Combo Label: '[F_MEASURE4]' to Combo Label: '<MonthFilters>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

	# Step 5 - Right-click the cell @AggCell, select @ApplyValue, select @ApplyType
	And the user enters the Text: '-15' on the Aggrid Grid Table Name: '<GridName>' at Row: '<CustomerFilters>' and Column: 'M4|MEASUR5'
	
	#Step 6 - In the cell @AggCell the value is @Value1
	Then the user validates on the Aggrid Grid Table Name: 'GRID_FR_MEASURES_1' at Row: '<CustomerFilters>' and Column: 'M4|MEASUR5' and has the Text: '-15'
	
	#Step 7 - Update and Close the document without saving
	When the user clicks on the 'Calculation Update Button'

Examples:
	| DocProcessYear | DocShellModel  | DocWeek | DocMonth | SectionName    | CustomerFilters | MonthFilters | DocumentID |
	| CBP_2020       | SHELL_MEASURES | 1       | 1        | SEC_MEASURES_1 | EC94100_4       | M4           | 132        |