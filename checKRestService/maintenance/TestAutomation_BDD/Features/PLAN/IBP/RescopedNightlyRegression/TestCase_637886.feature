Feature: TestCase_637886

@RESCOPED_BDD_637886 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_FILTERS_ROL_MEAS_NOTAGG_002
	# Step 1 - Open IBP Document Navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open the document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on the link with value '<DocumentID>' on the grid

	# Step 3 - Open the @SectionName
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 4 - Open @Filter, @Filter1 Deselect all options, Select @CUSTOMER, @PRODUCT, @MEAS
	When the user changes the filter on Filter Name: '<Filter>' to Filter Value: 'EC86195_4' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter1>' to Filter Value: '<Product>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter2>' to Filter Value: '<Meas>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 5 - In the @FrameName the displayed value for customer (on column @CustColumnName) is @CUSTOMER, for products (on column @ProdColumnName) is @PRODUCT and for measure (on column @MeasColumnName)  is @MEAS.
	Then the user validates that the 'Text in Grid Containing' with value '<Customer>' is present
	And the user validates that the 'Text in Grid Containing' with value '<Product>' is present
	And the user validates that the 'Text in Grid Containing' with value '<Meas>' is present

	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName       | Customer  | Product | Meas      | MonthFilters | DocumentID | Filter             | Filter1            | Filter2             | FrameName         |
	| CBP_2020       | SHELL_ROLMEAS | 41      | 10       | SC_ROLMEAS_NOTAGG | EC86195_4 | 07_5    | MEAS2_ROL | M4           | 142        | [FLT_ROLMEAS_CUST] | [FLT_ROLMEAS_PROD] | [FLT_ROLMEAS_MEAS2] | FR_ROLMEAS_NOTAGG |