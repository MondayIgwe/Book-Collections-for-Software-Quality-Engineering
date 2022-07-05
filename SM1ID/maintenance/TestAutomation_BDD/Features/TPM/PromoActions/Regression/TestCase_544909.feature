Feature: TestCase_544909

@BDD_544909 @PROMO_Regression @PromoActions
Scenario: WEB_TPM_SP_PROMODOCUMENT_WEEKLYSPLIT_REVALUATED_AFTER_COPY_001
	#Step 1-2	 Login to the app and go to Promo actions navigator
	Given the user navigates to the 'Promotional actions' page

	#Step 3 Create a new promo with:
	When the user creates a Promo with customer Level '<CUSTLEV>' customerCode: '<CUSTOMER>' confirmLevel: '<CONFIRMATIONLEVEL>'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '' sellOutEnd: '' mechanics: '<MECHANICS>'
	And the user adds products with productLevel: 'Product' productCodes: '<PROD1>'
	And the user adds products with productLevel: 'Product' productCodes: '<PROD2>'
	And the user checks the 'Grid CheckBox' with value 'ALL - Selected'
	And the user enters '<QTYESTIMATED>' on column name 'Estimated quantity' for product code 'ALL - Selected'
	#Check that in the Weekly Split tab, between "Field User" and "Total" columns there is only 1 column related to only 1 week.
	And the user clicks on top panel 'Weekly Split'
	Then the user validates that the 'Basic Grid Column Containing' with value 'W 1' is present
	And the user validates that the 'Basic Grid Column Containing' with value 'W 2' is not present
	#4 Save and Close the promo
	When the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#5 Search the just created promo in the Promo Actions nav.
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId1'
	#6 Select it
	And the user checks the 'Grid CheckBox' with value 'ActionId1'
	#7 Click on "Mass Copying" button in the navigator toolbar
	And the user clicks on 'Button Link' with value 'Mass copying'
	#8 Select  @UnitToShift = Days @PeriodToShift = 3 Click on "Execute" button
	And the user select value '<UnitToShift >' from dropdown list 'Units to shift'
	And the user enters '<PeriodToShift>' in field 'Input By Label Name' with value 'Period to shift'
	And the user clicks on 'Button' with value 'Execute Copy'
	#9 Once the copying is finished, Click on the PromoActionID present in the field "Generated Action Code"
	Then the user validates that column 'Copy result' has 'Success' with row text 'ActionId1'
	When the user retrieves text from column 'Generated Action Code' with unique row text 'ActionId1' and saves it as 'GeneratedActionId1'
	And the user clicks on 'Link In Grid' with value 'GeneratedActionId1'
	#10Go to Weekly Split tab
	And the user clicks on side panel 'Products'
	And the user clicks on top panel 'Weekly Split'
	#Check that in the Weekly Split tab, between "Field User" and "Total" columns there are 2 columns related to the fact that promo spreads 2 weeks.
	Then the user validates that the 'Basic Grid Column Containing' with value 'W 1' is present
	And the user validates that the 'Basic Grid Column Containing' with value 'W 2' is present

Examples:
	| CUSTLEV | CUSTOMER | CONFIRMATIONLEVEL | MECHANICS | SELLINSTART    | SELLINEND      | DESCRIPTION                  | PROD1 | PROD2 | QTYESTIMATED | UnitToShift | PeriodToShift |
	| Level 5 | EC86162  | Holder level      | TPR in %  | Next Monday +0 | Next Sunday +1 | Weekly Split After Copy Test | 001   | 002   | 1000         | Days        | 3             |