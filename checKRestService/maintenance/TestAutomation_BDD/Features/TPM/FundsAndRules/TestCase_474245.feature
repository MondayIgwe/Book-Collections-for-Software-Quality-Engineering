Feature: TestCase_474245

@BDD_474245 @PROMO_Nightly @FundsAndRules @FundsAndRulesNightly
Scenario: WEB_TPM_SP_FRDOCUMENT_RATEBASEDFUND_CALCULATE_SOME_CONSTRAINTS_001
	#Step 1
	Given the user navigates to the 'Funds & Rules' page
	When the user creates a new fund and rules with configuration ID: '<CONFIGURATIONID>' BRCustomerLevel: '<CUSTOMERLEVEL>' Description: '<PAGEDESCRIPTION >' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' productGroup: '<PRODUCT_GROUPS>' rateFundSource: '<RATEFUNDSOURCE>'
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: '% Rate Fund' constraint with value ConstraintValue: '<INITIALRATEFUND1>' startDate: '<STARTDATE1>' endDate: '<ENDDATE1>' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: '% Rate Fund' constraint with value ConstraintValue: '<INITIALRATEFUND2>' startDate: '<STARTDATE2>' endDate: '<ENDDATE2>' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#2 Open a Rate based fund just created
	And the user clicks on the 'Refresh Button'
	And the user clicks on 'Text' with value 'FundsRulesCode'
	#3 Go to Constraints tab ->  First Constraint FUNDSOURCEVALUE=0,  %RATEFUND=10,  UNCOMMITTEDBALANCE = 0, REMAININGBALANCE = 0
	And the user clicks on side panel 'Constraints'
	Then the user validates that column 'Fund Source Value' has '0.0000' with row text '<STARTDATE1>'
	And the user validates that column '% Rate Fund' has '10.00' with row text '<STARTDATE1>'
	And the user validates that column 'Uncommitted Balance' has '0.0000' with row text '<STARTDATE1>'
	And the user validates that column 'Remaining balance' has '0.0000' with row text '<STARTDATE1>'
	#Second Constraint FUNDSOURCEVALUE=0,   %RATEFUND=20,  UNCOMMITTEDBALANCE = 0, REMAININGBALANCE = 0
	And the user validates that column 'Fund Source Value' has '0.0000' with row text '<STARTDATE2>'
	And the user validates that column '% Rate Fund' has '20.00' with row text '<STARTDATE2>'
	And the user validates that column 'Uncommitted Balance' has '0.0000' with row text '<STARTDATE2>'
	And the user validates that column 'Remaining balance' has '0.0000' with row text '<STARTDATE2>'
	#4 Click on "Edit" button
	When the user clicks on 'Button' with value 'Edit'
	#5 Select only the first constraint and click "Calculate"
	And the user clicks on 'Div Text in Grid' with value '<STARTDATE1>'
	And the user clicks on 'Button Link' with value 'Calculate'
	#First Constraint FUNDSOURCEVALUE=8000,   %RATEFUND=10,  UNCOMMITTEDBALANCE = 800, REMAININGBALANCE = 800
	Then the user validates that column 'Fund Source Value' has '8,000.0000' with row text '<STARTDATE1>'
	And the user validates that column '% Rate Fund' has '10.00' with row text '<STARTDATE1>'
	And the user validates that column 'Uncommitted Balance' has '800.0000' with row text '<STARTDATE1>'
	And the user validates that column 'Remaining balance' has '800.0000' with row text '<STARTDATE1>'
	#Second Constraint FUNDSOURCEVALUE=0,   %RATEFUND=20,  UNCOMMITTEDBALANCE = 0, REMAININGBALANCE = 0
	And the user validates that column 'Fund Source Value' has '0.0000' with row text '<STARTDATE2>'
	And the user validates that column '% Rate Fund' has '20.00' with row text '<STARTDATE2>'
	And the user validates that column 'Uncommitted Balance' has '0.0000' with row text '<STARTDATE2>'
	And the user validates that column 'Remaining balance' has '0.0000' with row text '<STARTDATE2>'
	#6 Exit the Fund without saving
	When the user closes all pages without saving the work done
	#7 Reopen the document 
	And the user clicks on the 'Refresh Button'
	And the user clicks on 'Text' with value 'FundsRulesCode'
	#8 Click on "Edit" button
	And the user clicks on 'Button' with value 'Edit'
	#9 Go to Constraints tab
	And the user clicks on side panel 'Constraints'
	#First Constraint FUNDSOURCEVALUE=0,   %RATEFUND=10,  UNCOMMITTEDBALANCE = 0, REMAININGBALANCE = 0
	Then the user validates that column 'Fund Source Value' has '0.0000' with row text '<STARTDATE1>'
	And the user validates that column '% Rate Fund' has '10.00' with row text '<STARTDATE1>'
	And the user validates that column 'Uncommitted Balance' has '0.0000' with row text '<STARTDATE1>'
	And the user validates that column 'Remaining balance' has '0.0000' with row text '<STARTDATE1>'
	#Second Constraint FUNDSOURCEVALUE=0,   %RATEFUND=20,  UNCOMMITTEDBALANCE = 0, REMAININGBALANCE = 0
	And the user validates that column 'Fund Source Value' has '0.0000' with row text '<STARTDATE2>'
	And the user validates that column '% Rate Fund' has '20.00' with row text '<STARTDATE2>'
	And the user validates that column 'Uncommitted Balance' has '0.0000' with row text '<STARTDATE2>'
	And the user validates that column 'Remaining balance' has '0.0000' with row text '<STARTDATE2>'
	#10 Select Both constraints and click "Calculate"
	When the user clicks on 'Select Indexed Row' with value '1'
	And the user clicks on 'Select Indexed Row' with value '2'
	And the user clicks on 'Button Link' with value 'Calculate'
	#First Constraint FUNDSOURCEVALUE=8000,  %RATEFUND=10, UNCOMMITTEDBALANCE = 800, REMAININGBALANCE = 800
	Then the user validates that column 'Fund Source Value' has '8,000.0000' with row text '<STARTDATE1>'
	And the user validates that column '% Rate Fund' has '10.00' with row text '<STARTDATE1>'
	And the user validates that column 'Uncommitted Balance' has '800.0000' with row text '<STARTDATE1>'
	And the user validates that column 'Remaining balance' has '800.0000' with row text '<STARTDATE1>'
	#Second Constraint FUNDSOURCEVALUE=2000,   %RATEFUND=20,  UNCOMMITTEDBALANCE = 400, REMAININGBALANCE = 400
	And the user validates that column 'Fund Source Value' has '2,000.0000' with row text '<STARTDATE2>'
	And the user validates that column '% Rate Fund' has '20.00' with row text '<STARTDATE2>'
	And the user validates that column 'Uncommitted Balance' has '400.0000' with row text '<STARTDATE2>'
	And the user validates that column 'Remaining balance' has '400.0000' with row text '<STARTDATE2>'
	#11 Click on "Movements" icon for the First constraint @TYPEOFMOVEMENT
	When the user clicks on 'Funds Folder Icon By Row' with value '1'
	#The following information is displayed: First Movement: V - Deposit.value =  800 Remaining Balance = Uncommitted balance = 800 Fund Reserve = 0
	Then the user validates that 'Input By Label Name' with value 'Remaining balance' has text '800.0000'
	And the user validates that 'Input By Label Name' with value 'Uncommitted Balance' has text '800.0000'
 	And the user validates that 'Input By Label Name' with value 'Fund reserve' has text '0.0000'
	And the user validates that popup 'Movements' column 'Value' has '800.0000' with row text '<TYPEOFMOVEMENT>'

	#12 Close the Movements panel for the First constraint
	When the user clicks on 'Popup Button' with value 'OK'
	#13 Click on "Movements" icon for the Second constraint
	And the user clicks on 'Funds Folder Icon By Row' with value '2'
	Then the user validates that 'Input By Label Name' with value 'Remaining balance' has text '400.0000'
	And the user validates that 'Input By Label Name' with value 'Uncommitted Balance' has text '400.0000'
 	And the user validates that 'Input By Label Name' with value 'Fund reserve' has text '0.0000'
	And the user validates that popup 'Movements' column 'Value' has '400.0000' with row text '<TYPEOFMOVEMENT>'
	#14 Close the Movements panel for the Second constraint
	When the user clicks on 'Popup Button' with value 'OK'
	#15 Save and Close the Fund document
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#16 Reopen the document
	And the user clicks on the 'Refresh Button'
	And the user clicks on 'Text' with value 'FundsRulesCode'
	#17 Go to Constraints tab
	And the user clicks on side panel 'Constraints'
	#First Constraint FUNDSOURCEVALUE=8000,   %RATEFUND=10,  UNCOMMITTEDBALANCE = 800, REMAININGBALANCE = 800
	Then the user validates that column 'Fund Source Value' has '8,000.0000' with row text '<STARTDATE1>'
	And the user validates that column '% Rate Fund' has '10.00' with row text '<STARTDATE1>'
	And the user validates that column 'Uncommitted Balance' has '800.0000' with row text '<STARTDATE1>'
	And the user validates that column 'Remaining balance' has '800.0000' with row text '<STARTDATE1>'
	#Second Constraint FUNDSOURCEVALUE=2000,   %RATEFUND=20,  UNCOMMITTEDBALANCE = 400, REMAININGBALANCE = 400
	And the user validates that column 'Fund Source Value' has '2,000.0000' with row text '<STARTDATE2>'
	And the user validates that column '% Rate Fund' has '20.00' with row text '<STARTDATE2>'
	And the user validates that column 'Uncommitted Balance' has '400.0000' with row text '<STARTDATE2>'
	And the user validates that column 'Remaining balance' has '400.0000' with row text '<STARTDATE2>'
	#Click on "Movements" icon for the First constraint
	When the user clicks on 'Funds Folder Icon By Row' with value '1'
	#The following information is displayed: First Movement: V - Deposit.value =  800 Remaining Balance = Uncommitted balance = 800 Fund Reserve = 0
	Then the user validates that 'Input By Label Name' with value 'Remaining balance' has text '800.0000'
	And the user validates that 'Input By Label Name' with value 'Uncommitted Balance' has text '800.0000'
 	And the user validates that 'Input By Label Name' with value 'Fund reserve' has text '0.0000'
	And the user validates that popup 'Movements' column 'Value' has '800.0000' with row text '<TYPEOFMOVEMENT>'
	#19 Close the Movements panel for the First constraint
	When the user clicks on 'Popup Button' with value 'Cancel'
	#Click on "Movements" icon for the Second constraint
	And the user clicks on 'Funds Folder Icon By Row' with value '2'
	#The following information is displayed: First Movement: V - Deposit.value =  400 Remaining Balance = Uncommitted balance = 400 Fund Reserve = 0
	Then the user validates that 'Input By Label Name' with value 'Remaining balance' has text '400.0000'
	And the user validates that 'Input By Label Name' with value 'Uncommitted Balance' has text '400.0000'
 	And the user validates that 'Input By Label Name' with value 'Fund reserve' has text '0.0000'
	And the user validates that popup 'Movements' column 'Value' has '400.0000' with row text '<TYPEOFMOVEMENT>'
	#20 Close the Movements panel for the Second constraint
	When the user clicks on 'Popup Button' with value 'Cancel'
	When the user clicks on the 'Close Tab'
	And the user clicks on the 'Close Tab'


	Examples:
		| CONFIGURATIONID | SELLINSTART | SELLINEND  | CUSTOMERLEVEL | SELECTCUSTOMERNODES | CUST    | RATEFUNDSOURCE      | STARTDATE1 | ENDDATE1   | INITIALRATEFUND1 | STARTDATE2 | ENDDATE2   | INITIALRATEFUND2 | TYPEOFMOVEMENT | PAGEDESCRIPTION | PRODUCT_GROUPS |
		| Rate Based Fund | 01/01/2020  | 31/10/2020 | 5 - Level 5   |                     | EC86162 | SOURCE1 - NETAMOUNT | 01/01/2020 | 31/08/2020 | 10               | 01/09/2020 | 31/10/2020 | 20               | Deposit        | Funds & Rules   |                |
