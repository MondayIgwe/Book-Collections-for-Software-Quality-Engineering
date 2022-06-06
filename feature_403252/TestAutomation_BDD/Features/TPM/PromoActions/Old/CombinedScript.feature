Feature: Combined Actions TestCase_345335
	Creates a new Promo Action with the desired data, edits the created Promo Action, 
	adds and removes the products and validates the profits and losses in the 
	Profits and Losses grid

Scenario: TC345335 

	Given the user is on the 'Promotional actions' page
	
	#Add Promo
	When the user creates a Promo '<CustomerHierarchyLevel>' '<CustomerCode>'

	#Populating a cockpit
	And the user populates the cockpit 'Promo Action ID' '<Description>' 'Sell-In start' 'Sell-In end' '<PromoActionMechanic>'

	#Adding a product
	And the user adds a product '<Product1Level>' '<ProductCode1>'
	
	Then the user clicks on the 'save button'
	When the 'green notification banner' is present
	Then the user clicks on the 'close button'

	#Open Promo Action
	Then the user is on the 'Promotional actions' page
	When the user filters 'Action Id' 'number' column for 'Promo Action ID'
	Then the user clicks on the 'Promo Action ID'
	When the user is on the 'Cockpit Tab' page

	#Edit Promo Action
	Then the user clicks on the 'edit button'
	Then the user clicks on the 'Profit & Loss Tab'

	#Step 3
	When the user is on the 'Profit & Loss Tab' page
	Then the user clicks on the 'Refresh Button PL'
	When the user clicks on the 'Profit & Loss Retailer subtab'
	Then the user clicks on the 'Refresh Button PLR'
	And the user clicks on the 'Profit & Loss subtab'

	#Step 4 and 5
	And the user adds a product '<Product1Level>' '<ProductCode2>'

	#Populating a product grid 
	Then the user enters '<Product2LCCost>' under the column number '4' in row number '2' in table 'Products'

	#Add a product
	Then the user clicks on the 'Add button'
	When the 'Product pop-up' is present
	Then the user selects '<AddedProductsLevel>' in the 'Product Level side panel'
	And the user selects '<ProductCode3>' in the 'Product Table'
	When the user clicks on the 'OK button'

	#Populating a product grid
	Then the user enters '<Product3LCCost>' under the column number '4' in row number '3' in table 'Products'
	Then the user clicks on the 'Profit & Loss Tab'
	When the user is on the 'Profit & Loss Tab' page
	When '<TotalPromoRebateRow>' has a value of '<TotalPromoRebateValues>' in  column numnber '3' in table 'Profit & Loss'
	And '<NetMarginRow>' has a value of '<NetMarginValues>' in  column numnber '3' in table 'Profit & Loss'
	Then the user clicks on the 'Profit & Loss Retailer subtab'
	When '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '3' in table 'Profit & Loss'
	Then the user clicks on the 'Profit & Loss subtab'

	#Step 6
	When the user clicks on the 'Products Tab'
	Then the user is on the 'Products Tab' page
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'OK pop up button'
	When the user clicks on the 'Profit & Loss Tab'
	And the user is on the 'Profit & Loss Tab' page
	Then the user clicks on the 'Profit & Loss subtab'

	When '<TotalPromoRebateRow>' has a value of '<TotalPromoRebateValues>' in  column numnber '3' in table 'Profit & Loss'
	And '<NetMarginRow>' has a value of '<NetMarginValues>' in  column numnber '3' in table 'Profit & Loss'
	Then the user clicks on the 'Profit & Loss Retailer subtab'
	When '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '3' in table 'Profit & Loss'

	#Step 7
	And the user clicks on the 'Profit & Loss subtab'
	And the user clicks on the 'Refresh Button PL'
	When '<TotalPromoRebateRow>' has a value of '<TotalPromoRebateValues>' in  column numnber '3' in table 'Profit & Loss'
	And '<NetMarginRow>' has a value of '<NetMarginValues>' in  column numnber '3' in table 'Profit & Loss'
	Then the user clicks on the 'Profit & Loss Retailer subtab'
	And the user clicks on the 'Refresh Button PLR'
	Then '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '3' in table 'Profit & Loss'

	#Step 8
	When the user clicks on the 'Profit & Loss subtab'
	Then the user clicks on the 'Refresh Button PL'
	When the user clicks on the 'Detail type drop down menu PL'
	Then the user checks on the 'Checkbox;Products' checkbox
	And the user clicks on the 'OK button'
	When the user clicks on the 'Detail data drop down menu PL'
	Then the user checks on the 'Select All' checkbox
	And the user clicks on the 'OK button'
	When the user clicks on the 'Refresh Button PL'

	Then '<TotalPromoRebateRow>' has a value of '<TotalPromoRebateValues>' in  column numnber '5' in table 'Profit & Loss'
	And '<TotalPromoRebateRow>' has a value of '<TotalPromoRebateValues>' in  column numnber '4' in table 'Profit & Loss'
	When '<NetMarginRow>' has a value of '<NetMarginValues>' in  column numnber '5' in table 'Profit & Loss'
	And '<NetMarginRow>' has a value of '<NetMarginValues>' in  column numnber '4' in table 'Profit & Loss'

	# Step 9
	Then the user clicks on the 'Profit & Loss Retailer subtab'
	And the user clicks on the 'Refresh Button PLR'
	Then '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '3' in table 'Profit & Loss'

	# Step 10
	When the user clicks on the 'Detail type drop down menu PLR'
	Then the user checks on the 'Checkbox;Products' checkbox
	And the user clicks on the 'OK button'
	When the user clicks on the 'Detail data drop down menu PLR'
	Then the user checks on the 'Select All' checkbox
	And the user clicks on the 'OK button'
	When the user clicks on the 'Refresh Button PLR'
	Then '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '4' in table 'Profit & Loss'

	# Step 11
	When the user clicks on the 'Products Tab'
	Then the user enters '<NewProduct1LCCost>' under the column number '4' in row number '1' in table 'Products'
	And the user enters '<NewProduct2LCCost>' under the column number '4' in row number '2' in table 'Products'

	# Step 12
	And the user clicks on the 'Profit & Loss Tab'
	When the user is on the 'Profit & Loss Tab' page
	And the user clicks on the 'Refresh Button PLR'
	When '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '3' in table 'Profit & Loss'
	And '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '4' in table 'Profit & Loss'
	And '<GrossCostRow>' has a value of '<GrossCostValues>' in  column numnber '5' in table 'Profit & Loss'

	# Step 13
	Then the user closes all pages without saving the work done

	Examples: 
	| CustomerCode | CustomerHierarchyLevel | ConfirmationLevel | Description               | SellInStartDate | SellInEndDate | PromoActionMechanic | Product1Level | ProductCode1 | Product1LCCost | Product1EstumatedQty | ProductCode2 | ProductCode3 | AddedProductsLevel | Product2LCCost | Product3LCCost | TotalPromoRebateRow | GrossCostRow | Product1Name             | Product2Name          | NewProduct1LCCost | NewProduct2LCCost | TotalPromoRebateValues          | NetMarginValues                      | GrossCostValues                 | NetMarginRow | TableName | DataSource | Columns							 | tableData |
	| EC86172      | Level 4                | Holder Level      | TPM_SP_W_SMOKE_R80V1_0016 | d/m/y           | d+10/m/y      | Loyalty Card        | Product       | 004          | 40             | 0                    | 007          | 009          | Product            | 70             | 90             | Total Promo Rebate  | Gross Cost   | BACCO CHARDONNAY 0.75 lt | BACCO CORTESE 0.75 lt | 40                | 60                | 40.00,110.00,70.00,100.00,60.00 | -40.00,-110.00,-70.00,-100.00,-60.00 | 40.00,110.00,70.00,100.00,60.00 | Net Margin   | Product   | local	   | Product1LCCost,Product1EstumatedQty | 40,0      |