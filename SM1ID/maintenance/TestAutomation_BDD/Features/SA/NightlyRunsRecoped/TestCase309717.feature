Feature: WEB_SA_CLAIM_CLAIMS_MULTI-MATCH_018

@TTC_Nightly @TTC @BBD_309717
Scenario: TC_309717 WEB_SA_CLAIM_CLAIMS_MULTI-MATCH_018
    
    # Step 1
	Given the user navigates to the 'Claims' page under division'Claims'
    When the user creates a New Claim with Document Type: '' Document Number: '<CustomerDocNr1>' Level: '<Level>' Customer: '<Customer>' Amount: '<Amount>'
	And the user clicks on the 'Claims Summary Tab'
    When the user retrieves text from 'Document ID Textbox' and saves it as 'DocumentID'
    And the user clicks on the 'Close Tab'
    When the user creates a New Claim with Document Type: '' Document Number: '<CustomerDocNr2>' Level: '<Level>' Customer: '<Customer>' Amount: '<Amount>'
	And the user clicks on the 'Claims Summary Tab'
    When the user retrieves text from 'Document ID Textbox' and saves it as 'DocumentID1'
    And the user clicks on the 'Close Tab'

    # Step 2
    And the user navigates to the 'Promotional actions' page
    And the user creates a Promo with customerHLevel: '<Level>' customerCode: '<Customer>'
    When the user retrieves text from 'Action ID Textbox' and saves it as 'PromoID'
    And the user populates the cockpit with description: '<Description>' sellInStart: 'd/m/y' sellInEnd: 'd+30/m/y' sellOutStart: '' sellOutEnd: '' mechanics: '<PromoActionMechanic>'
    And the user adds products with productLevel: '<ProductLevel>' productCodes: '<ProductCode>'
    And the user enters '<meas1>' on column name 'Display' for product code '<ProductCode>'
	And the user clicks on the 'General Info Tab' 
	And the user clicks on the 'Header Info Top Tab' 
    When the user retrieves text from 'Action Code Textbox' and saves it as 'ActionCode'
	And the user clicks on the 'Workflow Tab'
    Then the user validates that the 'Promo Status Trigger Icon' is displayed
    When the user clicks on the 'Promo Status Trigger Icon'
    And the user clicks on 'Radio Button' with value 'To be authorized'
    And the user clicks on the 'OK Button'
    When the user clicks on the 'Promo Status Trigger Icon'
    And the user clicks on 'Radio Button' with value 'Confirm'
    And the user clicks on the 'OK Button'

    # Step 3
    And the user navigates to the 'Claims' page under division'Claims'

    # Step 4
    And the user clicks on 'Grid Checkbox' with value 'DocumentID'
    And the user clicks on 'Grid Checkbox' with value 'DocumentID1'
    Then the user validates that the 'Claims Match Button' is displayed

    # Step 5
    When the user clicks on the 'Claims Match Button'

    # Step 6
    And the user clicks on the 'Next Button'

    # Step 7
	And the user enters '<Match>' in the 'Match To Textbox'
    And the user clicks on the 'Next Button'

    # Step 8
    And the user clicks on 'Grid Checkbox' with value 'ActionCode'
    And the user clicks on the 'Next Button'

    # Step 9
    And the user clicks on the 'Assign Button'

    # Step 10
    And the user clicks on the 'Next Button'

    # Step 11
    And the user clicks on the 'Close Tab'
    Then the user validates that the 'Close Wizard Message' with value '<Message>' is displayed

    # Step 12
    When the user clicks on the 'Yes Button'

    # Step 13
    Then the user validates that elements 'Rows' have loaded
    When the user filters the column by column name 'Document ID', Filter Type 'Like', Value 'DocumentID'
    And the user clicks on 'DocumentID' text on the grid
    Then the user validates that the 'Matchings Table Checkbox Cell' with value 'false' is displayed
    And the user validates that column '<columnName>' has '<Amount>' with row text '<Description>'
    And the user validates that column 'VAT Code' has 'VAT CODE 1' with row text '<Description>'
    And the user validates that column 'Action Code' has 'ActionCode' with row text '<Description>'
    When the user clicks on the 'Close Tab'
    And the user filters the column by column name 'Document ID', Filter Type 'Like', Value 'DocumentID1'
    Then the user validates that elements 'Rows' have loaded
    When the user clicks on 'DocumentID1' text on the grid
    Then the user validates that the 'Edit Button' is displayed
    And the user validates that the 'Matchings Table Checkbox Cell' with value 'false' is displayed
    And the user validates that column '<columnName>' has '<Amount>' with row text '<Amount>'
    And the user validates that column 'VAT Code' has 'VAT CODE 1' with row text '<Amount>'
    And the user validates that column 'Action Code' has 'ActionCode' with row text '<Amount>'

    # Step 14
    When the user clicks on the 'Close Tab'

    Examples:
    | DocumentType1 | Customer | Amount | CustomerDocNr1 | CustomerDocNr2 | Level   | Promo Action ID | PromoActionMechanic | Description       | status           | status1 | ProductCode | ProductLevel | Match                 | Promo     | DaysToAdd | Message                                         | meas1 | columnName | RowNumber |
    | REO           | EC86206  | 500.00 | Document1      | Document2      | Level 3 | Promo_018       | Display             | SA_TC309717_Promo | To Be Authorized | Confirm | 01          | Product      | Match to Agg1 (Promo) | Promo_018 | 29        | The matching is completed. Do you want to exit? | 1,000 | Amount     | 1         |