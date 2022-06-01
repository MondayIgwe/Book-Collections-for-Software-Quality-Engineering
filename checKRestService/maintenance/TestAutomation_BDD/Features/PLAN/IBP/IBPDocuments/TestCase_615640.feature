Feature: TestCase_615640


@BDD_615640 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_FORMULA_001-SOURCE Case1
	# Step 1 - Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 -  Select @SectionName from the list of sections
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 4 - Open filter @Filter, @Month, @Filter1, @Customer on customer at section level
	When the user changes the filter on Filter Name: '<Filter1>' to Filter Value: '<Month>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter>' to Filter Value: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter2>' to Filter Value: '<Measure1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter2>' to Filter Value: '<Measure2>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter2>' to Filter Value: '<Measure3>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName | Filter               | Filter1            | Filter2            | FirstValue | GridName        | Customer  | Customer1 | Product | Meas1    | Year | Month | Meas2   | DocumentID | Measure | Measure1 | Measure2 | Measure3 | ProdCell1 | Value  | Value1   | Value2   | Value3   |
	| CBP_2020       | SHELL_SOURCE  | 15      | 4        | SC_SOURCE1  | [FLT_SOURCE_PLANTO1] | [FLT_SOURCE_MONTH] | [FLT_SOURCE_MEAS1] | M10        | GRID_FR_SOURCE1 | EC86550_1 | EC91603_4 | 08_5    | BASELINE | 2020 | M1    | TOT_VOL | 139        |  MEAS3  | MEAS2    | MEAS4    | MEAS5    | 100       | 100.02 | 2,475.60 | 2,575.62 | 2,375.58 |
