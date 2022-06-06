Feature: TestCase352730
	WEB_SA_BALANCE_BALANCE DOCUMENT_ADJUSTMENT_003_Finalization step

@TTC_Nightly @TCC @BDD_352730
Scenario: WEB_SA_BALANCE_BALANCE_DOCUMENT_ADJUSTMENT_003_Finalization_step
	# Step 1 Precondition1: Create a Promo for @customer @level with 2 products @prod1 and @prod2 and one mechanic @mech1, and the same measure @meas AND Move the promo to @status
	Given the user navigates to the 'Promotional actions' page
	When the user creates a Promo '<level>' '<customer>'
	And the user populates the cockpit '<promodescription1>' '<SELLINSTART>' '<SELLINEND>' '<SELLOUTSTARTDATE>' '<SELLOUTENDDATE>' '<mech1>'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Top Tab' with value 'Header info'
	And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode1'
	And the user adds a product '<productLevel>' '<prod1>'
	And the user adds a product '<productLevel>' '<prod2>'
	And the user enters '<meas>' on column name '<mech1>' for product code '<prod1>'
	And the user enters '<meas>' on column name '<mech1>' for product code '<prod2>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user changes the status to 'To be authorized'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#2 Precondition2: Create a Promo for @customer with 2 products @prod3 and @prod4 and one mechanic @mech1, and the same measure @meas AND  Move the promo to @status
	When the user navigates to the 'Promotional actions' page
	When the user creates a Promo '<level>' '<customer>'
	And the user populates the cockpit '<promodescription2>' '<SELLINSTART>' '<SELLINEND>' '<SELLOUTSTARTDATE>' '<SELLOUTENDDATE>' '<mech1>'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Top Tab' with value 'Header info'
	And the user retrieves text from element 'Input By Label Name' with value 'Action code' and saves it as 'ActionCode2'
	And the user adds a product '<productLevel>' '<prod3>'
	And the user adds a product '<productLevel>' '<prod4>'
	And the user enters '<meas>' on column name '<mech1>' for product code '<prod3>'
	And the user enters '<meas>' on column name '<mech1>' for product code '<prod4>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user changes the status to 'To be authorized'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#3 Precondition3: Create a REO claim for the @custome
	When the user navigates to the 'Claims' page under division'Claims'
	And the user creates a New Claim '' '<CustomerDocNr1>' '<level>' '<customer>' '<amount>'
	And the user clicks on 'Side Panel Tab' with value 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Document ID' and saves it as 'ClaimDocumentID'
	And the user clicks on 'Side Panel Tab' with value 'Matchings'
	And the user selects action 'Match To Generic Amounts' 'Match To Payable Amounts'
	And the user opens the Grid Settings Menu option: 'Remove Filter' in the 'Select Payable Amount' pop up table
	And the user clicks on element 'Grid CheckBox Containing Multi Texts' with value 'ActionCode1' and value '<prod1>'
	And the user clicks on element 'Grid CheckBox Containing Multi Texts' with value 'ActionCode1' and value '<prod2>'
	And the user clicks on element 'Grid CheckBox Containing Multi Texts' with value 'ActionCode2' and value '<prod3>'
	And the user clicks on element 'Grid CheckBox Containing Multi Texts' with value 'ActionCode2' and value '<prod4>'
	And the user clicks on 'Popup Button' with value 'OK'
	And the user enters '<atm1>' in grid cell with column 'Amount to match' and row text '<prod1>' in popup 'Matching finalization'
	And the user enters '<atm2>' in grid cell with column 'Amount to match' and row text '<prod2>' in popup 'Matching finalization'
	And the user enters '<atm3>' in grid cell with column 'Amount to match' and row text '<prod3>' in popup 'Matching finalization'
	And the user enters '<atm4>' in grid cell with column 'Amount to match' and row text '<prod4>' in popup 'Matching finalization'
	And the user clicks on 'Popup Button' with value 'OK'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#4 Login to app
	#5 Open the Balance navigator
	When the user navigates to the 'Balances' page by sm1-id 'BALANCE'
	#6 Create a new balance: Leave the current year and select the @customer -> click OK
	And user creates a new balance '<level>' '<customer>' '<BalanceYear>' '<Supplier>'
	#7 Click on Selector button
	#8 Click on Promo Selector
	And the user selects action 'Selector' 'Promo Selector'
	#9 In the promo selector Select the two promo created in preconditions 1 and 2, such as the sum of the OPA is < 0 and Click OK
	And the user clicks on 'Grid CheckBox Containing' with value 'ActionCode1'
	And the user clicks on 'Grid CheckBox Containing' with value 'ActionCode2'
	And the user clicks on 'Popup Button' with value 'OK'
	#10 Check the columns from the selector grid
	#Selection check-box (test that the multiselection is allowed)
	And the user clicks on 'Popup All Checkbox By Name' with value 'Finalization'
	Then the user validates that the 'Unchecked Grid CheckBox Containing' with value 'ActionCode1' is not present
	And the user validates that the 'Unchecked Grid CheckBox Containing' with value 'ActionCode2' is not present
	#Check Amount to Balance
	When the user retrieves text from popup 'Finalization' column 'Open payable amount' with unique row text 'ActionCode1' and saves it as 'OpenPayableAmount'
	Then the user validates that popup 'Finalization' column 'Amount to Balance' has opposite value of 'OpenPayableAmount' with row text 'ActionCode1'
	When the user retrieves text from popup 'Finalization' column 'Open payable amount' with unique row text 'ActionCode2' and saves it as 'OpenPayableAmount2'
	Then the user validates that popup 'Finalization' column 'Amount to Balance' has opposite value of 'OpenPayableAmount2' with row text 'ActionCode2'
	And the user validates that popup 'Finalization' column 'Amount to Balance' with row text 'ActionCode1' has the correct color
	And the user validates that popup 'Finalization' column 'Amount to Balance' with row text 'ActionCode2' has the correct color
	And the user validates that popup 'Finalization' column 'Amount to Balance' with row text 'ActionCode1' is not editable
	And the user validates that popup 'Finalization' column 'Amount to Balance' with row text 'ActionCode2' is not editable
	#Balance %: is a read only field with value 100% at the landing
	And the user validates that popup 'Finalization' column 'Balance Percentage' with row text 'ActionCode1' is not editable
	And the user validates that popup 'Finalization' column 'Balance Percentage' with row text 'ActionCode2' is not editable
	And the user validates that popup 'Finalization' column 'Balance Percentage' has '100' with row text 'ActionCode1'
	And the user validates that popup 'Finalization' column 'Balance Percentage' has '100' with row text 'ActionCode2'
	#ABS Amount to Balance filled with the result of this formula [ABS OPA * Balance%]
	When the user retrieves text from popup 'Finalization' column 'Balance Percentage' with unique row text 'ActionCode1' and saves it as 'BalancePercentage1'
	And the user retrieves text from popup 'Finalization' column 'ABS OPA' with unique row text 'ActionCode1' and saves it as 'ABSOPA1'
	And the user retrieves text from popup 'Finalization' column 'Absolute Amount to Balance' with unique row text 'ActionCode1' and saves it as 'AbsoluteAmountToBalance'
	Then user validates that 'AbsoluteAmountToBalance' has value of 'ABSOPA1' 'percent' 'BalancePercentage1'
	When the user retrieves text from popup 'Finalization' column 'Balance Percentage' with unique row text 'ActionCode2' and saves it as 'BalancePercentage2'
	And the user retrieves text from popup 'Finalization' column 'ABS OPA' with unique row text 'ActionCode2' and saves it as 'ABSOPA2'
	And the user retrieves text from popup 'Finalization' column 'Absolute Amount to Balance' with unique row text 'ActionCode2' and saves it as 'AbsoluteAmountToBalance2'
	Then user validates that 'AbsoluteAmountToBalance2' has value of 'ABSOPA2' 'percent' 'BalancePercentage2'
	#ABS Open Payable Amount filled with the sum of the absolute values of the OPA of the child payable amount of the row (in the payable amount selector is the absolute value of the OPA of the row)
	#11 Check the rows from the grid -> In the grid there are the same rows selected in the selector popup
	Then the user validates that the 'Grid CheckBox Containing' with value 'ActionCode1' is present
	And the user validates that the 'Grid CheckBox Containing' with value 'ActionCode2' is present
	#12 Check in the header of the popup if field 'Total Balance Amount' is present - > The field 'Total Balance Amount' is present and contains the sum of 'Amount to Balance' rows
	When the user retrieves text from popup 'Finalization' column 'Amount to Balance' with unique row text 'ActionCode1' and saves it as 'AmountToBalance1'
	And the user retrieves text from popup 'Finalization' column 'Amount to Balance' with unique row text 'ActionCode2' and saves it as 'AmountToBalance2'
	And the user retrieves text from element 'Input By Label Name' with value 'Total Balance Amount' and saves it as 'TotalBalanceAmount'
	Then user validates that 'TotalBalanceAmount' has value of 'AmountToBalance1' 'plus' 'AmountToBalance2'
	#13 Check in the grid Toolbar if there is a combo box 'Percentage' -> A combo box 'Percentage' is present with values  'o%','25%','50%','75%','100%' listed
	#14 Check OK and Cancel buttons -> OK and Cancel buttons are enabled
	Then the user validates that the 'Popup Button' with value 'Cancel' is enabled
	#15 Click on Cancel or Close the popup (X)
	When the user clicks on 'Input By Label Name' with value 'Total Balance Amount'
	And the user clicks on 'Popup Cancel Button' with value 'Finalization'
	Then the user validates that the 'Grid CheckBox Containing' with value 'ActionCode1' is not present
	And the user validates that the 'Grid CheckBox Containing' with value 'ActionCode2' is not present
	#16 Repeat steps from 5 to 12 choosing the Payable amount selector and the rows related to @prod2 @prod3 and @prod4, in order to have the sum of OPA > 0
	When the user clicks on the 'Close Tab'
	And the user clicks on the 'Alert Dialog No Button' if it exists
	#5 Open the Balance navdfgator
	When the user navigates to the 'Balances' page by sm1-id 'BALANCE'
	#6 Create a new balance: Leave the current year and select the @customer -> click OK
	And user creates a new balance '<level>' '<customer>' '<BalanceYear>' '<Supplier>'
	#7 Click on Selector button
	#8 Click on Promo Selector
	And the user selects action 'Selector' 'Payable Amount Selector'
	#9 In the promo selector Select the two promo created in preconditions 1 and 2, such as the sum of the OPA is < 0 and Click OK
	And the user selects opens the filter at column 'Action Code'
	And the user clicks on 'Filter Option' with value 'ActionCode1'
	And the user clicks on 'Filter Option' with value 'ActionCode2'
	And the user clicks on 'Popup Ok Button' with value 'Column:Action Code'
	And the user clicks on element 'Select Row Checkbox' with value 'Select Payable Amounts' and value '2'
	And the user clicks on element 'Select Row Checkbox' with value 'Select Payable Amounts' and value '4'
	And the user clicks on element 'Select Row Checkbox' with value 'Select Payable Amounts' and value '5'
	And the user clicks on 'Popup Button' with value 'OK'
	#10 Check the columns from the selector grid
	#Selection check-box (test that the multiselection is allowed)
	And the user clicks on 'Popup All Checkbox By Name' with value 'Finalization'
	Then the user validates that the 'Unchecked Grid CheckBox Containing' with value 'ActionCode1' is not present
	And the user validates that the 'Unchecked Grid CheckBox Containing' with value 'ActionCode2' is not present
	#Check Amount to Balance
	When the user retrieves text from popup 'Finalization' column 'Open payable amount' with unique row text 'ActionCode1' and saves it as 'OpenPayableAmount'
	Then the user validates that popup 'Finalization' column 'Amount to Balance' has opposite value of 'OpenPayableAmount' with row text 'ActionCode1'
	When the user retrieves text from popup 'Finalization' column 'Open payable amount' with unique row text 'ActionCode2' and saves it as 'OpenPayableAmount2'
	Then the user validates that popup 'Finalization' column 'Amount to Balance' has opposite value of 'OpenPayableAmount2' with row text 'ActionCode2'
	And the user validates that popup 'Finalization' column 'Amount to Balance' with row text 'ActionCode1' has the correct color
	And the user validates that popup 'Finalization' column 'Amount to Balance' with row text 'ActionCode2' has the correct color
	And the user validates that popup 'Finalization' column 'Amount to Balance' with row text 'ActionCode1' is not editable
	And the user validates that popup 'Finalization' column 'Amount to Balance' with row text 'ActionCode2' is not editable
	#Balance %: is a read only field with value 100% at the landing
	And the user validates that popup 'Finalization' column 'Balance Percentage' with row text 'ActionCode1' is not editable
	And the user validates that popup 'Finalization' column 'Balance Percentage' with row text 'ActionCode2' is not editable
	And the user validates that popup 'Finalization' column 'Balance Percentage' has '100' with row text 'ActionCode1'
	And the user validates that popup 'Finalization' column 'Balance Percentage' has '100' with row text 'ActionCode2'
	#ABS Amount to Balance filled with the result of this formula [ABS OPA * Balance%]
	When the user retrieves text from popup 'Finalization' column 'Balance Percentage' with unique row text 'ActionCode1' and saves it as 'BalancePercentage1'
	And the user retrieves text from popup 'Finalization' column 'ABS OPA' with unique row text 'ActionCode1' and saves it as 'ABSOPA1'
	And the user retrieves text from popup 'Finalization' column 'Absolute Amount to Balance' with unique row text 'ActionCode1' and saves it as 'AbsoluteAmountToBalance'
	Then user validates that 'AbsoluteAmountToBalance' has value of 'ABSOPA1' 'percent' 'BalancePercentage1'
	When the user retrieves text from popup 'Finalization' column 'Balance Percentage' with unique row text 'ActionCode2' and saves it as 'BalancePercentage2'
	And the user retrieves text from popup 'Finalization' column 'ABS OPA' with unique row text 'ActionCode2' and saves it as 'ABSOPA2'
	And the user retrieves text from popup 'Finalization' column 'Absolute Amount to Balance' with unique row text 'ActionCode2' and saves it as 'AbsoluteAmountToBalance2'
	Then user validates that 'AbsoluteAmountToBalance2' has value of 'ABSOPA2' 'percent' 'BalancePercentage2'
	#ABS Open Payable Amount filled with the sum of the absolute values of the OPA of the child payable amount of the row (in the payable amount selector is the absolute value of the OPA of the row)
	#11 Check the rows from the grid -> In the grid there are the same rows selected in the selector popup
	Then the user validates that the 'Grid CheckBox Containing' with value 'ActionCode1' is present
	And the user validates that the 'Grid CheckBox Containing' with value 'ActionCode2' is present
	#12 Check in the header of the popup if field 'Total Balance Amount' is present - > The field 'Total Balance Amount' is present and contains the sum of 'Amount to Balance' rows
	When the user retrieves text from element 'Input By Label Name' with value 'Total Balance Amount' and saves it as 'TotalBalanceAmount'
	Then user validates that 'TotalBalanceAmount' has value of sum for popup 'Finalization' colum 'Amount to Balance'

	Examples:
		| CustomerDocNr1 | CustomerDocNr2 | customer | level   | promodescription1         | promodescription2         | productLevel | prod1 | prod2 | mech1   | meas | status    | prod3 | prod4 | amount | atm1 | atm2 | atm3 | atm4 | SELLINSTARTYEAR | SELLINSTART | SELLINEND | SELLOUTSTARTDATE | SELLOUTENDDATE | BalanceYear | Supplier |
		| 352730#1       | 352730#2       | EC86276  | Level 2 | DOCUMENT_ADJUSTMENT_003_1 | DOCUMENT_ADJUSTMENT_003_2 | Product      | 059   | 060   | Display | 200  | Confirmed | 061   | 062   | 900    | 350  | 350  | 100  | 100  | x/x/y           | d/m/y       | d+10/m/y  |                  |                | x/x/y       |          |