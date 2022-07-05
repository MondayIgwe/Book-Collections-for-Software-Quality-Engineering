Feature: TestCase_463820

@BDD_463820 @PROMO_Regression @PromoActions
Scenario: WEB_TPM_SP_PRODUCTGRID_REMOVE_SOME_SKUPRODUCTS_001
	#Step 1 Login to the app and go to Promo actions navigator
	Given the user navigates to the 'Promotional actions' page

	#Step 2	Open in Edit mode the promo having @IDACTION1, @IDACTION1_DESCR	 
	When the user filters the column by column name 'Description', Filter Type 'Like', Value '<IDACTION1_DESCR>'
	And the user clicks on link on column 'Action Code' with row text '<ActionCode>'
	And the user clicks on 'Button' with value 'Edit'

	#Step 3 In the Product Grid, multi-select the following rows: - SKU: @PRODS (002, and 003 (the cancelled one))
	And the user clicks on side panel 'Products'
	Then  the user validates that the 'Grid CheckBox Containing' with value '<PROD1>' is present
	And the user validates that the 'Grid CheckBox Containing' with value '<PROD2>' is present
	When the user clicks on 'Grid CheckBox Containing' with value '<PROD1>'
	And the user clicks on 'Grid CheckBox Containing' with value '<PROD2>'
	#4 In the Product Grid,  Remove them from the grid.
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
	#All selected products are removed from the grid.
	Then the user validates that the 'Grid CheckBox Containing' with value '<PROD1>' is not present
	And the user validates that the 'Grid CheckBox Containing' with value '<PROD2>' is not present
	#5 Close w/o saving
	When the user closes all pages without saving the work done

Examples:
	| IDACTION1                      | IDACTION1_DESCR | PROD1 | PROD2 | ActionCode                     |
	| 000000000CSESCU200622095508304 | PromoDev1Test2  | 002   | 004   | 0000000MARIELPO201112090940123 |