Feature: TestCase_684650
    
@BDD_TC684650 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_GRID_003 - Horizontal scrollbar functionality for aggregated grids
    # Step 1 - Open IBP Document Navigator
    Given the user navigates to the 'IBP Documents' page
    
    # Step 2 - Open the document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When  the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user clicks on the link with value '<DocumentID>' on the grid	
	
    # Step 3 - Select @SectionName from the list of sections
    Then the user validates that the user is on the 'IBP Plan Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'IBP Plan Shell Tab' page

    # Step 4 - In @GridName, scroll horizontally
    When the user scrolls to the 'Aggrid Column Header Name' with value 'M1 - 1'
    And the user scrolls to the 'Aggrid Column Header Name' with value 'T1 - 1'

    # Step 5 - Validate: The first columns of the grid (related to the description/code of the dimensions and measure labels) (@Column1,@Column2).
    Then the user validates that the Aggrid Grid has the Top Column Header 'M1 - 1' in IBP
    And the user validates that the Aggrid Grid has the Top Column Header 'T1 - 1' in IBP
  
    Examples:
    | DocShellModel | DocWeek | DocMonth | DocProcessYear | SectionName    | Column1      | Column2 | GridName            | DocumentID |
    | SHELL_ROLMEAS | 41      | 10       | CBP_2020       | SC_ROLMEAS_AGG | [CBP_PROD_3] | [MEAS]  | GRID_FR_ROLMEAS_AGG |   142      |
