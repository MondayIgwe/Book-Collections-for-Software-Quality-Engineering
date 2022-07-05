Feature: TestCase_606464

@BDD_606464 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_SPLIT_ROL_MEAS_002
	# Step 1 - Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Select @SectionName from the list of sections
	Then the user validates that the user is on the 'IBP Plan Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'IBP Plan Shell Tab' page

	# Step 4 - Open filter @Filter on customer, Deselect all the choises, Select @Customer, Open filter @Filter1 on category
	When the user changes the Combo Label: '<Filter>' to Combo Label: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the Combo Label: '<Filter1>' to Combo Label: '<Category>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the Combo Label: '<Filter3>' to Combo Label: '<Month>,<Month1>,<Month2>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 6 - In @GridName, select the cell and set @Value
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Category>|<Measure>' and Column: 'M3'	
	
	#Step 7 - Validate values in cell
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Category>|<Measure>' and Column: 'M3' and has the Text: '<Value>'
	
	# Step 8 - Update and Close the document
	When the user clicks on the 'Calculation Update Button'

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | DocumentID | SectionName       | Filter             | Filter1            | Filter2             | Filter3             | Customer  | Category | Month | Month1 | Month2 | GridName               | Measure   | Measure1  | Measure3   | Measure4  | Measure5  | Year | Value | Value1 | Value2 | Value3 | Value4 | Value5 | Value6 |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | 142        | SC_ROLMEAS_NOTAGG | [FLT_ROLMEAS_CUST] | [FLT_ROLMEAS_PROD] | [FLT_ROLMEAS_MEAS2] | [FLT_ROLMEAS_MONTH] | EC91603_4 | 08_5     | M1    | M2     | M3     | GRID_FR_ROLMEAS_NOTAGG | MEAS1_ROL | MEAS2_ROL | MEAS15_ROL | MEAS5_ROL | MEAS6_ROL | 2020 | 333   | 111.11 | 111.11 | -685   | 222.22 | -574.77 | 76,208.12 |
