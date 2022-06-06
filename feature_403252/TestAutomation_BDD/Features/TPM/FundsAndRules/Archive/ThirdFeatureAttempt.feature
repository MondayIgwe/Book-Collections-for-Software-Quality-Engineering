Feature: ThirdFeatureAttempt
	Navigates to the Funds and Rules page and adds a New Fund & Rule


Scenario: Add new Fund & Rule KPI - Smoke Test
	#new Fund & Rule
	Given the user is on the 'Funds & Rules' page
	When the user clicks on the 'Add button'
	Then the 'New Fund&Rules pop-up' is present 
	When the user clicks on the 'Configuration ID drop-down icon'
	Then the user selects the '<ConfigID>'
	When the user clicks on the 'OK button'
	Then the user is on the 'Summary Tab' page
	#Add Summary Details
	When the user enters '<Description>' in the 'description textfield'
	And selects a 'Sell-In start' date
	And selects a 'Sell-In end' date
	Then the user clicks on the 'Customer Level drop-down menu icon'
	Then the user selects the '<CustomerLevel>'
	When the user clicks on the 'save button'
	Then the 'green notification banner' is present
	When the user clicks on the 'Constraints Tab'
	Then the user is on the 'Constriants Tab' page
	#Validate Constraints Table visible	
	And the user clicks on the 'Add button'
	Then the user is on the 'Add New Contraint' page
	#Validate that Add New Constraints is present and clicks the cancel button
	When the user clicks on the 'Cancel button'
	Then the user is on the 'Constriants Tab' page
	#Close all Menus
	When the user clicks on the 'close button'
	Then the user is on the 'Funds & Rules' page
	When the user clicks on the 'close button'
	Then the user is on the 'Dashboard' page

	Examples: 
|		Location		|	ColumnNames		|	PopulatedFields	    |	UnpopulatedFields	| ConfigID  | Description  | CustomerLevel |
|C:\Users\mbrown\Desktop| ColumnNames.txt	| PopulatedFields.txt	| UnpopulatedFields.txt | 629 - KPI | Test F&R KPI | 5 - Level 5   |