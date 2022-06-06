Feature: TestCase316220
	WEB_SA_CLAIM_CLAIM DOCUMENT_004 - Close a new claim without saving - created from Main menu + default VAT

@TTC_Nightly @TTC @BDD_316220
Scenario: WEB_SA_CLAIM_CLAIM DOCUMENT_004
	Given the user navigates to the 'Claims' page under division'Claims'
    When the user clicks on the 'Add Button'
	When the user enters '<DocumentNumber>' in field 'Input By Label Name' with value 'Customer document nr.'
    And the user clicks on 'Trigger By Field Name' with value 'Customer'
	And the user clicks on 'Hier. level side panel' with value '<Level>'
	And the user clicks on 'Customer Code table' with value '<Customer>'
    And the user clicks on 'Popup Ok Button' with value 'New Customer'
    And the user clicks on the 'Date Calendar Icon'
    And the user clicks on the 'Today Button'
	When the user enters '<Amount>' in field 'Input By Label Name' with value 'Amount'
    And the user clicks on the 'Customer Document Number TextField'
    And the user clicks on 'Popup Ok Button' with value 'New Claim'
    Then the user validates that the 'Add Button' is displayed
    And the user validates that column 'VAT Code' has '<CellValue>' with row text '<Amount>'
    And the user clicks on the 'Toolbar Close Button'
    
    Examples:
    | DocumentType1 | defaultVat | Customer | Amount | DocumentNumber | Level   | rowNumber | ColumnSM1ID  | CellValue  |
    | REO           | VAT CODE 1 | EC86292  | 105.67 | 316220_REO     | Level 2 | 2         | VATAMOUNT    | VAT CODE 1 |
    | NCC           | VAT CODE 1 | EC86292  | 324.99 | 316220_REO     | Level 2 | 2         | VATAMOUNT    | VAT CODE 1 |