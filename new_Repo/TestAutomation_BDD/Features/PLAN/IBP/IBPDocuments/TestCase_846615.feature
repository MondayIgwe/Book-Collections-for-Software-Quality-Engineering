Feature: TestCase_846615

@BDD_846615 @PLAN_Nightly @PLAN
Scenario: WEB_TPM_IBP_Multihierarchy_ClosedPeriod_001
	# Go to 'IBP Documents' Navigator
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
	When the user changes the filter on '<FilterProd>' to '<Prod>' and filters with 'User Code', 'Like' in the IBP Shell Tab
	#Step 5
	And the user enters the text '<Value>' on the Aggrid Grid table '<GridName>' at row: 'ORDER_DISC|SPW_009' and column: 'EC87135_1|WM2'
	#Step 6
	Then the user validates on the Aggrid Grid table '<GridName>' at row: 'ORDER_DISC|SPW_009' and column: 'EC87135_1|WM2' and has the text '<Value>'
	#Step 7
	And the user clicks on 'Button' with value 'UPDATE'
	And the user closes all pages without saving the work done
Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                     | FilterProd     | Prod    | GridName        | AggCell   | Value  | AggCell2  | AgCell3   | DocumentID |
	| CBPMH_2020     | SHELL_MADAMH5 | 2       | 1        | [GUIGWPLANDOC.SECTION4_MADAMH1] | [FLT_FR5PROD3] | SPW_009 | GRID_FR4_MADAMH | EC87135_1 | 100    | EC87135_1 | EC87135_1 |    148     |