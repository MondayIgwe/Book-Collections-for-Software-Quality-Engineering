Feature: TestCase927923
	WEB_SA_BALANCE_MATCHED CLAIMS-PROMOTIONS_002 - Unmatch button when matched amount and balance amount = 0

@BDD_927923 @TTC
Scenario: WEB_SA_BALANCE_MATCHED CLAIMS-PROMOTIONS_002
	Given the user navigates to the 'Rebates' page

    #Create a rebate document
    When the user creates a Rebate with Level: '<CustomerLevel>' Customer: '<CustomerHolder>' Classification: '<Classification>' Reason: '<Reason>' Target Type: '<TargetType>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
    And the user populates the Rebate mandatory fields with Data Source: '<DataSource>' Payment Mode: '<PaymentMode>' Payment Frequency: '<PaymentFrequency>'
    And the user clicks on 'Input By Label Name' with value 'DESCRIPTION'
	And the user enters '<FixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on 'Side Panel Tab' with value 'General Info'
    And the user clicks on the 'Status Arrow Icon'
    And the user clicks on 'Radio Button' with value '<Status>'
    And the user clicks on 'Popup Ok Button' with value 'Change Status'

    #Run LIQ session
	And the user clicks on 'Side Panel Tab' with value 'Dashboard'
	And the user clicks on 'Sub Tab' with value 'Settlements and Claims'
    And the user clicks on the 'Settlements Claims Update Button'
    Then the user validates that element: 'Update Button' with attribute: 'aria-disabled' is in state: 'false'
    And the user validates that 'Input By Label Name' with value 'PAYABLE AMOUNT' contains text '<FixedAmount>'
    When the user navigates to the 'Promotional actions' page
    And the user creates a Promo with customerHLevel: '<CustomerLevel>' customerCode: '<CustomerHolder>'
    And the user populates the cockpit with description: '<Description_Promo>' sellInStart: '<SellInStart>' sellInEnd: '<SellInEnd>' sellOutStart: '' sellOutEnd: '' mechanics: '<Mechanic>'
    And the user adds a product with productLevel: '<ProductLevel>' productCodes: '<ProductCode>'
    And the user enters '<Measure>' on column name 'Leaflet' for product code '<ProductCode>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user clicks on 'Trigger By Field Name' with value 'Status'
    And the user changes the status to '<Promo_Status>'
	And the user clicks on 'Trigger By Field Name' with value 'Status'
    And the user changes the status to '<Status>'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Sub Tab' with value 'Header info'
    And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode'

    #Matched Claims navigator
    And the user navigates to the 'Matched Claims' page
    And the user filters the column by column name 'Rebate code', Filter Type 'Equal', Value 'RebateCode'
    And the user clicks on 'Grid Checkbox' with value 'RebateCode'
    Then the user validates the 'Unmatch Link' is disabled
    When the user navigates to the 'Matched Claims - Promotions' page
    And the user filters the column by column name 'Action Code', Filter Type 'Like', Value 'ActionCode'
    And the user clicks on 'Grid Checkbox' with value 'ActionCode'
    Then the user validates the 'Unmatch Link' is disabled

    Examples:
    | Classification | Reason           | TargetType    | CustomerLevel | CustomerHolder | FixedAmount | PaymentMode     | PaymentFrequency | Description_rebate | Status  | Mechanic | ProductLevel | ProductCode | Measure | Description_Promo | SellInStart | SellInEnd | Promo_Status     | DataSource        |
    | Supply         | Year End Bonuses | Unconditional | Level 4       | EC86217        | 1000        | Invoice payable | Monthly          | TC927923_rebate    | Confirm | Leaflet  | Product      | 059         | 1,000   | TC927923_promo    | d/m/y       | d+1/m/y   | To be authorized | Net sales revenue |