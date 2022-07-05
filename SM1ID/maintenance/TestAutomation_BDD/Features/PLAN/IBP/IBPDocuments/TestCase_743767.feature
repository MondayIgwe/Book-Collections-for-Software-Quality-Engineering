Feature: TestCase_743767

@BDD_743767 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_ROLMEAS_MATRIX_002
	# Step 1 - Go to 'IBP Documents' Navigator

	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document  with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Open @sectionName
	Then the user validates that the user is on the 'IBP Plan Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'IBP Plan Shell Tab' page

	# Step 4 - Open the @FilterName, Select @FilterValue
	When the user changes the Combo Label: '<FilterName>' to Combo Label: '<FirstValue>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 5 - In @GridName, set @Value for @Customer, @Product, @Meas1, @Year
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Product>|<Meas1>' and Column: 'M10'
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Product>|<Meas1>' and Column: '2020'
	
	# Step 6 - 1. The value for: @Customer, @Product, @Meas1, @Year is @Value;
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Product>|<Meas1>' and Column: 'M10' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Product>|<Meas1>' and Column: '2020' and has the Text: '<Value>'
	
	# Step 7 - Update and Close the document without saving
	When the user clicks on the 'Calculation Update Button'

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                       | FilterName          | FirstValue | GridName           | Value | Customer  | Product | Meas1    | Year | Month1  | Meas2 | DocumentID |
	| CBP_2020       | SHELL_MATRIX3 | 99      | 99       | [GUIGWPLANDOC.SECTION_MATRIXNEW3] | [FLT_ROLMEAS_MONTH] | M10        | GRID_FR_MATRIXNEW3 | 500   | EC86195_4 | 08_5    | BASELINE | 2020  | M10  | TOT_VOL | 146   |