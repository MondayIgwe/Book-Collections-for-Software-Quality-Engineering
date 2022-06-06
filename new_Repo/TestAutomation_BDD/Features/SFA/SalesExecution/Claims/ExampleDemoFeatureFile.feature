Feature: ExampleDemoFeatureFile
	This is a demo example file

@ExampleDemoFile
Scenario: TC317049 - TPM_SA_W_SMOKE_R80V1_0008 - Create new Claim
	Given the user is on the 'Claims' page
	When the user clicks on the 'Add button'
	And the user adds the document number '<DocumentNumber>'
	And the user clicks on the 'Customer open icon'
	And the user selects '<level>' in the 'Hier. level side panel'
	And the user filters the column by column name 'Customer code', 'like', '<customer>'
	Then the user validates grid 'Customer code' value '<customer>'
	When the user selects the '<customer>'
	And the user clicks on the 'New Customer Ok Button'
	And the user selects today's Document Date
	And the user enters a New Claim amount <Amount>
	When the user clicks on the 'New Claim Ok Button'
	Then the user is on the 'Matchings Tab' page
	Then the user validates 'VAT Amount' row and header information is '<VatAmount>'
	And the user validates 'Amount' row and header information is '<NetAmount>'
	And the user validates 'Gross Amount' row and header information is '<GrossAmount>'
	When the user clicks on the 'Save button'
	And the user clicks on the 'Close button'
	Then the user is on the 'Claims' page
	And the user clicks on the 'Refresh button'

Examples: 
	| DocumentNumber | level   | customer | Amount | VatAmount | NetAmount | GrossAmount |
	| 5465           | Level 3 | EC94439  | 148,62 | 28.24     | 148.62    | 176.86      |
	| 5465           | Level 3 | EC94439  | 148,62 | 28.24     | 148.62    | 176.86      |
