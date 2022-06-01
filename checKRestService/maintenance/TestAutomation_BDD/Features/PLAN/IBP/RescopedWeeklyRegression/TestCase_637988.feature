Feature: TestCase_637988

@BDD_637988  @PLAN_Weekly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_SPLIT_ROL_MEAS_NOTAGG_006-US425392-AC3-Example 2
	# Step 1 - Open IBP Document Navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open the document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	When the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Open the @Section Name
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 4 - Open the @FLT_ROLMEAS_CUST, @FLT_ROLMEAS_MONTH filter set on customer,month, Deselect all options, Select @Customer,@Month, @Month1 - Press on the "OK" button
	When the user changes the filter on Filter Name: '<FLT_Rolmeas_Customer>' to Filter Value: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<FLT_Rolmeas_Month>' to Filter Value: '<Month1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<FLT_Rolmeas_Month>' to Filter Value: '<Month2>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

	# Step 5 - In the @GridName, select the cell @Measure, @Customer, @ProdCell, @Month2
	# Step 6 - Right-click the cell, Select @Block, Select @BlockType, 
	# Step 7 - Set @Value for the cell @Measure, @Measure2, @Customer, @ProdCell @Quarter
	And the user right clicks on the Aggrid Grid table at Row: 'EC94721_4|07_5|MEAS1_ROL' and Column: '<Month2>' and Selects: 'Block > Cell(s)'
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC94721_4|07_5|MEAS2_ROL' and Column: '<Month2>'
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC94721_4|07_5|MEAS2_ROL' and Column: '<Quarter>'
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC94721_4|07_5|MEAS2_ROL' and Column: '<Year>'
	
	# Step 8 - Press on the "Update" button 
	When the user clicks on 'Button' with value 'UPDATE'

	# Step 9 - Expected
	#	1. The value for the cell @Measure, @Customer, @ProdCell, @Month is @Value. 
	#	2. The value for the cell @Measure, @Customer, @ProdCell, @Quarter  is  @Value. 
	#	3. The value for the cell @Measure, @Customer, @ProdCell, @Year  is  @Value. 
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC94721_4|07_5|MEAS2_ROL' and Column: '<Month2>' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC94721_4|07_5|MEAS2_ROL' and Column: '<Quarter>' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC94721_4|07_5|MEAS2_ROL' and Column: '<Year>' and has the Text: '<Value>'
		
Examples:  
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName       | DocumentID | Customer  | Month1 | Month2 | FLT_Rolmeas_Customer | FLT_Rolmeas_Prod   | FLT_Rolmeas_Month   | FLT_Rolmeas_Meas    | Measure   | Measure1  | Measure2  | GridName               | ProdCell | Block | BlockType | Value | Value1 | Value3 | Quarter | Year |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | SC_ROLMEAS_NOTAGG | 142        | EC94721_4 | M1     | M2     | [FLT_ROLMEAS_CUST]   | [FLT_ROLMEAS_PROD] | [FLT_ROLMEAS_MONTH] | [FLT_ROLMEAS_MEAS2] | MEAS1_ROL | MEAS3_ROL | MEAS2_ROL | GRID_FR_ROLMEAS_NOTAGG | 07_5     | Block | Cell(s)   | 20    | 50     | 250    | T1      | 2020 |

