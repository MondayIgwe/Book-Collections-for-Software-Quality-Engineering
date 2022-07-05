Feature: TestCase_433363

@BDD_433363 @PROMO_Nightly @FundsAndRules @FundsAndRulesNightly @TestPipeline
Scenario: WEB_TPM_SP_PROMODOCUMENT_FUNDS_ASSOCIATION_001
	#Step 1 - Create a Confirmed @NEWSTATUS @FR1DESCRIPTION F&R_01 having
	Given the user navigates to the 'Funds & Rules' page
	When the user creates a new fund and rules with configuration ID: '<CONFIGURATIONID>' BRCustomerLevel: '<CUSTOMERLEVEL>' Description: '<FR1DESCRIPTION >' sellInStart: '<STARTSELLIN>' sellInEnd: '<ENDSELLIN>' productGroup: '<CategoryA>,<CategoryB>' rateFundSource: '<RATEFUNDSOURCE>'
	And the user clicks on the 'Constraints Tab'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<CONSTRAINT>' startDate: '<VALIDITYSTART>' endDate: '<VALIDITYEND>' familyConstraints: '<FAMILY_CONSTRAINTS>'
	And the user clicks on the 'Summary Tab'
	And the user retrieves text from 'Funds And Rules Code TextBox' and saves it as 'FundsRulesCode1'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#2 Create a  Confirmed @FR2DESCRIPTION F&R_02 having 
	Given the user navigates to the 'Funds & Rules' page
	When the user creates a new fund and rules with configuration ID: '<CONFIGURATIONID>' BRCustomerLevel: '<CUSTOMERLEVEL>' Description: '<FR2DESCRIPTION >' sellInStart: '<STARTSELLIN>' sellInEnd: '<ENDSELLIN>' productGroup: '<CategoryA>,<CategoryC>' rateFundSource: '<RATEFUNDSOURCE>'
	And the user clicks on the 'Constraints Tab'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<CONSTRAINT>' startDate: '<VALIDITYSTART>' endDate: '<VALIDITYEND>' familyConstraints: '<FAMILY_CONSTRAINTS>'
	And the user clicks on the 'Summary Tab'
	And the user retrieves text from 'Funds And Rules Code TextBox' and saves it as 'FundsRulesCode2'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#3 Create Promo in Draft
	When the user navigates to the 'Promotional actions' page
	And the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUSTOMER>'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<STARTSELLIN>' sellInEnd: '<ENDSELLIN>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<ACTIVITY_A>'
	And the user adds a product with productLevel: '<PRODUCTLEVEL>' productCodes: '<PROD1>,<PROD2>,<PROD3>'
	And the user enters '<PROD1_LEAFLET>' on column name '<ACTIVITY_A>' for product code '<PROD1>'
	And the user enters '<PROD2_LEAFLET>' on column name '<ACTIVITY_A>' for product code '<PROD2>'
	And the user enters '<PROD3_LEAFLET>' on column name '<ACTIVITY_A>' for product code '<PROD3>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Cockpit Tab'
	And the user retrieves text from 'Action ID Textbox' and saves it as 'ActionId'
	And the user clicks on the 'Close Tab'
	#4 Open the created promo in edit mode
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId'
	And the user clicks on 'Indexed Row Link' with value '1'
	Then the user validates that the Loading Mask is not present
	When the user clicks on the 'Edit Button'
	#5 Open the 'Fund' subtab
	And the user clicks on the 'Products Tab'
	And the user clicks on the 'Funds Top Tab'
	#Check that both Funds are injected. F&R_01 and F&R_02.   None of the funds is selected
	Then the user validates that the 'Text in Grid' with value '#FundsRulesCode1#(1)-<FR1DESCRIPTION>' is present
	And the user validates that the 'Text in Grid' with value '#FundsRulesCode2#(1)-<FR2DESCRIPTION>' is present
	## None of the funds is selected
	And the user validates that the 'Checked Grid CheckBox Containing' with value '#FundsRulesCode1#(1)-<FR1DESCRIPTION>' is not present
	And the user validates that the 'Checked Grid CheckBox Containing' with value '#FundsRulesCode2#(1)-<FR2DESCRIPTION>' is not present
	#6 Check the Commited and Uncommited balance. The values are not calculated for any of the injected funds @EMPTYBALANCE
	And the user validates that from table with unique column 'Remaining balance' column 'Committed Balance' has '<EMPTYBALANCE>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'
	And the user validates that from table with unique column 'Remaining balance' column 'Committed Balance' has '<EMPTYBALANCE>' with row text '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Uncommitted Balance' has '<EMPTYBALANCE>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Uncommitted Balance' has '<EMPTYBALANCE>' with row text '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'

	#7 Select F&R_01 About F&R_01, @PROD1 and @PROD2 are shown in the Products column of the Prducts\Funds tab
	When the user checks the 'Grid CheckBox' with value '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'
	Then the user validates that from table with unique column 'Remaining balance' column 'Products' contains '<PROD1>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'	
	And  the user validates that from table with unique column 'Remaining balance' column 'Products' contains '<PROD2>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'	

	#About F&R_2, No product is associated to it 
	And the user validates that from table with unique column 'Remaining balance' column 'Products' does not contain '<PROD2>' with row text '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'	
	#8 Open the Details for F&R_01 (...)
	When the user clicks on 'Grid Elipses' with value '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'
	#In the pop-up @PROD1, @PROD2 are set
	Then the user validates that the 'Text in Grid Containing' with value '<PROD1>' is present
	And the user validates that the 'Text in Grid Containing' with value '<PROD2>' is present
	#9 Close Details for F&R_01 (...)
	When the user clicks on the 'OK Button'
	#10 Select F&R_02
	And the user checks the 'Grid CheckBox' with value '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'
	#About F&R_01, only @PROD2 is shown in the Products column of the Prducts\Funds tab
	Then the user validates that from table with unique column 'Remaining balance' column 'Products' contains '<PROD2>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Products' does not contain '<PROD1>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Products' does not contain '<PROD3>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'	
	#About F&R_02, @PROD3, @PROD2 are shown in the Products column of the Prducts\Funds tab
	Then the user validates that from table with unique column 'Remaining balance' column 'Products' contains '<PROD3>' with row text '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Products' contains '<PROD1>' with row text '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'	
	#Open the Details for F&R_02 (...)
	When the user clicks on 'Grid Elipses' with value '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'
	#In the pop-up @PROD3, @PROD2 are checked. 
	Then the user validates that the 'Checked Grid CheckBox Containing' with value '<PROD3>' is present
	And the user validates that the 'Checked Grid CheckBox Containing' with value '<PROD1>' is present
	#12 Close Details for F&R_02 (...)
	When the user clicks on the 'OK Button'
	#13 Calculate the Commited and Uncommited balanced
	And the user clicks on the 'Refresh Button'
	#13 The balances are calculated according to the selected products @FR1_COMMITED_1 @FR1_UNCOMMITED_1 @FR2_COMMITED_1 @FR2_UNCOMMITED_1 
	Then the user validates that from table with unique column 'Remaining balance' column 'Committed Balance' has '<FR1_COMMITED_1>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Committed Balance' has '<FR2_COMMITED_1>' with row text '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Uncommitted Balance' has '<FR1_UNCOMMITED_1>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Uncommitted Balance' has '<FR2_UNCOMMITED_1>' with row text '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'
	#14 Open the Details for F&R_01 (...)
	When the user clicks on 'Grid Elipses' with value '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'
	#@PROD1 is not set
	Then the user validates that the 'Checked Grid CheckBox Containing' with value '<PROD1>' is not present
	#15 Set @PROD1 
	When the user checks the 'PopUp Grid CheckBox By Name Containing' with popup name 'Sales Fund - #FundsRulesCode1#(1)-<FR1DESCRIPTION>' and value '<PROD1>'
	And the user checks the 'PopUp Grid CheckBox By Name Containing' with popup name 'Sales Fund - #FundsRulesCode1#(1)-<FR1DESCRIPTION>' and value '<PROD2>'

	#16 Close Details for F&R_01 (...)
	And the user clicks on the 'OK Button'
	#17 'Calculate the Commited and Uncommited balanced
	And the user clicks on the 'Refresh Button'
	#The Commited and Uncommited balances are recalculated @FR1_COMMITED_2 @FR1_UNCOMMITED_2 @FR2_COMMITED_2 @FR2_UNCOMMITED_2 
	Then the user validates that from table with unique column 'Remaining balance' column 'Committed Balance' has '<FR1_COMMITED_2>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Committed Balance' has '<FR2_COMMITED_2>' with row text '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Uncommitted Balance' has '<FR1_UNCOMMITED_2>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Uncommitted Balance' has '<FR2_UNCOMMITED_2>' with row text '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'
	#18 Open again the Detail for F&R_01 ("...")
	When the user clicks on 'Grid Elipses' with value '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'
	#The Product remains still set, it cannot be deselected.
	And the user checks the 'PopUp Grid CheckBox By Name Containing' with popup name 'Sales Fund - #FundsRulesCode1#(1)-<FR1DESCRIPTION>' and value '<PROD1>'
	Then the user validates that the 'Checked Grid CheckBox Containing' with value '<PROD1>' is present
	#19 Close Details for F&R_01 (...)
	When the user clicks on the 'OK Button'
	#20 Go to the Product Grid  and double @Measure_X_Double the value for Measure_X at ALL_Selected row level
	And the user clicks on top panel 'Products'
	And the user clicks on 'Product Grid CheckBox' with value 'ALL - Selected'
	And the user enters '<Measure_X_Double>' on column name '<Measure_X>' for product code 'ALL - Selected'
	#21 Go back to Fund tab  and Calculate the Commited and Uncommited balanced
	And the user clicks on top panel 'Funds'
	And the user checks the 'Grid CheckBox' with value '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'
	And the user clicks on the 'Refresh Button'
	#Uncommited balances are doubled 
	Then the user validates that from table with unique column 'Remaining balance' column 'Uncommitted Balance' has '<FR1_UNCOMMITED_3>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Uncommitted Balance' has '<FR2_UNCOMMITED_3>' with row text '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Committed Balance' has '<FR1_COMMITED_3>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Committed Balance' has '<FR2_COMMITED_3>' with row text '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'	
	#22 Save and Close the promo
	When the user closes the page and saves the work done
	#23 Open again the promo
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId'
	And the user clicks on 'Indexed Row Link' with value '1'
	And the user clicks on the 'Edit Button'
	And the user clicks on the 'Products Tab'
	And the user clicks on the 'Funds Top Tab'
	#All data previously saved are kept.
	Then the user validates that from table with unique column 'Remaining balance' column 'Uncommitted Balance' has '<FR1_UNCOMMITED_3>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Uncommitted Balance' has '<FR2_UNCOMMITED_3>' with row text '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Committed Balance' has '<FR1_COMMITED_3>' with row text '#FundsRulesCode1#(1)-<FR1DESCRIPTION>'	
	And the user validates that from table with unique column 'Remaining balance' column 'Committed Balance' has '<FR2_COMMITED_3>' with row text '#FundsRulesCode2#(1)-<FR2DESCRIPTION>'	
	

	Examples:
		| NEWSTATUS | FR1DESCRIPTION | CONFIGURATIONID  | CUSTOMERLEVEL | CategoryA | CategoryB | CONSTRAINT | FR2DESCRIPTION | CategoryC | CUSTLEV | CUSTOMER | DESCRIPTION            | STARTSELLIN | ENDSELLIN | ACTIVITY_A | Measure_X | Measure_X_Value | PROD1 | PROD2 | PROD3 | PRODUCTLEVEL | PROD1_LEAFLET | PROD2_LEAFLET | PROD3_LEAFLET | EMPTYBALANCE | FR1_COMMITED_1 | FR1_UNCOMMITED_1 | FR2_COMMITED_1 | FR2_UNCOMMITED_1 | FR1_COMMITED_2 | FR1_UNCOMMITED_2 | FR2_COMMITED_2 | FR2_UNCOMMITED_2 | Measure_X_Double | FR1_COMMITED_3 | FR1_UNCOMMITED_3 | FR2_COMMITED_3 | FR2_UNCOMMITED_3 | FAMILY_CONSTRAINTS | VALIDITYSTART | VALIDITYEND | RATEFUNDSOURCE | SELLOUTSTART | SELLOUTEND |
		| Confirm   | F&R_01         | 632 - Sales Fund | 5 - Level 5   | 01        | 02        | 1000       | F&R_02         | CRACKERS  | Level 3 | EC86247  | Two funds are injected | d+1/m/y     | d+15/m/y  | Leaflet    | Leaflet   | 1000            | 004   | 046   | 136   | Product      | 65.81         | 546.11        | 388.08        | 0.00         | 0.00           | 546.11           | 0.00           | 453.89           | 0.00           | 611.92           | 0.00           | 388.08           | 2000             | 0.00           | 1,092.22         | 0.00           | 907.78           |                    |               |             |                |              |            |