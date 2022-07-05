Feature: TestCase_783174

@BDD_783174 @PROMO_Nightly @noSellOutDate @PromoActions @PromoActionsNightly
Scenario: TPM_SP_W_SMOKE_R80V1_0016_NEW_BEHAVIOR
	#Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#Step 2
	When the user creates a Promo with customerHLevel: '<CUSTLEVEL>' customerCode: '<CUSTOMER>'
	And the user populates the cockpit with description: '<PROMODESC>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<MECHANICS>'
	And the user adds a product with productLevel: '<PRODLEVEL>' productCodes: '<PRODCODE>'

	And the user enters '<LC_COST>' on column name 'Loyalty Card' for product code '<PRODCODE>'
	And the user enters '<QTYESTIMATED>' on column name 'Estimated quantity' for product code '<PRODCODE>'
	And the user clicks on the 'Cockpit Tab'
	When the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#3 Switch it to "Edit" mode
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	#4 In the P&L tabs click "Refresh" button Profit & Loss
	And the user clicks on the 'Profit & Loss Tab'
	And the user clicks on the 'Profit And Loss Refresh Button'
	And the user clicks on the 'Profit & Loss Retailer Top Tab'
	And the user clicks on the 'Profit And Loss Retailer Refresh Button'
	#5 In the Product Grid, Add the following Products: 007, 009 (@PROD2, @PROD3 , @PRODUCT_LEVEL)
	And the user adds a product with productLevel: '<PRODUCT_LEVEL>' productCodes: '<PROD2>'
	And the user adds a product with productLevel: '<PRODUCT_LEVEL>' productCodes: '<PROD3>'
	#6 In the Product Grid,	Set the following values for LC_COST measure: 007 - LC_COST  = 70 (@PROD2_LCCOST) 009 - LC_COST  = 90  (@PROD3_LCCOST)
	And the user enters '<PROD2_LCCOST>' on column name 'Loyalty Card' for product code '<PROD2>'
	And the user enters '<PROD3_LCCOST>' on column name 'Loyalty Card' for product code '<PROD3>'
	#In the "Profit & Loss"."Profit & Loss" tab, P&L is not updated:
	And the user clicks on the 'Profit & Loss Tab'
	And the user clicks on the 'Profit & Loss Top Tab'
	#The value of "Total Promo Rebate " = 40 (@TOTALPROMOREBATE, @TOTALPROMOREBATE_VALUES)
	Then the user validates text '<TOTALPROMOREBATE_VALUES>' on column name 'Promo Total/Current' for profit and loss element name '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -40 (@NETMARGIN, @NETMARGIN_VALUES)
	And the user validates text '<NETMARGIN_VALUES>' on column name 'Promo Total/Current' for profit and loss element name '<NETMARGIN>' with unique column 'Promo Total / Current'
	#In the "Profit & Loss"."Profit & Loss Retailer"" tab, P&L is not updated: The value of "Gross Cost" = 40 (@GROSSCOST, @GROSSCOST_VALUES) 
	When the user clicks on the 'Profit & Loss Retailer Top Tab'
	Then the user validates text '<GROSSCOST_VALUES>' on column name 'Action/Current' for profit and loss element name '<GROSSCOST>' with unique column 'Action / Current'
	#7 From the Product Grid, Remove 009 Product.
	When the user clicks on the 'Products Tab'
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
	#The value of "Total Promo Rebate " = 40 
	And the user clicks on the 'Profit & Loss Tab'
	And the user clicks on the 'Profit & Loss Top Tab'
	Then the user validates text '<TOTALPROMOREBATE_VALUES>' on column name 'Action/Current' for profit and loss element name '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -40 
	And the user validates text '<NETMARGIN_VALUES>' on column name 'Promo Total/Current' for profit and loss element name '<NETMARGIN>' with unique column 'Promo Total / Current'
	#The value of "Gross Cost" = 40 
	When the user clicks on the 'Profit & Loss Retailer Top Tab'
	Then the user validates text '<GROSSCOST_VALUES>' on column name 'Action/Current' for profit and loss element name '<GROSSCOST>' with unique column 'Action / Current'
	#8 Click on "Refresh" button 
	When the user clicks on the 'Profit & Loss Top Tab'
	And the user clicks on the 'Profit And Loss Refresh Button'
	#The value of "Total Promo Rebate " = 110
	Then the user validates text '110.00' on column name 'Promo Total/Current' for profit and loss element name '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -110
	And the user validates text '-110.00' on column name 'Promo Total/Current' for profit and loss element name '<NETMARGIN>' with unique column 'Promo Total / Current'
	#9. Open "Detail Type" combo and flag also the "Products" checkbox.
	When the user clicks on the 'Profit And Loss Detail Type Trigger Icon'
	And the user clicks on 'Selection Popup Checkbox' with value '<PRODUCTS>'
	And the user clicks on the 'OK Button'
	#open "Detail Data" combo and flag all checkboxes.
	And user selects all products on Detail Data for 'Profit & Loss' tab and column 'Promo Total / Current'
	#Click on "Refresh" button 
	And the user clicks on the 'Profit And Loss Refresh Button'
	And the user clicks on the 'Profit & Loss Top Tab'
	#Title: @PRODDESCR_004 = "BACCO CHARDONNAY 0.75 lt"; The value of "Total Promo Rebate " =  40 
	Then the user validates text '<TOTALPROMOREBATE_VALUES>' on column name 'Product - BACCO CHARDONNAY 0.75 lt / Current' for profit and loss element name '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -40
	And the user validates text '<NETMARGIN_VALUES>' on column name 'Product - BACCO CHARDONNAY 0.75 lt / Current' for profit and loss element name '<NETMARGIN>' with unique column 'Promo Total / Current'
	#Title: @PRODDESCR_007 = "BACCO CORTESE 0.75  The value of "Total Promo Rebate " =  70
	And the user validates text '70.00' on column name 'Product - BACCO CORTESE 0.75 lt / Current' for profit and loss element name '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -70
	And the user validates text '-70.00' on column name 'Product - BACCO CORTESE 0.75 lt / Current' for profit and loss element name '<NETMARGIN>' with unique column 'Promo Total / Current'
	#In the "Profit & Loss"."Profit & Loss Retailer" tab, Click on "Refresh" button 
	When the user clicks on the 'Profit & Loss Retailer Top Tab'
	And the user clicks on the 'Profit And Loss Retailer Refresh Button'
	Then the user validates text '110.00' on column name 'Action/Current' for profit and loss element name '<GROSSCOST>' with unique column 'Action / Current'
	#Open "Detail Type" combo and flag also the "Products" checkbox. Open "Detail Data" combo and flag all checkboxes. Click on "Refresh" button 
	When the user clicks on the 'Profit And Loss Retailer Detail Type Trigger Icon'
	And the user clicks on 'Selection Popup Checkbox' with value '<PRODUCTS>'
	And the user clicks on the 'OK Button'
	#open "Detail Data" combo and flag all checkboxes.
	And user selects all products on Detail Data for 'Profit & Loss Retailer' tab and column 'Action / Current'
	#Click on "Refresh" button 
	And the user clicks on the 'Profit And Loss Retailer Refresh Button'
	Then the user validates text '<GROSSCOST_VALUES>' on column name 'Product - BACCO CHARDONNAY 0.75 lt / Current' for profit and loss element name '<GROSSCOST>' with unique column 'Action / Current'
	And the user validates text '70.00' on column name 'Product - BACCO CORTESE 0.75 lt / Current' for profit and loss element name '<GROSSCOST>' with unique column 'Action / Current'
	#12 In the Product Grid, 004 - LC_COST  = 40 (@NEW_LCCOST_PROD1) 007 - LC_COST  = 60 (@NEW_LCCOST_PROD2)
	When the user clicks on the 'Products Tab'
	And the user enters '<NEW_LCCOST_PROD1>' on column name 'Loyalty Card' for product code '<PRODCODE>'
	And the user enters '<NEW_LCCOST_PROD2>' on column name 'Loyalty Card' for product code '<PROD2>'
	#13 In the "Profit & Loss"."Profit & Loss" tab, Click on "Refresh" button 
	And the user clicks on the 'Profit & Loss Tab'
	And the user clicks on the 'Profit & Loss Top Tab'
	And the user clicks on the 'Profit And Loss Refresh Button'
	Then the user validates text '100.00' on column name 'Promo Total / Current' for profit and loss element name '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	And the user validates text '-100.00' on column name 'Promo Total / Current' for profit and loss element name '<NETMARGIN>' with unique column 'Promo Total / Current'
	#Title: @PRODDESCR_004 = "BACCO CHARDONNAY 0.75 lt"; The value of "Total Promo Rebate " =  40
	And the user validates text '<TOTALPROMOREBATE_VALUES>' on column name 'Product - BACCO CHARDONNAY 0.75 lt / Current' for profit and loss element name '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -40
	And the user validates text '<NETMARGIN_VALUES>' on column name 'Product - BACCO CHARDONNAY 0.75 lt / Current' for profit and loss element name '<NETMARGIN>' with unique column 'Promo Total / Current'
	#Title: @PRODDESCR_007 = "BACCO CORTESE 0.75  The value of "Total Promo Rebate " =  60
	And the user validates text '<NEW_LCCOST_PROD2>' on column name 'Product - BACCO CORTESE 0.75 lt / Current' for profit and loss element name '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -60
	And the user validates text '-60.00' on column name 'Product - BACCO CORTESE 0.75 lt / Current' for profit and loss element name '<NETMARGIN>' with unique column 'Promo Total / Current'
	#14 In the "Profit & Loss"."Profit & Loss Retailer" tab, Click on "Refresh" button 
	When the user clicks on the 'Profit & Loss Retailer Top Tab'
	And the user clicks on the 'Profit And Loss Retailer Refresh Button'
	#Title: "Action/Current" The value of "Gross Cost" = 100
	Then the user validates text '100.00' on column name 'Action / Current' for profit and loss element name '<GROSSCOST>' with unique column 'Action / Current'
	#Title: @PRODDESCR_004 = "BACCO CHARDONNAY 0.75 lt";The value of "Gross Cost"  =  40
	And the user validates text '<GROSSCOST_VALUES>' on column name 'Product - BACCO CHARDONNAY 0.75 lt / Current' for profit and loss element name '<GROSSCOST>' with unique column 'Action / Current'
	#Title: @PRODDESCR_007 = "BACCO CORTESE 0.75 lt" The value of "Gross Cost" = 60
	And the user validates text '60.00' on column name 'Product - BACCO CORTESE 0.75 lt / Current' for profit and loss element name '<GROSSCOST>' with unique column 'Action / Current'
	When the user clicks on the 'Close Tab'
	And the user clicks on the 'Alert Dialog No Button'
	And the user clicks on the 'Close Tab'


	Examples:
		| DIVISION | CUSTOMER | CUSTLEVEL | CONFLEVEL    | PROMODESC                 | SELLINSTART | SELLINEND | SELLOUTSTART | SELLOUTEND | MECHANICS    | PRODCODE | PRODLEVEL | LC_COST | QTYESTIMATED | PROD2 | PROD3 | PRODUCT_LEVEL | PROD2_LCCOST | PROD3_LCCOST | TOTALPROMOREBATE   | TOTALPROMOREBATE_VALUES | NETMARGIN  | NETMARGIN_VALUES | GROSSCOST  | GROSSCOST_VALUES | PRODUCTS | PRODDESCR_009        | PRODDESCR_004            | PRODDESCR_007         | NEW_LCCOST_PROD1 | NEW_LCCOST_PROD2 |
		| AUTOM2   | EC86172  | Level 4   | Holder Level | TPM_SP_W_SMOKE_R80V1_0016 | d/m/y       | d+10/m/y  |              |            | Loyalty Card | 004      | Product   | 40      | 0            | 007   | 009   | Product       | 70           | 90           | Total Promo Rebate | 40.00                   | Net Margin | -40.00           | Gross Cost | 40.00            | Products | BACCO PINNOT 0.75 lt | BACCO CHARDONNAY 0.75 lt | BACCO CORTESE 0.75 lt | 40.00            | 60.00            |