Feature: TestCase_474215

@BDD_474215 @PROMO_Nightly @FundsAndRules
Scenario: WEB_TPM_SP_FRDOCUMENT_RATEBASEDFUND_NEGC_MOV_001
	#Step 1
	Given the user navigates to the 'Funds & Rules' page
	When the user creates a new fund and rules '<CONFIGURATIONID>' '<CUSTOMERLEVEL>' '<PAGEDESCRIPTION>' '<STARTSELLIN>' '<ENDSELLIN>' '<PRODUCT_GROUPS>' '<RATEFUNDSOURCE>'
	And the user clicks on 'Side Panel Tab' with value 'Constraints'
	And user adds a '% Rate Fund' constraint with value '<INITIALRATEFUND>' '<START_DATE>' '<END_DATE>' ''
	And the user clicks on 'Side Panel Tab' with value 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#2 Open a Rate based fund just created.
	And the user clicks on the 'Refresh Button'
	And the user clicks on 'Text' with value 'FundsRulesCode'
	#3 Go to Constraints tabs -> FUNDSOURCEVALUE=0,  %RATEFUND=10, UNCOMMITTEDBALANCE = 0, REMAININGBALANCE = 0,
	And the user clicks on 'Side Panel Tab' with value 'Constraints'
	#Then the user validates that grid 'Movements' column 'Fund Source Value' has '0.0000' with row text '1'
	Then the user validates that column '% Rate Fund' has '10.00' with row text '1'
	And the user validates that column 'Uncommitted Balance' has '0.0000' with row text '1'
	And the user validates that column 'Remaining balance' has '0.0000' with row text '1'
	#4 Click "Edit" button
	When the user clicks on 'Button' with value 'Edit'
	#5 Change %RATEFUND to @NEWINITRATEFUND = 20
	And the user enters '<NEWINITRATEFUND>' in cell with column '% Rate Fund' and row text '1'
	#6 Select the constraint and click "Calculate" button -> FUNDSOURCEVALUE=10000,   %RATEFUND=20, UNCOMMITTEDBALANCE = 2000, REMAININGBALANCE = 2000,
	And the user clicks on 'Button Link' with value 'Calculate'
	Then the user validates that column 'Fund Source Value' has '10,000.0000' with row text '1'
	And the user validates that column '% Rate Fund' has '20.00' with row text '1'
	And the user validates that column 'Uncommitted Balance' has '2,000.0000' with row text '1'
	And the user validates that column 'Remaining balance' has '2,000.0000' with row text '1'
	#7 Click on "Movements" icon for the constraint
	When the user clicks on the 'Open Folder Icon'
	#he following information is displayed: First Movement: V - Deposit.value =  2000
	Then the user validates that popup 'Movements' column 'Value' has '2,000.0000' with row text 'Deposit'
	#Then the user validates that column 'Value' has '2,000.0000' with row text 'Deposit'
	#Remaining Balance = Uncommitted balance = 2000 Fund Reserve = 0 No POSC/NEGC movements are shown @MOVEMENTS
	And the user validates that 'Input By Label Name' with value 'Remaining balance' has text '2,000.0000'
	And the user validates that 'Input By Label Name' with value 'Uncommitted Balance' has text '2,000.0000'
	And the 'Text' with value 'POSC'  is not present
	And the 'Text' with value 'NEGC'  is not present
	#8 Close Movements panel
	When the user clicks on 'Popup Button' with value 'OK'
	#9 Change % @NEWRATEFUND=10 click "Calculate" button
	And the user enters '<INITIALRATEFUND>' in cell with column '% Rate Fund' and row text '1'
	And the user clicks on 'Button Link' with value 'Calculate'
	#10 Click on "Movements" icon for the constraint
	And the user clicks on the 'Open Folder Icon'
	#The following information is displayed: First Movement: V - Deposit.value =  2000 Negative Movement: NEGC.value = 1000 Remaining Balance = Uncommitted balance = 1000 Fund Reserve = 0
	Then the user validates that popup 'Movements' column 'Value' has '2,000.0000' with row text 'Deposit'
	And the user validates that popup 'Movements' column 'Value' has '1,000.0000' with row text 'NEGC'
	And the user validates that 'Input By Label Name' with value 'Remaining balance' has text '1,000.0000'
	And the user validates that 'Input By Label Name' with value 'Uncommitted Balance' has text '1,000.0000'
	And the user validates that 'Input By Label Name' with value 'Fund reserve' has text '0.0000'
	#11 Click "Save" button
	When the user clicks on 'Popup Button' with value 'OK'
	And the user clicks on the 'Save Button'
	#12 Close the document
	And the user clicks on the 'Close Tab'
	#13 Open again the FR Document
	And the user clicks on 'Text' with value 'FundsRulesCode'
	#14 Open Movements panel
	And the user clicks on 'Side Panel Tab' with value 'Constraints'
	And the user clicks on the 'Open Folder Icon'
	#The following information is displayed: First Movement: V - Deposit.value =  2000 Negative Movement: NEGC.value = 1000 Remaining Balance = Uncommitted balance = 1000 Fund Reserve = 0 @PAGEDESCRIPTION
	Then the user validates that popup 'Movements' column 'Value' has '2,000.0000' with row text 'Deposit'
	And the user validates that popup 'Movements' column 'Value' has '1,000.0000' with row text 'NEGC'
	And the user validates that 'Input By Label Name' with value 'Remaining balance' has text '1,000.0000'
	And the user validates that 'Input By Label Name' with value 'Uncommitted Balance' has text '1,000.0000'
	And the user validates that 'Input By Label Name' with value 'Fund reserve' has text '0.0000'
	#Clean up
	When the user clicks on 'Popup Button' with value 'OK'
	And the user clicks on the 'Close Tab'

	Examples:
		| CONFIGURATIONID | STARTSELLIN | ENDSELLIN  | CUSTOMERLEVEL | SELECTCUSTOMERNODES | CUST    | RATEFUNDSOURCE      | INITIALRATEFUND | NEWINITRATEFUND | MOVEMENTS | MOVEMENTS2 | MOVEMENTS3 | NEWRATEFUND | PAGEDESCRIPTION | PRODUCT_GROUPS | START_DATE | END_DATE |
		| Rate Based Fund | 01/01/2020  | 31/10/2020 | Level 5       | TRUE                | EC86162 | SOURCE1 - NETAMOUNT | 10              | 20              | Deposit   | POSC       | NEGC       | 10          | Funds & Rules   |                |            |          |