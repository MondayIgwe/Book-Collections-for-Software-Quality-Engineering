Feature: Laeeq

Scenario: Test_Script

	Given the user navigates to the 'Advanced Pricing Actions' page
    When the user adds a new Advanced Pricing Action with Code: '<Code>', Advanced Pricing Book: '<AdvancedPricingBook>', Target Discount: '<YesOrNo>', Application Type: '<ApplicationType>', Valorization Type: '<ValorizationType>'

    And the user clicks on 'Input By Label Name' with value 'Description'
    
    And the user enters '<Description>' in field 'Input By Label Name' with value 'Description'
    And the user moves the focus away from the element
    Then the user validates that 'Input By Label Name' with value 'Status' has text 'Simulation'
  
    When the user clicks on 'Side Panel Tab' with value 'General info'
    Then the user validates that 'Input By Label Name' with value 'Status' has text 'Simulation'

    And the user validates that the element 'Validity Period Start Date' has text '<StartDate>'
    And the user validates that the element 'Validity Period End Date' has text '<EndDate>'

    And the user validates that the 'Checkbox By Label' with value 'Only perfect multiples' is enabled
    And the user validates that 'Checkbox By Label' with value 'Only perfect multiples' is marked as: 'False'

    And the user validates that 'Checkbox By Label' with value 'Convert different UM' is marked as: 'True'
    And the user validates that 'Checkbox By Label' with value 'Consider Manually modified Rows' is marked as: 'True'

    And the user validates that 'Input By Label Name' with value 'Valorization Attribute' has text 'Number of times'
    And the user validates the 'Input By Label Name' with value 'Measure Unit' is empty

    #Combos are disabled - Query with Paul and Ioan

    And the user validates that the 'Checkbox By Label' with value 'Maximum Bracket Only' is disabled
    And the user validates that 'Checkbox By Label' with value 'Maximum Bracket Only' is marked as: 'True'
    
    And the user validates that 'Radio Button' with value 'Do not consider Past orders' is marked as: 'True'

    When the user clicks on 'Side Panel Tab' with value 'Main constraints'
    Then the user validates that the hierarchical node with the value 'AND' is visible
    
    When the user clicks on 'Side Panel Tab' with value 'Valorization'
    Then the user validates that the hierarchical node with the value 'MULTIPLE' is visible

    When the user clicks on 'Side Panel Tab' with value 'Benefits'
    And the user clicks on 'Top Tab' with value 'Benefit'

    Then the user validates that the hierarchical node with value 'AND' -> 'Order Row - Row Type = Sale' is visible
    And the user closes all pages without saving the work done

    When the user keys in the '<key>' key
    When the user keys out the '<key>' key
    Then the user validates that the '[string]' with value '[string]' is not shown

    Examples: 
    | CustomerAction1 | NATION                   | BILL_TO_SHIP_TO_POS      | VATCODE | STATUS_DES | CUST_NAME   | ADDR         | ZIP    | DESLOC | PHONE | FAX | MAIL      |
    | New customer    | United States of America | Bill-to, Ship-to and POS | US20    | New        | CUST_UI_016 | Strada Palat | 123456 | Iasi   | 112   | 112 | def@aa.ro |