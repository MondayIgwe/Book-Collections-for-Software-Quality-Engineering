Feature: TestCase_548129

@BDD_548129 @PROMO_Regression @PromoActions
Scenario: WEB_TPM_SP_PROMODOCUMENT_WEEKLYSPLIT_54WEEKS
	#Step 1 Login to the app @Division
	Given the user has logged in with division '<Division>'
	When the user navigates to the 'Promotional actions' page
	#Step2 From Promo Actions navigator create a new promo with:
	And the user creates a Promo with customer Level '<CUSTLEV>' customerCode: '<CUSTOMER>' confirmLevel: '<CONFIRMATIONLEVEL>'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELL_OUT_START_P1>' sellOutEnd: '<SELL_OUT_END_P1>' mechanics: '<MECHANICS>'
	And the user clicks on side panel 'Products'
	And the user adds a product with productLevel: '<ProdLevel>' productCodes: '<Prod1>'
	And the user checks the 'Grid CheckBox' with value 'ALL - Selected'
	And the user enters '<QTYESTIMATED1>' on column name 'Estimated quantity' for product code '<Prod1>'
	
	#3 Open Week Split tab 
	And the user clicks on top panel 'Weekly Split'
	#The split is done for 54 weeks ( a column with description "W 54 01/03" is present @COLUMNHEADERWEEK54 and the total estimated quantity has the correct value @QTYESTIMATED 	
	Then user validates that all products rowName: 'Estimated quantity' for column 'Total' are set to '<QTYESTIMATED>'
	And the user validates that the 'Basic Grid Column' with value '<COLUMNHEADERWEEK54>' is present

	#5 Close the promotion without saving
	When the user closes all pages without saving the work done


Examples:
	| Division                                 | CUSTLEV | CUSTOMER | CONFIRMATIONLEVEL | MECHANICS | SELLINSTART | SELLINEND  | SELL_OUT_START_P1 | SELL_OUT_END_P1 | DESCRIPTION | ProdLevel | Prod1 | QTYESTIMATED1 | QTYESTIMATED | COLUMNHEADERWEEK54 |
	| XTEL TPM AUTOMATION - Global Group SM1V4 | Level 5 | EC86162  | Holder level      | Leaflet   | 28/12/2020  | 06/01/2022 | 28/12/2020        | 06/01/2022      | 54Weeks     | Product   | 012   | 54            | 54.000       | W 54 01/03         |