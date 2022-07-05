Feature: TestCase_249431
	Validates the 'Sorting' functionality of the columns

@BDD_TC249431 @FRM_Nightly
Scenario: FRM_REFDOC_NAVIGATORGRID_001

    # Step 1 - Login and Navigate to the Reference Docs page
    Given the user navigates to the 'Reference Docs' page

    # Step 2 - Sort ascending "Progressive" column
    When the user sorts the 'Progressive' column in 'ascending' order

    # Expected result - Mentioned column is ascending sorted
    Then the user validates that the 'Progressive' column is sorted in 'ascending' order 

    # Step 3 - Sort descending "Progressive" column
    When the user sorts the 'Progressive' column in 'descending' order

    # Expected result - Mentioned column is descending sorted
    Then the user validates that the 'Progressive' column is sorted in 'descending' order 

    # Step 4 - Sort descending "Date 1" column
    When the user sorts the 'Date 1' column in 'ascending' order

    # Expected results - 
    # "progressive" column is descending sorted
    # "Date1" column is ascending sorted 
    Then the user validates that the 'Date 1' column is sorted in 'ascending' order
    
    # Step 5 - Sort descending "Number1" column
    When the user sorts the 'Number 1' column in 'ascending' order

    # Expected result - 
    # "progressive" column is descending sorted
    # "Date1" column is ascending sorted  
    # "Number1" column is ascending sorted 
    Then the user validates that the 'Number 1' column is sorted in 'ascending' order

    # Step 6 - Sort descending "Division" column
    When the user sorts the 'Division' column in 'descending' order

    # Expected results - 
    # "Date1" column is ascending sorted  
    # "Number1" column is ascending sorted 
    # "Division" column is descending sorted
    # "Progressive" column is no more sorted - max 3 columns allowed to sort
    Then the user validates that the 'Division' column is sorted in 'descending' order 
    And the user validates that the 'Progressive' column is not sorted

    # Step 7 - Click on the 'Back' button and re-open the Reference Doc navigator
    When the user clicks on the 'Back Button'
    And the user navigates to the 'Reference Docs' page

    # Expected results - 
    # "Number1" column is no more sorted
    # "Division" column is no more sorted  
    # "Date1" column is no more sorted  
    # "progressive" column is no more sorted
    Then the user validates that the 'Number 1' column is not sorted
    And the user validates that the 'Division' column is not sorted
    And the user validates that the 'Date 1' column is not sorted
    And the user validates that the 'Progressive' column is not sorted
