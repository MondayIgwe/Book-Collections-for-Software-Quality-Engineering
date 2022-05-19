Feature: TestCase_345334

@BDD_345334 @PROMO_Regression @PromoActions @PROMO_Smoke
Scenario: TPM_SP_W_SMOKE_R80V1_0015 - Promo and Retailer P&L - Refresh feature on Promo Creation
	#1-3
	Given the user navigates to the 'Promotional actions' page
	When the user creates a Promo with customerHLevel: '<COVERAGE>' customerCode: '<HOLDER>'
	#5-7
	And the user populates the cockpit with description: '<PROMODESCRIPTION>' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: '<MECHANIC>'
	#8 Add the following Products: 004, 006 (@PRODUCT_LEVEL, @PROD1CODE, @PROD1NAME, @PROD2CODE, @PROD2NAME)
	And the user adds products with productLevel: '<PRODUCT_LEVEL>' productCodes: '<PROD1CODE>'
	And the user adds products with productLevel: '<PRODUCT_LEVEL>' productCodes: '<PROD2CODE>'
	#9 Set the following values for LC_COST measure: 004 - LC_COST  = 40 (@LC_COST_PROD1) 006 - LC_COST  = 60 (@LC_COST_PROD2)
	And the user enters '<LC_COST_PROD1>' on column name 'Loyalty Card' for product code '<PROD1CODE>'
	And the user enters '<LC_COST_PROD2>' on column name 'Loyalty Card' for product code '<PROD2CODE>'
	#In the "Profit & Loss"."Profit & Loss" tab,  The P&L is not updated (Only the voices colum "P&L Elements" is shown, the "Action/Current" column is not shown).
	And the user clicks on side panel 'Profit & Loss'
	And the user clicks on top panel 'Profit & Loss'
	Then the user validates that the count for 'Prodit And Loss All Columns' with value 'Total Promo Rebate' is '2'
	#The "Refresh button is enabled".
	And the user validates the 'Profit And Loss Refresh Button' is enabled
	#In the "Profit & Loss"."Profit & Loss Retailer" tab,  The P&L is not updated (Only the voices colum "P&L Elements" is shown, the "Action/Current" column is not shown).
	When the user clicks on top panel 'Profit & Loss Retailer'
	Then the user validates that the count for 'Prodit And Loss All Columns' with value 'Retail Sales value' is '2'
	And the user validates the 'Profit And Loss Retailer Refresh Button' is enabled
	#10 From the Product Grid, Remove 006 Product.
	When the user clicks on side panel 'Products'
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
	#n the "Profit & Loss"."Profit & Loss" tab,  The P&L is not updated(Only the voices colum "P&L Elements" is shown, the "Action/Current" column is not shown).
	And the user clicks on side panel 'Profit & Loss'
	And the user clicks on top panel 'Profit & Loss'
	Then the user validates that the count for 'Prodit And Loss All Columns' with value 'Total Promo Rebate' is '2'
	#In the "Profit & Loss"."Profit & Loss Retailer" tab,  The P&L is not updated (Only the voices colum "P&L Elements" is shown, the "Action/Current" column is not shown). 
	When the user clicks on top panel 'Profit & Loss Retailer'
	Then the user validates that the count for 'Prodit And Loss All Columns' with value 'Retail Sales value' is '2'
	#11 In the "Profit & Loss"."Profit & Loss" tab,  Click on "Refresh" button
	When the user clicks on top panel 'Profit & Loss'
	And the user clicks on the 'Profit And Loss Refresh Button'
	#The P&L is updated (Both the Columns  "P&L Elements", "Action/Current" are shown)
	Then the user validates that the count for 'Prodit And Loss All Columns' with value 'Total Promo Rebate' is '3'
	And the user validates that the 'Basic Grid Column' with value 'P&L Elements' is present
	And the user validates that the 'Basic Grid Column' with value 'Promo Total / Current' is present
	#The value of "Total Promo Rebate " = 40
	And the user validates text '<TOTALPROMOREBATE_VALUE>' on column name 'Promo Total/Current' for profit and loss element name '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -40
	And the user validates text '<NETMARGIN_VALUE>' on column name 'Promo Total/Current' for profit and loss element name '<NETMARGIN>' with unique column 'Promo Total / Current'
	#12 In the "Profit & Loss"."Profit & Loss Retailer" tab,  Click on "Refresh" button 
	When the user clicks on top panel 'Profit & Loss Retailer'
	And the user clicks on the 'Profit And Loss Retailer Refresh Button'
	#The P&L is updated (Both the Columns  "P&L Elements", "Action/Current" are shown)
	Then the user validates that the count for 'Prodit And Loss All Columns' with value 'Retail Sales value' is '3'
	#The value of "Gross Cost" = 40 
	And the user validates text '<GROSSCOST_VALUE>' on column name 'Action/Current' for profit and loss element name '<GROSSCOST>' with unique column 'Action / Current'
	#13 Click on Save button 
	When the user clicks on the 'Save Button'
	#14 Close the Promo 
	And the user clicks on the 'Close Tab'


Examples:
	| HOLDER  | CONFIRMATIONLEVEL | COVERAGE | PROMODESCRIPTION  | MECHANIC     | PRODUCT_LEVEL | PROD1CODE | PROD1NAME                      | PROD2CODE | PROD2NAME                     | LC_COST_PROD1 | LC_COST_PROD2 | TOTALPROMOREBATE_VALUE | TOTALPROMOREBATE   | NETMARGIN  | NETMARGIN_VALUE | GROSSCOST  | GROSSCOST_VALUE |
	| EC86174 | Holder level      | Level 3  | P&L Refresh Test1 | Loyalty Card | Product       | 004       | 004 - BACCO CHARDONNAY 0.75 lt | 006       | 006 - BACCO CHARDONNAY 1.5 lt | 40            | 60            | 40.00                  | Total Promo Rebate | Net Margin | -40.00          | Gross Cost | 40.00           |
