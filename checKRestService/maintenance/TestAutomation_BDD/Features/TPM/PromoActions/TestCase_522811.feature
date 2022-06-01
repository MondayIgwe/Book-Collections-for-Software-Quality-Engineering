Feature: TestCase_522811

@BDD_522811 @PROMO_Nightly @PromoActions @PromoActionsNightly
Scenario: WEB_TPM_SP_PRODUCTGRID_QTYESTIMATED_CALCULATION_SKU_AND_DISPLAYS_001
	#Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#Step 2 Click on "New" to create a new promotion:
	When the user creates a Promo with customerHLevel: '<CUSTLEVEL>' customerCode: '<Customer_Holder_P1>'
	And the user populates the cockpit with description: '<Description_P1>' sellInStart: '<SELL_IN_START_P1>' sellInEnd: '<SELL_IN_END_P1>' sellOutStart: '<SELL_OUT_START_P1>' sellOutEnd: '<SELL_OUT_END_P1>' mechanics: '<Mechanic_P1>'
	
	#3 From Products tab add a @Display product @DisplayProd , @DisplayProd_Descr
	And the user adds a product with productLevel: '<Display>' productCodes: '<DisplayProd>'
	#4 From Products tab add 2 SKU's @Product @SKUProd1 @SKUProd2 
	And the user adds a product with productLevel: '<Product>' productCodes: '<SKUProd1>'
	And the user adds a product with productLevel: '<Product>' productCodes: '<SKUProd2>'
	#Select the 2 SKU's @SKUProd1 and @SKUProd2 and in the "All - Select" line add a value @Total to the "Estimated Quantity" field ... @SKUProd1_descr @SKUProd2_descr.
	And the user clicks on 'Product Grid CheckBox' with value '<SKUProd1> - <SKUProd1_descr>'
	And the user enters '<Total>' on column name 'Estimated quantity' for product code 'ALL - Selected'
	And the user clicks on 'Button' with value 'Edit'
	Then the user validates text '<Estimated_quantity_per_product>' on column name 'Estimated quantity' for product code '<SKUProd1>'
	And the user validates text '<Estimated_quantity_per_product>' on column name 'Estimated quantity' for product code '<SKUProd2>'
	When the user clicks on the 'Close Tab'
	And the user clicks on the 'Alert Dialog No Button'
	And the user clicks on the 'Close Tab'

	Examples:
		| DIVISION                                 | Customer_Holder_P1 | CUSTLEVEL | SELL_IN_START_P1 | SELL_IN_END_P1 | SELL_OUT_START_P1 | SELL_OUT_END_P1 | Description_P1     | Mechanic_P1 | Display | DisplayProd | DisplayProd_Descr | Product | SKUProd1 | SKUProd2 | Total | Estimated_quantity_per_product | SKUProd1_descr | SKUProd2_descr |
		| XTEL TPM AUTOMATION - Global Group SM1V4 | EC94723            | Level 2   | d+10/m/y         | d+20/m/y       | d+10/m/y          | d+20/m/y        | SKUsumWithDisplays | Coupon      | Display | D002        | DISPLAY WINE 1.5  | Product | 022      | 024      | 100   | 50                             |BACCO BARBERA 0.75 lt | BACCO BARDOLINO 0.75 lt |