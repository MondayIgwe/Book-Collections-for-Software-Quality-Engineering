Feature: TestCase_428189

@BDD_428189 @PROMO_Nightly @PromoActions @PromoActionsNightly
Scenario: WEB_TPM_SP_PRODUCTGRID_MEASUREVALUES_EDIT_002
	#Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#Step 2 Click on "New" to create a new promotion:
	When the user creates a Promo with customerHLevel: '<HOLDERLEVEL>' customerCode: '<HOLDER>'
	And the user populates the cockpit with description: '<HOLDERDESCR>' sellInStart: '<SELLINSTARTDATE>' sellInEnd: '<SELLINENDDATE>' sellOutStart: '<SELLOUTSTARTDATE>' sellOutEnd: '<SELLOUTENDDATE>' mechanics: '<MECH>'

	#From the "Products"."Products" tab, In the Agrregation Rule combo field, Set "Aggregation Rule" = RULE @ALLOCATION_TYPE="Allocation: rule"
	And the user clicks on side panel 'Products'
	#In the Product Grid, Add the following reference rows @PRODS: 01201 - CHIANTI 0.75 lt 01202 - CHIANTI 1.5 lt
	And the user adds a product with productLevel: '<PRODUCTLEVEL>' productCodes: '<PRODREF1>'
	And the user adds a product with productLevel: '<PRODUCTLEVEL>' productCodes: '<PRODREF2>'

	#In the "ALL_Selected" row, Set DISC_PERC (% Cut Price) = 10
	And the user unchecks all columns on the product table
	And the user clicks on 'Product Grid CheckBox' with value 'ALL - Selected'
	And the user enters '10' on column name '% Cut Price' for product code 'ALL - Selected'
	Then the user validates text '10.00' on column name '% Cut Price' for product code '<PROD1>'
	And the user validates text '10.00' on column name '% Cut Price' for product code '<PROD2>'
	And the user validates text '10.00' on column name '% Cut Price' for product code '<PROD3>'
	#6 In the aggregated row related to 01201 - CHIANTI 0.75 lt, Set DISC_PERC = 20
	When the user enters '20' on column name '% Cut Price' for product code '<PRODREF1>'
	Then the user validates text '20.00' on column name '% Cut Price' for product code '<PROD1>'
	And the user validates text '20.00' on column name '% Cut Price' for product code '<PROD2>'
	#In the Agrregation Rule combo field, @ALLOCATION_TYPE1="Allocation: copy" Set "Aggregation Rule" = COPY 
	When the user clicks on the 'Product Grid Allocation DropDown'
	And the user clicks on 'List' with value '<ALLOCATION_TYPE1>'
	#Select the following aggregated rows: 01201 - CHIANTI 0.75 lt 01202 - CHIANTI 1.5 lt 
	And the user unchecks all columns on the product table
	And the user clicks on 'Product Grid CheckBox' with value '<PRODREF1>'
	And the user clicks on 'Product Grid CheckBox' with value '<PRODREF2>'
	#In the "ALL_Selected" row, Set DISC_PERC = 30
	And the user enters '30' on column name '% Cut Price' for product code 'ALL - Selected'
	Then the user validates text '30.00' on column name '% Cut Price' for product code '<PROD1>'
	And the user validates text '30.00' on column name '% Cut Price' for product code '<PROD2>'
	And the user validates text '30.00' on column name '% Cut Price' for product code '<PROD3>'
	#Set DISC_PERC [01201 - CHIANTI 0.75 lt - 030] = 40 directly in a Cell
	When the user enters '40' on column name '% Cut Price' for product code '<PROD1>'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Alert Dialog No Button'
	And the user clicks on the 'Close Tab'

Examples:
	| DIVISION                                 | HOLDER  | HOLDERDESCR      | HOLDERLEVEL | COVERAGE | CONFIRMATIONLEVEL | WFSTATUS | SELLINSTARTDATE | SELLINENDDATE | SELLOUTSTARTDATE | SELLOUTENDDATE | MECH             | PRODUCTLEVEL | ALLOCATION_TYPE  | PRODUCTSLEVEL1 | PRODREF1 | PRODREF2 | ALLOCATION_TYPE1 | PROD1 | PROD2 | PROD3 |
	| XTEL TPM AUTOMATION - Global Group SM1V4 | EC86184 | AUCHAN_EC86184_2 | Level 3     | Level 3  | Holder level      | Draft    | d+10/m/y        | d+20/m/y      | d+10/m/y         | d+20/m/y       | TPR in %,Leaflet | Reference    | Allocation: rule | Reference      | 01201    | 01202    | Allocation: copy | 030   | 031   | 032   |