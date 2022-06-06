Feature: TC344842_Simplified
	Simple calculator for adding two numbers

@mytag
Scenario: Add two numbers
    #Add Promo
	When the user creates a Promo '<CustomerHierarchyLevel>' '<CustomerCode>'
	#Populating a cockpit
	And the user populates the cockpit 'Promo Action ID' '<Description>' 'Sell-In start' 'Sell-In end' '<PromoActionMechanic1>'
	
	#Save Work
	Then the user clicks on the 'save button'
	When the 'green notification banner' is present
	Then the user clicks on the 'close button'

	#Open Promo Action
	Then the user is on the 'Promotional actions' page
	When the user filters 'Action Id' 'number' column for 'Promo Action ID'
	Then the user clicks on the 'Promo Action ID'

	When the user is on the 'Cockpit Tab' page
	Then the user clicks on the 'edit button'
	When the user clicks on the 'General Info Tab'
	Then the user is on the 'General Info Tab' page

	When the user sets the mechanics '<ComaSeperatedMechanics>'
    And the user adds a product '<ProductLevel>' '<ProductCode1>'
	And the user adds a product '<ProductLevel>' '<ProductCode2>'
    And the user changes the Measure level to 'All'
	When the user validates the '<ComaSeperatedMechanicList>' is on the grid

	Then the user clicks on the 'General Info Tab'
	Then the user is on the 'General Info Tab' page
	When the user sets the mechanics '<PromoActionMechanic3>'
	And the user clicks on the 'Popup Yes Button'
	Then the user clicks on the 'Products Tab'
	When the user is on the 'Products Tab' page
	Then the user validates the table does have '<PromoActionMechanic3>'

	Then the user clicks on the 'General Info Tab'
	Then the user is on the 'General Info Tab' page
	When the user sets the mechanics '<PromoActionMechanic4>'
	And the user clicks on the 'No Button'
	Then the user clicks on the 'Products Tab'
	When the user is on the 'Products Tab' page
	Then the user validates the table does not have '<PromoActionMechanic4>'

	When the user clicks Data on the products table '<Productcode1>' '<Promomechanicsm1ID>'
	And the user clicks the dropdown on the grid
	Then the user clicks '<PromoActionMechanic4>' under the checkbox in row '<PromoActionMechanic4>' in table
	And the user clicks on the 'Ok'
    Then the user validates the table does have '<PromoActionMechanic4>'

	When the user clicks Data on the products table '<Productcode2>' '<Promomechanicsm1ID>'
	And the user clicks the dropdown on the grid
	Then the user clicks '<PromoActionMechanic4>' under the checkbox in row '<PromoActionMechanic4>' in table
	And the user clicks on the 'Pop up Mechanic Selection'
    Then the user validates the table does have '<PromoActionMechanic4>'
	And the user validates the cell is deactivated on the products table '<Product2>''<PromoActionMechanic3>'
	Then the user enters '<Product1LCCost>' under the column '<LeafletSm1ID>' in row '<Productcode1>' in table 'Products'
	Then the user clicks on the 'Funds SubPage'
	Then the user validates that Fund '<Fund>' is not visible

	Then the user clicks on the 'save button'
	When the 'green notification banner' is present
	Then the user clicks on the 'close button'

	Examples:
	| CustomerCode | CustomerHierarchyLevel | ConfirmationLevel | Description               | SellInStartDate | SellInEndDate | PromoActionMechanic1 | PromoActionMechanic2 | PromoActionMechanic3 | ComaSeperatedMechanics               | PromoActionMechanic4 | ProductLevel | Productcode1 | Productcode2 | Product1LCCost | MeasMechID1          | MeasMechID2 | MeasMechID3   | MEAS_VALUE_PROD | Fund | ComaSeperatedMechanicList         | Promomechanicsm1ID | LeafletSm1ID |
	| EC10019      | Level 3                | Holder Level      | TPM_SP_W_SMOKE_R80V1_0014 | d/m/y           | d+10/m/y      | TPR in %             | Hostess              | Def. Cut Price in %  | TPR in %,Hostess,Def. Cut Price in % | Leaflet              | Level 0      | 008          | 011          | 009            | ESTIMATEDDEFDISCPERC | DEMO_COST   | DEF_DISC_PERC | 40              | 884  | % Cut Price,% Def. Cut Price,Demo | ACTIVITIES         | LF_COST      |

