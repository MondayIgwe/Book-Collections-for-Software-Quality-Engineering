Feature: TC317049
    Creates a new claim with the specified data and saves it,
    The new claim is then edited,
    Then the data claim is validated for the edit data.
 
Scenario: TC317049 - TPM_SA_W_SMOKE_R80V1_0008 - Create new Claim
    #Step 1 
    Given the user is on the 'Claims' page

    When the user creates a New Claim '<DocumentNumber>' '<Level>' '<Customer>' '<Amount>'
 
    #Step 8
    And the user is on the 'Matchings Tab' page
 
    Then the user validates grid '<AmountColumnSM1-id>' value '<Amount>'
    Then the user validates grid '<VatAmountColumnSM1-id>' value '<VATAmount>'
    Then the user validates grid '<GrossAmountColumnSM1-id>' value '<GrossAmount>'

    #Step 9
    And the user clicks on the 'Summary Tab Button'
 
    And the user retrieves the Document ID

    Then the user clicks on the 'Save button'
    And the user clicks on the 'Close button'
 
    Then the user is on the 'Claims' page
    And the user clicks on the 'Refresh button'
 
    Then the user adds an invoice row in claims page '<VAT Code>' '<Amount2>'
 
    #Step 12
    Then the user validates claims grid '<ColumnName>' total summary value '<TotalAmount>'
 
    #Step 13-14
    When the user clicks on the 'Save button'
 
    And the user clicks on the 'Close button'
 
    Then the user is on the 'Claims' page

    And the user clicks on the 'Refresh button'
 
    Then the user validates grid '<NetAmountColumnSM1-id>' value '<TotalAmount>'
 
    Examples: 
    | DocumentNumber | Level   | Customer | Amount | VAT Code | Amount2 | TotalAmount | VATAmount | GrossAmount | AmountColumnSM1-id | VatAmountColumnSM1-id |GrossAmountColumnSM1-id |NetAmountColumnSM1-id   |ColumnName   |
    | 5465           | Level 3 | EC94439  | 148.62 | NOVAT    | 671.35  | 819.97      | 28.24      | 176.86     | AMOUNT             | VATAMOUNT             |GROSSAMOUNT             |NETAMOUNT               |Amount       |
 
