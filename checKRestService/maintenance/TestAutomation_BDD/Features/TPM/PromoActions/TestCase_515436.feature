Feature: TestCase_515436

@BDD_515436 @PROMO_Regression @PromoActions @PromoActions
Scenario: WEB_TPM_SP_PRODUCTGRID_GENERALCHECKS_002
	#Step 1 Login to the app and go to Promo actions navigator
	Given the user navigates to the 'Promotional actions' page

	#Step 2 Create a new Promo
	When the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUSTOMER>'

	#Step 3 - 4 Set Sell-in/out (in the future)	 & Set @MECH as Mechanics
	And the user populates the cockpit with description: '' sellInStart: '<SELL_IN_START_DATE>' sellInEnd: '<SELL_IN_END_DATE>' sellOutStart: '' sellOutEnd: '' mechanics: '<MECH>'

	#Step 5 Go to the Product Grid
	And the user clicks on side panel 'Products'

	#Step 6 Open Product Selector, select @AGGR_PRODUCT_LEVEL_1, select the @PRODUCT
	And the user adds a product with productLevel: '<AGGR_PRODUCT_LEVEL_1>' productCodes: '<PRODUCT>'
	Then the user validates that the 'Grid CheckBox' with value '001 - BACCO ALBANA 0,75 lt' is present

	#Step 7 Open Product Selector, select @AGGR_PRODUCT_LEVEL_2, select the @FAMILY
	When the user adds a product with productLevel: '<AGGR_PRODUCT_LEVEL_2>' productCodes: '<FAMILY>'
	Then the user validates that the 'Checked Grid CheckBox Containing' with value '<FAMILY>' is not present
	And the user validates that the 'Text in Grid Containing' with value '<MESSAGE>' is present
	
	#Step 8 Close the promo w/o saving
	When the user closes all pages without saving the work done

Examples:
	| CUSTLEV | CUSTOMER | CONFLEV      | COVERAGE | SELL_IN_START_DATE | SELL_IN_END_DATE | MECH          | AGGR_PRODUCT_LEVEL_1 | PRODUCT | AGGR_PRODUCT_LEVEL_2 | FAMILY | MESSAGE                                                                                    |
	| Level 5 | EC86162  | Holder level | Level 5  | d+1/m/y            | d+15/m/y         | TPR in Rate " | Product              | 001     | Family               | 01     | The following products were not added because they are already present: 01 - ITALIAN WHITE |

