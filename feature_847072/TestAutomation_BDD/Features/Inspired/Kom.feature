Feature: Kom
WEB_SA_CLAIM_CLAIM DOCUMENT_MATCHINGS_085 - D2D Matching Information pop-up - editability of the button



@mytag
Scenario: TC927240 - WEB_SA_CLAIM_CLAIM DOCUMENT_MATCHINGS_085 - D2D Matching Information pop-up - editability of the button
#Precondition - Create a new REO claim doc
Given the user is on the 'Claims' page
When the user clicks on the 'Add Button'
When the user adds the document Type '<DocumentType1>'
And the user adds the document number '<DocumentNumber>'
And the user clicks on the 'Customer open icon'
And the user selects '<Level>' in the 'Hier. level side panel'
And the user selects '<Customer>' in the 'Customer code table'
And the user clicks on Ok button on the popup 'New Customer'
And the user selects today's Document Date
And the user enters a New Claim amount <Amount>
And the user clicks on the 'New Claim Document Type Field'
When the user clicks on the 'New Claim Ok Button'
Then the user is on the 'Matchings Tab' page
#Precondition - Add a second row
When the user clicks on the 'Match To Generic Amounts Button'
When the user clicks on the 'Match To Option;Match To Payable Amounts'
And the user filters 'Source Type' 'like' column for '123'
When the user clicks on the 'Ok Button'
#Precondition - Add a third row
#When the user clicks on the 'Add Button'
#And the user enters '<VATCode>' in the 'New Claim VAT Code Field'
#And the user clicks on the 'New Claim Vat Code Option;<VATCode>'
#And the user enters '<AmountNewRow2>' in the 'New Claim Row Amount Field'
#And the user clicks on the 'New Claim VAT Code Field'
#And the user clicks on the 'New Claim Row Ok Button'
And the user clicks on the 'Toolbar Save Button'
And the user clicks on the 'Summary Tab Button'
And the user is on the 'Claims Summary Tab' page
And the 'Document ID field' is visible
And the user retrieves the 'Document ID field' text as 'DocumentID1'
When the user clicks on the 'Toolbar Close button'
Then the user is on the 'Claims' page
#Precondition - Create a new NCC claim doc
When the user clicks on the 'Add button'
When the user adds the document Type '<DocumentType2>'
And the user adds the document number '<DocumentNumber2>'
And the user clicks on the 'Customer open icon'
And the user selects '<Level>' in the 'Hier. level side panel'
And the user selects '<Customer>' in the 'Customer code table'
And the user clicks on Ok button on the popup 'New Customer'
And the user selects today's Document Date
And the user enters a New Claim amount <AmountNewRow>
When the user clicks on the 'New Claim Ok Button'
Then the user is on the 'Matchings Tab' page
When the user clicks on the 'Toolbar Save Button'
And the user clicks on the 'Summary Tab Button'
Then the user is on the 'Claims Summary Tab' page
And the 'Document ID field' is visible
And the user retrieves the 'Document ID field' text as 'DocumentID2'
When the user clicks on the 'Toolbar Close button'
Then the user is on the 'Claims' page
#Precondition - Perform the 'Match to document'
When the user clicks on the 'Refresh button'
And the user filters the column by column name 'Document ID', 'like', 'DocumentID1'
And the user clicks on the 'Document ID Link'
Then the user is on the 'Matchings Tab' page
And the user clicks on the 'Edit Button'
And the user selects a row by row number '{rowNumber}'
Examples:
| DocumentType1              | DocumentType2              | DocumentNumber | DocumentNumber2 | Level   | Customer | Amount | VATCode | AmountNewRow | AmountNewRow2 |
| REO - Customer Invoice     | NCC - Customer Credit Note | REO_927240     | NCC_927240      | Level 4 | EC86217  | 100 | NOVAT | 200 | 300 |
| NCC - Customer Credit Note | REO - Customer Invoice     | NCC_927240     | REO_927240      | Level 4 | EC86217  | 50 | NOVAT | 200 | 300 |