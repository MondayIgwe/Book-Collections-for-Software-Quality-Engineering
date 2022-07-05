Feature: TestCase_433229

@BDD_433229 @SFA_Nightly @SFA_Weekly
Scenario: WEB_SFA_SF_CNVACT_014_Can_create_a_new_automatic_canvass_action
	Given the user navigates to the 'Advanced Pricing Actions' page
    When the user adds a new Advanced Pricing Action with Code: '<Code>', Advanced Pricing Book: '<AdvancedPricingBook>', Target Discount: 'YES', Application Type: '<ApplicationType>', Valorization Type: '<ValorizationType>'

    And The user is on the 'Advanced Pricing Actions - General Info Tab' page
    And the user clicks on the 'Description Textbox'
    And the user enters 'This is a description for WEB_SFA_SF_CNVACT_014' in the 'Description Textbox'
    And the user moves the focus away from the element

    And The user is on the 'Advanced Pricing Actions' page
    Then the user validates that the element 'Status Textbox' has text 'Simulation'

    When the user clicks on the 'General Info Tab'
    Then the user validates that the element 'Status Textbox' has text 'Simulation'

    When The user is on the 'Advanced Pricing Actions - General Info Tab' page
    
    Then the user validates that the element 'Valid Period Start Date Textbo' has text '<StartDate>'
    And the user validates that the element 'Valid Period End Date Textbox' has text '<EndDate>'

    And the user validates the 'Only Perfect Multiples Checkbox' is enabled
    And the user validates that 'Only Perfect Multiples Checkbox' is marked as (true/false): 'False'

    And the user validates that 'Convert Different UM Checkbox' is marked as (true/false): 'False'
    And the user validates that 'Consider Manually Modified Rows Checkbox' is marked as (true/false): 'False'

    And the user validates that the element 'Valorization Attribute Textbox' has text 'Number of times'
    And the user validates the 'Measure Unit Textbox' is empty

    And the user validates the 'Valorization Attribute Textbox' is disabled
    And the user validates the 'Measure Unit Textbox' is disabled

    #And the user validates that the 'Checkbox By Label' with value 'Maximum Bracket Only' is disabled
    And the user validates the 'Maximum Bracket Only Checkbox' is disabled
    And the user validates that 'Maximum Bracket Only Checkbox' is marked as (true/false): 'True'
    
    When The user is on the 'GenericElementsPage' page
    Then the user validates that 'Radio Button' with value 'Do not consider Past orders' is marked as: 'True'

    When The user is on the 'Advanced Pricing Actions' page
    And the user clicks on the 'Main Constraints Tab'
    Then the user validates that the hierarchical node with the value 'AND' is visible
    
    When the user clicks on the 'Valorization Tab'
    Then the user validates that the hierarchical node with the value 'MULTIPLE' is visible

    When the user clicks on the 'Benefits Tab'
    And the user clicks on 'Top Tab' with value 'Benefit'

    Then the user validates that the hierarchical node with value 'AND' -> 'Order Row - Row Type = Sale' is visible
    When the user closes all pages without saving the work done

    Examples: 
    | Code                  | AdvancedPricingBook | ApplicationType | ValorizationType | StartDate  | EndDate    |
    | WEB_SFA_SF_CNVACT_014 | 29 - JHN            | Automatic       | Number of times  | 01/24/2010 | 02/19/2099 |