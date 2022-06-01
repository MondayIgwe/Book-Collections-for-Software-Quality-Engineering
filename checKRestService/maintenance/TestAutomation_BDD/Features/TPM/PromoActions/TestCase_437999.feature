Feature: TestCase_437999

@BDD_437999 @PROMO_Nightly @PromoActions @PromoActionsNightly
Scenario: WEB_TPM_SP_PROMODOCUMENT_WEEKLYSPLIT_001
	#Login to the promo and go to Promo action navigator
	Given the user navigates to the 'Promotional actions' page
	#2 Create a new Promo with:
	When the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUSTOMER>'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTARTDATE>' sellOutEnd: '<SELLOUTENDDATE>' mechanics: '<MECHANICS>'

	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user adds a product with productLevel: 'Family' productCodes: '<FAM>'
	#Go to Products\Weekly Split tab
	And the user clicks on 'Top Tab' with value 'Weekly Split'
	#4 Select the Aggregation row of the Family @FAMILYROW
	And the user clicks on 'Grid CheckBox Containing' with value '<FAMILYROW>'
	#All products below the Family are selected.
	Then the user validates that the 'Unchecked Grid CheckBox Containing' with value 'Product -' is not present
	#Button "Default Week Split Drivers" is disabled
	And the user validates that the 'Button Link' with value 'Default Week Split Drivers' is disabled
	#Weights are automatically set to  @COLUMNVALUES "50"
	And user validates that all products rowName: 'Weight' for column 'W 1' are set to '<COLUMNVALUES>'
	#5 At Family Aggregation Row, Set Weekly Split weights for the products @W1, @W2 (30, 70)
	When the user enters '<W1>' on Weekly Split column name 'W 1' for product code '<FAMILYROW>' and row 'Weight'
	And the user enters '<W2>' on Weekly Split column name 'W 2' for product code '<FAMILYROW>' and row 'Weight'
	#Weights are updated for all products below the Family. (30, 70)
	Then user validates that all products rowName: 'Weight' for column 'W 1' are set to '30.000'
	And user validates that all products rowName: 'Weight' for column 'W 2' are set to '70.000'
	#6 Select the Aggregation row of the Family
	#7 Click on "Reset to default split"- Reset will be applied to ALL rows. Proceed?- Click "NO"
	When the user clicks on 'Button Link' with value 'Reset to default split'
	And the user clicks on the 'Alert Dialog No Button'
	Then user validates that all products rowName: 'Weight' for column 'W 1' are set to '30.000'
	And user validates that all products rowName: 'Weight' for column 'W 2' are set to '70.000'
	#Click on "Reset to default split"- Reset will be applied to ALL rows. Proceed?- Click "YES"
	When the user clicks on 'Button Link' with value 'Reset to default split'
	And the user clicks on the 'Alert Dialog Yes Button'
	#Values are reset (Weights are now (50, 50))
	Then user validates that all products rowName: 'Weight' for column 'W 1' are set to '50.000'
	And user validates that all products rowName: 'Weight' for column 'W 2' are set to '50.000'
	#9 Go to Products tab,At Family row level, insert a value in Estimated Quantity Measure (@QTYESTIMATED_VALUE = 1000)
	When the user clicks on 'Top Tab' with value 'Products'
	And the user enters '<QTYESTIMATED_VALUE>' on column name 'Estimated quantity' for product code '<FAM>'
	#10 Return to Weekly Split subtab 
	And the user clicks on 'Top Tab' with value 'Weekly Split'
	#Weekly split is updated with the inserted values:
	Then user validates that product code '<FAM>' with row 'Estimated quantity' for column 'W 1' is set to '500.000'
	And user validates that product code '<FAM>' with row 'Estimated quantity' for column 'W 2' is set to '500.000'
	#Close the promo w/o saving
	When the user closes all pages without saving the work done
	#12 Open Default Weekly Split Drivers for @CUSTOMER2 and Configure for Family 01 (40, 60 if @PERIOD lasts 2 weeks)
	And the user navigates to the 'Default Week Split Driver' page
	And the user filters the column by column name 'Code', Filter Type 'Like', Value '<CUSTOMER2>'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	And the user enters '40' on Weekly Split driver for promo week row 'W1' and promo week column '2 Weeks'
	And the user enters '60' on Weekly Split driver for promo week row 'W2' and promo week column '2 Weeks'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#13 Create a new Promo with:
	And the user navigates to the 'Promotional actions' page
	When the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUSTOMER2>'
	And the user populates the cockpit with description: '<DESCRIPTION2>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTARTDATE>' sellOutEnd: '<SELLOUTENDDATE>' mechanics: '<MECHANICS>'
	
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user adds a product with productLevel: 'Family' productCodes: '<FAM>'
	#14 Go to Products\Weekly Split tab
	And the user clicks on 'Top Tab' with value 'Weekly Split'
	#15 Select the Aggregation row of the Family
	And the user clicks on 'Grid CheckBox Containing' with value '<FAMILYROW>'
	#All products below the Family are selected.
	Then the user validates that the 'Unchecked Grid CheckBox Containing' with value 'Product -' is not present
	#Button "Default Week Split Drivers" is enabled
	And the user validates that the 'Button Link' with value 'Default Week Split Drivers' is enabled
	#Weights are automatically set to @DEFW1, @DEFW2 (40, 60)
	And user validates that all products rowName: 'Weight' for column 'W 1' are set to '<DEFW1>'
	And user validates that all products rowName: 'Weight' for column 'W 2' are set to '<DEFW2>'
	#16 Click on "Default Week Split Drivers"
	When the user clicks on 'Button Link' with value 'Default Week Split Drivers'
	#GUI related to Default Week Split Driver is opened.
	Then the user validates that the 'Text in Grid' with value 'Promo week' is present
	#Check the weights for 2 weeks are 40, 60
	And the user validate that Weekly Split driver for promo week row 'W2' and promo week column '2 Weeks' is '60.000'
	And the user validate that Weekly Split driver for promo week row 'W1' and promo week column '2 Weeks' is '40.000'
	#17 Close the GUI
	When the user clicks on the 'Close Tab'

	#18 Set Weekly Split weights for the products @PRODS, @WPRODS
	And the user enters '<WPRODS1>' on Weekly Split column name 'W 1' for product code '<PRODS>' and row 'Weight'
	And the user enters '<WPRODS2>' on Weekly Split column name 'W 2' for product code '<PRODS>' and row 'Weight'
	And the user enters '<WPRODS1>' on Weekly Split column name 'W 1' for product code '<PRODS2>' and row 'Weight'
	And the user enters '<WPRODS2>' on Weekly Split column name 'W 2' for product code '<PRODS2>' and row 'Weight'
	#Go to Products tab- insert any value in Estimated Quantity Measure for @PRODS, @QTYESTIMATED_VAL_PRODS
	And the user clicks on 'Top Tab' with value 'Products'
	And the user enters '<QTYESTIMATED_VAL_PRODS>' on column name 'Estimated quantity' for product code '<PRODS>'
	And the user enters '<QTYESTIMATED_VAL_PRODS2>' on column name 'Estimated quantity' for product code '<PRODS2>'
	#20 Go back to the Weekly Split tab
	And the user clicks on 'Top Tab' with value 'Weekly Split'
	#QTYESTIMATED is split on weeks according to the inserted weights:
	Then user validates that product code '<PRODS>' with row 'Estimated quantity' for column 'W 1' is set to '33.333'
	And user validates that product code '<PRODS>' with row 'Estimated quantity' for column 'W 2' is set to '66.667'
	#21 Select only 1 of the 2 products (001)
	When the user clicks on 'Grid CheckBox Containing' with value '<PRODS>'
	#22 Click on "Reset to default split"- Reset will be applied to ALL rows. Proceed?- Click "NO"
	When the user clicks on 'Button Link' with value 'Reset to default split'
	And the user clicks on the 'Alert Dialog No Button'
	Then user validates that product code '<PRODS>' with row 'Estimated quantity' for column 'W 1' is set to '33.333'
	And user validates that product code '<PRODS>' with row 'Estimated quantity' for column 'W 2' is set to '66.667'
	#23 Click on "Reset to default split"- Reset will be applied to ALL rows. Proceed?- Click "YES"
	When the user clicks on 'Button Link' with value 'Reset to default split'
	And the user clicks on the 'Alert Dialog Yes Button'
	#Only weights related to the selected product are reset to the default value (40, 60)
	Then user validates that product code '<PRODS>' with row 'Estimated quantity' for column 'W 1' is set to '40.000'
	And user validates that product code '<PRODS>' with row 'Estimated quantity' for column 'W 2' is set to '60.000'
	#Go to the Products tab, remove a product (001)
	When the user clicks on 'Top Tab' with value 'Products'
	And the user clicks on 'Grid CheckBox Containing' with value '01 - ITALIAN WHITE'
	And the user clicks on 'Grid CheckBox Containing' with value '<PRODS>'
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
	#25  Return to Weekly Split subtab 
	And the user clicks on 'Top Tab' with value 'Weekly Split'
	#Product (001) is no more present in the Weekly Split tab
	Then the user validates that the 'Text Containing' with value 'Product - <PRODS>' is not present
	#26 Close the promo w/o saving
	When the user closes all pages without saving the work done

Examples:
	| CUSTLEV | CUSTOMER | MECHANICS | SELLINSTART | SELLINEND        | SELLOUTSTARTDATE | SELLOUTENDDATE | DESCRIPTION         | DESCRIPTION2        | FAM | FAMILYROW   | COLUMNVALUES | COLUMNVALUES2 | COLUMNVALUES3 | W1 | W2 | QTYESTIMATED_VALUE | CUSTOMER2 | PERIOD  | DEFW1  | DEFW2  | PRODS | PRODS2 | WPRODS | WPRODS2 | QTYESTIMATED_VAL_PRODS | QTYESTIMATED_VAL_PRODS2 |
	| Level 3 | EC94679  | TPR in %  | Next Monday | Next Next Sunday |                  |                | Weekly Split test 1 | Weekly Split test 2 | 01  | Family - 01 | 50.000       | 500.000       | 0.000         | 30 | 70 | 1000               | EC95056   | 2 Weeks | 40.000 | 60.000 | 001   | 002    | 1      | 2       | 100                    | 200                     |