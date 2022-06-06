Feature: WEB_SA_CLAIM_CLAIMS_MULTI-MATCH_018

@TTC_Nightly @TTC @BBD_309717
Scenario: TC_309717 WEB_SA_CLAIM_CLAIMS_MULTI-MATCH_018
	Given the user navigates to the 'Claims' page under division'Claims'
    When the user creates a New Claim '<CustomerDocNr1>' '<Level>' '<Customer>' '<Amount>' 
	And the user clicks on 'Side Panel Tab' with value 'Summary'
    And the user retrieves text from element 'Input By Label Name' with value 'Document ID' and saves it as 'DocumentID'
    And the user clicks on the 'Close Tab'
    And the user creates a New Claim '<CustomerDocNr2>' '<Level>' '<Customer>' '<Amount>'
	And the user clicks on 'Side Panel Tab' with value 'Summary'
    And the user retrieves text from element 'Input By Label Name' with value 'Document ID' and saves it as 'DocumentID1'
    And the user clicks on the 'Close Tab'
    And the user navigates to the 'Promotional actions' page
    And the user creates a Promo '<Level>' '<Customer>'
    And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'PromoID'
    And the user populates the cockpit '<Description>' 'd/m/y' 'd+30/m/y' '' '' '<PromoActionMechanic>'
    And the user adds products '<ProductLevel>' '<ProductCode>'
    And the user enters '<meas1>' on column name 'Display' for product code '<ProductCode>'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Sub Tab' with value 'Header info'
    And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode'
    And the user clicks on 'Side Panel Tab' with value 'Workflow'
    Then the user validates that the 'Trigger By Field Name' with value 'Current status' is displayed
    When the user clicks on 'Trigger By Field Name' with value 'Current status'
    And the user clicks on 'Radio Button' with value 'To be authorized'
    And the user clicks on 'Popup Ok Button' with value 'Change Status'
    And the user clicks on 'Trigger By Field Name' with value 'Current status'
    And the user clicks on 'Radio Button' with value 'Confirm'
    And the user clicks on 'Popup Ok Button' with value 'Change Status'
    And the user navigates to the 'Claims' page under division'Claims'
    And the user clicks on 'Grid Checkbox' with value 'DocumentID'
    And the user clicks on 'Grid Checkbox' with value 'DocumentID1'
    Then the user validates that the 'Button' with value 'Match' is displayed
    When the user clicks on the 'Toolbar Match Link'
    And the user clicks on 'Button' with value 'Next'
	And the user enters '<Match>' in field 'Input By Label Name' with value 'Match To'
    And the user clicks on 'Button' with value 'Next'
    And the user clicks on 'Grid Checkbox' with value 'ActionCode'
    And the user clicks on 'Button' with value 'Next'
    And the user clicks on 'Button' with value 'Assign'
    And the user clicks on 'Button' with value 'Next'
    And the user clicks on the 'Close Tab'
    Then the user validates that the 'Close Wizard Message' with value '<Message>' is displayed
    When the user clicks on 'Button' with value 'Yes'
    Then the user validates that elements 'Rows' have loaded
    When the user filters the column by column name 'Document ID', 'Like', 'DocumentID'
    And the user clicks on 'DocumentID' text on the grid
    Then the user validates that the 'Matchings Table Checkbox Cell' with value 'false' is displayed
    And the user validates that column '<columnName>' has '<Amount>' with row text '<Description>'
    And the user validates that column 'VAT Code' has 'VAT CODE 1' with row text '<Description>'
    And the user validates that column 'Action Code' has 'ActionCode' with row text '<Description>'
    When the user clicks on the 'Close Tab'
    And the user filters the column by column name 'Document ID', 'Like', 'DocumentID1'
    Then the user validates that elements 'Rows' have loaded
    When the user clicks on 'DocumentID1' text on the grid
    Then the user validates that the 'Button' with value 'Edit' is present
    And the user validates that the 'Matchings Table Checkbox Cell' with value 'false' is displayed
    And the user validates that column '<columnName>' has '<Amount>' with row text '<Amount>'
    And the user validates that column 'VAT Code' has 'VAT CODE 1' with row text '<Amount>'
    And the user validates that column 'Action Code' has 'ActionCode' with row text '<Amount>'
    And the user clicks on the 'Close Tab'
    Examples:
    | DocumentType1 | Customer | Amount | CustomerDocNr1 | CustomerDocNr2 | Level   | Promo Action ID | PromoActionMechanic | Description       | status           | status1 | ProductCode | ProductLevel | Match                 | Promo     | DaysToAdd | Message                                         | meas1 | columnName | RowNumber |
    | REO           | EC86206  | 500.00 | Document1      | Document2      | Level 3 | Promo_018       | Display             | SA_TC309717_Promo | To Be Authorized | Confirm | 01          | Product      | Match to Agg1 (Promo) | Promo_018 | 29        | The matching is completed. Do you want to exit? | 1,000 | Amount     | 1         |