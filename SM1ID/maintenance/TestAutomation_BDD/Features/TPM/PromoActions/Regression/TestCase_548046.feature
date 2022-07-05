Feature: TestCase_548046

@BDD_548046 @PROMO_Regression @PromoActions
Scenario: WEB_TPM_SP_PROMODOCUMENT_WEEKLYSPLIT_ADD_REMOVE_PRODUCTS
	#1 Login to the app @Division  
	Given the user has logged in with division '<Division>'
	#Step 2 From Promo Actions navigator create a new promo with:
	And the user navigates to the 'Promotional actions' page
	When the user creates a Promo with customer Level '<CUSTLEV>' customerCode: '<CUSTOMER>' confirmLevel: '<CONFIRMATIONLEVEL>'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELL_IN_START_P1>' sellInEnd: '<SELL_IN_END_P1>' sellOutStart: '<SELL_OUT_START_P1>' sellOutEnd: '<SELL_OUT_END_P1>' mechanics: '<MECHANICS>'
	And the user clicks on side panel 'Products'
	And the user adds a product with productLevel: '<ProductLevel>' productCodes: '<Prod1>'
	And the user adds a product with productLevel: '<ProductLevel>' productCodes: '<Prod2>'
	And the user adds a product with productLevel: '<ProductLevel>' productCodes: '<Prod3>'
	And the user enters '<QTYESTIMATED1>' on column name 'Estimated quantity' for product code '<Prod1>'
	And the user enters '<QTYESTIMATED2>' on column name 'Estimated quantity' for product code '<Prod2>'
	And the user enters '<QTYESTIMATED3>' on column name 'Estimated quantity' for product code '<Prod3>'
	And the user checks the 'Grid CheckBox' with value 'ALL - Selected'
	And the user enters '<QTYESTIMATED>' on column name 'Estimated quantity' for product code 'ALL - Selected'
	#3 Open Week Split tab
	When the user clicks on top panel 'Weekly Split'
	#The Estimated Quantity for the Total column @ESTWeekTotal is equal to the @QTYESTIMATED
	Then user validates that product code 'Family - 01 - ITALIAN WHITE (Default)' with row 'Estimated quantity' for column 'Total' is set to '<ESTWeekTotal>'
	#4 From Products tab remove @Prod3
	When the user clicks on top panel 'Products'
	And the user unchecks the 'Grid CheckBox' with value 'ALL - Selected'
	And the user clicks on 'Grid CheckBox Containing' with value '<Prod3>'
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
    #5 Open Week Split tab
	When the user clicks on top panel 'Weekly Split'
	#The product is removed and the new Total Estimated Quantity (Total column) has the new value @ESTWeekTotal2 that is the sum of the remaining quantities ( @QTYESTIMATED1 + @QTYESTIMATED2 )
	Then user validates that product code 'Family - 01 - ITALIAN WHITE (Default)' with row 'Estimated quantity' for column 'Total' is set to '<ESTWeekTotal2>'
	And the user validates that the 'Containing Text In Table Cell' with value '<Prod3>' is not displayed
	#6 From Products tab add @Prod4 with @QTYESTIMATED4
	When the user clicks on top panel 'Products'
	And the user adds a product with productLevel: '<ProductLevel>' productCodes: '<Prod4>'
	And the user enters '<QTYESTIMATED4>' on column name 'Estimated quantity' for product code '<Prod4>'
	#Open Week Split tab
	When the user clicks on top panel 'Weekly Split'
	#The new Total Estimated Quantity (Total column) has the new value @ESTWeekTotal3 that is the sum of the quantities of the products in the promotion ( @QTYESTIMATED1 + @QTYESTIMATED2 + @QTYESTIMATED4
	Then user validates that product code 'Family - 01 - ITALIAN WHITE (Default)' with row 'Estimated quantity' for column 'Total' is set to '<ESTWeekTotal3>'
	#8 Save and close the promotion
	When the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'


Examples:
	| Division                                 | CUSTLEV | CUSTOMER | CONFIRMATIONLEVEL | MECHANICS | SELL_IN_START_P1 | SELL_IN_END_P1 | SELL_OUT_START_P1 | SELL_OUT_END_P1 | DESCRIPTION            | ProductLevel | Prod1 | QTYESTIMATED1 | Prod2 | QTYESTIMATED2 | Prod3 | QTYESTIMATED3 | QTYESTIMATED | ESTWeekTotal | ESTWeekTotal2 | Prod4 | QTYESTIMATED4 | ESTWeekTotal3 |
	| XTEL TPM AUTOMATION - Global Group SM1V4 | Level 3 | EC86194  | Holder level      | Leaflet   | d+10/m/y         | d+17/m/y       | d+10/m/y          | d+17/m/y        | AddRemoveProdWeekSplit | Product      | 012   | 100           | 013   | 123           | 014   | 42            | 265          | 265.000      | 223.000       | 019   | 27            | 250.000       |