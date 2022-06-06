Feature: Functions Test Case 305210
	Open an existing Rebate

@functionsTestCase_305210
Scenario: TC305210 - TPM_SA_W_SMOKE_R80V1_0001 - Open existing Rebate
	Given the user is on the 'Rebates' page
	When an existing Rebate is opened <RebateCode>
	Then the rebate fields are populated with <RebateCode>, <Description>, <ClassificationValue>, <ReasonValue>, <TargetTypeValue>
	
	Examples: 
	| Description | RebateCode | ClassificationValue | ReasonValue      | TargetTypeValue |
	| TEST test   | 207005     | Supply              | Year End Bonuses | Unconditional   |