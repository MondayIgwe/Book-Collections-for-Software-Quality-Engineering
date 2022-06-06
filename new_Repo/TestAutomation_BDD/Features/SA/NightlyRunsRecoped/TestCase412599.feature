Feature: TestCase412599
	WEB_SA_BALANCE_BALANCE DETAILS_006 Link to Matched CLaims - Promotions Nav (one PROMO and one rebate)

@TTC_Nightly @TCC @BBD_412599
Scenario:WEB_SA_BALANCE_BALANCE DETAILS_006
	Given the user navigates to the 'Rebates' page
	When the user clicks on the 'Add Button'
	And the user clicks on the 'Customer Holder'
	And the user clicks on 'Hier. level side panel' with value '<Level>'
	And the user clicks on 'Customer Code table' with value '<Customer>'
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
    And the user clicks on 'Radio Button' with value 'Confirm'
    And the user clicks on 'Popup Ok Button' with value 'Change Status'
	And the user clicks on 'Side Panel Tab' with value 'Dashboard'
	And the user clicks on 'Sub Tab' with value 'Settlements and Claims'
    And the user clicks on the 'Settlements Claims Update Button'
    Then the user waits for the element 'Update Button' attribute 'aria-disabled' to be 'false'
    And 'Payable Amount Textfield' text contains '<FixedAmount>'
    When the user navigates to the 'Promotional actions' page
    When the user creates a Promo '<Level>' '<Customer>'
    Then the user populates the cockpit '<PromoDescription>' 'd/m/y' 'd+1/m/y' '' '' '<Mechanic>'
    When the user adds products '<ProductLevel>' '<Prodcut1>'
    And the user is on the 'Products Tab' page
    And the user enters '<Measure>' on column name 'Leaflet' for product code '<Prodcut1>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
    When the user changes the status to 'To be authorized'
    When the user changes the status to 'Confirm'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Sub Tab' with value 'Header info'
    And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode'
    When the user navigates to the 'Matched Claims' page
    And the user filters the column by column name 'Rebate code', 'Equal', 'RebateCode'
    And the user clicks on 'Grid Checkbox' with value 'RebateCode'
    And the user clicks on the 'Balance Button'
    And the user clicks on 'Popup Ok Button' with value 'Finalization'
    When the user navigates to the 'Matched Claims' page
    And the user filters the column by column name 'Action Code', 'Like', 'ActionCode'
    And the user clicks on 'Grid Checkbox' with value 'ActionCode'
    And the user clicks on the 'Balance Button'
    And the user clicks on 'Popup Ok Button' with value 'Finalization'
    When the user navigates to the 'Balance Details' page
    And the user selects opens the filter at column 'Promo Rebate'
    And the user clicks on 'Filter Option' with value 'RebateCode'
    And the user clicks on 'Filter Option' with value 'ActionCode'
    And the user clicks on 'Popup Ok Button' with value 'Column:Promo Rebate'
    And the user clicks on 'Grid Checkbox' with value 'RebateCode'
    And the user clicks on 'Grid Checkbox' with value 'ActionCode'   
    And the user clicks on the 'Links Button'
    And the user clicks on the 'Matched Claims Promotions Links Option'
    Then the user validates that the 'Div Text in Grid' with value 'ActionCode' is present
    Examples:
    | Customer | Level   | Classification | Reason           | TargetType    | DataSource        | PaymentMode     | PaymentFrequency | FixedAmount | Status  | Session | Prodcut1 | ProductLevel | Mechanic | Measure | PromoDescription | PromoTransition  | Division                                 | ColumnSmOneId |
    | EC86206  | Level 3 | Supply         | Year End Bonuses | Unconditional | Net sales revenue | Invoice payable | Monthly          | 100         | Confirm | LIQ     | 050      | Product      | Leaflet  | 500     | Promo 412599     | To be authorized | XTEL SFA AUTOMATION - Global Group SM1V4 | AGGATTR1DES   |