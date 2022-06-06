Feature: TestCase_425033
	Validates collapse and expand functionality of the Tree Node Leaf items in the 'TREE LIST EXAMPLE' top tab in the Panel Examples side panel tab

@BDD_TC425033 @FRM_Nightly
Scenario: WEB_FRM_TREELIST_METHODS_001

    # Step 1 -  5 Login, view a Reference doc and go to Tree List Example sub-tab in the Panel Examples
    Given the user navigates to the 'Reference Docs' page
    When the user opens the grid item in row '1'
    And the user clicks on 'Side Panel Tab' with value 'Panel Examples'
    And the user clicks on 'Top Tab' with value 'TREE LIST EXAMPLE'

    # Expected result - "Book report 1" node is selected
    Then the user validates that the element 'Custom Tree West Node Leaf' with value 'Book report 1' is selected

    # Step 6 - Click on "Homework1"
    When the user clicks on 'Custom Tree West Node Leaf' with value 'Homework1'

    # Step 7 - Click on Collapse Node
    When the user clicks on 'Button' with value 'Collapse Node'
    Then the user validates that the 'Custom Tree West Node Leaf' with value 'Book report 1' is not present

    # Step 8 - Click on Expand Node
    When the user clicks on 'Button' with value 'Expand Node'
    Then the user validates that the 'Custom Tree West Node Leaf' with value 'Book report 1' is displayed

    # Step 9 - Click on Collapse Node Children
    When the user clicks on 'Button' with value 'COLLAPSE NODE CHILDREN'
    Then the user validates that the 'Custom Tree West Node Leaf' with value 'Book report 2' is not present
    
    # Step 10 - Click on Expand Node Children
    When the user clicks on 'Button' with value 'EXPAND NODE CHILDREN'
    Then the user validates that the 'Custom Tree West Node Leaf' with value 'Book report 2' is displayed


    