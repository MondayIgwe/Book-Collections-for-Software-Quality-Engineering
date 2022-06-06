Feature:  Automics Test Case 305210
	Open an existing Rebate

@automicsTestCase_305210
Scenario: TC305210 - TPM_SA_W_SMOKE_R80V1_0001 - Open existing Rebate
	Given the user is on the 'Rebates' page
	Then the user filters the column by column name 'Rebate code', 'Like', '<RebateCode>'
	When the user clicks on the link value '<RebateCode>' on the grid
	Then the user is on the 'Summary Tab' page
	When 'Description Field' is populated with '<Description>'
	And 'Rebate Code Field' is populated with '<RebateCode>'
	Then 'Classification Field' is populated with '<ClassificationValue>'
	And 'Reason Field' is populated with '<ReasonValue>'
	And 'Target Type Field' is populated with '<TargetTypeValue>'

	Examples: 
	| Description | RebateCode | ClassificationValue | ReasonValue      | TargetTypeValue |
	| TEST test   | 207005     | Supply              | Year End Bonuses | Unconditional   |