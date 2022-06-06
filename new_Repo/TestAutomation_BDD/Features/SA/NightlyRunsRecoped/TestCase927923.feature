Feature: TestCase927923
	WEB_SA_BALANCE_MATCHED CLAIMS-PROMOTIONS_002 - Unmatch button when matched amount and balance amount = 0

@BDD_927923 @TTC
Scenario: WEB_SA_BALANCE_MATCHED CLAIMS-PROMOTIONS_002
	Given the user navigates to the 'Rebates' page

    #Create a rebate document
	When the user clicks on the 'Add Button'
	And the user clicks on the 'Customer Holder'
	And the user clicks on 'Hier. level side panel' with value '<CustomerLevel>'
	And the user clicks on 'Customer Code table' with value '<CustomerHolder>'
    And the user clicks on 'Popup Ok Button' with value 'Customer Holder'
    Then the user validates that the 'Popup' with value 'New Rebate' is displayed
    Then the user validates that the 'Input By Label Name' with value 'Classification' is displayed
	When the user enters '<Classification>' in field 'Input By Label Name' with value 'Classification'
	When the user enters '<Reason>' in field 'Input By Label Name' with value 'Reason'
	When the user enters '<TargetType>' in field 'Input By Label Name' with value 'Target Type'
    And the user clicks on 'Input By Label Name' with value 'Reason'
    And the user clicks on 'Popup Ok Button' with value 'New Rebate'
    Then the user is on the 'Summary Tab' page
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	When the user enters '<DataSource>' in field 'Input By Label Name' with value 'Data source'
	When the user enters '<PaymentMode>' in field 'Input By Label Name' with value 'Payment mode'
	When the user enters '<PaymentFrequency>' in field 'Input By Label Name' with value 'Payment Frequency'
    And the user clicks on 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<FixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on 'Side Panel Tab' with value 'General Info'
    And the user clicks on the 'Status Arrow Icon'
    When the user changes the status to '<Status>'

    #Run LIQ session
	And the user clicks on 'Side Panel Tab' with value 'Dashboard'
	And the user clicks on 'Sub Tab' with value 'Settlements and Claims'
    And the user clicks on the 'Settlements Claims Update Button'
    Then the user waits for the element 'Update Button' attribute 'aria-disabled' to be 'false'
    And the user validates that 'Input By Label Name' with value 'PAYABLE AMOUNT' contains text '<FixedAmount>'
    When the user navigates to the 'Promotional actions' page
    When the user creates a Promo '<CustomerLevel>' '<CustomerHolder>'
    Then the user populates the cockpit '<Description_Promo>' '<SellInStart>' '<SellInEnd>' '' '' '<Mechanic>'
    When the user adds a product '<ProductLevel>' '<ProductCode>'
    When the user is on the 'Products Tab' page
    And the user enters '<Measure>' on column name 'Leaflet' for product code '<ProductCode>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user clicks on 'Trigger By Field Name' with value 'Status'
    When the user changes the status to '<Promo_Status>'
	And the user clicks on 'Trigger By Field Name' with value 'Status'
    When the user changes the status to '<Status>'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Sub Tab' with value 'Header info'
    And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode'

    #Matched Claims navigator
    When the user navigates to the 'Matched Claims' page
    And the user filters the column by column name 'Rebate code', 'Equal', 'RebateCode'
    And the user clicks on 'Grid Checkbox' with value 'RebateCode'
    Then the user validates the 'Unmatch Link' is disabled
    When the user navigates to the 'Matched Claims - Promotions' page
    And the user filters the column by column name 'Action Code', 'Like', 'ActionCode'
    And the user clicks on 'Grid Checkbox' with value 'ActionCode'
    Then the user validates the 'Unmatch Link' is disabled

    Examples:
    | Classification | Reason           | TargetType    | CustomerLevel | CustomerHolder | FixedAmount | PaymentMode     | PaymentFrequency | Description_rebate | Status  | Mechanic | ProductLevel | ProductCode | Measure | Description_Promo | SellInStart | SellInEnd | Promo_Status     | DataSource        |
    | Supply         | Year End Bonuses | Unconditional | Level 4       | EC86217        | 1000        | Invoice payable | Monthly          | TC927923_rebate    | Confirm | Leaflet  | Product      | 059         | 1,000   | TC927923_promo    | d/m/y       | d+1/m/y   | To be authorized | Net sales revenue |