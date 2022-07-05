Feature: TestCase412599
	WEB_SA_BALANCE_BALANCE DETAILS_006 Link to Matched CLaims - Promotions Nav (one PROMO and one rebate)

@TTC_Nightly @TCC @BBD_412599
Scenario: WEB_SA_BALANCE_BALANCE DETAILS_006

    # Step 1
	Given the user navigates to the 'Rebates' page
	When the user creates a Rebate with Level: '<Level>' Customer: '<Customer>' Classification: '<Classification>' Reason: '<Reason>' Target Type: '<TargetType>'
    Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'
	And the user populates the Rebate mandatory fields with Data Source: '<DataSource>' Payment Mode: '<PaymentMode>' Payment Frequency: '<PaymentFrequency>'
	And the user enters '<FixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on 'Side Panel Tab' with value 'General Info'
    When the user clicks on the 'Status Trigger Icon'
    When the user clicks on 'Radio Button' with value 'Confirm'
    And the user clicks on 'Popup Ok Button' with value 'Change Status'

    # Step 2
	And the user clicks on 'Side Panel Tab' with value 'Dashboard'
	And the user clicks on 'Sub Tab' with value 'Settlements and Claims'
    And the user clicks on the 'Settlements Claims Update Button'
    Then the user validates that element: 'Update Button' with attribute: 'aria-disabled' is in state: 'false'
    And the user validates that 'Payable Amount Textfield' text contains '<FixedAmount>'

    # Step 3
    When the user navigates to the 'Promotional actions' page
    And the user creates a Promo with customerHLevel: '<Level>' customerCode: '<Customer>'
    And the user populates the cockpit with description: '<PromoDescription>' sellInStart: 'd/m/y' sellInEnd: 'd+1/m/y' sellOutStart: '' sellOutEnd: '' mechanics: '<Mechanic>'
    And the user adds products with productLevel: '<ProductLevel>' productCodes: '<Prodcut1>'
    And the user enters '<Measure>' on column name 'Leaflet' for product code '<Prodcut1>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
    When the user changes the status to 'To be authorized'
    When the user changes the status to 'Confirm'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Sub Tab' with value 'Header info'
    And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode'

    # Step 4
    And the user navigates to the 'Matched Claims' page
    And the user filters the column by column name 'Rebate code', Filter Type 'Equal', Value 'RebateCode'
    And the user clicks on 'Grid Checkbox' with value 'RebateCode'
    And the user clicks on the 'Balance Button'
    And the user clicks on 'Popup Ok Button' with value 'Finalization'
    And the user navigates to the 'Matched Claims' page
    And the user filters the column by column name 'Action Code', Filter Type 'Like', Value 'ActionCode'
    And the user clicks on 'Grid Checkbox' with value 'ActionCode'
    And the user clicks on the 'Balance Button'
    And the user clicks on 'Popup Ok Button' with value 'Finalization'

    # Step 5
    And the user navigates to the 'Balance Details' page

    # Step 6
    And the user opens the filter at column 'Promo Rebate'
    And the user clicks on 'Filter Option' with value 'RebateCode'
    And the user clicks on 'Filter Option' with value 'ActionCode'
    And the user clicks on 'Popup Ok Button' with value 'Column:Promo Rebate'
    And the user clicks on 'Grid Checkbox' with value 'RebateCode'
    And the user clicks on 'Grid Checkbox' with value 'ActionCode'   

    # Step 7
    And the user clicks on the 'Links Button'
    And the user clicks on the 'Matched Claims Promotions Links Option'
    Then the user validates that the 'Text in Grid' with value 'ActionCode' is present

    Examples:
    | Customer | Level   | Classification | Reason           | TargetType    | DataSource        | PaymentMode     | PaymentFrequency | FixedAmount | Status  | Session | Prodcut1 | ProductLevel | Mechanic | Measure | PromoDescription | PromoTransition  | Division                                 | ColumnSmOneId |
    | EC86206  | Level 3 | Supply         | Year End Bonuses | Unconditional | Net sales revenue | Invoice payable | Monthly          | 100         | Confirm | LIQ     | 050      | Product      | Leaflet  | 500     | Promo 412599     | To be authorized | XTEL SFA AUTOMATION - Global Group SM1V4 | AGGATTR1DES   |