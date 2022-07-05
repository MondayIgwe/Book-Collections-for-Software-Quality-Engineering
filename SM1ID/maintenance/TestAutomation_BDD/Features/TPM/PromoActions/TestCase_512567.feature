Feature: TestCase_512567

@BDD_512567 @PROMO_Nightly @PromoActions @PromoActionsNightly
Scenario: WEB_TPM_SP_PRODSELECTOR_PROMOASSORTMENT_MANDATORY_AND_DISPLAY_001
	#2 IF NOT ALREADY EXISTS, Create a new valid Promo Assortment with:
	Given the user navigates to the 'Assortments' page
	When the user creates a new assortment of Type: 'Assortment by hierarchy', Assortment Type: '<ASSOTYPE>', Customer Level: '<CUSTOMERLEV>', Customer: '<CUSTOMER>', Description: '<DESCRIPTION>', Save: 'no'
	And the user clicks on 'Checkbox' with value 'Mandatory'
	And the user adds an assortment product with productCode: '<PRODUCTS>'
	And the user adds an assortment product with productCode: '<PRODUCTS2>'
	And the user adds an assortment product with productCode: '<PRODUCTS3>'
	And the user adds an assortment product with productCode: '<PRODUCTS4>'
	And the user adds an assortment product with productCode: '<PRODUCTS5>'
	And the user adds an assortment product with productCode: '<PRODUCTS6>'
	And the user adds an assortment product with productCode: '<PRODUCTS7>'
	And the user adds an assortment product with productCode: '<DISPLAY>'
	And the user adds an assortment product with productCode: '<DISPLAY2>'
	And the user adds an assortment product with productCode: '<DISPLAY3>'
	And the user adds an assortment product with productCode: '<DISPLAY4>'
	And the user clicks on 'Button' with value 'Save'
	And the user clicks on the 'Close Tab'
	#3 Go to Promo Action nav.
	And the user navigates to the 'Promotional actions' page
	#4 Create a new Promo with:
	When the user creates a Promo with customerHLevel: '<CUSTOMERLEV>' customerCode: '<CUSTOMER>'
	And the user populates the cockpit with description: '<DESCR>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTARTDATE>' sellOutEnd: '<SELLOUTENDDATE>' mechanics: '<MECHANICS>'
	And the user clicks on side panel 'Cockpit'
	#5 Go to Prod Grid
	And the user clicks on side panel 'Products'
	#6 Open Prod Selector
	And the user clicks on the 'Product Add Button'
	#"InAssortment" option is hidden
	Then the user validates that the 'In Assortment Section' is not present
	#Only @PRODUCTS can be selected;
	When the user checks the 'Grid CheckBox' with value '<PRODUCTS>'
	And the user checks the 'Grid CheckBox' with value '<PRODUCTS2>'
	And the user checks the 'Grid CheckBox' with value '<PRODUCTS3>'
	And the user checks the 'Grid CheckBox' with value '<PRODUCTS4>'
	And the user checks the 'Grid CheckBox' with value '<PRODUCTS5>'
	And the user checks the 'Grid CheckBox' with value '<PRODUCTS6>'
	And the user checks the 'Grid CheckBox' with value '<PRODUCTS7>'
	Then the user validates that the count for 'Popup Grid Selected Rows' with value 'Product' is '7'
	#The last 2 cols (InAssortment and Mandatory) are flagged and readonly.
	And the user validates that all popup 'Product' checkboxes for column 'Mandatory' are 'checked'
	And the user validates that all popup 'Product' checkboxes for column 'In Assortment' are 'disabled'
	And the user validates that all popup 'Product' checkboxes for column 'Mandatory' are 'checked'
	And the user validates that all popup 'Product' checkboxes for column 'In Assortment' are 'disabled'
	#7 Select "Display" item in the left menu of the selector
	When the user clicks on 'Product Level' with value 'Display'
	#All @DISPLAY products can be selected
	And the user clicks on 'Grid CheckBox' with value '<DISPLAY>'
	And the user clicks on 'Grid CheckBox' with value '<DISPLAY2>'
	And the user clicks on 'Grid CheckBox' with value '<DISPLAY3>'
	And the user clicks on 'Grid CheckBox' with value '<DISPLAY4>'
	Then the user validates that the count for 'Popup Grid Selected Rows' with value 'Product' is '5'

	Examples:
		| ASSOTYPE  | DESCRIPTION                | CUSTOMER | PRODUCTS | PRODUCTS2 | PRODUCTS3 | PRODUCTS4 | PRODUCTS5 | PRODUCTS6 | PRODUCTS7 | FINALDATE  | FLAG_MANDATORY | MECHANIC | CONFIRMATIONLEV | CUSTOMERLEV | DESCR                             | SELLINSTART | SELLINEND | SELLOUTSTARTDATE | SELLOUTENDDATE | MECHANICS | DISPLAY | DISPLAY2 | DISPLAY3 | DISPLAY4 |
		| Promotion | Test Mandatory Assortment3 | EC86232  | 051      | 052       | 053       | 054       | 055       | 056       | 057       | 01/01/2100 | TRUE           | TPR in % | Holder level    | Level 3     | Promo having mandatory assortment | d+1/m/y     | d+15/m/y  |                  |                | TPR in %  | D001    | D002     | D003     | D004     |