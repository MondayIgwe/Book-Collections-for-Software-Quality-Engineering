Feature: TC291932_FeatureFile
	Simple calculator for adding two numbers

@TC291932_FeatureFile
Scenario: TC291932_FeatureFile
	Given the user is on the 'Promotional actions' page
	
	When the user creates a Promo '<CustomerHierarchyLevel>' '<CustomerCode>'
	
	Then the user is on the 'Cockpit Tab' page

	When the user enters '<description>' in the 'description textfield'

	And the user selects a Sell-in 'Sell-In start' date '15' 'Current'
	
	And the user selects a Sell-in 'Sell-In end' date '20' 'next'
	
	And the user sets the mechanics '<ComaSeparatedMechanics>'
	
	And the user changes the Participant Level to <ParticipantLevel>
	
	And the user adds products  '<ProductLevel>' '<ComaSeparatedProductList>'

	And the user changes the Measure level to 'All'

	And the user enters data into the products table '004' 'QTYESTIMATED' '1000'

	And the user enters data into the products table '004' 'DISC_PERC' '10'

	And the user enters data into the products table '004' 'LF_COST' '100'

	And the user enters data into the products table '004' 'SELLOUTPROMOPRICE' '10'

	Then the user clicks on the 'save button'
	
	And the user clicks on the 'Funds SubPage'
	
	When the user validates that Fund '<fund>' is present
	
	And the fund state changed to '<FundState>'
	
	And the user clicks on the 'Products Tab'

	And the user is on the 'Products Tab' page
	
	Then the user validates that Fund 'Sales Fund (Mandatory)' is present

	And the user validate that the product codes are in the fund product column '<ComaSeparatedProductList>'

	Examples: 
	| CustomerHierarchyLevel | CustomerCode | description               | ComaSeparatedMechanics           | ParticipantLevel | ProductLevel | ComaSeparatedProductList | fund                      | FundState |
	| Level 3                | EC86221      | TPM_SP_W_SMOKE_R80V1_0008 | TPR in %,Leaflet,Instore support | Level 0          | Product      | 004,007,009,010,023      | 871(1)-Automation Fund 01 | Confirm   |
	