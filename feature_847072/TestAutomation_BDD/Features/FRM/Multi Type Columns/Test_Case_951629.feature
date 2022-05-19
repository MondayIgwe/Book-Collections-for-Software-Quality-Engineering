Feature: Test_Case_951629

Given a multitype numeric column the user is able to filter data opening the filter popup 
which will have the layout of a text column filter popup with Equal, Not Equal, Greater or Equal, Less or Equal, Greater, Less and IN field if enabled


Scenario: BDD_WEB_FRM_FILTERING_NUMERIC_MULTITYPE_COLUMN 
   
    # Navigate to Reference Docs navigator and create a new reference document
    Given the user is on the 'Reference Docs' page
    When the user clicks on the 'Add Button'
    And the user selects 'Today' from calendar icon 'Date 1 Calendar Icon'
    And the user selects 'Today' from calendar icon 'Date 2 Calendar Icon'
    And the user clicks OK button in the 'Reference Doc Detail Popup' popup
    Then the user is on the 'Summary Tab' page
    When the user selects 'Today' from calendar icon 'Event Test Type Calendar Icon'
    And the user clicks on the 'Transactional Data Button'
    And the user retrieves the 'Progressive Field' text as 'ProgressiveValue'
    And the user clicks on the 'Field Examples'
    Then the user is on the 'Available Fields Tab' page
    When the user enters 'ITAC Test' in the 'Textbox Field'
    And the user selects 'voice1' in the combo box 'Combo Field'
    And the user clicks on the 'Field Validation Button'
    Then the user is on the 'Field Validation Tab' page
    And the user enters 'ITAC TEST' in the 'Force Upper Case Field'
    Then the user clicks on the 'Toolbar Save Button'
    And the user clicks on the 'Toolbar Close Button'
    Then the user is on the 'Reference Docs' page
    And the user filters the column by column name 'Progressive', 'like', 'ProgressiveValue'
    And the user clicks on the link value 'ProgressiveValue' on the grid
    
    # select Grids Examples tab
    When the user clicks on the 'Grids Examples'

    # filter the grid by using this constraint StringMultiTypeColumn Equal = 7.05
    And the user filters the column by column name 'Numeric MultiType Column', 'Equal', '9.50'
    Then the user validates that the cell in row number '1' in column 'vRandomDec' has text '9.50'

    # filter the grid by using this constraint StringMultiTypeColumn NOT Equal = 7.05
    When the user filters the column by column name 'Numeric MultiType Column', 'Not Equal', '9.50'
    Then the user validates that the cell in row number '1' in column 'vRandomDec' has text '1.31'

    # filter the grid by using this constraint StringMultiTypeColumn IN = 7.05 6.01
    When the user filters the column by column name 'Numeric MultiType Column', 'In', '7.05 6.01'
    Then the user validates that the cell in row number '1' in column 'vRandomDec' has text '7.05'
    And the user validates that the cell in row number '2' in column 'vRandomDec' has text '6.01'

    # filter the grid by using this constraint StringMultiTypeColumn Greater = 0.5
    When the user filters the column by column name 'Numeric MultiType Column', 'Greater', '0.50'
    Then the user validates that the cell in row number '1' in column 'vRandomDec' has text '7.55'
    
    # filter the grid by using this constraint StringMultiTypeColumn Greater = 0.5
    When the user filters the column by column name 'Numeric MultiType Column', 'Less', '5.00'
    Then the user validates that the cell in row number '1' in column 'vRandomDec' has text '1.31'


