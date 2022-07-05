Feature: TestCase_846615

@BDD_846615 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_Multihierarchy_ClosedPeriod_001
	# Step 1 - Go to 'IBP Documents' Navigator
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

	# Step 4 - Open the filter defined for product @FILTERPROD, Deselect all choices and Select @PROD
	When the user changes the Combo Label: '<FilterProd>' to Combo Label: '<Prod>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 5 - In @GridName, select the cell @AggCell and Insert @Value
	And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: 'ORDER_DISC|<Prod>' and Column: '<AggCell>|WM2'
	
	# Step 6 - The value for @AggCell is @Value
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: 'ORDER_DISC|<Prod>' and Column: '<AggCell>|WM2' and has the Text: '<Value>'
	
	# Step 7 - Update and Close the document without saving
	When the user clicks on the 'Calculation Update Button'

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                     | FilterProd     | Prod    | GridName        | AggCell   | Value | AggCell2  | AgCell3   | DocumentID |
	| CBPMH_2020     | SHELL_MADAMH5 | 2       | 1        | [GUIGWPLANDOC.SECTION4_MADAMH1] | [FLT_FR5PROD3] | SPW_009 | GRID_FR4_MADAMH | EC87135_1 | 100   | EC87135_1 | EC87135_1 | 148        |