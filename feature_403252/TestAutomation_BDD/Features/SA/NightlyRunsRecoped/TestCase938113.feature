Feature: TestCase938113
WEB_SA_BALANCE_MATCHED CLAIMS_003 - Standard unmatching process in 'Matched Claims' and 'Matched Claims - Promotions' Navigators

@BDD_938113 @TTC
Scenario: WEB_SA_BALANCE_MATCHED CLAIMS_003

    #Step 1 - Create a Promo document
    Given the user navigates to the 'Promotional actions' page
    When the user creates a Promo '<Level>' '<Customer>'
    And the user populates the cockpit '<PromoDescription>' 'd/m/y' 'd+1/m/y' '' '' '<Mechanic>'
    And the user adds a product '<ProductLevel>' '<ProductCode1>'
    And the user adds a product '<ProductLevel>' '<ProductCode2>'
    And the user is on the 'Products Tab' page
    And the user enters '<Measure>' on column name 'Leaflet' for product code '<ProductCode1>'
    And the user enters '<Measure>' on column name 'Leaflet' for product code '<ProductCode2>'
    And the user clicks on 'Side Panel Tab' with value 'Cockpit'
    And the user clicks on 'Trigger By Field Name' with value 'Status'
    And the user changes the status to 'To be authorized'
    And the user clicks on 'Trigger By Field Name' with value 'Status'
    And the user changes the status to 'Confirm'
    And the user clicks on 'Side Panel Tab' with value 'General info'
    And the user clicks on 'Sub Tab' with value 'Header info'
    And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode'

    #Step 2 - Create a claim document
    When the user navigates to the 'Claims' page under division'Claims'
    And the user clicks on the 'Add Button'
    And the user enters '<DocumentType>' in the 'Customer Document Number TextField'
    And the user enters '<DocumentNumber>' in the 'Customer Document Type TextField'
    And the user clicks on the 'Customer Open Icon'
    And the user clicks on 'Hier. level side panel' with value '<Level>'
    And the user clicks on 'Customer Code table' with value '<Customer>'
    And the user clicks on 'Popup Ok Button' with value 'New Customer'
    And the user clicks on the 'Date Calendar Icon'
    And the user clicks on the 'Today Button'
    And the user enters '<Amount>' in the 'Amount Text Field'
    And the user clicks on the 'Customer Document Type TextField'
    And the user clicks on 'Popup Ok Button' with value 'New Claim'
    And the user clicks on the 'Save Button'

    #Step 3 - Match the claim with the promo
    And the user clicks on 'Button' with value 'Match To Generic Amounts'
    And the user clicks on 'Menu Item Text' with value 'Match To Promo ID'
    And the user filters the column by column name 'Action Code', 'Like', 'ActionCode'
    And the user clicks on 'Grid Checkbox' with value 'ActionCode'
    And the user clicks on 'Popup Ok Button' with value 'Select Promotions'
    And the user clicks on 'Button' with value 'Assign'
    And the user clicks on 'Popup Ok Button' with value 'Matching finalization'
    And the user clicks on 'Side Panel Tab' with value 'Summary'
    And the user is on the 'Summary Tab' page
    And the user retrieves text from element 'Input By Label Name' with value 'Document ID' and saves it as 'DocumentID'
    And the user clicks on the 'Close Tab'
    And the user clicks on the 'Refresh button'
    
    #Step 4-5-6-7 - Matched Claims navigator
    When the user navigates to the 'Matched Claims' page
    And the user filters the column by column name 'Action Code', 'Like', 'ActionCode'
    And the user clicks on 'Grid Checkbox' with value 'ActionCode'
    And the user clicks on the 'Unmatch Link'
    And the user clicks on the 'Alert Dialog No Button'
    Then the user validates that the 'Alert Dialog Message Box' is not present
    And the user validates that the 'Selected Row' with value 'ActionCode' is displayed

    #Step 8-9-10-11 Matched Claims Promotions navigator
    When the user navigates to the 'Matched Claims - Promotions' page
    And the user filters the column by column name 'Action Code', 'Like', 'ActionCode'
    And the user clicks on 'Grid Checkbox' with value 'ActionCode'
    And the user clicks on the 'Unmatch Link'
    And the user clicks on the 'Alert Dialog No Button'
    Then the user validates that the 'Alert Dialog Message Box' is not present
    And the user validates that the 'Selected Row' with value 'ActionCode' is displayed
   
    #Check that no unmatch was processed
    When the user navigates to the 'Claims' page under division'Claims'
    And the user filters the column by column name 'Document ID', 'Like', 'DocumentID'
    And the user clicks on the 'Document ID Link'
    And the user validates that 'Input By Label Name' with value 'Status' has text 'Approved'

Examples:
| Level   | Customer | Status  | Mechanic | ProductLevel | ProductCode1 | ProductCode2 | Measure | PromoDescription | Sell-In start | Sell-In end | Sell-Out start | Sell-Out end | Promo_Status     | DocumentType           | DocumentNumber | Amount  | Claim Status |
| Level 4 | EC86217  | Confirm | Leaflet  | Product      | 011          | 012          | 1000.00 | TC938113_promo   | d/m/y         | d+1/m/y     | d/m/y          | d+1/m/y      | TO BE AUTHORIZED | REO - Customer Invoice | TC938113       | 3000.00 | Not matched  |