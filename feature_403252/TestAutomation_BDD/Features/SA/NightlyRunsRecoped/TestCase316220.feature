Feature: TestCase316220
	WEB_SA_CLAIM_CLAIM DOCUMENT_004 - Close a new claim without saving - created from Main menu + default VAT

@TTC_Nightly @TTC @BDD_316220
Scenario: WEB_SA_CLAIM_CLAIM DOCUMENT_004
    
    # Step 1 & 2
	Given the user navigates to the 'Claims' page under division'Claims'

    # Step 3 - 5
    When the user creates a New Claim '<DocumentType1>' '<DocumentNumber>' '<Level>' '<Customer>' '<Amount>'
    Then the user validates that the 'Add Button' is displayed
    And the user validates that the 'Button' with value 'Edit' is enabled

    # Step 6
    And the user validates that column 'VAT Code' has '<CellValue>' with row text '<Amount>'

    # Step 7
    When the user clicks on the 'Toolbar Close Button'
    Then the user validates that the 'Alert Dialog Message Box' is not present

    Examples:
    | DocumentType1 | defaultVat | Customer | Amount | DocumentNumber | Level   | rowNumber | ColumnSM1ID  | CellValue  |
    | REO           | VAT CODE 1 | EC86292  | 105.67 | 316220_REO     | Level 2 | 2         | VATAMOUNT    | VAT CODE 1 |
    | NCC           | VAT CODE 1 | EC86292  | 324.99 | 316220_REO     | Level 2 | 2         | VATAMOUNT    | VAT CODE 1 |