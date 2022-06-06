Feature: TestCase_455697

@BDD_455697 @outofscope @donotrun
Scenario: WEB_TPM_SP_PROMOPLANDOCUMENT_SCENARIOREASSIGN_001
	#Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#Step 2
	When the user creates a Promo '<CUSTLEVEL>' '<CUSTOMER>'
	And the user populates the cockpit '<PROMODESC1>' '<SELLINSTART>' '<SELLINEND>' '<SELLOUTSTART>' '<SELLOUTEND>' '<MECHANICS>'
	And the user adds a product '<PRODLEVEL>' '<PRODCODE>'
	And the user enters '<LC_COST>' on column name 'Loyalty Card' for product code '<PRODCODE>'
	And the user enters '<QTYESTIMATED>' on column name 'Estimated quantity' for product code '<PRODCODE>'
	And the user clicks on the 'Save Button'
	#Switch it to "Edit" mode
	And the user clicks on 'Button' with value 'Edit'
	#In the P&L tabs click "Refresh" button Profit & Loss
	And the user clicks on 'Button' with value 'Profit & Loss'
	And the user clicks on the 'Profit And Loss Refresh Button'
	#In the Product Grid, Add the following Products: 007, 009 (@PROD2, @PROD3 , @PRODUCT_LEVEL)
	And the user adds a product '<PRODUCT_LEVEL>' '<PROD2>'
	And the user adds a product '<PRODUCT_LEVEL>' '<PROD3>'
	#In the Product Grid,	Set the following values for LC_COST measure: 007 - LC_COST  = 70 (@PROD2_LCCOST) 009 - LC_COST  = 90  (@PROD3_LCCOST)
	And the user enters '<PROD2_LCCOST>' on column name 'Loyalty Card' for product code '<PROD2>'
	And the user enters '<PROD3_LCCOST>' on column name 'Loyalty Card' for product code '<PROD3>'
	#In the "Profit & Loss"."Profit & Loss" tab, P&L is not updated:
	And the user clicks on 'Button' with value 'Profit & Loss'
	#The value of "Total Promo Rebate " = 40 (@TOTALPROMOREBATE, @TOTALPROMOREBATE_VALUES)
	Then the user validates text '<TOTALPROMOREBATE_VALUES>' on column name 'Promo Total/Current' for profit and loss '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -40 (@NETMARGIN, @NETMARGIN_VALUES)
	And the user validates text '<NETMARGIN_VALUES>' on column name 'Promo Total/Current' for profit and loss '<NETMARGIN>' with unique column 'Promo Total / Current'
	#In the "Profit & Loss"."Profit & Loss Retailer"" tab, P&L is not updated: The value of "Gross Cost" = 40 (@GROSSCOST, @GROSSCOST_VALUES) 
	When the user clicks on 'Button' with value 'Profit & Loss Retailer'
	Then the user validates text '<GROSSCOST_VALUES>' on column name 'Action/Current' for profit and loss '<GROSSCOST>' with unique column 'Action / Current'
	#From the Product Grid, Remove 009 Product.
	When the user clicks on 'Button' with value 'Products'
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
	#The value of "Total Promo Rebate " = 40 
	And the user clicks on 'Button' with value 'Profit & Loss'
	And the user clicks on 'Top Tab' with value 'Profit & Loss'
	Then the user validates text '<TOTALPROMOREBATE_VALUES>' on column name 'Action/Current' for profit and loss '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -40 
	And the user validates text '<NETMARGIN_VALUES>' on column name 'Promo Total/Current' for profit and loss '<NETMARGIN>' with unique column 'Promo Total / Current'
	#The value of "Gross Cost" = 40 
	When the user clicks on 'Button' with value 'Profit & Loss Retailer'
	Then the user validates text '<GROSSCOST_VALUES>' on column name 'Action/Current' for profit and loss '<GROSSCOST>' with unique column 'Action / Current'
	#Click on "Refresh" button 
	When the user clicks on 'Top Tab' with value 'Profit & Loss'
	And the user clicks on 'Top Tab' with value 'Profit & Loss'
	And the user clicks on the 'Profit And Loss Refresh Button'
	#The value of "Total Promo Rebate " = 110
	Then the user validates text '110.00' on column name 'Promo Total/Current' for profit and loss '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -110
	And the user validates text '-110.00' on column name 'Promo Total/Current' for profit and loss '<NETMARGIN>' with unique column 'Promo Total / Current'
	#9. Open "Detail Type" combo and flag also the "Products" checkbox.
	When the user clicks on 'Profit Loss Drop Down Trigger' with value 'Detail type'
	And the user clicks on 'Selection Popup Checkbox' with value '<PRODUCTS>'
	And the user clicks on 'Popup Ok Button' with value 'Selection'
	#open "Detail Data" combo and flag all checkboxes.
	And the user clicks on 'Profit Loss Drop Down Trigger' with value 'Detail data'
	And the user clicks on the 'Selection Popup All Checkbox'
	And the user clicks on 'Popup Ok Button' with value 'Selection'
	#Click on "Refresh" button 
	And the user clicks on the 'Profit And Loss Refresh Button'
	And the user clicks on 'Top Tab' with value 'Profit & Loss'
	#Title: @PRODDESCR_004 = "BACCO CHARDONNAY 0.75 lt"; The value of "Total Promo Rebate " =  40 
	Then the user validates text '<TOTALPROMOREBATE_VALUES>' on column name 'Product - BACCO CHARDONNAY 0.75 lt / Current' for profit and loss '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -40
	And the user validates text '<NETMARGIN_VALUES>' on column name 'Product - BACCO CHARDONNAY 0.75 lt / Current' for profit and loss '<NETMARGIN>' with unique column 'Promo Total / Current'
	#Title: @PRODDESCR_007 = "BACCO CORTESE 0.75  The value of "Total Promo Rebate " =  70
	And the user validates text '70.00' on column name 'Product - BACCO CORTESE 0.75 lt / Current' for profit and loss '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -70
	And the user validates text '-70.00' on column name 'Product - BACCO CORTESE 0.75 lt / Current' for profit and loss '<NETMARGIN>' with unique column 'Promo Total / Current'
	#In the "Profit & Loss"."Profit & Loss Retailer" tab, Click on "Refresh" button 
	When the user clicks on 'Button' with value 'Profit & Loss Retailer'
	And the user clicks on the 'Profit And Loss Retailer Refresh Button'
	Then the user validates text '110.00' on column name 'Action/Current' for profit and loss '<GROSSCOST>' with unique column 'Action / Current'
	#Open "Detail Type" combo and flag also the "Products" checkbox. Open "Detail Data" combo and flag all checkboxes. Click on "Refresh" button 
	When the user clicks on 'Profit Loss Retailer Drop Down Trigger' with value 'Detail type'
	And the user clicks on 'Selection Popup Checkbox' with value '<PRODUCTS>'
	And the user clicks on 'Popup Ok Button' with value 'Selection'
	#open "Detail Data" combo and flag all checkboxes.
	And the user clicks on 'Profit Loss Retailer Drop Down Trigger' with value 'Detail data'
	And the user clicks on the 'Selection Popup All Checkbox'
	And the user clicks on 'Popup Ok Button' with value 'Selection'
	#Click on "Refresh" button 
	And the user clicks on the 'Profit And Loss Retailer Refresh Button'
	Then the user validates text '<GROSSCOST_VALUES>' on column name 'Product - BACCO CHARDONNAY 0.75 lt / Current' for profit and loss '<GROSSCOST>' with unique column 'Action / Current'
	And the user validates text '70.00' on column name 'Product - BACCO CORTESE 0.75 lt / Current' for profit and loss '<GROSSCOST>' with unique column 'Action / Current'
	#12 In the Product Grid, 004 - LC_COST  = 40 (@NEW_LCCOST_PROD1) 007 - LC_COST  = 60 (@NEW_LCCOST_PROD2)
	When the user clicks on 'Button' with value 'Products'
	And the user enters '<NEW_LCCOST_PROD1>' on column name 'Loyalty Card' for product code '<PRODCODE>'
	And the user enters '<NEW_LCCOST_PROD2>' on column name 'Loyalty Card' for product code '<PROD2>'
	#13 In the "Profit & Loss"."Profit & Loss" tab, Click on "Refresh" button 
	And the user clicks on 'Button' with value 'Profit & Loss'
	And the user clicks on 'Top Tab' with value 'Profit & Loss'
	And the user clicks on the 'Profit And Loss Refresh Button'
	Then the user validates text '100.00' on column name 'Promo Total / Current' for profit and loss '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	And the user validates text '-100.00' on column name 'Promo Total / Current' for profit and loss '<NETMARGIN>' with unique column 'Promo Total / Current'
	#Title: @PRODDESCR_004 = "BACCO CHARDONNAY 0.75 lt"; The value of "Total Promo Rebate " =  40
	And the user validates text '<TOTALPROMOREBATE_VALUES>' on column name 'Product - BACCO CHARDONNAY 0.75 lt / Current' for profit and loss '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -40
	And the user validates text '<NETMARGIN_VALUES>' on column name 'Product - BACCO CHARDONNAY 0.75 lt / Current' for profit and loss '<NETMARGIN>' with unique column 'Promo Total / Current'
	#Title: @PRODDESCR_007 = "BACCO CORTESE 0.75  The value of "Total Promo Rebate " =  60
	And the user validates text '<NEW_LCCOST_PROD2>' on column name 'Product - BACCO CORTESE 0.75 lt / Current' for profit and loss '<TOTALPROMOREBATE>' with unique column 'Promo Total / Current'
	#The value of "Net margin " =  -60
	And the user validates text '-60.00' on column name 'Product - BACCO CORTESE 0.75 lt / Current' for profit and loss '<NETMARGIN>' with unique column 'Promo Total / Current'
	#14 In the "Profit & Loss"."Profit & Loss Retailer" tab, Click on "Refresh" button 
	When the user clicks on 'Button' with value 'Profit & Loss Retailer'
	And the user clicks on the 'Profit And Loss Retailer Refresh Button'
	#Title: "Action/Current" The value of "Gross Cost" = 100
	Then the user validates text '100.00' on column name 'Action / Current' for profit and loss '<GROSSCOST>' with unique column 'Action / Current'
	#Title: @PRODDESCR_004 = "BACCO CHARDONNAY 0.75 lt";The value of "Gross Cost"  =  40
	And the user validates text '<GROSSCOST_VALUES>' on column name 'Product - BACCO CHARDONNAY 0.75 lt / Current' for profit and loss '<GROSSCOST>' with unique column 'Action / Current'
	#Title: @PRODDESCR_007 = "BACCO CORTESE 0.75 lt" The value of "Gross Cost" = 60
	And the user validates text '60.00' on column name 'Product - BACCO CORTESE 0.75 lt / Current' for profit and loss '<GROSSCOST>' with unique column 'Action / Current'
	When the user clicks on the 'Close Tab'
	And the user clicks on the 'Alert Dialog No Button'
	And the user clicks on the 'Close Tab'


	Examples:
		| test |
		|hellow|