Feature: TestCase_340354

When the ALLOW NULL Property = TRUE set for Entity Selector Field, then the Entity Selector field is mandatory
When the ALLOW NULL Property = FALSE set for Entity Selector Field, then the Entity Selector field is optional

Scenario: WEB_FRM_CONFIGURATOR_LOGICAL_FIELD_ENTITY_SELECTOR_ALLOW_NULL
	
	#Step 1 & 2
    Given the user is on the 'Reference Docs' page
    When the user clicks on the 'Add Button'
    And the user selects 'Today' from calendar icon 'Date 1 Calendar Icon'
    And the user selects 'Today' from calendar icon 'Date 2 Calendar Icon'
    And the user clicks OK button in the 'Reference Doc Detail Popup' popup
    Then the user is on the 'Summary' page
    When the user selects 'Today' from calendar icon 'Event Test Type Calendar Icon'
    And the user clicks on the 'Transactional Data Button'
    And the user retrieves the 'Progressive Field' text as 'ProgressiveValue'
    And the user clicks on the 'Field Examples'
    Then the user is on the 'Available Fields Tab' page
    When the user enters 'ITAC Test' in the 'Textbox Field'
    And the user selects 'voice1' in the combo box 'Combo Field'
    And the user clicks on the 'Field Validation Button'
    Then the user is on the 'Field Validation Tab' page
    And the user enters 'ITAC TEST' in the 'Force Upper Case Field'
    Then the user clicks on the 'Toolbar Save Button'
    And the user clicks on the 'Back Button'
    Then the user is on the 'Reference Docs' page
    And the user filters the column by column name 'Progressive', 'like', 'ProgressiveValue'
    And the user clicks on the link value 'ProgressiveValue' on the grid
    Then the user is on the 'Summary' page     
    When the user clicks on the 'Edit Button'

	#Step 3 & 4
	And the user clicks on the 'Configurator Button'
	Then the user validates that the 'GUI Configurator On' is displayed
	And the user clicks on the 'Field Entity Selector Settings Icon'
	Then the 'Gui Configurator Popup' is visible
	
	#Step 5
	When the user enters 'CUST2 - Customer Master' in the 'GUI Name Field'
	When the user clicks on the 'Allow Null Open Icon'
	Then the 'Value Field' is visible
	When the user clicks on the 'Value Dropdown Icon'
	And the user clicks on the 'Value False Dropdown Option'
	And the user clicks on the 'Value Popup Ok Button'
	And the user clicks on Ok button on the popup 'Gui Configurator'
	Then the user validates that the 'Field Entity Selector Mandatory Icon' is displayed

	#Step 6 & 7
    When the user clicks on the 'Save Configuration Button'
	Then the user validates that the 'Save Success Toast Message' is displayed
    And the user validates that the 'Field Entity Selector Mandatory Icon' is displayed
	When the user clicks on the 'Configurator Button'

	#Step 8
	When the user selects 'Today' from calendar icon 'Event Test Type Calendar Icon'
    And the user clicks on the 'Field Examples'
    Then the user is on the 'Available Fields Tab' page
    When the user enters 'ITAC Test' in the 'Textbox Field'
    And the user selects 'voice1' in the combo box 'Combo Field'
    And the user clicks on the 'Field Validation Button'
    Then the user is on the 'Field Validation Tab' page
    And the user enters 'ITAC TEST' in the 'Force Upper Case Field'
    When the user clicks on the 'Summary'
	Then the user is on the 'Summary' page
	Then 'Toolbar Error Message Field' is populated with 'Field Entity Selector: Mandatory field empty'

	#Step9
    When the user clicks on the 'Field Entity Selector Dropdown Icon'
	And the user handles the loading screen
	When the user selects a row by row number '2'
	And the user clicks on Ok button on the popup 'Customer Master'
	And the user handles the loading screen
	Then the user validates the 'Toolbar Error Message Field' has no text

	#Step10 - 11 - 12
	When the user clicks on the 'Configurator Button'
	Then the user validates that the 'GUI Configurator On' is displayed
	When the user clicks on the 'Field Entity Selector Settings Icon'
	Then the 'Gui Configurator Popup' is visible
    When the user clicks on the 'Allow Null Open Icon'
	Then the 'Value Field' is visible
	When the user clicks on the 'Value Dropdown Icon'
	And the user clicks on the 'Value True Dropdown Option'
	And the user clicks on the 'Value Popup Ok Button'
	And the user clicks on Ok button on the popup 'Gui Configurator'
	When the user clicks on the 'Save Configuration Button'
	Then the user validates that the 'Save Success Toast Message' is displayed
	When the user clicks on the 'Configurator Button'
	And the user handles the loading screen
	Then the user validates 'Field Entity Selector Mandatory Icon' is not visible