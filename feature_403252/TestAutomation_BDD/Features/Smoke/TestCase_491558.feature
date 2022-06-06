Feature: TestCase_491558
	Create rebate with different filter on target

@mytag
Scenario: Create rebate with different filter on target

    #Step 1
    Given the user is on the 'Agreements' page
    When the user clicks on the 'Add button'
	Then the user clicks on the 'Customer Holder Icon'
	When the user selects '<CustomerHierarchyLevel>' in the 'Hier. level side panel'
	Then the user selects '<CustomerCode>' in the 'Customer code table'
	When the user clicks on the 'OK Customer code button'
	When the user enters '<AgreementCode>' in the 'Agreement Code'
	And the user enters '<AgreementDesc>' in the 'Agreement Desc'
	Then the user clicks on the 'New Agreement OK button'
	Then the user is on the 'Conditions Tab' page

	#Step 2
	When the user clicks on the 'Rebates Add A Product Button'

	#Step 3
	And the user handles the loading screen
	When the user selects '<Classification>' in the dropbox '<ClassificationSM1ID>'
	And the user selects '<Reason>' in the dropbox '<ReasonSM1ID>'
	And the user selects '<TargetType>' in the dropbox '<TargetTypeSM1ID>'
	And the user selects '<PaymentMode>' in the dropbox '<PaymentModeSM1ID>'
	And the user selects '<CalculationBasis>' in the dropbox '<CalculationBasisSM1ID>'
	Then the user selects a date wtih '<StartDay>' '<StartMonth>' '<EndDay>' '<EndMonth>'
	
	#Step 4
	Then the user populates 'hier' filter maker '<Attribute1>' '<Operator1>' '<filterValue>' '<FilterName1>' '<CustomerHierarchyLevel1>'

	#Step 5
	And the user selects '<BeneficiaryLvl>' in the dropbox '<BeneficiaryLvlSM1ID>'

	#Step 6
	Then the user populates 'customer' filter maker '<Attribute1>' '<Operator1>' '<FilterValue1>' '<FilterName1>' ''

	#Step 7
	Then the user populates 'product' filter maker '<Attribute2>' '<Operator2>' '<FilterValue2>' '<FilterName2>' ''

	#Step 8
	Then the user clicks on the 'Rebates Add Product Button'
	When the user selects '<ProductsLevel>' in the 'Products Level'
	Then the user selects '<ProductsCode>' in the 'Products code table'
	When the user clicks on Ok button on the popup 'Products'

	#Step 9/ Step 10
	Then the user clicks on the 'Target button'
	Then the user checks on the 'AggregatedCheckbox' checkbox
	And the user selects '<TargetLevel>' in the dropbox '<TargetLevelSM1ID>'
	Then the user populates 'target' filter maker '<Attribute3>' '<Operator3>' '<FilterValue3>' '<FilterName3>' ''
	When the user clicks on Ok button on the popup 'Target'

	#Step 11
	Then the user clicks on the 'Other Info Arrow'
	Then the user clicks on the 'Calculation Basis Start Date'
	Then the user selects a date wtih '<StartDay>' '<StartMonth>' '<EndDay>' '<EndMonth1>'
	Then the user clicks on the 'Target Start Date'
	Then the user selects a date wtih '<StartDay1>' '<StartMonth1>' '<EndDay1>' '<EndMonth1>'

	#Step 12
	Then the user enters '<LumpSum>' under the column number '4' in row number '1' in table 'Products Rebate Table'
	Then the user enters '<LumpSum>' under the column number '4' in row number '2' in table 'Products Rebate Table'

	#Step 13
	When the user clicks on Ok button on the popup 'New Rebate:'

	#Step 14/15
	Then the user clicks on the 'Agreement save button'
    And the user handles the loading screen
	Then the user saves the 'AgreementID'
	Then the user clicks on the 'close button'
	And the user handles the loading screen
	Then the user is on the 'Agreements' page

	#Step 16/17
	Given the user is on the 'Rebates' page
	Then the user filters the column by sm1ID 'AGREEMENTID', 'Equal', '269'

	#Step 18
	Then the user clicks under the column name 'Rebate code' in row number '2' in table 'Rebates'
	And the user handles the loading screen
	Then the user is on the 'Summary Tab' page
	Then the user validates that the '<rebateDateSm1ID>' validaty dates '<StartDate>' '<EndDate>'
	Then the user validates that the '<calcultionbasisDateSm1ID>' validaty dates '<StartDate1>' '<EndDate1>'
	Then the user validates that the 'calculationbasis' section filter '<FilterName2>' '<FilterName2>' '<FilterName3>'
	And the user validates that the 'Target' section filter '<FilterName1>' '<FilterName3>' '<FilterName1>'
	And the user validates that the checkbox '<SamefiltersontargetSm1ID>' is not flagged

	#Step 19
	Then the user clicks on the 'Products Side Tab'
	Then the user is on the 'Products Tab' page
    And the user validates '<ProductCode>' under the column name '1' in row number '1' in table 'Products Rebate Table'

	#Step 20
	Then the user clicks on the 'Target side Tab'
	And the user validates '<ProductCode1>' under the column name '1' in row number '1' in table 'Products Rebate Table'

	#Step 21
	Then the user clicks on the 'Calculation Basis side Tab'
	Then the user clicks on the 'Refresh button calculation basis'
	And the user validates the table contains a single row in table 'Products Rebate Table'

    #Step 22
	Then the user clicks on the 'Target side Tab'
	And the user validates the table contains a single row in table 'Target Rebate Table' 
	Then the user clicks on the 'close button'
	And the user handles the loading screen

	#Step 23
	When the user is on the 'Rebates' page
	Then the user clicks under the column name 'Rebate code' in row number '1' in table 'Rebates'
	Then the user validates that the '<rebateDateSm1ID>' validaty dates '<StartDate>' '<EndDate>'
	Then the user validates that the '<calcultionbasisDateSm1ID>' validaty dates '<StartDate1>' '<EndDate1>'
	Then the user validates that the 'calcultionbasis' section filter '<FilterName1>' '<FilterName2>' '<FilterName3>'
	And the user validates that the 'Target' section filter '<FilterName1>' '<FilterName2>' '<FilterName4>'
	And the user validates that the checkbox '<SamefiltersontargetSm1ID>' is not flagged
	
	#Step 24
	Then the user clicks on the 'Product page'
	And the user validates '<ProductCode>' under the column name '1' in row number '1' in table 'Products Rebate Table'

	#Step 25
	Then the user clicks on the 'Target side Tab'
	And the user validates '<ProductCode1>' under the column name '1' in row number '1' in table 'Target Rebate Table' 

	#Step 26
	Then the user clicks on the 'Calculation Basis side Tab'
	Then the user clicks on the 'Refresh button calculation basis'
	And the user validates the table contains a single row in table 'Products Rebate Table' 

    #Step 27
	Then the user clicks on the 'Target Tab'
	And the user validates the table contains a single row in table 'Target Rebate Table'
	Then the user clicks on the 'close button'
	And the user handles the loading screen

	Examples: 
	| CustomerCode | CustomerHierarchyLevel | AgreementCode               | AgreementDesc                      | Classification | ClassificationSM1ID | Reason           | ReasonSM1ID | TargetType | TargetTypeSM1ID | PaymentMode | PaymentModeSM1ID | CalculationBasis  | CalculationBasisSM1ID | StartDay | StartMonth | EndDay | EndMonth | CustomerHierarchyLevel1 | CustomerCode1 | FilterName            | BeneficiaryLvl | BeneficiaryLvlSM1ID | Attribute1   | Operator1 | FilterValue1 | FilterName1           | Attribute2 | FilterValue2  | FilterName2           | ProductsLevel | ProductsCode | TargetLevel | TargetLevelSM1ID | Attribute3 | FilterValue3  | FilterName3           | StartDay1 | StartMonth1 | EndDay1 | EndMonth1 | StartDay2 | StartMonth2 | EndDay2 | EndMonth2 | LumpSum | rebateDateSm1ID | calcultionbasisDateSm1ID | targetDateSm1ID | StartDate  | EndDate    | StartDate1 | EndDate1   | EndDate2   | SamefiltersontargetSm1ID | filterValue |
	| EC86217      | Level 4                | TestAutomationAgreementCode | TestAutomationAgreementDescription | Supply         | CLASSIFICATION      | Year End Bonuses | REASON      | Brackets   | TARGETTYPE      | Credit note | PAYMENTMODE      | Net sales revenue | CALCBASESOURCE        | 01       | 02         | 30     | 11       | Level 1                 | EC87135       | TestAutomationFilter1 | Level 1        | BENEFICIARYLEVEL    | Nielsen Area | In        | AN4          | TestAutomationFilter2 | EAN        | 8000102030059 | TestAutomationFilter3 | Family        | 01           | Level 0     | TARGETLEVEL      | EAN        | 8000101010011 | TestAutomationFilter4 | 01        | 02          | 30      | 06        | 01        | 07          | 30      | 11        | 100     | dtpPeriod       | dtpCalcBase              | dtpTarget       | 01/01/2021 | 12/31/2021 | 02/01/2021 | 06/30/2021 | 06/30/2021 | CHKFLGSAMEFILTER         | EC87135     |
	