Feature: TestCase_776594

@BDD_776594 @PROMO_Regression @PromoActions @PROMO_Smoke
Scenario: WEB_TPM_SP_PROMOPL_RETAILERPL_AGGREGATION_OPTION_002_NEW_BEHAVIOR
	#1 Login to the app and go to Promo actions navigator
	Given the user navigates to the 'Promotional actions' page
	
	#Step 2 - Create a new Promo with:
	When the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUSTOMER>'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '' sellOutEnd: '' mechanics: '<MECHANICS>'
	And the user adds a product with productLevel: '<PRODUCTLEVELS1>' productCodes: '<PROD1>'
	And the user adds a product with productLevel: '<PRODUCTLEVELS1>' productCodes: '<PROD2>'
	And the user adds a product with productLevel: '<PRODUCTLEVELS2>' productCodes: '<REFERENCE1>'
	And the user adds a product with productLevel: '<PRODUCTLEVELS2>' productCodes: '<REFERENCE2>'
	And the user adds a product with productLevel: '<PRODUCTLEVELS3>' productCodes: '<DISPLAY1>'
	And the user adds a product with productLevel: '<PRODUCTLEVELS3>' productCodes: '<DISPLAY2>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	
	#3 Open in Edit mode the promo
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId1'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	
	#4 From the promo Document toolbar,  Click on "Promotional What-If"
	
	And the user clicks on the 'Promo What If Button'
	#5 In the What-If Popup, click on "Create What-If"
	And the user clicks on the 'Promo Create WhatIf Button'
	
	#6 Enter a Description for the what-If (@WHATIF_DES). Click OK.
	And the user enters '<WHATIF_DES>' in the 'Promo Create WhatIf Text'
	And the user clicks on 'Popup OK Button' with value 'Create What If'
	
	#7 In the Product Grid, Set the following values for LF_COST measure:
	And the user clicks on side panel 'Products'
	And the user enters '<LF_COST_PROD1>' on column name 'Leaflet' for product code '<PROD1>'
	And the user enters '<LF_COST_PROD2>' on column name 'Leaflet' for product code '<PROD2>'
	And the user enters '<LF_COST_REF1>' on column name 'Leaflet' for product code '<REFERENCE1>'
	And the user enters '<LF_COST_REF2>' on column name 'Leaflet' for product code '<REFERENCE2>'
	And the user enters '<LF_COST_DISPLAY1>' on column name 'Leaflet' for product code '<DISPLAY1>'
	And the user enters '<LF_COST_DISPLAY2>' on column name 'Leaflet' for product code '<DISPLAY2>'
	
	#8 Save the promo.
	And the user clicks on the 'Save Button'

	#9 Go to Promo What-if  P&L tab and Click "Refresh" button 
	And the user clicks on side panel 'Profit & Loss'
	And the user clicks on top panel 'Profit & Loss What-IF'
	And the user clicks on the 'Profit And Loss What If Refresh Button'

	#10 Open "Detail Type" combo and flag ALL checkboxes and click "OK". Open "Detail Data" combo and flag ALL checkboxes. Flag the checkbox "See Product Aggregated" and click "OK"
	And the user clicks on 'Profit Loss WhatIf Drop Down Trigger' with value 'Detail type'
	And the user checks the 'Selection Popup Checkbox' with value 'Action'
	And the user checks the 'Selection Popup Checkbox' with value 'Display'
	And the user checks the 'Selection Popup Checkbox' with value 'Products'
	And the user clicks on 'Popup Ok Button' with value 'Selection'
	And the user clicks on 'Profit Loss WhatIf Drop Down Trigger' with value 'Detail data'
	And the user clicks on the 'Popup All Checkbox'
	And the user clicks on 'Popup Ok Button' with value 'Selection'
	And the user clicks on 'Aggregate Products Checkbox By Unique Field' with value 'Gross Amount'
	
	#11 Click on "Refresh" button
	And the user clicks on the 'Profit And Loss What If Refresh Button'

	#For each What-if version (i.e. NATIVE, Version 1)
	#The following further 2 columns are present: - Products Aggregation/Current - Display Aggregation/Current
	Then the user validates that the 'Column' with value 'Products Aggregation / NATIVE' is present
	And the user validates that the 'Column' with value 'Products Aggregation / Version 1' is present
	And the user validates that the 'Column' with value 'Display Aggregation / NATIVE' is present
	And the user validates that the 'Column' with value 'Display Aggregation / Version 1' is present

	#@VERSIONS For the "Native" version, all values are 0. @VERSIONVALUE
	And the user validates text '<VERSIONVALUE>' on column name 'Action / NATIVE' for profit and loss element name 'Quantity' with unique column 'Gross Amount'
	And the user validates text '<VERSIONVALUE>' on column name 'Action / NATIVE' for profit and loss element name 'Gross Amount' with unique column 'Gross Amount'
	And the user validates text '<VERSIONVALUE>' on column name 'Action / NATIVE' for profit and loss element name 'Regular Discount off invoice' with unique column 'Gross Amount'
	And the user validates text '<VERSIONVALUE>' on column name 'Action / NATIVE' for profit and loss element name 'Total Promo Discount' with unique column 'Gross Amount'
	And the user validates text '<VERSIONVALUE>' on column name 'Action / NATIVE' for profit and loss element name 'Net Amount' with unique column 'Gross Amount'
	And the user validates text '<VERSIONVALUE>' on column name 'Action / NATIVE' for profit and loss element name 'Regular Rebate' with unique column 'Gross Amount'
	And the user validates text '<VERSIONVALUE>' on column name 'Action / NATIVE' for profit and loss element name 'Total Promo Rebate' with unique column 'Gross Amount'
	And the user validates text '<VERSIONVALUE>' on column name 'Action / NATIVE' for profit and loss element name 'Margin' with unique column 'Gross Amount'
	And the user validates text '<VERSIONVALUE>' on column name 'Action / NATIVE' for profit and loss element name 'Marketing cost' with unique column 'Gross Amount'
	And the user validates text '<VERSIONVALUE>' on column name 'Action / NATIVE' for profit and loss element name 'COGS & WHS' with unique column 'Gross Amount'
	And the user validates text '<VERSIONVALUE>' on column name 'Action / NATIVE' for profit and loss element name 'Net Contribution' with unique column 'Gross Amount'
	And the user validates text '<VERSIONVALUE>' on column name 'Action / NATIVE' for profit and loss element name 'ROI' with unique column 'Gross Amount'

	#For the "Version 1" version, In the "Products Aggregation/Current" column, @TOTALPROMOREBATE_PAC Total Promo Rebate = 10 + 20 + 10 + 20 = 60 @TOTALPROMOREBATE
	And the user validates text '<TOTALPROMOREBATE_PAC>' on column name 'Products Aggregation / Version 1' for profit and loss element name 'Total Promo Rebate' with unique column 'Gross Amount'

	#In the "Display Aggregation/Current" column, @TOTALPROMOREBATE_DAC Total Promo Rebate = 100 + 200 = 300
	And the user validates text '<TOTALPROMOREBATE_DAC>' on column name 'Display Aggregation / Version 1' for profit and loss element name 'Total Promo Rebate' with unique column 'Gross Amount'

	When the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'


Examples:
	| CUSTLEV | CUSTOMER | MECHANICS | SELLINSTART | SELLINEND | DESCRIPTION                                 | PRODUCTLEVELS1 | PRODUCTLEVELS2 | PRODUCTLEVELS3 | PROD1 | PROD2 | REFERENCE1 | REFERENCE2 | DISPLAY1 | DISPLAY2 | WHATIF_DES | LF_COST_PROD1 | LF_COST_PROD2 | LF_COST_REF1 | LF_COST_REF2 | LF_COST_DISPLAY1 | LF_COST_DISPLAY2 | VERSION1         | VERSION2      | VERSIONVALUE | TOTALPROMOREBATE_PAC | TOTALPROMOREBATE   | TOTALPROMOREBATE_DAC |
	| Level 5 | EC86162  | Leaflet   | d+1/m/y     | d+15/m/y  | P&L Display/No Display Aggregation Option 2 | Product        | Reference      | Display        | 001   | 002   | 01201      | 01202      | D001     | D002     | Version 1  | 10            | 20            | 10           | 20           | 100              | 200              | Action/Version 1 | Action/NATIVE | 0.00         | 60.00                | Total Promo Rebate | 300.00               |