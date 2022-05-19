Feature: TestCase_508646

@BDD_508646 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_FILTERS - Filter on shell-001
	# Step 1 - Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Select @SectionName from the list of sections
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 4 - Open the filter defined for measures @CustomerFilter, @FilterMonth - @CustomerFilter
	When the user changes the filter on Filter Name: 'Customer Filter' to Filter Value: '<CustomerFilter>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '[FLT_MONTH]' to Filter Value: '<MonthFilters>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 5 - Validate In the frame @FrameName, the value shown for the month is @FilterValue1
	Then the user validates that the Aggrid Grid has the Top Column Header '<FilterValue1>' in IBP


    Examples: 
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                    | DocumentID | CustomerFilter | MonthFilters | FilterValue1 |
	| CBP_2020       | SHELL_DEMO2_2 | 6       | 2        | [GUIGWPLANDOC.SEC_P&L_DEMO2_2] | 131        | EC91603_4      | M1,M2        | M1           |