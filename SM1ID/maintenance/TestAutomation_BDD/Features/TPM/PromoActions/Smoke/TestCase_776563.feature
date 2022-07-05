Feature: TestCase_776563

@BDD_776563 @PROMO_Regression @PromoActions @PROMO_Smoke
Scenario: TPM_SP_W_SMOKE_R80V1_0019_REFRESH_PROMOSHOT_P&L_NEW_BEHAVIOR
	#1 Create a Promo with @DESCRIPTION, @MECHANIC, @CUSTHOLDER, @LEVEL
	Given the user navigates to the 'Promotional actions' page
	#Precondition
	When the user creates a Promo with customerHLevel: 'Level 3' customerCode: '<CUSTHOLDER>'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: '<MECHANIC>'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user adds products with productLevel: 'Product' productCodes: '<prodCode>'
	#2 Create 3 What-ifs
	And the user clicks on the 'Save Button'
	And the user creates a new Promotional What If with description '<scenarios1>'
	And the user creates a new Promotional What If with description '<scenarios2>'
	And the user creates a new Promotional What If with description '<scenarios3>'
	#3 Go to Profit&Loss tab
	And the user clicks on side panel 'Profit & Loss'
	#4 Go to theP&L What-if tab and open the "Scenarios" combo @scenarios
	And the user clicks on top panel 'Profit & Loss What-IF'
	When the user changes the Promo What If with description '<scenarios1>'
	And the user clicks on side panel 'Products'
	And the user enters '<value1>' on column name 'Leaflet' for product code '<prodCode>'
	When the user changes the Promo What If with description '<scenarios2>'
	And the user clicks on side panel 'Products'
	And the user enters '<value2>' on column name 'Leaflet' for product code '<prodCode>'
	When the user changes the Promo What If with description '<scenarios3>'
	And the user clicks on side panel 'Products'
	And the user enters '<value3>' on column name 'Leaflet' for product code '<prodCode>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#5 Select all the Shots What-If Versions and press OK
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	And the user clicks on side panel 'Profit & Loss'
	And the user clicks on top panel 'Profit & Loss What-IF'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Scenario'
	And the user checks the 'Selection Popup Checkbox' with value '<scenarios1>'
	And the user checks the 'Selection Popup Checkbox' with value '<scenarios2>'
	And the user checks the 'Selection Popup Checkbox' with value '<scenarios3>'
	And the user clicks on 'Popup Ok Button' with value 'Selection'
	#6 Open the "Detail Type" combo @detailTypes
	When the user clicks on 'Profit Loss WhatIf Drop Down Trigger' with value 'Detail type'
	#7 Select All shown Detail Types and press OK
	And the user checks the 'Selection Popup Checkbox' with value 'Action'
	And the user checks the 'Selection Popup Checkbox' with value 'Display'
	And the user checks the 'Selection Popup Checkbox' with value 'Products'
	And the user clicks on 'Popup Ok Button' with value 'Selection'
	#8 Check the "Detail Data" combo -> The Detail Data displayed are: Action or Product 001
	And the user clicks on 'Profit Loss WhatIf Drop Down Trigger' with value 'Detail data'
	Then the user validates that the 'Selection Popup Checkbox' with value 'BACCO ALBANA 0,75 lt' is present
	#9 Select also Product 001 and press OK
	When the user checks the 'Selection Popup Checkbox' with value 'BACCO ALBANA 0,75 lt'
	When the user checks the 'Selection Popup Checkbox' with value 'ACTION'
	And the user clicks on 'Popup Ok Button' with value 'Selection'
	#10 Click "Refresh" button the P&L
	And the user clicks on 'Profit And Loss Refresh Button' with value 'Gross Amount'
	Then the user validates that the Loading Mask is not present
	And the user validates that the 'Basic Grid Column' with value 'Action / Version1' is present
	And the user validates that the 'Basic Grid Column' with value 'Action / Version2' is present
	And the user validates that the 'Basic Grid Column' with value 'Action / Version3' is present
	And the user validates that the 'Basic Grid Column' with value 'Product - BACCO ALBANA 0,75 lt / Version1' is present
	And the user validates that the 'Basic Grid Column' with value 'Product - BACCO ALBANA 0,75 lt / Version2' is present
	And the user validates that the 'Basic Grid Column' with value 'Product - BACCO ALBANA 0,75 lt / Version3' is present
	#11 Check the value for "Total promo Rebate" for the Confirmed What-if @values
	And the user validates text '<value3>' on column name 'Action / Version3' for profit and loss element name 'Total Promo Rebate' with unique column 'Gross Amount'
	#12 Check the value for "Total promo Rebate"  for Version 2
	And the user validates text '<value2>' on column name 'Action / Version2' for profit and loss element name 'Total Promo Rebate' with unique column 'Gross Amount'
	#13 Check the value for "Total promo Rebate"  for Version 1
	#bug
	And the user validates text '<value1>' on column name 'Action / Version1' for profit and loss element name 'Total Promo Rebate' with unique column 'Gross Amount'
	#14 Go to Products grid and change value for @LF_COST to 200
	When the user clicks on side panel 'Products'
	And the user enters '<LF_COST1>' on column name 'Leaflet' for product code '<prodCode>'
	#15 Save the promo
	And the user clicks on the 'Save Button'
	#16 Go Back to P&L What-if tab and refresh the Grid
	And the user clicks on side panel 'Profit & Loss'
	And the user clicks on top panel 'Profit & Loss What-IF'
	And the user clicks on 'Profit And Loss Refresh Button' with value 'Gross Amount'
	#17 Check the value for "Total promo Rebate" for the Confirmed What-if
	Then the user validates that the Loading Mask is not present
	And the user validates text '-200.00' on column name 'Action / Version3' for profit and loss element name 'Margin' with unique column 'Gross Amount'
	#18 Go to Products grid and change value for LF_COST to 300
	When the user clicks on side panel 'Products'
	And the user enters '<LF_COST2>' on column name 'Leaflet' for product code '<prodCode>'
	#19 Save the promo
	And the user clicks on the 'Save Button'
	#20 Go Back to P&L What-if tab and click "refresh" in the Grid
	And the user clicks on side panel 'Profit & Loss'
	And the user clicks on top panel 'Profit & Loss What-IF'
	And the user clicks on 'Profit And Loss Refresh Button' with value 'Gross Amount'
	#21 Check the value for "Total promo Rebate" for the Confirmed What-if
	Then the user validates that the Loading Mask is not present
	And the user validates text '<LF_COST2>' on column name 'Action / Version3' for profit and loss element name 'Total Promo Rebate' with unique column 'Gross Amount'
	#22 Close the Promo



Examples:
	| DESCRIPTION           | MECHANIC | CUSTHOLDER | LEVEL   | scenarios1 | scenarios2 | scenarios3 | detailTypes1 | detailTypes2 | detailTypes3 | prodCode | prodName             | value1 | value2 | value3 | LF_COST1 | LF_COST2 |
	| Refresh PromoShot P&L | Leaflet  | EC86221    | PRODUCT | Version1   | Version2   | Version3   | Action       | Display      | Products     | 001      | BACCO ALBANA 0,75 lt | 50.00  | 100.00 | 150.00 | 200.00   | 300.00   |
