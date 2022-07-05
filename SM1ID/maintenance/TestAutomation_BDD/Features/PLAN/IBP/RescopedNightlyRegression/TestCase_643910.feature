Feature: TestCase_643910
    AC1 - The first column of the not-aggregated grid is frozen

@BDD_TC643910 @PLAN_Nightly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_GRID_002-US643099
    # Step 1 - Open IBP Document Navigator
    Given the user navigates to the 'IBP Documents' page
    
    # Step 2 - Open the document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear in Draft status
	When  the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
    And the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user clicks on the link with value '<DocumentID>' on the grid	
	
    # Step 3 - Select @SectionName from the list of sections
    Then the user validates that the user is on the 'IBP Plan Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'IBP Plan Shell Tab' page

    # Step 4 - In @GridName, perform an horizontally scroll
    When the user scrolls to the 'Aggrid Column Header Name' with value 'M1'

    # Step 5 - Validate: The first column of the grid
    Then the user validates that the Aggrid Grid has the Top Column Header 'M1' in IBP

    Examples:
    | DocShellModel | DocWeek | DocMonth | DocProcessYear | SectionName          | Column1      | Column2 | GridName                 | DocumentID |
    | SHELL_DEMO2_2 | 6       | 2        | CBP_2020       | SEC_BASELINE_DEMO2_2 | [CBP_PROD_3] | [MEAS]  | GRID_FR_BASELINE_DEMO2_2 |   131      |
