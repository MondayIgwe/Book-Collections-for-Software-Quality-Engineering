Feature: TestCase_317049
	Creates a new claim with the specified data and saves it,
	The new claim is then edited,
	Then the data claim is validated for the edit data.

Scenario: Test Case : 317049
	#Step 1 
	Given the user is on the 'Claims' page
	#Step 2
	When the user clicks on the 'Add button'
	#Step 3
	And the user adds the document number '<DocumentNumber>'
	#Step 4
	And the user clicks on the 'Customer open icon'
	And the user selects '<Level>' in the 'Hier. level side panel'
	And the user selects '<Customer>' in the 'Customer code table'
	And the user clicks on the 'New Customer Ok Button'
	#Step 5
	And the user selects today's Document Date
	#Step 6
	And the user enters a New Claim amount <Amount>
	#Step 7
	And the user clicks on the 'New Claim Ok Button'
	#Step 8
	And the user is on the 'Matchings Tab' page

	Then the user validates grid '<AmountColumnSM1-id>' value '<Amount>'
	Then the user validates grid '<VatAmountColumnSM1-id>' value '<VATAmount>'
	Then the user validates grid '<GrossAmountColumnSM1-id>' value '<GrossAmount>'
	
	#Step 9
	When the user clicks on the 'Summary Tab Button'

	Then the user retrieves the Document ID
	
	When the user clicks on the 'Save button'
	And the user clicks on the 'Close button'

	Then the user is on the 'Claims' page
	And the user clicks on the 'Refresh button'

	# Validation
	Then the new claim is present in the navigator

	#Step 10
	When the user opens the claim in edit mode

	And the user is on the 'Matchings Tab' page
	#Step 11
	When the user adds an invoice row '<VAT Code>' and '<Amount2>'

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
	| 5465           | Level 3 | EC94439  | 148.62 | NOVAT    | 671.35  | 819.97      | 28.24      | 176.86     | AMOUNT             | VATAMOUNT		     |GROSSAMOUNT             |NETAMOUNT               |Amount       |