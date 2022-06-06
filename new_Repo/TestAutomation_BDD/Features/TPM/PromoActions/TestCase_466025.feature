Feature: TestCase_466025

@BDD_466025 @PROMO_Nightly @PromoActions
Scenario: WEB_TPM_SP_PROMODOCUMENT_DIRECTCUSTOMERS_001
	#Go to "Promo Action" navigator
	Given the user has logged in with division 'XTEL SFA AUTOMATION - Global Group SM1V4'
	#3 Go to the promo actions nav.
	When the user navigates to the 'Promotional actions' page
	#4 Create a new promo with:
	And the user creates a Promo 'Level 4' '<CUSTOMER1>'
	And the user populates the cockpit 'Indirect Customer Promo 1' 'd+1/m/y' 'd+15/m/y' '<DATE>' '<DATE>' 'Trade Price Reduction (%)'
	And the user adds a product 'Product' '<PROD1>'
	And the user adds a product 'Product' '<PROD2>'
	And the user enters '<QTYEST1>' on column name 'Estimated quantity' for product code '<PROD1>'
	And the user enters '<QTYEST1_2>' on column name 'Estimated quantity' for product code '<PROD2>'
	And the user enters '<DISCPERC>' on column name '% Cut Price' for product code '<PROD1>'
	And the user enters '<DISCPERC>' on column name '% Cut Price' for product code '<PROD2>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#5 Open just created promo
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Action Id', 'Equal', 'ActionId'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	#7 Go to Products\Direct customers tab.
	And the user clicks on 'Side Panel Tab' with value 'Products'
	And the user clicks on 'Top Tab' with value 'Direct Customers'
	#The following cols are shown: @DC_GRID_COLS
	Then the user validates that the 'Element by SM1Id' with value 'CODPRODUCT' is present
	And the user validates that the 'Element by SM1Id' with value 'ALLOCATION_WEIGHT' is present
	And the user validates that the 'Element by SM1Id' with value 'QTYESTIMATED' is present
	And the user validates that the 'Element by SM1Id' with value 'BASELINE_IMPORTED' is present
	And the user validates that the 'Element by SM1Id' with value 'UPLIFT_CALC' is present
	And the user validates that the 'Element by SM1Id' with value 'UM' is present
	And the user validates that the 'Element by SM1Id' with value 'GROSSSALESREVENUE' is present
	And the user validates that the 'Element by SM1Id' with value 'PREPROMOPRICE' is present
	And the user validates that the 'Element by SM1Id' with value 'PREPROMOREVENUE' is present
	And the user validates that the 'Element by SM1Id' with value 'DISC_PERC' is present
	#About Prod 001:- @DCUST_1 {EC86263, EC86264} are shown.
	And the user validates that the customer '<DCUST_1>' under product '<PROD1>' is present
	And the user validates that the customer '<DCUST_2>' under product '<PROD1>' is present
	#Qty estimated for each row is calculated as: QTYEST (at product level) * ALLOCATION_WEIGHT = @QTYCALC1 {70, 30}
	And the user validates that the customer '<DCUST_1>' under product '<PROD1>' has value '70.00' for 'Estimated quantity'
	And the user validates that the customer '<DCUST_2>' under product '<PROD1>' has value '30.00' for 'Estimated quantity'
	#About Prod 002:- @DCUST_1 {EC86264, EC86312} are shown.
	And the user validates that the customer '<DCUST_3>' under product '<PROD2>' is present
	And the user validates that the customer '<DCUST_4>' under product '<PROD2>' is present
	#Qty estimated for each row is calculated as: QTYEST (at product level) * ALLOCATION_WEIGHT = QTYCALC1 {80, 120}
	And the user validates that the customer '<DCUST_3>' under product '<PROD2>' has value '80.00' for 'Estimated quantity'
	And the user validates that the customer '<DCUST_4>' under product '<PROD2>' has value '120.00' for 'Estimated quantity'
	#8 Check the product grid
	When the user clicks on 'Top Tab' with value 'Products'
	#About Prod 001:  @GROSS_SALES_REVENUE_1 is calculated as 70+30 = 100
	And the user clicks on the 'Product Grid Select Measures'
	And the user clicks on 'List' with value 'All'
	Then the user validates text contains '100.00' on column name 'Gross Sales Revenue' for product code '<PROD1>'
	#@PRE_PROMO_PRICE_1 is calculated as GROSS_SALES_REVENUE/QTYEST = 1
	And the user validates text contains '1.00' on column name 'Pre Promo Price' for product code '<PROD1>'
	#About Prod 002:@GROSS_SALES_REVENUE_1 is calculated as 160+240 = 400
	And the user validates text contains '400.00' on column name 'Gross Sales Revenue' for product code '<PROD2>'
	#PRE_PROMO_PRICE_1 is calculated as GROSS_SALES_REVENUE/QTYEST = 400/200 = 2
	And the user validates text contains '2.00' on column name 'Pre Promo Price' for product code '<PROD2>'
	#9 Save and Close the promo
	When the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#10 From Promo Action nav. Copy the previous promo.
	And the user clicks on 'Button Link' with value 'Copy action'
	#11 Select in the creation popup a child of Child of EC86178 (i.e. @CHILD_OF_CUST = EC86176).
	And the user selects a customer 'Level 3' '<CHILD_OF_CUST>'
	And the user clicks on 'Popup Button' with value 'OK'
	#12 Go to Products\Direct customers tab.
	And the user clicks on 'Side Panel Tab' with value 'Products'
	And the user enters '<QTYEST1>' on column name 'Estimated quantity' for product code '<PROD1>'
	And the user enters '<QTYEST1_2>' on column name 'Estimated quantity' for product code '<PROD2>'
	And the user enters '<DISCPERC>' on column name '% Cut Price' for product code '<PROD1>'
	And the user enters '<DISCPERC>' on column name '% Cut Price' for product code '<PROD2>'
	And the user clicks on 'Top Tab' with value 'Direct Customers'
	#The following cols are shown: @DC_GRID_COLS
	Then the user validates that the 'Element by SM1Id' with value 'CODPRODUCT' is present
	And the user validates that the 'Element by SM1Id' with value 'ALLOCATION_WEIGHT' is present
	And the user validates that the 'Element by SM1Id' with value 'QTYESTIMATED' is present
	And the user validates that the 'Element by SM1Id' with value 'BASELINE_IMPORTED' is present
	And the user validates that the 'Element by SM1Id' with value 'UPLIFT_CALC' is present
	And the user validates that the 'Element by SM1Id' with value 'UM' is present
	And the user validates that the 'Element by SM1Id' with value 'GROSSSALESREVENUE' is present
	And the user validates that the 'Element by SM1Id' with value 'PREPROMOPRICE' is present
	And the user validates that the 'Element by SM1Id' with value 'PREPROMOREVENUE' is present
	And the user validates that the 'Element by SM1Id' with value 'DISC_PERC' is present
	#About Prod 001:- @DCUST_1 {EC86263, EC86264} are shown.
	And the user validates that the customer '<DCUST_1>' under product '<PROD1>' is present
	And the user validates that the customer '<DCUST_2>' under product '<PROD1>' is present
	#Qty estimated for each row is calculated as: QTYEST (at product level) * ALLOCATION_WEIGHT = @QTYCALC1 {70, 30}
	And the user validates that the customer '<DCUST_1>' under product '<PROD1>' has value '70.00' for 'Estimated quantity'
	And the user validates that the customer '<DCUST_2>' under product '<PROD1>' has value '30.00' for 'Estimated quantity'
	#About Prod 002:- @DCUST_1 {EC86264, EC86312} are shown.
	And the user validates that the customer '<DCUST_3>' under product '<PROD2>' is present
	And the user validates that the customer '<DCUST_4>' under product '<PROD2>' is present
	#Qty estimated for each row is calculated as: QTYEST (at product level) * ALLOCATION_WEIGHT = QTYCALC1 {80, 120}
	And the user validates that the customer '<DCUST_3>' under product '<PROD2>' has value '80.00' for 'Estimated quantity'
	And the user validates that the customer '<DCUST_4>' under product '<PROD2>' has value '120.00' for 'Estimated quantity'
	#13 Check the product grid
	When the user clicks on 'Top Tab' with value 'Products'
	#About Prod 001:  @GROSS_SALES_REVENUE_1 is calculated as 70+30 = 100
	And the user clicks on the 'Product Grid Select Measures'
	And the user clicks on 'List' with value 'All'
	Then the user validates text contains '100.00' on column name 'Gross Sales Revenue' for product code '<PROD1>'
	#@PRE_PROMO_PRICE_1 is calculated as GROSS_SALES_REVENUE/QTYEST = 1
	And the user validates text contains '1.00' on column name 'Pre Promo Price' for product code '<PROD1>'
	#About Prod 002:@GROSS_SALES_REVENUE_1 is calculated as 160+240 = 400
	And the user validates text contains '400.00' on column name 'Gross Sales Revenue' for product code '<PROD2>'
	#PRE_PROMO_PRICE_1 is calculated as GROSS_SALES_REVENUE/QTYEST = 400/200 = 2
	And the user validates text contains '2.00' on column name 'Pre Promo Price' for product code '<PROD2>'
	#14 Close promo w/o saving
	When the user closes all pages without saving the work done
	#15 Create a new promo with
	And the user creates a Promo 'Level 1' 'EC86851'
	And the user populates the cockpit 'Indirect Customer Promo 2' 'd+1/m/y' 'd+15/m/y' '<DATE>' '<DATE>' 'Trade Price Reduction (%)'
	And the user adds a product 'Product' '<PROD1>'
	And the user adds a product 'Product' '<PROD2>'
	And the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Top Tab' with value 'Header info'
	And the user selects active scenario 'Level 1' from dropdown list 'Participants level'
	#16 Go to Products and add: @FAMILY 02
	And the user adds a product 'Family' '<FAMILY>'
	#17 At Family row level, set @QTYEST2 = 1000 @DISCPERC = 10
	And the user clicks on the 'Product Grid Select Measures'
	And the user clicks on 'List' with value 'All'
	And the user enters '<QTYEST2>' on column name 'Estimated quantity' for product code '02 - ITALIAN RED'
	And the user enters '<DISCPERC>' on column name '% Cut Price' for product code '<PROD1>'
	#18 Go to Direct customers tab.
	And the user clicks on 'Top Tab' with value 'Direct Customers'
	#Family 02 has 4 rows: @FAMILY_CUSTS EC10044, EC10045, EC9985, EC9975
	Then the user validates that the customer 'EC10044' under product '<PROD3>' is present
	And the user validates that the customer 'EC10045' under product '<PROD3>' is present
	And the user validates that the customer '<FAMILY_CUSTS3>' under product '<PROD3>' is present
	And the user validates that the customer '<FAMILY_CUSTS4>' under product '<PROD3>' is present
	#Weights for them are = 0.2, 0.3, 0.4, 0.1
	And the user validates that the customer 'EC10044' under product '<PROD3>' has value '0.20' for 'Weight'
	And the user validates that the customer 'EC10045' under product '<PROD3>' has value '0.30' for 'Weight'
	And the user validates that the customer '<FAMILY_CUSTS3>' under product '<PROD3>' has value '0.40' for 'Weight'
	And the user validates that the customer '<FAMILY_CUSTS4>' under product '<PROD3>' has value '0.10' for 'Weight'
	#@QTYCALC2 for each row is calculated as: QTYEST (at product level) * ALLOCATION_WEIGHT
	And the user validates that the customer 'EC10044' under product '<PROD3>' has value '<QTYCALC2_1>' for 'Estimated quantity'
	And the user validates that the customer 'EC10045' under product '<PROD3>' has value '<QTYCALC2_2>' for 'Estimated quantity'
	And the user validates that the customer '<FAMILY_CUSTS3>' under product '<PROD3>' has value '<QTYCALC2_3>' for 'Estimated quantity'
	And the user validates that the customer '<FAMILY_CUSTS4>' under product '<PROD3>' has value '<QTYCALC2_4>' for 'Estimated quantity'
	#19 Check the product grid At product row level, measure values are the same shown in the Direct Customers tab.
	And values for product grid and direct customers tab are the same
	#20 Close promo w/o saving
	When the user closes all pages without saving the work done
	#21 Create another promo choosing an holder not configured in T044INDIRECT_CUSTOMER (i.e. EC86162)
	And the user creates a Promo 'Level 5' 'EC86162'
	And the user clicks on the 'Save Button'
	And the user populates the cockpit 'direct Customer Promo 3' 'd+1/m/y' 'd+15/m/y' '<DATE>' '<DATE>' 'Trade Price Reduction (%)'
	And the user adds a product 'Product' '<PROD1>'
	And the user adds a product 'Product' '<PROD2>'
	And the user enters '<QTYEST3>' on column name 'Estimated quantity' for product code '<PROD1>'
	And the user enters '<QTYEST3>' on column name 'Estimated quantity' for product code '<PROD2>'
	#22 Go to Direct customers tab. Each product has 1 rows: direct customer = customer holder. @WEIGHT = 1
	And the user clicks on 'Top Tab' with value 'Direct Customers'
	Then the user validates that product '<PROD1>' has '1' customers
	And the user validates that the customer 'EC86162' under product '<PROD1>' has value '1.00' for 'Weight'
	And the user validates that the customer 'EC86162' under product '<PROD2>' has value '1.00' for 'Weight'
	#23 Close promo w/o saving
	When the user closes all pages without saving the work done
	#24 Create a new promo with customer holder equal to EC86164
	And the user creates a Promo 'Level 4' 'EC86164'
	And the user populates the cockpit 'Indirect Customer Promo 3' 'd+1/m/y' 'd+15/m/y' '<DATE>' '<DATE>' 'Trade Price Reduction (%)'
	And the user adds a product 'Display' '<DISPLAY>'
	And the user enters '<QTYESTDISPLAY>' on column name 'Display estimated quantity' for product code 'D001 - DISPLAY COCKTAIL'
	Then the user validates that the 'Text Containing' with value '<PRODS4_1>' is present
	And the user validates that the 'Text Containing' with value '<PRODS4_2>' is present
	And the user validates that the 'Text Containing' with value '<PRODS4_3>' is present
	And the user validates text contains '150' on column name 'Estimated quantity' for product code '<PRODS4_1>'
	And the user validates text contains '150' on column name 'Estimated quantity' for product code '<PRODS4_2>'
	And the user validates text contains '150' on column name 'Estimated quantity' for product code '<PRODS4_3>'
	#25 Add also product 054 @DESCPROD4 (which is part of display) with @QTYEST4 = 620.
	When the user adds a product 'Product' '<DESCPROD4>'
	And the user enters '<QTYEST4>' on column name 'Estimated quantity' for product code '<DESCPROD4>'
	#26 Go to Direct customers tab. @DCUST_4
	And the user clicks on 'Top Tab' with value 'Direct Customers'
	#2 different rows are shown for the 054 product.
	Then the user validates product '<PRODS4_1>' with 'Estimated quantity' of '150.00' has '2' customers
	#The row related to the stand-alone 054 is connected only to EC86160 (as direct customer) having ALLOCATION_WEIGHT equal to 1.
	And the user validates product '<PRODS4_1>' with 'Estimated quantity' of '<QTYCALC4_3>' has '1' customers
	And the user validates product '<PRODS4_1>' with 'Estimated quantity' of '<QTYCALC4_3>' has '1' customers
	#All Display components are connected also to EC86312 direct customer.
	And the user validates the customer '<DCUST_4>' under product '<PRODS4_1>' with 'Estimated quantity' of '150.00' is present
	And the user validates that the customer '<DCUST_4>' under product '<PRODS4_2>' is present
	And the user validates that the customer '<DCUST_4>' under product '<PRODS4_3>' is present
	#Qty estimated for each row is calculated as: QTYEST (at product level) * ALLOCATION_WEIGHT
	And the user validates the customer '<DCUST_4_1>' under product '<PRODS4_1>' with 'Estimated quantity' of '150.00' has value '97.50' for 'Estimated quantity'
	And the user validates the customer '<DCUST_4>' under product '<PRODS4_1>' with 'Estimated quantity' of '150.00' has value '52.50' for 'Estimated quantity'
	And the user validates that the customer '<DCUST_4_1>' under product '<PRODS4_2>' has value '97.50' for 'Estimated quantity'
	And the user validates that the customer '<DCUST_4>' under product '<PRODS4_2>' has value '52.50' for 'Estimated quantity'
	And the user validates that the customer '<DCUST_4_1>' under product '<PRODS4_3>' has value '97.50' for 'Estimated quantity'
	And the user validates that the customer '<DCUST_4>' under product '<PRODS4_3>' has value '52.50' for 'Estimated quantity'
	#Save and close the promo
	And the user closes all pages without saving the work done

	Examples:
		| CUSTOMER1  | DATE | PROD1 | PROD2 | QTYEST1 | QTYEST1_2 | DISCPERC | DCUST_1 | DCUST_2 | DCUST_3 | DCUST_4 | QTYCALC1 | QTYCALC2 | QTYCALC3 | QTYCALC4 | CHILD_OF_CUST | FAMILY | QTYEST2 | FAMILY_CUSTS2 | FAMILY_CUSTS3 | FAMILY_CUSTS4 | QTYCALC2_1 | QTYCALC2_2 | QTYCALC2_3 | QTYCALC2_4 | QTYEST3 | WEIGHT | DISPLAY | QTYESTDISPLAY | PRODS4_1 | PRODS4_2 | PRODS4_3 | QTYCALC4_1 | QTYCALC4_2 | QTYCALC4_3 | DESCPROD4 | QTYEST4 | DCUST_4_1 | DCUST_4_2 | PROD3 |
		| EC86178    |      | 001   | 002   | 100     | 200       | 10       | EC86263 | EC86264 | EC86264 | EC86312 | 70.00    | 30.00    | 80.00    | 120.00   | EC86176       | 02     | 1000    | EC10045       | EC9985        | EC9975        | 2.40       | 3.60       | 4.80       | 1.20       | 50      | 1      | D001    | 15            | 054      | 065      | 070      | 97.50      | 52.50      | 620.00     | 054       | 620     | EC86160   | EC86312   | 022   |