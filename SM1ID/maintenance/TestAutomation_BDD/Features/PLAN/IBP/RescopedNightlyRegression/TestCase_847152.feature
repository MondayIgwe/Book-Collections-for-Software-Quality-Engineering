Feature: TestCase_847152
    
@BDD_TC847152 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_Multihierarchy_AggRules_004
    # Step 1 - Open IBP Document Navigator
    Given the user navigates to the 'IBP Documents' page
    
    # Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear
	When  the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user clicks on the link with value '<DocumentID>' on the grid	
	
    # Step 3 - Select @SectionName from the list of sections
    Then the user validates that the user is on the 'IBP Plan Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'IBP Plan Shell Tab' page


    # Step 4 - Open the filter defined for measures @FILTER1
    # Step 5 - Deselect all choices
    # Step 6 - Select @MEAS
    When the user changes the Combo Label: '<FILTER1>' to Combo Label: '<MEAS>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

    # Step 7 - Open the filter defined for products @FLTPROD
    # Step 8 - Deselect all choices
    # Step 9 - Select @PROD1,@PROD2
    And the user changes the Combo Label: '<FLTPROD>' to Combo Label: '<PROD1>,<PROD2>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

    # Step 10 - In @GridName, set @Value for @CUST, @PROD1, @MEAS, @WM
    And the user enters the Text: '<Value>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<CUST>' and Column: '<MEAS>|<WM>'

    # Step 11 - In @GridName, set @Value4 for @CUST, @MEAS, @WM2
    And the user enters the Text: '<Value4>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<CUST>' and Column: '<MEAS>|<WM2>'

    # Step 12 - Update and Close the document
	When the user clicks on the 'Calculation Update Button'

    # Step 13 - The value of @CUST, @PROD1, @MEAS, @WM is @Value.
    # The value of @CUST, @MEAS, @WM is @Value.
    # The value of @CUST, @PROD2, @MEAS, @WM is @Value4.
    Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<CUST>' and Column: '<MEAS>|<WM>' and has the Text: '<Value>'
    And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<CUST>|<PROD1>' and Column: '<MEAS>|<WM>' and has the Text: '<Value>'
    And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<CUST>|<PROD2>' and Column: '<MEAS>|<WM>' and has the Text: '<Value>'

    And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<CUST>' and Column: '<MEAS>|<WM2>' and has the Text: '<Value4>'
    And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<CUST>|<PROD1>' and Column: '<MEAS>|<WM2>' and has the Text: '<Value4>'
    And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<CUST>|<PROD2>' and Column: '<MEAS>|<WM2>' and has the Text: '<Value4>'

    Examples:
    | DocShellModel | DocWeek | DocMonth | DocProcessYear | SectionName                    | FILTER1        | MEAS      | FLTPROD           | PROD1 | PROD2  | GridName        | Value  | CUST      | WM  | Value2 | Value3 | Value4  | WM2 | DocumentID |
    | SHELL_MADAMH1 | 6       | 2        | CBPMH_2020     | [GUIGWPLANDOC.SECTION_MADAMH1] | [FLT_FR11MEAS] | MEAS_MH30 | [FLT_PRODASSONEW] | 001   | 002    | GRID_FR_MADAMH1 | 5,000  | EC86507_1 | WM1 | 2.500  | 0.000  | 100,000 | WM2 | 147        |
