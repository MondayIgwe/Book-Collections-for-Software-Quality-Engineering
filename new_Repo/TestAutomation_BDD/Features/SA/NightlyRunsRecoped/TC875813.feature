Feature: WEB_SA_CLAIM_CLAIM DOCUMENT_AGGREGATED MATCHINGS PAGE_001
	TC875813The match to buttons and the match to options in the combo box, are disabled if the Amount=0

@TTC @BDD_875813
Scenario: TC875813 WEB_SA_CLAIM_CLAIM DOCUMENT_AGGREGATED MATCHINGS PAGE_001
    Given the user navigates to the 'Claims' page under division'Claims'
    When the user clicks on the 'Add Button'
    Then the user validates that the 'Popup' with value 'New Claim' is displayed
	When the user enters '<DocumentType>' in field 'Input By Label Name' with value 'Document Type'
	When the user enters '<DocumentNumber>' in field 'Input By Label Name' with value 'Customer document nr.'
    And the user clicks on the 'Customer Open Icon'
	And the user clicks on 'Hier. level side panel' with value '<Level>'
	And the user clicks on 'Customer Code table' with value '<Customer>'
    And the user clicks on 'Popup Ok Button' with value 'New Customer'
    And the user clicks on the 'Date Calendar Icon'
    And the user clicks on the 'Today Button'
	When the user enters '<Amount>' in field 'Input By Label Name' with value 'Amount'
    And the user clicks on 'Input By Label Name' with value 'Document Type'
    And the user clicks on 'Popup Ok Button' with value 'New Claim'
	And the user clicks on the 'Accept Button'
	And the user clicks on 'Button' with value 'Yes'
	And the user clicks on 'Button' with value 'Save'
	And the user clicks on 'Side Panel Tab' with value 'Summary'
    Then the user validates that the 'Input By Label Name' with value 'Document ID' is displayed
    When the user retrieves text from element 'Input By Label Name' with value 'Document ID' and saves it as 'DocumentId'
    When the user clicks on the 'Close Tab'
    And the user clicks on the 'Refresh button'
    And the user filters the column by column name 'Document ID', 'Like', 'DocumentId'
    And the user clicks on the 'Document ID Link'
	And the user clicks on 'Button' with value 'Edit'
	And the user clicks on 'Side Panel Tab' with value 'Aggregated Matchings'
    Then the user validates that the 'Button' with value 'Match' is displayed
    And the user validates the 'Payable Amount Button' is disabled
    And the user validates the 'Promo ID Button' is disabled
	And the user clicks on 'Button' with value 'Match'
    And the user validates the 'Promo ID Mechanics Option' is disabled
    And the user validates the 'Reason Option' is disabled
    And the user validates the 'Promo Mechanics Product Option' is disabled

    Examples:
    |DocumentType              |   DocumentNumber |Level   |Customer |Amount |
    |REO - Customer Invoice     |   875813_REO     |Level 4 |EC86217  |50     |
    |NCC - Customer Credit Note |   875813_NCC     |Level 4 |EC86217  |50     |