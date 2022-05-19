Feature: TestCase_291932

@BDD_291932 @PROMO_Regression @FundsAndRules @PROMO_Smoke
Scenario:  TPM_SP_W_SMOKE_R80V1_0008 - Fund linked to a Confirmed Promo
	#precondition
	#1 Create promo from the navigator @DIVISION

	#2 Select level 3 customer @coverage @customer @confLevel
	When the user navigates to the 'Promotional actions' page
	And the user creates a Promo with customerHLevel: '<coverage>' customerCode: '<customer>'


	#3 Set sell in date from 15 to 20 of the next month starting from the current month (SYSDATE)
	#4 Add a @description
	#5 set @mechanics (TPR, Leaflet, Instore Support 1000)
	And the user populates the cockpit with description: '<description>' sellInStart: 'd/m/y' sellInEnd: 'd+15/m+1/y' sellOutStart: '' sellOutEnd: '' mechanics: '<mechanics>,<mechanics1>,<mechanics2>'

	#6 Header Info: change Participant level to 0 @partLevel
	And the user clicks on side panel 'General info'
	And the user clicks on top panel 'Header info'
	And the user select value '<partLevel>' from dropdown list 'Participants level'

	#7 Add 5 @products and change the following overall measures:
#Estimated quantity 1000, cut price 10, leaflet 100, sellout prize 1 @product
	When the user clicks on side panel 'Products'
	And the user adds a product with productLevel: 'Product' productCodes: '<products1>,<products2>,<products3>,<products4>,<products5>'
	And the user enters '<Estimated_Quantity>' on column name 'Estimated quantity' for product code 'ALL - Selected'
	And the user enters '<CUTPRICEVALUE>' on column name '% Cut Price' for product code 'ALL - Selected'
	And the user enters '<Leaflet>' on column name 'Leaflet' for product code 'ALL - Selected'
	And the user enters '<SellOut_Prize>' on column name 'Sell-out promo price (PZ)' for product code 'ALL - Selected'

	#8	save the promo
	And the user clicks on the 'Save Button'

	#9	Open promo, go to funds tab and check the @fund displayed
	And the user clicks on top panel 'Funds'
	And the user clicks on 'Grid CheckBox Containing' with value '<fund>'
	And the user retrieves text from table with unique column 'Remaining balance' column 'Remaining balance' with row text '<fund>' and saves it as 'Balance'

	#10	Change the state to confirmed (first in "In Authorization" then "Confirmed") @status
	And the user changes the status to '<status1>'
	And the user changes the status to '<status>'

	#11	Return to the funds tab and check details
	And the user clicks on side panel 'Products'
	And the user clicks on top panel 'Products'
	And the user clicks on the 'Product Grid Select Measures'
	And the user clicks on 'List' with value 'All'
	And the user retrieves value on column name 'Total Sales Cost' for product code 'ALL - Selected' and saves it as 'TotalSalesCost'
	And the user clicks on top panel 'Funds'
	#Committed Balance = total sales cost
	Then the user validates that from table with unique column 'Committed Balance' column 'Committed Balance' has 'TotalSalesCost' with row text '<fund>'
	#uncommitted balance = 0
	And the user validates that from table with unique column 'Uncommitted Balance' column 'Uncommitted Balance' has '0.00' with row text '<fund>'
	#remaining balance = balance - total sales cost
	When the user retrieves text from table with unique column 'Remaining balance' column 'Remaining balance' with row text '<fund>' and saves it as 'RemainingBalance'
	Then user validates that 'RemainingBalance' is a result of value 1: 'Balance' operator: 'minus' value 2: 'TotalSalesCost'

	Examples:
		| DIVISION | coverage | customer | confLevel    | description               | mechanics | mechanics1 | mechanics2      | partLevel | products1 | products2 | products3 | products4 | products5 | product                        | fund                      | status  | status1          | CUTPRICEVALUE | Estimated_Quantity | Leaflet | SellOut_Prize |
		| AUTOM2   | Level 3  | EC86221  | Holder level | TPM_SP_W_SMOKE_R80V1_0008 | TPR in %  | Leaflet    | Instore support | Level 0   | 004       | 007       | 009       | 010       | 023       | 004 - BACCO CHARDONNAY 0.75 lt | 871(1)-Automation Fund 01 | Confirm | To be authorized | 10            | 1000               | 100     | 10            |