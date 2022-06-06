Feature: TestCase_308904
	Create a new Rebate on Kantar

@BDD
Scenario: Create a new Rebate
	Given the user is on the 'Rebates' page
	When the user clicks on the 'Add button'
	Then the user clicks on the 'Customer Holder'
	When the user selects '<CustomerHierarchyLevel>' in the 'Hier. level side panel'
	Then the user selects '<CustomerCode>' in the 'Customer code table'
	When the user clicks on the 'OK Customer code button'
	Then the user selects '<Classification>' in the dropbox '<ClassificationSm1ID>'
	And the user selects '<Reason>' in the dropbox '<ReasonSm1ID>'
	And the user selects '<TargetType>' in the dropbox '<TargetTypeSm1ID>'
	When the user clicks on the 'Ok Button'
	Then the user is on the 'Summary Tab' page
	And the user handles the loading screen
	And the user validates that there is a rebate code
	When the user selects '<DataSource>' in the dropbox '<CalculationSm1ID>'
	Then the user enters '<Threshold>' under the column number '1' in row number '1' in table 'Benifits'
	And the user enters '<Percentage>' under the column number '2' in row number '1' in table 'Benifits'
	When the user selects '<PaymentMode>' in the dropbox '<PaymentModeSm1ID>'
	And the user selects '<PaymentFrequency>' in the dropbox '<PaymentFrequencySM1ID>'
	Then the user clicks on the 'Toolbar Save Button'
	Then the user clicks on the 'Toolbar Close Button'
	And the user handles the loading screen
	Then the user is on the 'Rebates' page
	When the user selects the created rebate
	Then the user is on the 'Summary Tab' page
	Then the created rebate fields are populated with '<CustomerCode>', '<Status>', '<DataSource>', '<Threshold>', '<Percentage>', '<PaymentMode>', '<PaymentFrequency>'

	Examples: 
	| CustomerHierarchyLevel | CustomerCode | Classification | ClassificationSm1ID | Reason           | ReasonSm1ID | TargetType | TargetTypeSm1ID | DataSource        | CalculationSm1ID  | Threshold | Percentage | PaymentMode     | PaymentModeSm1ID      | PaymentFrequency | PaymentFrequencySM1ID   | Status |
	| Level 2                | EC86262      | Supply         | CLASSIFICATION      | Year End Bonuses | REASON      | Brackets   | TARGETTYPE      | Net sales revenue | cmbCalcBaseSource | 1,000.00  | 5.00       | Invoice payable | cmbPaymentModeCockpit | Monthly          | cmbPaymentSchemaCockpit | Draft  |