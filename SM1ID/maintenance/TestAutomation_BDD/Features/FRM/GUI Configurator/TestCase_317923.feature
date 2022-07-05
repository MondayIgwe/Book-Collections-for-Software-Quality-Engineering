Feature: TestCase_317923
	US313540 - AC_1 - Check UI configurator with "New" and the subitem "Empty Configuration" 

@mytag
Scenario: Check UI configurator with "New" and the subitem "Empty Configuration" 
	#Step 1 & 2
    Given the user is on the 'Reference Docs' page
    When the user filters the column by column name 'Progressive', Filter Type 'Like', Value '<ProgressiveValue>'
	And the user clicks on '<ProgressiveValue>' text on the grid
	And the user is on the 'Summary' page

	#Step 3 & 4
	And the user clicks on the 'Configurator Button'
	Then the user validates that the 'GUI Configurator On' is displayed

	#Step 5- 6--7
	When the user clicks on the 'New Configuration Button'
	And the user clicks on the 'Empty Configuration Option'	
	
	#Step 5-6-7

    And the 'Gui Configurator Popup' is visible

	#Search for button text in the search field
	When the user enters '[CUST] button_header1' in the 'Tree Search Field'
	And the user clicks on the 'Cust Button Headers1'
	Then the 'Visible Value Field' is visible
	When the user clicks on the 'Visible Value Field'
	And the user clicks on the 'Value Dropdown Icon'
	And the user clicks on the 'Value False Dropdown Option'
	And the user clicks on the 'Value Popup Ok Button'
	And the user clicks on Ok button on the popup 'Gui Configurator'

	#Step 8-9-10
	When the user clicks on the 'Configurator Button'
	And the user validates that the 'Configuration Save Popup Message Box' is displayed
	And the user clicks on the 'Configuration Save Popup Yes Button'
	Then the user validates that the 'GUI Configurator Off' is displayed
	
	#Step 10 - 11- 12
	When the user clicks on the 'Back Button'
	And the user is on the 'Reference Docs' page
    And the user filters the column by column name 'Progressive', Filter Type 'Like', Value '<ProgressiveValue>'
	And the user clicks on '<ProgressiveValue>' text on the grid
	And the user is on the 'Summary' page

	#Step 13 - 14
	When the user clicks on the 'Configurator Button'
	And the user validates that the 'GUI Configurator On' is displayed
	And the user clicks on the 'New Configuration Button'
	And the user clicks on the 'From Option'
	Then the 'Configuration K1 Option' is visible

	Examples:
		| ProgressiveValue |
		| 1                |