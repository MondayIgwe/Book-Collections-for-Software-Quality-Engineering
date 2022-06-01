Feature: TestCase_846436

@BDD_846436 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_Multihierarchy_Readonlyformula_001
	# Step 1 - Go to 'IBP Documents' Navigator
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

	# Step 4 - Open the filter defined for meas @FILTER,  products @FILTER2, Deselect all choices, @MEAS,@PRODUCT
	When the user changes the filter on Filter Name: '<Filter>' to Filter Value: '<Meas>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter2>' to Filter Value: '<Product>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

Examples:
	| DocProcessYear | DocumentID  | DocShellModel | DocWeek | DocMonth | SectionName                     | Filter        | Meas   | Filter2        | Product | GridName        | AggCell   | AggCell2 | AggCell3  | AggCell4 |Value  |
	| CBPMH_2020     | 148         | HELL_MADAMH5  | 2       | 1        | [GUIGWPLANDOC.SECTION5_MADAMH1] | [FLT_FR5MEAS] | STR_M1 | [FLT_FR5PROD2] | SPW_034 | GRID_FR5_MADAMH | EC87135_1 | EC87135_1| EC87135_1 | EC87135_1| TEST  |