Feature: TestCase_742768

@BDD_742768 @PLAN_Weekly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_ROLMATRIX_001
	# Step 1 - Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear
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
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 4 - In @GridName, set @Value for @Customer, @Meas, @Month1
	When the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>' and Column: '2020|BASELINE' 
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>' and Column: 'M1|BASELINE' 
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86195_4|08_5' and Column: '2020|BASELINE' 
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86195_4|08_5|100' and Column: '2020|BASELINE' 

	# Step 5 - Click on the "Update" button
	When the user clicks on 'Button' with value 'UPDATE'

	# Step 6 - 1. The value for: @Customer, @Meas, @Month1 is @Value;
	#          2. The value for: @Customer, @Product, @Month1, @Meas is @Value.
	#          3. The value for: @Customer, @Product, @ChildProd, @Month1, @Meas is @Value2.
    #          4. The value for: @Customer, @Meas, @Year is @Value.
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>' and Column: '2020|BASELINE' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>' and Column: 'M1|BASELINE' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86195_4|08_5' and Column: '2020|BASELINE' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86195_4|08_5|100' and Column: '2020|BASELINE' and has the Text: '<Value2>'

	# Step 7 - In @GridName, set @Value for @Customer, @Product, @ChildProd, @Meas, @Month2
	When the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>' and Column: '2020|BASELINE' 
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>' and Column: 'M2|BASELINE' 
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86195_4|08_5' and Column: '2020|BASELINE' 
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86195_4|08_5|100' and Column: '2020|BASELINE' 

	# Step 8 - Click on the "Update" button
	When the user clicks on 'Button' with value 'UPDATE'

	# Step 9 - 1. The value for: @Customer, @Meas, @Month2 is @Value.
	#          2. The value for: @Customer, @Product, @Meas, @Month2 is @Value.
	#          3. The value for: @Customer, @Product, @ChildProd, @Meas, @Month2 is @Value.
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>' and Column: '2020|BASELINE' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>' and Column: 'M2|BASELINE' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86195_4|08_5' and Column: '2020|BASELINE' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86195_4|08_5|100' and Column: '2020|BASELINE' and has the Text: '<Value>'

	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                    | Meas     | Customer  | GridName        | Value | Value2 | DocumentID | Month | ChildProd | Product | Year | Month2 |
	| CBP_2020       | SHELL_MATRIX1 | 2       | 1        | [GUIGWPLANDOC.SECTION_MATRIX1] | BASELINE | EC86195_4 | GRID_FR_MATRIX1 | 100   | 25     | 144        | M1    | 100       | 08_5    | 2020 | M2     |