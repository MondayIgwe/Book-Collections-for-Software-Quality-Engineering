Feature: TestCase_728481
	Validates the functionality of the Filter Maker with Multiple filters 'In' condition

@BDD_TC728481 @FRM
Scenario: WEB_FRM_NAVIGATOR_FILTER_MAKER_OPERATORS

    # Step 1 - 2 Open the main menu and then open the "Discount Lists" navigator
    Given the user navigates to the 'Discount lists' page

    # Step 3 - Open the context menu of the navigator and select "Edit filters"
    When the user clicks on the 'Grid Settings Menu'
    And the user clicks on 'Grid Settings Menu Option' with value 'Edit Filters'

    # Step 4 - Add two filters with the same attribute and operator
    And the user adds a filter with Attribute: 'Workflow Status' Operator: 'In' Value: 'Cancelled'
    And the user adds a filter with Attribute: 'Workflow Status' Operator: 'In' Value: ''

    # Expected result - An Warning "Complex Filters Not Supported" must be triggered and displayed
    Then the user validates that the 'Alert Dialog Message Box' with value 'Complex Filters Not Supported' is displayed

    # Step 5 - Click Cancel Button inside the popup
    When the user clicks on 'Alert Popup Ok Button' with value 'Warning'

    # expected result - The Edit Filters popup has been closed
    Then the user validates that the 'Alert Dialog Message Box' with value 'Complex Filters Not Supported' is not displayed

