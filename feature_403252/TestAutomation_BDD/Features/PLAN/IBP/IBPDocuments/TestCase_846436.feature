Feature: TestCase_846436

@BDD_846436 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_Multihierarchy_Readonlyformula_001
	#Step 1
	Given the user navigates to the 'IBP Documents' page
	#Step 2
	When the user filters the column by column name 'Process Year', 'Like', '<DocProcessYear>'
	And the user filters the column by column name 'Month', 'Equal', '<DocMonth>'
	And the user filters the column by column name 'Week', 'Equal', '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', 'Like', '<DocShellModel>'
	And the user clicks on '<DocumentID>' text on the grid
	#Step 3
	Then the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user is on the 'Shell Tab' page
	#Step 4
	When the user changes the filter on '<Filter>' to '<Meas>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	And the user changes the filter on '<Filter2>' to '<Product>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	#Step 5
	And the user closes all pages without saving the work done where there is no pop up

Examples:
	| DocProcessYear | DocumentID  | DocShellModel | DocWeek | DocMonth | SectionName                     | Filter        | Meas   | Filter2        | Product | GridName        | AggCell   | AggCell2 | AggCell3  | AggCell4 |Value  |
	| CBPMH_2020     | 148         | HELL_MADAMH5  | 2       | 1        | [GUIGWPLANDOC.SECTION5_MADAMH1] | [FLT_FR5MEAS] | STR_M1 | [FLT_FR5PROD2] | SPW_034 | GRID_FR5_MADAMH | EC87135_1 | EC87135_1| EC87135_1 | EC87135_1| TEST  |