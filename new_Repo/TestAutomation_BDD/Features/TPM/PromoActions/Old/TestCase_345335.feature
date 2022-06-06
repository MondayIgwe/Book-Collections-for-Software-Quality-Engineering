Feature: TestCase_345335
	Creates a new Promo Action with the desired data, edits the created Promo Action, 
	adds and removes the products and validates the profits and losses in the 
	Profits and Losses grid

Scenario: Test Case : 345335
	#Steps 1 and 2
	Given the user is on the 'Promotional actions' page
	#Adding a Promo
	When the user clicks on the 'Add button'
	Then the user clicks on the 'Contractor Menu Icon'
	When the user selects '<CustomerHierarchyLevel>' in the 'Hier. level side panel'
	Then the user selects '<CustomerCode>' in the 'Customer code table'
	When the user clicks on the 'OK Customer code button'
	And the 'OK button' is present
	Then the user clicks on the 'OK button'
	#Populating a cockpit
	Then the user is on the 'Cockpit Tab' page
	And the user saves the 'Promo Action ID' value
	When the user enters '<Description>' in the 'description textfield'
	Then the user selects a 'Sell-In start' date
	And the user selects a 'Sell-In end' date
	When the user clicks on the 'View - All Mechanics link'
	Then the user is on the 'General Info Tab' page
	When the user selects '<PromoActionMechanic>' checkbox in the 'Sales Lump Sums section'
	#Adding a product
	Then the user clicks on the 'Products Tab'
	When the user is on the 'Products Tab' page
	And the 'Add button' is present
	Then the user clicks on the 'Add button'
	When the 'Product pop-up' is present
	Then the user selects '<Product1Level>' in the 'Product Level side panel'
	And the user selects '<ProductCode1>' in the 'Product Table' 
	When the user clicks on the 'OK button'
	And the user handles the loading screen
	#Populating a product grid
	Then the user enters '<Product1LCCost>' under the column number '5' in row number '1' in table 'Products'
	And the user enters '<Product1EstumatedQty>' under the column number '3' in row number '1' in table 'Products'
	When the user handles the loading screen
	#Save Work
	Then the user clicks on the 'save button'
	When the 'green notification banner' is present
	And the user handles the loading screen
	#Close Page and Save
	Then the user clicks on the 'close button'
	And the user handles the loading screen
	#Open Promo Action
	Then the user is on the 'Promotional actions' page
	When the user filters 'Action Id' 'number' column for 'Promo Action ID'
	Then the user clicks on the 'Promo Action ID'
	When the user is on the 'Cockpit Tab' page
	#Edit Promo Action
	Then the user clicks on the 'edit button'
	When the 'save button' is present 
	Then the user clicks on the 'Profit & Loss Tab'
	#Step 3
	When the user is on the 'Profit & Loss Tab' page
	And the user handles the loading screen
	Then the user clicks on the 'Refresh Button PL'
	And the user handles the loading screen
	When the user clicks on the 'Profit & Loss Retailer subtab'
	And the user handles the loading screen
	Then the user clicks on the 'Refresh Button PLR'
	And the user handles the loading screen
	And the user handles the loading screen
	And the user clicks on the 'Profit & Loss subtab'
	And the user handles the loading screen
	#Step 4 and 5
	Then the user clicks on the 'Products Tab'
	When the user is on the 'Products Tab' page
	#Add a product
	Then the user clicks on the 'Add button'
	When the 'Product pop-up' is present
	Then the user selects '<AddedProductsLevel>' in the 'Product Level side panel'
	And the user selects '<ProductCode2>' in the 'Product Table' 
	When the user clicks on the 'OK button'
	And the user handles the loading screen
	#Populating a product grid
	Then the user enters '<Product2LCCost>' under the column number '4' in row number '2' in table 'Products'
	#Add a product
	Then the user clicks on the 'Add button'
	When the 'Product pop-up' is present
	Then the user selects '<AddedProductsLevel>' in the 'Product Level side panel'
	And the user selects '<ProductCode3>' in the 'Product Table'
	When the user clicks on the 'OK button'
	And the user handles the loading screen
	#Populating a product grid
	Then the user enters '<Product3LCCost>' under the column number '4' in row number '3' in table 'Products'
	And the user handles the loading screen
	Then the user clicks on the 'Profit & Loss Tab'
	When the user is on the 'Profit & Loss Tab' page
	And the user handles the loading screen
	And the user handles the loading screen
	When '<TotalPromoRebateRow>' has a value of '<TotalPromoRebateValues>' in  column numnber '3' in table 'Profit & Loss'
	And '<NetMarginRow>' has a value of '<NetMarginValues>' in  column numnber '3' in table 'Profit & Loss'
	Then the user clicks on the 'Profit & Loss Retailer subtab'
	When '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '3' in table 'Profit & Loss'
	Then the user clicks on the 'Profit & Loss subtab'
	#Step 6
	When the user clicks on the 'Products Tab'
	Then the user is on the 'Products Tab' page
	When the 'Remove Button' is present
	And the user clicks on the 'Remove Button'
	Then the 'OK pop up button' is present
	And the user clicks on the 'OK pop up button'
	And the user handles the loading screen
	When the user clicks on the 'Profit & Loss Tab'
	And the user is on the 'Profit & Loss Tab' page
	Then the user clicks on the 'Profit & Loss subtab'
	When '<TotalPromoRebateRow>' has a value of '<TotalPromoRebateValues>' in  column numnber '3' in table 'Profit & Loss'
	And '<NetMarginRow>' has a value of '<NetMarginValues>' in  column numnber '3' in table 'Profit & Loss'
	Then the user clicks on the 'Profit & Loss Retailer subtab'
	And the user handles the loading screen
	When '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '3' in table 'Profit & Loss'
	#Step 7
	And the user clicks on the 'Profit & Loss subtab'
	And the user clicks on the 'Refresh Button PL'
	And the user handles the loading screen
	When '<TotalPromoRebateRow>' has a value of '<TotalPromoRebateValues>' in  column numnber '3' in table 'Profit & Loss'
	And '<NetMarginRow>' has a value of '<NetMarginValues>' in  column numnber '3' in table 'Profit & Loss'
	Then the user clicks on the 'Profit & Loss Retailer subtab'
	And the user clicks on the 'Refresh Button PLR'
	When the user handles the loading screen
	Then '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '3' in table 'Profit & Loss'
	#Step 8
	When the user clicks on the 'Profit & Loss subtab'
	Then the user clicks on the 'Refresh Button PL'
	And the user handles the loading screen
	When the user clicks on the 'Detail type drop down menu PL'
	And the 'Checkbox;Products' is present
	Then the user checks on the 'Checkbox;Products' checkbox
	And the user clicks on the 'OK button'
	When the user clicks on the 'Detail data drop down menu PL'
	And the 'Select All' is present
	Then the user checks on the 'Select All' checkbox
	And the user clicks on the 'OK button'
	When the user clicks on the 'Refresh Button PL'
	And the user handles the loading screen
	Then '<TotalPromoRebateRow>' has a value of '<TotalPromoRebateValues>' in  column numnber '5' in table 'Profit & Loss'
	And '<TotalPromoRebateRow>' has a value of '<TotalPromoRebateValues>' in  column numnber '4' in table 'Profit & Loss'
	When '<NetMarginRow>' has a value of '<NetMarginValues>' in  column numnber '5' in table 'Profit & Loss'
	And '<NetMarginRow>' has a value of '<NetMarginValues>' in  column numnber '4' in table 'Profit & Loss'
	# Step 9
	Then the user clicks on the 'Profit & Loss Retailer subtab'
	And the user clicks on the 'Refresh Button PLR'
	When the user handles the loading screen
	And  the user handles the loading screen
	Then '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '3' in table 'Profit & Loss'
	# Step 10
	When the user clicks on the 'Detail type drop down menu PLR'
	And the 'Checkbox;Products' is present
	Then the user checks on the 'Checkbox;Products' checkbox
	And the user clicks on the 'OK button'
	When the user clicks on the 'Detail data drop down menu PLR'
	And the 'Select All' is present
	Then the user checks on the 'Select All' checkbox
	And the user clicks on the 'OK button'
	When the user clicks on the 'Refresh Button PLR'
	And the user handles the loading screen
	Then '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '4' in table 'Profit & Loss'
	And the user handles the loading screen
	And the user handles the loading screen
	# Step 11
	When the user clicks on the 'Products Tab'
	And the user handles the loading screen
	Then the user enters '<NewProduct1LCCost>' under the column number '4' in row number '1' in table 'Products'
	And the user enters '<NewProduct2LCCost>' under the column number '4' in row number '2' in table 'Products'
	# Step 12
	Then the user handles the loading screen
	And the user clicks on the 'Profit & Loss Tab'
	When the user is on the 'Profit & Loss Tab' page
	And the user clicks on the 'Refresh Button PLR'
	Then the user handles the loading screen
	When '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '3' in table 'Profit & Loss'
	And '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '4' in table 'Profit & Loss'
	And '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '5' in table 'Profit & Loss'
	# Step 13
	Then the user closes all pages without saving the work done

	Examples: 
	| CustomerCode | CustomerHierarchyLevel | ConfirmationLevel | Description               | SellInStartDate | SellInEndDate | PromoActionMechanic | Product1Level | ProductCode1 | Product1LCCost | Product1EstumatedQty | ProductCode2 | ProductCode3 | AddedProductsLevel | Product2LCCost | Product3LCCost | TotalPromoRebateRow | GrossCostRow | Product1Name             | Product2Name          | NewProduct1LCCost | NewProduct2LCCost | TotalPromoRebateValues          | NetMarginValues                      | GrossCostValues                 | NetMarginRow |
	| EC86172      | Level 4                | Holder Level      | TPM_SP_W_SMOKE_R80V1_0016 | d/m/y           | d+10/m/y      | Loyalty Card        | Product       | 004          | 40             | 0                    | 007          | 009          | Product            | 70             | 90             | Total Promo Rebate  | Gross Cost   | BACCO CHARDONNAY 0.75 lt | BACCO CORTESE 0.75 lt | 40                | 60                | 40.00,110.00,70.00,100.00,60.00 | -40.00,-110.00,-70.00,-100.00,-60.00 | 40.00,110.00,70.00,100.00,60.00 | Net Margin   |