Feature: TestCase_442993

@BDD_442993 @PROMO_Nightly @FundsAndRules @FundsAndRulesNightly
Scenario: WEB_TPM_SP_ANOM_GL_KPI_INCIDENCE_001
	#Step 1
	Given the user navigates to the 'Funds & Rules' page
	#Step 2 - Create a Confirmed BR_01 having
	When the user creates a new fund and rules with configuration ID: '<CONFIGURATIONID>' BRCustomerLevel: '<BRCUSTOMERLEVEL>' Description: '<DESCRIPTION >' sellInStart: '<STARTSELLIN>' sellInEnd: '<ENDSELLIN>' productGroup: '<CategoryA>' rateFundSource: '<RATEFUNDSOURCE>'
	And the user clicks on side panel 'Constraints'
	And user adds a constraint MinimumDiscount: '<MinimalDiscount>' MaximumDiscount: '<MaximalDiscount>'
	And the user clicks on side panel 'Summary'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#3. Create a Promo in Draft with
	And the user navigates to the 'Promotional actions' page
	And the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUSTOMER>'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<STARTSELLIN>' sellInEnd: '<ENDSELLIN>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<ACTIVITY_A>'
	And the user adds a product with productLevel: '<PRODLVL>' productCodes: '<PROD1>'
	And the user clicks on 'Top Tab' with value 'Business Rules'
	And user selects products business rule with description: '<DESCRIPTION>'
	And the user clicks on 'Top Tab' with value 'Products'
	And the user enters '<FIRSTCUTPRICEVALUE>' on column name '% Cut Price' for product code '<PROD1>'
	And the user enters '<QTYESTIMATED>' on column name 'Estimated quantity' for product code '<PROD1>'
	And the user clicks on the 'Save Button'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user clicks on the 'Close Tab'
	#4 Go to Promo Navigator
	And the user clicks on the 'Refresh Button'
	#5. Open the created promo and Switch it in "Edit" mode. Go to the "Business Rules" tab.
	Then the user validates that the Loading Mask is not present
	When the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId'
	And the user clicks on 'Indexed Row Link' with value '1'
	And the user clicks on 'Button' with value 'Edit'
	And the user clicks on side panel 'Products'
	And the user clicks on 'Top Tab' with value 'Business Rules'
	Then user validates products business rule is selected with description: '<DESCRIPTION>'
	#6 Go to Workflow tab and Revaluate anomalies.
	When the user clicks on side panel 'Workflow'
	And the user clicks on the 'ReEvaluate Anomalies Button'
	And the user filters the column by column name 'Funds & Rules', Filter Type 'Like', Value '<DESCRIPTION>'
	Then the user validates that the 'Anomalies Rows' is not present
	#7 In the Product Grid, Set DISC_PERC = 1%, @SECONDCUTPRICEVALUE Go to Workflow tab and  Revaluate anomalies.
	When the user clicks on side panel 'Products'
	And the user clicks on 'Top Tab' with value 'Products'
	And the user enters '<SECONDCUTPRICEVALUE>' on column name '% Cut Price' for product code '<PROD1>'
	And the user clicks on side panel 'Workflow'
	And the user clicks on the 'ReEvaluate Anomalies Button'
	Then the user validates that the 'Anomalies Rows' is present
	#8 In the Product Grid, Set Set DISC_PERC = 4%, @THIRDCUTPRICEVALUE Go to Workflow tab and  Revaluate anomalies.
	When the user clicks on side panel 'Products'
	And the user clicks on 'Top Tab' with value 'Products'
	And the user enters '<THIRDCUTPRICEVALUE>' on column name '% Cut Price' for product code '<PROD1>'
	And the user clicks on side panel 'Workflow'
	And the user clicks on the 'ReEvaluate Anomalies Button'
	Then the user validates that the 'Anomalies Rows' is not present
	#9 In the Product Grid, Set Set DISC_PERC = 6%, @FOURTHCUTPRICEVALUE  Go to Workflow tab and Revaluate anomalies.
	When the user clicks on side panel 'Products'
	And the user clicks on 'Top Tab' with value 'Products'
	And the user enters '<FOURTHCUTPRICEVALUE>' on column name '% Cut Price' for product code '<PROD1>'
	And the user clicks on side panel 'Workflow'
	And the user clicks on the 'ReEvaluate Anomalies Button'
	Then the user validates that the 'Anomalies Rows' is present
	#10 In the product grid Add a new product @PROD2 = 002 and Set DISC_PERC = 10%, @FIFTHCUTPRICEVALUE
	When the user adds a product with productLevel: '<PRODLVL>' productCodes: '<PROD2>'
	And the user enters '<FIFTHCUTPRICEVALUE>' on column name '% Cut Price' for product code '<PROD2>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId'
	And the user clicks on 'Indexed Row Link' with value '1'
	And the user clicks on side panel 'Workflow'
	And the user clicks on the 'ReEvaluate Anomalies Button'
	Then the user validates that the 'Anomalies Rows' is present
	When the user clicks on the 'Close Tab'
	And the user clicks on the 'Close Tab'

Examples:
	| CONFIGURATIONID | BRCUSTOMERLEVEL | CategoryA    | RATEFUNDSOURCE | MinimalDiscount | MaximalDiscount | CUSTLEV | CUSTOMER | DESCRIPTION              | STARTSELLIN | ENDSELLIN | SELLOUTSTART | SELLOUTEND | ACTIVITY_A | PRODLVL | PROD1 | FIRSTCUTPRICEVALUE | QTYESTIMATED | SECONDCUTPRICEVALUE | THIRDCUTPRICEVALUE | FOURTHCUTPRICEVALUE | PROD2 | FIFTHCUTPRICEVALUE |
	| 629 - KPI       | 5 - Level 5     | ITALIAN WINE |                | 2               | 5               | Level 3 | EC94103  | Incidence Anomaly test 1 | d+1/m/y     | d+15/m/y  |              |            | TPR in %   | Product | 004   | 3                  | 100000       | 1                   | 4                  | 6                   | 002   | 10                 |