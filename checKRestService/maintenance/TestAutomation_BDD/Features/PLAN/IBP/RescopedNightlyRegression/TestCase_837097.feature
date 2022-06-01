Feature: TestCase_837097

	AC1/AC2-GWP_QUICKEDIT_AGG_001-"New Value" for a single selected cell

@BDD_837097 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: AC1/AC2-GWP_QUICKEDIT_AGG_001
	# Step 1 - Go to IBP Planning Documents
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open a document containing an aggregated grid (check pre-conditions)
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Open the related section
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 4 - Right click on it, Select Quick > Edit and Press on New Value
	When the user right clicks on the Aggrid Grid table at Row: 'EC86195_4|07_5|MEAS1_ROL' and Column: 'M1' and Selects: 'Quick Edit > New Value'
	
	# Step 5 - Validate pop-up containing an editing field appears. The pop-up contains 2 buttons: OK and Cancel.
	Then the user validates that the 'Text' with value 'New Value' is displayed
	And the user validates that the 'Input By Label Name' with value 'New Value' is displayed
	And the user validates that the 'Popup Ok Button' with value 'New Value' is displayed
	And the user validates that the 'Popup Cancel Button' with value 'New Value' is displayed	
	
	# Step 6 - Insert Value and Press on "OK" button 
	When the user enters '<Value>' into the Aggrid context 'New Value' pop up menu
	
	# Step 7 - Validate Row and Column has text, The value is changed in the selected cell. The aggregation and the split are correctly applied.
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86195_4|07_5|MEAS1_ROL' and Column: 'M1' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86195_4|07_5|MEAS1_ROL' and Column: 'T1' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'EC86195_4|07_5|MEAS1_ROL' and Column: '2020' and has the Text: '<Value>'
	
	# Step 9 - Close document
	When the user clicks on 'Button' with value 'UPDATE'

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName       | Value | MonthFilters | DocumentID | GridName               |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | SC_ROLMEAS_NOTAGG | 0     | M4           | 142        | GRID_FR_ROLMEAS_NOTAGG |