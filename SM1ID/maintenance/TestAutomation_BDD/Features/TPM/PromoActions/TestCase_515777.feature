Feature: TestCase_515777

@BDD_515777 @PROMO_Regression @PromoActions @PromoActions
Scenario: WEB_TPM_SP_PRODUCTGRID_GENERALCHECKS_004
	#Step 1 Login to the app and go to Promo actions navigator
	Given the user navigates to the 'Promotional actions' page

	#Step 2 Create a new Promo
	When the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUSTOMER>'
	And the user populates the cockpit with description: '' sellInStart: '<SELL_IN_START_DATE>' sellInEnd: '<SELL_IN_END_DATE>' sellOutStart: '' sellOutEnd: '' mechanics: '<MECH>'

	#Step 3 Go to the Product Grid
	And the user clicks on side panel 'Products'

	#Step 4 Open Product Selector, select @AGGR_PRODUCT_LEVEL_1, select the @PRODUCT_1, @PRODUCT_2
	And the user adds a product with productLevel: '<AGGR_PRODUCT_LEVEL_1>' productCodes: '<PRODUCT_1>,<PRODUCT_2>'
	
	#Step 5 Open Product Selector, select @AGGR_PRODUCT_LEVEL_2, select the @FAMILY
	When the user adds a product with productLevel: '<AGGR_PRODUCT_LEVEL_2>' productCodes: '<REFERENCE_1>'

	#Step 6 Select "ALL"
	And the user checks the 'Grid CheckBox' with value 'ALL - Selected'

	#@PRODUCT_1, @PRODUCT_2 and the products of the @REFERENCE_1 are selected and not the Aggregation row of the @REFERENCE_1
	Then the user validates that 'Grid CheckBox' with value '<AGGR_PRODUCT_LEVEL_1>' is marked as: 'checked'
	And the user validates that 'Grid CheckBox' with value '<AGGR_PRODUCT_LEVEL_2>' is marked as: 'not checked'


    #Step 7 Open Product Selector, select @AGGR_PRODUCT_LEVEL_3  select the @FAMILY_1
	When the user adds a product with productLevel: '<AGGR_PRODUCT_LEVEL_3>' productCodes: '<FAMILY_1>'

	# User validates @PRODUCT_1, @PRODUCT_2 and the products of the @REFERENCE_1 are deselected. @FAMILY_1 has the Aggregation row selected
	Then the user validates that 'Grid CheckBox' with value '<AGGR_PRODUCT_LEVEL_1>' is marked as: ' not checked'
	And the user validates that 'Grid CheckBox' with value '<AGGR_PRODUCT_LEVEL_2>' is marked as: ' not checked'
	And the user validates that 'Grid CheckBox' with value '<AGGR_PRODUCT_LEVEL_3>' is marked as: 'checked'

	#Step 8 Close the promo w/o saving
	When the user closes all pages without saving the work done

Examples:
	| CUSTLEV | CUSTOMER | CONFLEV      | COVERAGE | SELL_IN_START_DATE | SELL_IN_END_DATE | MECH          | AGGR_PRODUCT_LEVEL_1 | PRODUCT_1 | PRODUCT_2 | AGGR_PRODUCT_LEVEL_2 | REFERENCE_1 | AGGR_PRODUCT_LEVEL_3 | FAMILY_1 |
	| Level 5 | EC86162  | Holder level | Level 5  | d+1/m/y            | d+15/m/y         | TPR in Rate " | Product              | 001       | 002       | Reference            | 00401       | Family               | 09       |

