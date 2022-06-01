Feature: TestCase_237856
	Validates the numeric values on the grid in the Conversions tab in Products UI

@BDD_TC237856 @FRM_Nightly
Scenario: FRM_REFDOC_NUMBOXCOLUMN_001

    # Step 1 - 2 Open products navigator and open product GUI in edit mode, go on Conversions tab
    Given the user navigates to the 'Products' page
    When the user opens the grid item in row '2'
    And the user clicks on 'Button' with value 'Edit'
    And the user clicks on 'Side Panel Tab' with value 'Conversions'

    # Step 3 - Insert some positive numeric values in a numeric cell 
    And the user enters '13456' in cell with column 'Conversion factor' and row text 'CARTONS'

    # Expected result - Positive numeric values are inserted and validated by the system
    Then the user validates that column 'Conversion factor' has '13,456.000000' with row text 'CARTONS'

    When the user enters '11' in cell with column 'Conversion factor' and row text 'CARTONS'
    Then the user validates that column 'Conversion factor' has '11.000000' with row text 'CARTONS'

    # Step 4 - Navigate to other tab and then go back to Conversions tab
    When the user clicks on 'Side Panel Tab' with value 'Details'
    And the user clicks on 'Side Panel Tab' with value 'Conversions'

    # Expected result - Positive numeric values are still persistent and inserted in the grid
    Then the user validates that column 'Conversion factor' has '11.000000' with row text 'CARTONS'

    # Step 5 -  Save the changes, click on back button and reopen product GUI, go on Conversions tab
    When the user clicks on 'Button' with value 'Save'
    And the user clicks on the 'Toolbar Close Button'
    And the user opens the grid item in row '2'
    And the user clicks on 'Side Panel Tab' with value 'Conversions'

    # Expected result - Positive numeric values are shown in the grid and saved in DB 
    Then the user validates that column 'Conversion factor' has '11.000000' with row text 'CARTONS'

    # Step 5 - Click on edit button and insert a different numeric value 
    When the user clicks on 'Button' with value 'Edit'
    And the user enters '999' in cell with column 'Conversion factor' and row text 'CARTONS'
 
    # Step 6 - Click on save button, click on back button and open product GUI in edit mode, go on Conversions tab
    And the user clicks on 'Button' with value 'Save'
    And the user clicks on the 'Toolbar Close Button'
    And the user opens the grid item in row '2'
    And the user clicks on 'Button' with value 'Edit'
    And the user clicks on 'Side Panel Tab' with value 'Conversions'
    
    # Expected result - The updated numeric value is shown in the grid and saved in DB 
    Then the user validates that column 'Conversion factor' has '999.000000' with row text 'CARTONS'

    





