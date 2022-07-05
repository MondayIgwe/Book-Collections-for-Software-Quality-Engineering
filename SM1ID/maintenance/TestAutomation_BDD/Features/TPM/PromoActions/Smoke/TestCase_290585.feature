Feature: TestCase_290585

@BDD_290585 @PROMO_Regression @PromoActions @PROMO_Smoke @TestPipeline
Scenario: TPM_SP_W_SMOKE_R80V1_0001 - Promo Creation
	#1 PRECONDITION
	Given the user navigates to the 'Funds & Rules' page
	When the user creates a new fund and rules with configuration ID: '<configuration>' BRCustomerLevel: '<custLevel>' Description: '<description>' sellInStart: '15/m+1/y' sellInEnd: '20/m+1/y' productGroup: '' rateFundSource: ''
	And the user clicks on side panel 'Constraints'
	And user adds a ConstraintField: 'Fund value' constraint with value ConstraintValue: '<constraint>' startDate: '' endDate: '' familyConstraints: ''
	And the user clicks on side panel 'Summary'
	And the user changes the status to 'Confirm'
	#2-6 Create promo from the navigator
	And the user navigates to the 'Promotional actions' page
	When the user creates a Promo with customerHLevel: '<custLevel>' customerCode: '<customer>'
	And the user populates the cockpit with description: '<description>' sellInStart: '15/m+1/y' sellInEnd: '20/m+1/y' sellOutStart: '' sellOutEnd: '' mechanics: '<mechanics>,<mechanics2>,<mechanics3>'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user clicks on the 'Save Button'
	#7 Header Info: change Participant level to 0 @partLevel
	And the user clicks on side panel 'General info'
	And the user clicks on top panel 'Header info'
	And the user select value '<partLevel>' from dropdown list 'Participants level'
	#Add 5 @products and change the following overall measures:
	And the user adds a product with productLevel: '<prodLevel>' productCodes: '<products1>'
	And the user adds a product with productLevel: '<prodLevel>' productCodes: '<products2>'
	And the user adds a product with productLevel: '<prodLevel>' productCodes: '<products3>'
	And the user adds a product with productLevel: '<prodLevel>' productCodes: '<products4>'
	And the user adds a product with productLevel: '<prodLevel>' productCodes: '<products5>'
	And the user enters '<estQty>' on column name 'Estimated quantity' for product code '<products1>'
	And the user enters '<estQty>' on column name 'Estimated quantity' for product code '<products2>'
	And the user enters '<estQty>' on column name 'Estimated quantity' for product code '<products3>'
	And the user enters '<estQty>' on column name 'Estimated quantity' for product code '<products4>'
	And the user enters '<estQty>' on column name 'Estimated quantity' for product code '<products5>'
	And the user enters '<cutPrice>' on column name '% Cut Price' for product code '<products1>'
	And the user enters '<cutPrice>' on column name '% Cut Price' for product code '<products2>'
	And the user enters '<cutPrice>' on column name '% Cut Price' for product code '<products3>'
	And the user enters '<cutPrice>' on column name '% Cut Price' for product code '<products4>'
	And the user enters '<cutPrice>' on column name '% Cut Price' for product code '<products5>'
	And the user enters '<leaflet>' on column name 'Leaflet' for product code '<products1>'
	And the user enters '<leaflet>' on column name 'Leaflet' for product code '<products2>'
	And the user enters '<leaflet>' on column name 'Leaflet' for product code '<products3>'
	And the user enters '<leaflet>' on column name 'Leaflet' for product code '<products4>'
	And the user enters '<leaflet>' on column name 'Leaflet' for product code '<products5>'
	And the user enters '<sellout>' on column name 'Sell-out promo price (PZ)' for product code '<products1>'
	And the user enters '<sellout>' on column name 'Sell-out promo price (PZ)' for product code '<products2>'
	And the user enters '<sellout>' on column name 'Sell-out promo price (PZ)' for product code '<products3>'
	And the user enters '<sellout>' on column name 'Sell-out promo price (PZ)' for product code '<products4>'
	And the user enters '<sellout>' on column name 'Sell-out promo price (PZ)' for product code '<products5>'
	#9 Select all the measures from the combo in the toolbar
	And the user clicks on the 'Product Grid Select Measures'
	And the user clicks on 'List' with value 'All'
	#Verify Price List is not 0.00
	When the user retrieves text on column name 'Price List' for product code '<products1>' and saves it as 'priceList1'
	And the user retrieves text on column name 'Price List' for product code '<products2>' and saves it as 'priceList2'
	And the user retrieves text on column name 'Price List' for product code '<products3>' and saves it as 'priceList3'
	And the user retrieves text on column name 'Price List' for product code '<products4>' and saves it as 'priceList4'
	And the user retrieves text on column name 'Price List' for product code '<products5>' and saves it as 'priceList5'
	Then the user validates that the value 'priceList1' is not equal to '0.00'
	And the user validates that the value 'priceList2' is not equal to '0.00'
	And the user validates that the value 'priceList3' is not equal to '0.00'
	And the user validates that the value 'priceList4' is not equal to '0.00'
	And the user validates that the value 'priceList5' is not equal to '0.00'
	#Verify gross sale rev = price list * est. quantity
	When the user retrieves text on column name 'Gross Sales Revenue' for product code '<products1>' and saves it as 'salesRevenue1'
	And the user retrieves text on column name 'Gross Sales Revenue' for product code '<products2>' and saves it as 'salesRevenue2'
	And the user retrieves text on column name 'Gross Sales Revenue' for product code '<products3>' and saves it as 'salesRevenue3'
	And the user retrieves text on column name 'Gross Sales Revenue' for product code '<products4>' and saves it as 'salesRevenue4'
	And the user retrieves text on column name 'Gross Sales Revenue' for product code '<products5>' and saves it as 'salesRevenue5'
	Then user validates that 'salesRevenue1' is a result of value 1: 'priceList1' operator: 'multiply' value 2: '1000'
	And user validates that 'salesRevenue2' is a result of value 1: 'priceList2' operator: 'multiply' value 2: '1000'
	And user validates that 'salesRevenue3' is a result of value 1: 'priceList3' operator: 'multiply' value 2: '1000'
	And user validates that 'salesRevenue4' is a result of value 1: 'priceList4' operator: 'multiply' value 2: '1000'
	And user validates that 'salesRevenue5' is a result of value 1: 'priceList5' operator: 'multiply' value 2: '1000'

	#10 Open fund tab and check the @fund displayed, then refresh the grid
	When the user unchecks all columns on the product table
	And the user retrieves text on column name 'Total Sales Cost' for product code 'ALL - Selected' and saves it as 'TotalSalesCost'
	And the user clicks on top panel 'Funds'
	#Uncommitted balance = total sales cost
	Then the user validates that from table with unique column 'Remaining balance' column 'Uncommitted Balance' has 'TotalSalesCost' with row text 'Automation Fund 01'
	#11 Save the promo
	When the user clicks on the 'Save Button'
	#12 Close the promo and refresh the navigator
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Refresh Button'
	Then the user validates that the 'Text In Table Cell' with value 'ActionId1' is present

Examples:
	| configuration   | days1 | days2 | description | custLevel | constraint | status  | customer | mechanics | mechanics2 | mechanics3      | instoreSupport | partLevel | products1 | products2 | products3 | products4 | products5 | estQty | cutPrice | leaflet | sellout | product                        | prodLevel | fund                      |
	| Automation Fund | 15    | 20    | 290585      | Level 3   | 1000       | CONFIRM | EC86221  | TPR in %  | Leaflet    | Instore support | 1000           | Level 0   | 004       | 007       | 009       | 010       | 023       | 1000   | 10       | 100     | 10      | 004 - BACCO CHARDONNAY 0.75 lt | Product   | 871(1)-Automation Fund 01 |
