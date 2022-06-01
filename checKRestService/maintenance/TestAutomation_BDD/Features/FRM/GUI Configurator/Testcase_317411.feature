Feature: Testcase_317411
	US270197 - AC_2 - Check full text search and collapsible/expandable items from UI configurator

Scenario:  Check full text search and collapsible/expandable items from UI configurator
    # step 1 and 2 
	Given the user is on the 'Reference Docs' page
    When the user clicks on the 'Add Button'
    And the user selects 'Today' from calendar icon 'Date 1 Calendar Icon'
    And the user selects 'Today' from calendar icon 'Date 2 Calendar Icon'
    And the user clicks OK button in the 'Reference Doc Detail Popup' popup
    Then the user is on the 'Summary Tab' page

	# step 3 set Gui Configurator button ON
	When the user clicks on the 'Configurator Button'
	And the user validates that the 'GUI Configurator On' is displayed
	
	#click on settings key icon near to edit/save button of UI 
	And the user clicks on the 'Side Panel Settings Icon'

	#Check if the search field  and gui configurato pop is visible
	And the 'Gui Configurator Popup' is visible
	When the user clicks on the 'Flattened Tree Button'

	#Search for button text in the search field
	And the user enters 'button' in the 'Tree Search Field'
	And the 'Logical Button Tree Item' is visible

	#Collapse the LogicalButton
	And the user clicks on the 'Logical Button Arrow Icon'
	Then the user validates 'Button Header1 Item' is not visible

	#Expand LogicalButton
	When the user clicks on the 'Logical Button Arrow Icon'
	Then the 'Button Header1 Item' is visible
	And  the user clicks on the 'Tree Search Field Close Icon'

	#Search for grid component that belongs to SM1.LogicalListGrid components group
	When the user enters 'grid' in the 'Tree Search Field'
	And the 'Logical Grid Tree Item' is visible

	#Collapse the SM1.LogicalListGrid
	And the user clicks on the 'Logical Grid Arrow Icon'
	Then  the user validates 'Reference Doc Detail Grid Item' is not visible

	#Expend the SM1.LogicalListGrid 
	When the user clicks on the 'Logical Grid Arrow Icon'
	Then the 'Reference Doc Detail Grid Item' is visible


	#Search for field maker in the search bar
	When the user enters 'maker' in the 'Tree Search Field'
	And the 'Logical Field Filter Maker Tree Item' is visible

	#Expand SM1.Logical Field Filter Maker components group
	When the user clicks on the 'Logical Field Filter Maker Arrow Icon'
	Then  the user validates 'Field Filter Maker1 Item' is not visible

	#Collapse the SM1.Logical Field Filter Maker
	And the user clicks on the 'Logical Field Filter Maker Arrow Icon'
	Then the 'Field Filter Maker1 Item' is visible

	#Search for field in the search bar
	When the user enters 'date' in the 'Tree Search Field'
	And the 'Logical Field Date Picker Tree Item' is visible

	#Expand SM1.Logical Field Date Picker components group
	When the user clicks on the 'Logical Field Date Picker Arrow Icon'
	Then  the user validates 'Field Date Picker Item' is not visible

	#Collapse SM1.Logical Field Date Picker components group
	When the user clicks on the 'Logical Field Date Picker Arrow Icon'
	Then the 'Field Date Picker Item' is visible

	#Click on X button of search field for reset 
	And  the user clicks on the 'Tree Search Field Close Icon'