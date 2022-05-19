Feature: TestCase_457489

@BDD_457489 @PROMO_Nightly @FundsAndRules @FundsAndRulesNightly
Scenario: WEB_TPM_SP_FRDOCUMENT_REMOVECONSTRAINTS_003
	#Step 1 - PRECONDITION 1
	Given the user navigates to the 'Funds & Rules' page
	When the user creates a new fund and rules with configuration ID: '<CONFIGURATIONID>' BRCustomerLevel: '<CUSTOMERLEVEL>' Description: '<DESCRIPTION >' sellInStart: '<STARTSELLIN>' sellInEnd: '<ENDSELLIN>' productGroup: '<PRODUCT_GROUPS>' rateFundSource: '<RATEFUNDSOURCE>'
	#2 Add 2 Constraints:
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<VALUE>' startDate: '<VALIDITYSTART1>' endDate: '<VALIDITYEND1>' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<VALUE2>' startDate: '<VALIDITYSTART2>' endDate: '<VALIDITYEND2>' familyConstraints: '<FAMILYCONSTRAINTS>'
	#2 Change @STATUS to Confirmed and close document
	And the user clicks on side panel 'Summary'
	And the user retrieves text from element 'Input By Label Name' with value 'Funds & Rules code' and saves it as 'FundsRulesCode'
	And the user changes the status to '<STATUS>'
	And the user clicks on the 'Close Tab'
	#4 PRECONDITION 2 - Go to the Promotional action navigator and create a new promo:
	And the user navigates to the 'Promotional actions' page
	And the user creates a Promo with customerHLevel: '<CUSTOMERLEVEL>' customerCode: '<CUSTOMER>'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<PROMOSELLINSTART>' sellInEnd: '<PROMOSELLINEND>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<MECHANIC>'
	And the user adds a product with productLevel: '<PRODLVL>' productCodes: '<PRODUCT>'
	#5 Add a @MECHANICVALUE = 100 for @MECHANIC in @PRODUCT  then go in Fund tab and check the related fund row
	And the user enters '<MECHANICVALUE>' on column name '<MECHANIC>' for product code '<PRODUCT>'
	And the user clicks on 'Top Tab' with value 'Funds'
	And the user clicks on 'Grid CheckBox Containing' with value 'FundsRulesCode'
	#6 Go to Funds sub-tab and select the CONSTRAINT1 from the Fund from PRECONDITION 1
	#7 Change @STATUS to Confirmed and close document @CHANGESTATUSES
	And the user clicks on side panel 'Cockpit'
	And the user changes the status to '<CHANGESTATUSES>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#8 Go to Funds & Rules navigator
	And the user navigates to the 'Funds & Rules' page
	#9 Open in Edit mode the document form PRECONDITION 1
	And the user filters the column by column name 'Funds & Rules code', Filter Type 'Like', Value 'FundsRulesCode'
	And the user clicks on 'Text' with value 'FundsRulesCode'
	And the user clicks on 'Button' with value 'Edit'
	#10 Change @STATUS to Draft
	And the user clicks on side panel 'Summary'
	And the user changes the status to '<STATUS2>'
	#11 Go to Constraints tab and select the Constraint 1. Click on "Remove"
	And the user clicks on side panel 'Constraints'
	And the user unchecks the 'Grid Row CheckBox' with value '<VALIDITYEND2>'
	And the user clicks on '<VALIDITYEND1>' text on the grid
	And the user clicks on 'Grid Row CheckBox' with value '<VALIDITYEND1>' until 'Remove Button' is enabled
	And the user clicks on the 'Remove Button'
	Then the user validates that the 'Text' with value 'Selected constraint(s) cannot be removed because it has fund movements associated.' is present
	#12 Select the Constraint 2. Click on "Remove"
	When the user unchecks the 'Grid Row CheckBox' with value '<VALIDITYEND1>'
	And the user unchecks the 'Grid Row CheckBox' with value '<VALIDITYEND2>'
	And the user clicks on 'Grid Row CheckBox' with value '<VALIDITYEND2>' until 'Remove Button' is enabled
	And the user clicks on the 'Remove Button'
	Then the user validates that the 'Alert Dialog Message Box' is present
	When the user clicks on the 'Alert Dialog Cancel Button'
	#13 Close without saving the document
	And the user clicks on the 'Close Tab'

	Examples:
		| CONFIGURATIONID | STARTSELLIN | ENDSELLIN | DESCRIPTION                                 | CUSTOMERLEVEL | VALIDITYSTART1 | VALIDITYEND1 | VALUE | VALUE2 | VALIDITYSTART2 | VALIDITYEND2 | FAMILYCONSTRAINTS | STATUS  | STATUS2  | CUSTOMER | PROMOSELLINSTART | PROMOSELLINEND | MECHANIC | PRODLVL | PRODUCT | MECHANICVALUE | CHANGESTATUSES   | CHANGESTATUSES2 | PRODUCT_GROUPS | RATEFUNDSOURCE | SELLOUTSTART | SELLOUTEND |
		| Sales Fund      | 10/01/y     | 20/12/y   | WEB_TPM_SP_FRDOCUMENT_REMOVECONSTRAINTS_003 | Level 5       | 10/01/y        | 30/06/y      | 1000  | 2000   | 01/07/y        | 20/12/y      | 01,02             | Confirm | Modified | EC86170  | 10/01/y          | 20/12/y        | Leaflet  | Product | 009     | 100           | To be authorized | Confirm         |                |                |              |            |