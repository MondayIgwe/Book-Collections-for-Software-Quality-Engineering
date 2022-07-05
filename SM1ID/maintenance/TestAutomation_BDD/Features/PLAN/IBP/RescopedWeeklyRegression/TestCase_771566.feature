Feature: TestCase_771566
	
@BDD_TC771566 @PLAN_Weekly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_ROLMATRIX_002

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

	# Step 4 - In @GridName, set @Value for @Meas1, @Month1
	When the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<Meas1>' and Column: '<Month1>'

	# Step 5 - Update the document
	When the user clicks on the 'Calculation Update Button'

	# Step 6 - 1. The value for:  @Meas1, @Month1 is @Value;
	# 2. The value for:  @Meas2, @Month1 is @Value                                                                   
	Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Meas1>' and Column: '<Month1>' and has the Text: '<Value>'
	And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<Meas2>' and Column: '<Month1>' and has the Text: '<Value>'

	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                      | Value | Meas1    | Month1 | Meas2   | Year | GridName          |  DocumentID |
	| CBP_2020       | SHELL_MATRIX2 | 2       | 1        | [GUIGWPLANDOC.SECTION_MATRIXNEW] | 15    | BASELINE | M7     | TOT_VOL | 2020 | GRID_FR_MATRIXNEW |  145        |