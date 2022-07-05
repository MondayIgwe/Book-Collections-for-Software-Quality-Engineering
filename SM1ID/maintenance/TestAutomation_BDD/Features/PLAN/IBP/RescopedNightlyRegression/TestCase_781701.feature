Feature: TestCase_781701

@BDD_781701 @PLAN_Nightly @PLAN @Regression
Scenario: Filter on value not visible, not quick, for ROL-MEAS aggregated grid
	# Step 1 - Login to the app
	# Step 2 - Go to IBP Planning Documents
	Given the user navigates to the 'IBP Documents' page
	
	# Step 3 - Open IBP document  with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When  the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 4 Open @sectionName
	Then the user validates that the user is on the 'IBP Plan Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'IBP Plan Shell Tab' page

	# Step 5 - Open the @FilterCust
	# Step 6 - Select @FilterCustValue
	When the user changes the Combo Label: '<FilterCust>' to Combo Label: '<FilterCustValue>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

	# Step 7 - Open the @FilterProd
	# Step 8 - Deselect all options
	# Step 9 - Select @FilterProdValue
	# Step 10 - Press on the "OK" button
	When the user changes the Combo Label: '<FilterProd>' to Combo Label: '<FilterProductValue>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

	# Step 11 - In @GridName, set @Value for @Customer, @Meas, @Header
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<FilterCustValue>' and Column: '<Header>|<Meas>'
	
	# Step 12 -Click on the "Update" button
	When the user clicks on the 'Calculation Update Button'
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<FilterCustValue>' and Column: '<Header>|<Meas>' and has the Text: '<Value>'
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<FilterCustValue>|<FilterProductValue>' and Column: '<Header>|<Meas>' and has the Text: '<Value>'
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<FilterCustValue>|<FilterProductValue>|<SubProduct>' and Column: '<Header>|<Meas>' and has the Text: '<Value>'

	Examples:
	| DocShellModel | DocWeek | DocMonth | DocProcessYear | SectionName                        | FilterCust         | FilterCustValue | FilterProd         | GridName            | Value | Customer  | Meas      | Header     | FilterProductValue | SubProduct | DocumentID |
	| SHELL_MATRIX1 | 2       | 1        | CBP_2020       | [GUIGWPLANDOC.SECTION_MATRIX1_5TH] | [FLT_MATRIX1_CUST] | EC95054_4       | [FLT_MATRIX1_PROD] | GRID_FR_MATRIX1_5TH | 100   | EC95054_4 | UPLIFT_PY | [LABEL_PY] | 08_5               | 100        | 144        |