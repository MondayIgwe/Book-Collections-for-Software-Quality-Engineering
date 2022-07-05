Feature: TestCase_670558
    
@BDD_TC670558 @PLAN_Weekly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_FORMULA_010-SOURCE Case2_Bug 663207 
 # Step 1 - Open IBP Document Navigator
    Given the user navigates to the 'IBP Documents' page
    
    # Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When  the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user clicks on the link with value '<DocumentID>' on the grid	
	
    # Step 3 - Select @SectionName from the list of sections
 	Then the user validates that the user is on the 'IBP Plan Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'IBP Plan Shell Tab' page

    # Step 4 - Open filter @Filter, @Filter1 on customer at section level
    # Step 5 - Deselect all choices
    # Step 6 - Select @Customer, Month
    When the user changes the Combo Label: '<FILTER>' to Combo Label: '<CUSTOMER1>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
    And the user changes the Combo Label: '<FILTER1>' to Combo Label: '<MONTH>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab

    # Step 10 - In @GridName, select @Measure, @Measure1, @ProdCell1, @Customer, @Month
    # Edit @Value
    And the user enters the Text: '<VALUE>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<CUSTOMER>' and Column: '<MONTH>|<MEASURE>'
    And the user enters the Text: '<VALUE>' on the Aggrid Grid Table Name: '<GridName>' at Row: '<CUSTOMER>|<PRODCELL1>' and Column: '<MONTH>|<MEASURE1>'

    # Step 12 - Close the document
    And the user closes all pages without saving the work done

    # Step 13 - IBP Document Navigator, open IBP document with @DocShellModel1
    And the user navigates to the 'IBP Documents' page

    # Step 14 - open IBP document with @DocShellModel1 created for @DocWeek1, @DocMonth1, @DocProcessYear in Draft status
    And  the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel1>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek1>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth1>'
	And the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user clicks on the link with value '<DocumentID1>' on the grid	

    # Step 15 - Select the @SectionName1
    Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName1>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

    # Step 16 - Open filter @Filter2 on customer at section level
    # Deselect all the choises,Select @Customer
    # Open filter @Filter3 on month, Deselect all the choises, Select @Month
    When the user changes the Combo Label: '<FILTER2>' to Combo Label: '<CUSTOMER2>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
    And the user changes the Combo Label: '<FILTER3>' to Combo Label: '<MONTH>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
  
    # Step 17 - In @GridName1, check the value of @Measure3, @ProdCell1, @Customer1, @Month
    # Step 18 - The value of @Measure3, @ProdCell1, @Customer1, @Month is @Value1
    # Step 19 - Check the value of @Measure3, @ProdCell2, @Customer1, @Month
    # Step 20 - The value of @Measure3, @ProdCell2, @Customer1, @Month is @Value2
    Then the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<CUSTOMER>' and Column: '|<MEASURE>|<MONTH>' and has the Text: '<VALUE2>'
    And the user validates on the Aggrid Grid Table Name: '<GridName>' at Row: '<CUSTOMER>|<PRODCELL2>' and Column: '<MEASURE>|<MONTH>' and has the Text: '<VALUE>'


    Examples:
    | DocShellModel | DocShellModel1 | DocWeek | DocWeek1 | DocMonth | DocMonth1 | DocProcessYear | SectionName | SectionName1 | FILTER               | FILTER1            | FILTER2          | FILTER3        | CUSTOMER  | CUSTOMER1 | CUSTOMER2 | MONTH | GridName        | MEASURE | MEASURE1 | MEASURE3 | PRODCELL1 | PRODCELL2 | VALUE | VALUE1 | VALUE2 | DocumentID | DocumentID1 |
    | SHELL_SOURCE  | SHELL_IF       | 15      | 16       | 4        | 4         | CBP_2020       | SC_SOURCE1  | SC_IF3       | [FLT_SOURCE_PLANTO1] | [FLT_SOURCE_MONTH] | [FLT_IF_PLANTO3] | [FLT_IF_MONTH] | EC91603_4 | EC86548_1 | EC86550_1 | M12   | GRID_FR_SOURCE1 | MEAS1   | MEAS3    | MEAS13   | 100       | 101       |       | 18,480 |        | 139        | 140         |
