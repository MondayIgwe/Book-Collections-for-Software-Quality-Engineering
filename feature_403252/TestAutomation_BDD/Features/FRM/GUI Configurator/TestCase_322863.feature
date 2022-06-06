Feature: TestCase_322863

When the ALLOW NULL Property = TRUE set for Text Area Field, then the Text Area field is mandatory
When the ALLOW NULL Property = FALSE set for Text Area Field, then the Text Area field is optional

Scenario: WEB_FRM_LOGICAL_FIELD_TEXTAREA
	
	#Step 1 & 2
    Given the user is on the 'Reference Docs' page
    When the user clicks on the 'Add Button'
    And the user selects 'Today' from calendar icon 'Date 1 Calendar Icon'
    And the user selects 'Today' from calendar icon 'Date 2 Calendar Icon'
    And the user clicks OK button in the 'Reference Doc Detail Popup' popup
    Then the user is on the 'Summary Tab' page
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
    And the user clicks on the 'Toolbar Close Button'
    Then the user is on the 'Reference Docs' page
    And the user filters the column by column name 'Progressive', 'like', 'ProgressiveValue'
    And the user clicks on the link value 'ProgressiveValue' on the grid
    Then the user is on the 'Summary Tab' page     
    When the user clicks on the 'Edit Segmented Button'

	#Step 3 & 4
	And the user clicks on the 'Configurator Button'
	Then the user validates that the 'GUI Configurator On' is displayed
	And the user clicks on the 'D2 Field Settings Icon'
	Then the 'Gui Configurator Popup' is visible
	
	#Step 5
	When the user clicks on the 'Allow Null Open Icon'
	Then the 'Value Field' is visible
	When the user clicks on the 'Value Dropdown Icon'
	And the user clicks on the 'Value False Dropdown Option'
	And the user clicks on the 'Value Popup Ok Button'
	And the user clicks on Ok button on the popup 'Gui Configurator'
	And the user handles the loading screen
	Then the user validates that the 'D2 Field Mandatory Icon' is displayed

	#Step 6 & 7
    When the user clicks on the 'Save Configuration Button'
	Then the user validates that the 'Save Success Toast Message' is displayed
    And the user validates that the 'D2 Field Mandatory Icon' is displayed
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
	Then the user is on the 'Summary Tab' page
	Then 'Toolbar Error Message Field' is populated with 'D2: Mandatory field empty'

	#Step9
    When the user enters 'test' in the 'D2 Field'
	And the user moves the focus away from the element
	Then the user validates the 'Toolbar Error Message Field' has no text

	#Step10 - 11 - 12
	When the user clicks on the 'Configurator Button'
	Then the user validates that the 'GUI Configurator On' is displayed
	When the user clicks on the 'D2 Field Settings Icon'
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
	Then the user validates 'D2 Field Mandatory Icon' is not visible