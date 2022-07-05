Feature: TestCase_515567

@BDD_515567 @PROMO_Regression @PromoActions @PromoActions
Scenario: WEB_TPM_SP_PRODUCTGRID_GENERALCHECKS_003
	#Step 1 Login to the app and go to Promo actions navigator
	Given the user navigates to the 'Promotional actions' page

	#Step 2 Create a new Promo
	When the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUSTOMER>'
	And the user populates the cockpit with description: '' sellInStart: '<SELL_IN_START_DATE>' sellInEnd: '<SELL_IN_END_DATE>' sellOutStart: '' sellOutEnd: '' mechanics: '<MECH>'

	#Step 3 Go to the Product Grid
	And the user clicks on side panel 'Products'

	#Step 4 Open Product Selector, select @AGGR_PRODUCT_LEVEL_1, select the @PRODUCT
	And the user adds a product with productLevel: '<AGGR_PRODUCT_LEVEL_1>' productCodes: '<FAMILY_1_1>,<FAMILY_2_1>,<FAMILY_3_1>'

	#Step 5 In the Grid collapse all the 3 Families @TESTVALUES
	And the user checks the 'Grid CheckBox' with value 'ALL - Selected'
	And the user unchecks the 'Grid CheckBox' with value 'ALL - Selected'
	And the user clicks on 'Grid CheckBox Containing' with value '<TESTVALUES>'
	And the user clicks on 'Grid CheckBox Containing' with value '<TESTVALUES1>'
	And the user clicks on 'Grid CheckBox Containing' with value '<TESTVALUES2>'
	And the user clicks on the 'Product Grid Collapse Button'
	Then the user validates that the 'Expended Product Family' with value '<FAMILY_1_2>' is not present
	And the user validates that the 'Expended Product Family' with value '<FAMILY_2_2>' is not present
	And the user validates that the 'Expended Product Family' with value '<FAMILY_3_2>' is not present

	#Step 6 Expand the  @FAMILY_1, @FAMILY_2
	When the user clicks on 'Expander Button' with value '<FAMILY_1_2>'
	And the user scrolls to the 'Expander Button' with value '<FAMILY_2_2>'
	When the user clicks on 'Expander Button' with value '<FAMILY_2_2>'

	#Step 7 Click in the cell of the Aggregation row of the @FAMILY_1 in the @MEASURE
	And the user enters '' on column name 'Estimated quantity' for product code '<FAMILY_1_1>'

	#Step 8 Expand the @FAMILY_3
	And the user scrolls to the 'Expander Button' with value '<FAMILY_3_2>'
	And the user clicks on 'Expander Button' with value '<FAMILY_3_2>'
	Then the user validates that the 'Expended Product Family' with value '<FAMILY_3_2>' is present
	#Step 9 Close the promo w/o saving
	When the user closes all pages without saving the work done

Examples:
	| CUSTLEV | CUSTOMER | CONFLEV      | COVERAGE | SELL_IN_START_DATE | SELL_IN_END_DATE | MECH          | AGGR_PRODUCT_LEVEL_1 | FAMILY_1_1 | FAMILY_1_2         | FAMILY_2_1 | FAMILY_2_2       | FAMILY_3_1 | FAMILY_3_2        | TESTVALUES | TESTVALUES1 | TESTVALUES2 | MEASURE      |
	| Level 5 | EC86162  | Holder level | Level 5  | d+1/m/y            | d+15/m/y         | TPR in Rate " | Family               | 01         | 01 - ITALIAN WHITE | 02         | 02 - ITALIAN RED | 03         | 03 - ITALIAN ROSé | 001        | 022         | 041         | QTYESTIMATED |