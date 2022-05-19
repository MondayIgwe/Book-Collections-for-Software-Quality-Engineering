Feature: TestCase_642627

@BDD_642627 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_AGGREGATION_ROL_MEAS_NOTAGG_006-US425392-AC4-Example 1
	# Step 1 - Open IBP Document Navigator
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

	# Step 4 - Open the @Section Name
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 5 - Open the @FLT_ROLMEAS_CUST,@FLT_ROLMEAS_MONTH filter set on customer,month, Deselect all options, Select @Customer,@Month, @Month1 - Press on the "OK" button
	When the user changes the filter on Filter Name: '<FLT_Rolmeas_Month>' to Filter Value: '<Month>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<FLT_Rolmeas_Month>' to Filter Value: '<Month1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<FLT_Rolmeas_Prod>' to Filter Value: '<ProdCell>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<FLT_Rolmeas_Meas>' to Filter Value: '<Measure>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<FLT_Rolmeas_Meas>' to Filter Value: '<Measure1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<FLT_Rolmeas_Customer>' to Filter Value: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	

	# Step 6 - In the @GridName, select the cell @Measure, @Customer, @ProdCell, @Month
	# Step 7 - Right-click the cell, Select @Block, Select @BlockType, Select the cell @Measure @Customer, @ProdCell @Month1, Set @Value, Press on the "Update" button
	And the user right clicks on the Aggrid Grid table at Row: 'EC94101_4|07_5|MEAS2_ROL' and Column: '<Month1>' and Selects: 'Block > Cell(s)'
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC94101_4|07_5|MEAS2_ROL' and Column: '<Month1>'
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC94101_4|07_5|MEAS2_ROL' and Column: '<Quarter>'
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC94101_4|07_5|MEAS2_ROL' and Column: '<Year>'
	
	# Step 8 - Expected:
				#1. The value for the cell @Measure, @Customer, @ProdCell, @Month is empty. 
				#2. The value for the cell @Measure, @Customer, @ProdCell, @Month1 is @Value. 
				#3. The value for the cell @Measure, @Customer, @ProdCell, @Quarter is @Value.
				#4. The value for the cell @Measure, @Customer, @ProdCell, @Year is @Value.
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC94101_4|07_5|MEAS2_ROL' and Column: '<Month1>' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC94101_4|07_5|MEAS2_ROL' and Column: '<Quarter>' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC94101_4|07_5|MEAS2_ROL' and Column: '<Year>' and has the Text: '<Value>'

	# Step 9 - Update and Close the document without saving
	When the user clicks on 'Button' with value 'UPDATE'
	
Examples:  
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName       | DocumentID | Customer  | Month | Month1 | FLT_Rolmeas_Customer | FLT_Rolmeas_Prod   | FLT_Rolmeas_Month   | FLT_Rolmeas_Meas    | Measure   | Measure1  | GridName               | ProdCell | Block | BlockType | Value | Quarter | Year |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | SC_ROLMEAS_NOTAGG | 142        | EC94101_4 | M1    | M2     | [FLT_ROLMEAS_CUST]   | [FLT_ROLMEAS_PROD] | [FLT_ROLMEAS_MONTH] | [FLT_ROLMEAS_MEAS2] | MEAS1_ROL | MEAS2_ROL | GRID_FR_ROLMEAS_NOTAGG | 07_5     | Block | Cell(s)   | 55    | T1      | 2020 |

