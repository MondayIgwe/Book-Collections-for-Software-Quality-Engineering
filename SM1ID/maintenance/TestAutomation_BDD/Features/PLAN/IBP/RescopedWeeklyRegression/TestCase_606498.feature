Feature: TestCase_606498

@BDD_606498 @PLAN_Weekly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_AGGREGATION_ROL_MEAS_002-US425391-AC5-Aggregation Example 2
	# Step 1 - Go To 'IBP Documents' navigator
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

	# Step 4 - Open filter @Filter on customer
	# Deselect all the choises
	# Select @Customer
	# Open filter @Filter1 on category
	# Deselect all the choises
	# Select @Category
	# Open filter @Filter3 on month 
	# Deselect all the choises
	# Select from @Month to @Month1
	When the user changes the Combo Label: '<Filter>' to Combo Label: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the Combo Label: '<Filter1>' to Combo Label: '<Category>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the Combo Label: '<Filter3>' to Combo Label: '<Month>,<Month1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 5 - In @GridName, select @Category, @Measure, @Month and set @Value
	# In @GridName, select @Category, @Measure2, @Month and set @Value2
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Category>|<Measure>' and Column: 'M3'
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Category>|<Measure2>' and Column: 'M3'

	# Step 6 - Press the button "Update"
	When the user clicks on the 'Calculation Update Button'

	# The value of cell @Customer, @Category, @Measure, @Month is @Value
	# The value of @Customer, @Category, @Measure2, @Month is @Value2. 
	# The value of @Customer, @Category, @Measure2, @Month1 is empty. 
	# The value of @Customer, @Category, @Measure, @Quarter is @Value.
	# The value of @Customer, @Category, @Measure2, @Year is @Value2. 
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Category>|<Measure>' and Column: '<Month>' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Category>|<Measure2>' and Column: '<Month>' and has the Text: '<Value2>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Category>|<Measure2>' and Column: '<Month1>' and has the Text: '<>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Category>|<Measure>' and Column: '<Quarter>' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Category>|<Measure2>' and Column: '<Year>' and has the Text: '<Value2>'

	# Step - 7 Check the values for the formulas
	# The value cell @Customer, @Category, @Measure3, @Month is @Value3. 
	# The value cell @Customer, @Category, @Measure3, @Quarter is @Value3. 
	# The value cell @Customer, @Category, @Measure3, @Year is @Value3.
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Category>|<Measure3>' and Column: '<Month>' and has the Text: '<Value3>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Category>|<Measure3>' and Column: '<Quarter>' and has the Text: '<Value3>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Customer>|<Category>|<Measure3>' and Column: '<Year>' and has the Text: '<Value3>'

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | DocumentID | SectionName       | Filter             | Filter1            | Filter2             | Filter3             | Customer  | Category | Month | Month1 | Month2 | GridName               | Measure   | Measure2  | Measure3  | Value | Value2 | Value3 | Year | Quarter |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | 142        | SC_ROLMEAS_NOTAGG | [FLT_ROLMEAS_CUST] | [FLT_ROLMEAS_PROD] | [FLT_ROLMEAS_MEAS2] | [FLT_ROLMEAS_MONTH] | EC94101_4 | 08_5     | M1    | M2     | M3     | GRID_FR_ROLMEAS_NOTAGG | MEAS1_ROL | MEAS2_ROL | MEAS3_ROL | 300   | 0.30   | 300.30 | 2020 | T1      | 7
