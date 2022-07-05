Feature: TestCase_642470

@BDD_642470 @PLAN_Weekly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_APPLY_VALUE_ROL_MEAS_AGG_007-US425392-AC5-Example 1
	# Step 1 - Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open the document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'

	# Step 3 - Expected - Document opens correctly
	Then the user validates that column 'Process Year' contains '<DocProcessYear>' with row text '<DocProcessYear>'
	And the user validates that column 'Month' contains '<DocMonth>' with row text '<DocMonth>'
	And the user validates that column 'Document Shell Model' contains '<DocShellModel>' with row text '<DocShellModel>'
	And the user validates that column 'Week' contains '<DocWeek>' with row text '<DocWeek>'
	When the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Select @SectionName from the list of sections
	Then the user validates that the user is on the 'IBP Plan Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'IBP Plan Shell Tab' page

	# Step 4 - Open @Filter1, @Filter2, on customer, Month, Deselect all options, Select @Customer, @Month, @Month, Press on the "OK" button
	When the user changes the Combo Label: '<Filter>' to Combo Label: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the Combo Label: '<Filter1>' to Combo Label: '<Month>,<Month1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

	# Step 5 - In the @GridName, select the cell @Measure, @Customer, @ProdCell, @Month
	# Right-click the cell @Measure, @ProdCell, @Month
	# Select @Block, Select @BlockType
	And the user right clicks on the Aggrid Grid table at Row: '<Customer>|<ProdCell>|<Measure>' and Column: '<Month>' and Selects: '<Block> > <BlockType>'

	# In the @GridName, select the cell @Measure, @ProdCell, @Year
	# Right-click on the cell @Measure, @ProdCell, @Year
	# Select @ApplyValue
	# Select @ApplyType
	And the user right clicks on the Aggrid Grid table at Row: '<Customer>|<ProdCell>|<Measure>' and Column: '<Year>' and Selects: '<ApplyValue> > <ApplyType>'
	Then the user validates that the 'Text Containing' with value 'Absolute' is displayed
	And the user validates that the 'Popup Ok Button' with value 'Absolute' is displayed
	
	# Step 6 - In the pop-up, edit @Value, Click on "OK" button
	When the user enters '<Value>' into the Aggrid context 'Absolute' pop up menu

	# Step 7 - Expected: 1. The value on the cell @Measure, @ProdCell, @Year is @Value
	# 2. The value at the cell at @Measure, @ProdCell, @Month is empty
	# 3. The value at the cell at @Measure, @ProdCell, @Month1 is @Value
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<ProdCell>|<Measure>' and Column: '<Year>' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<ProdCell>|<Measure>' and Column: '<Month>' and has the Text: '<>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<ProdCell>|<Measure>' and Column: '<Month1>' and has the Text: '<Value>'

	# Step 8 - In the @GridName, select the cell @Measure, @ProdCell, @Year
	# Right-click on the cell @Measure, @ProdCell, @Year
	# Select @Block, Select @BlockType
	# Right-click on the cell @Measure, @ProdCell, @Year
	# Select @ApplyValue
	# Check if the options are disabled
	# The available options: New Value Percentage Absolute are disabled.
	And the user validates that the '<Block> > <BlockType>' on the Aggrid Grid table at row: '<Customer>|<ProdCell>|<Measure>' and column: '<Year>' is disabled
	And the user validates that the 'Apply value> > <ApplyValue>' on the Aggrid Grid table at row: '<Customer>|<ProdCell>|<Measure>' and column: '<Year>' is disabled

	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName       | Filter             | Filter1             | Month | Month1 | ProdCell | Customer  | GridName               | Measure   | Block | BlockType | Year | ApplyValue  | ApplyType | DocumentID | Value |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | SC_ROLMEAS_NOTAGG | [FLT_ROLMEAS_CUST] | [FLT_ROLMEAS_MONTH] | M2    | M3     | 07_5     | EC86195_4 | GRID_FR_ROLMEAS_NOTAGG | MEAS1_ROL | Block | Cell(s)   | 2020 | Apply value | Absolute  | 142        | 58.00 |