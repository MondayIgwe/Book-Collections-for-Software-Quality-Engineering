Feature: TestCase559339
	WEB_SA_AGREEMENT_AGREEMENT DOCUMENT_CONDITIONS_097 - Promo tab - only target with end date <= sell-in end date are visible in the selector

@TTC_Nightly @TCC @BDD_559339
Scenario: WEB_SA_AGREEMENT_AGREEMENT_DOCUMENT_CONDITIONS_097
	# Step 1 Precondition1
	Given the user navigates to the 'Agreements' page
	When the user creates a New Document '<CustomerLevel>' '<CustomerHolder>' '<AgreementCode>' '<AgreementDescription>'
	And the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementID'
	# step 2 Precondition2
	Then the user validates that the 'Sub Tab Add Button' with value 'Rebate Header' is displayed
	When the user clicks on 'Sub Tab Add Button' with value 'Rebate Header'
	Then the user validates that the 'Popup' with value 'New Rebate:' is displayed
	When the user populates the New Rebate Details '<Classification>' '<Reason>' '<TargetType>' '<PaymentMode>' '<CalculationBasis>' '<RebateDescription>'
	And the user selects validity period '<StartDate>' '<EndDate>' on the 'Rebate Validity Period' field
	#3 Precondition3
	And the user clicks on 'Element by SM1Id' with value 'ACTION_all-filters'
	And the user in popup 'Rebate Products:' enters '<Percentage>' in cell with column '%' and row text 'All Products'
	And the user clicks on 'Popup Ok Button' with value 'New Rebate'
	And the user clicks on the 'Save Button'
	When the user clicks on the 'Close Tab'
	#4 Precondition4
	Given the user navigates to the 'Rebates' page
	When the user creates a Rebate '<CustomerLevel>' '<CustomerHolder>' '<Classification>' '<Reason>' '<TargetType>'
	And the user populates the Rebate Details '<PaymentMode>' '<CalculationBasis>' '<RebateDescription2>'
	And the user selects validity period '<StartDate>' '<EndDate>' on the 'Small Letter Rebate validity Period' field
	Then the user validates that the 'Input By Label Name' with value 'Rebate code' is displayed
	When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode2'
	And the user enters '<FixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user populates the Rebate mandatory data '<TargetSource>' '<PaymentMode>' '<PaymentFrequency>'
	And the user clicks on 'Side Panel Tab' with value 'General Info'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Agreement ID'
	And the user clicks on 'Text' with value 'AgreementID'
	And the user clicks on 'Popup Button' with value 'OK'
	And the user clicks on the 'Agreement Code Label'
	And the user clicks on the 'Save Button'
	And the user clicks on 'Side Panel Tab' with value 'Customers'
	And the user clicks on the 'Refresh button'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#5 Open agreements navigator and open the @AgreementCode document in edit mode
	And the user navigates to the 'Agreements' page
	And the user clicks on 'AgreementID' text on the grid
	And the user clicks on 'Button' with value 'Edit'
	And the user clicks on 'Side Panel Tab' with value 'Conditions'
	When the user clicks on 'Sub Tab' with value 'PROMOTIONS'
	Then the user validates that the 'Sub Tab Add Button' with value 'Promo Header' is displayed
	When the user clicks on 'Sub Tab Add Button' with value 'Promo Header'
	Then the user validates that the 'Popup' with value 'New Promotion' is displayed
	When the user clicks on 'Popup Ok Button' with value 'New Promotion'
	Then the user validates that the 'Input By Label Name' with value 'Description' is displayed
	When the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	When the user populates the cockpit '<PromoDescription>' '<promoStartDate>' '<promoEndDate>' '<promoStartDate>' '<promoEndDate>' '<Mechanic>'
	When the user clicks on 'Sub Tab' with value 'Header info'
	When the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'PromoId'
	When the user adds a product '<ProductLevel>' '<ProductCode>'
	Then the user validates that elements 'Rows' have loaded
	When the user enters '<Measure>' on column name '<Mechanic>' for product code '<ProductCode>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#6 Select the promo row and click on the Add link to target  button
	Then the user validates that the 'Loading Mask' is not present
	When the user clicks on 'Grid Checkbox' with value 'ActionId'
	And the user clicks on 'Button' with value 'Add Link to Target'
	#Two rows are present in the popup grid related to @RebateDescription and @RebateDescription2
	Then the user validates that the 'Popup Grid Node' with value '<RebateDescription>' is present
	And the user validates that the 'Popup Grid Node' with value '<RebateDescription2>' is present
	#7 Click Cancel on the popup
	When the user clicks on 'Popup Button' with value 'Cancel'
	#8 Save the agreement
	And the user clicks on the 'Save Button'
	#9 Go to the Rebates tab -> select the row and click Edit
	And the user clicks on 'Top Tab' with value 'REBATES'
	And the user clicks on 'Grid Checkbox' with value '<RebateDescription>'
	And the user clicks on 'Element by SM1Id' with value 'ACTION_edit'
	#10 Change the validity: @StartDay @StartMonth Current year- @EndDay3 @EndMonth4 Current year
	Then the user validates that the 'Loading Mask' is not present
	When the user selects validity period '<StartDate>' '<RebateUpdateEndDate>' on the 'Rebate Validity Period' field
	#11 Click OK on the MP popup AND Save the Agreement
	And the user clicks on 'Popup Button' with value 'OK'
	And the user clicks on the 'Save Button'
	#12 Go to Promotions tab -> select the promo row and click on the Add link to target  button 
	And the user clicks on 'Top Tab' with value 'PROMOTIONS'
	And the user clicks on 'Button' with value 'Add Link to Target'
	#Only one row is present in the popup grid related to @RebateDescription2
	Then the user validates that the 'Popup Grid Node' with value '<RebateDescription>' is not present
	And the user validates that the 'Popup Grid Node' with value '<RebateDescription2>' is present
	#13 Click Cancel on the popup and close the agreement
	When the user clicks on 'Popup Button' with value 'Cancel'
	#14 From rebates navigator open the @RebateDescription2 in edit mode
	When the user navigates to the 'Rebates' page
	And the user filters the column by column name 'Rebate code', 'Like', 'RebateCode2'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	#15 Change the validity: @StartDay @StartMonth Current year- @EndDay3 @EndMonth4 Current year
	Then the user validates that the 'Loading Mask' is not present
	When the user selects validity period '<StartDate>' '<RebateUpdateEndDate>' on the 'Small Letter Rebate validity Period' field
	And the user clicks on the 'Save Button'
	When the user clicks on the 'Close Tab'
	#16 Open the @AgreementCode document in edit mode and go to the Promotions tab
	When the user navigates to the 'Agreements' page
	And the user filters the column by column name 'Agreement ID', 'Like', 'AgreementID'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	And the user clicks on 'Side Panel Tab' with value 'Conditions'
	And the user clicks on 'Top Tab' with value 'PROMOTIONS'
	#17 Select the promo row and click on the Add link to target  button 
	And the user clicks on 'Grid Checkbox' with value 'ActionId'
	And the user clicks on 'Button' with value 'Add Link to Target'
	Then the user validates that the 'Popup Grid Node' with value '<RebateDescription>' is not present
	And the user validates that the 'Popup Grid Node' with value '<RebateDescription2>' is not present

	Examples:
		| CustomerLevel | CustomerHolder | AgreementCode   | AgreementDescription | Classification | Reason           | TargetType | PaymentMode     | CalculationBasis       | TargetSource      | RebateDescription | StartDate | EndDate | Percentage | RebateDescription2 | PaymentFrequency | FixedAmount | promoStartDate | promoEndDate | PromoDescription | Mechanic | ProductLevel | ProductCode | Measure | RebateUpdateEndDate |
		| Level 3       | EC86215        | AGG_CODE_559339 | AGG_DES_559339       | Supply         | Year End Bonuses | Brackets   | Invoice payable | Sales volumes (pieces) | Net sales revenue | REB_DES_559339    | 01/01/y   | 30/06/y | 10         | REB2_DES_559339    | Monthly          | 3000        | 01/08/y        | 31/08/y      | PROMO_559339     | Display  | Product      | 007         | 500     | 31/10/y             |