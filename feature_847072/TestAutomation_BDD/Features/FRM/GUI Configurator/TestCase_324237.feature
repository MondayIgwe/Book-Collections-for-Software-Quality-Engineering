Feature: TestCase_324237

When the ALLOW NULL Property = TRUE set for Numeric Box Field, then the Numeric Box field is mandatory
When the ALLOW NULL Property = FALSE set for Numeric Box Field, then the Numeric Box field is optional

Scenario: WEB_FRM_CONFIGURATOR_NUMERIC_BOX_FIELD_ALLOW_NULL
	
	#Step 1-2
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

	#Step 3-7
	And the user clicks on the 'Configurator Button'
	Then the user validates that the 'GUI Configurator On' is displayed
	And the user clicks on the 'Num 1 Settings Icon'
	Then the 'Gui Configurator Popup' is visible
	When the user clicks on the 'Allow Null Open Icon'
	Then the 'Value Field' is visible
	When the user clicks on the 'Value Dropdown Icon'
	And the user clicks on the 'Value False Dropdown Option'
	And the user clicks on the 'Value Popup Ok Button'
	And the user clicks on Ok button on the popup 'Gui Configurator'
	Then the user validates that the 'Num 1 Mandatory Icon' is displayed
	When the user clicks on the 'Save Configuration Button'
	Then the user validates that the 'Save Success Toast Message' is displayed
    And the user validates that the 'Num 1 Mandatory Icon' is displayed
	When the user clicks on the 'Configurator Button'
	When the user clears the text from 'Num 1 Field' element
	Then 'Num 1 Field' is populated with '0.00'

	#Step 9-14
    And the user clicks on the 'Configurator Button'
	Then the user validates that the 'GUI Configurator On' is displayed
	And the user clicks on the 'Num 1 Settings Icon'
	Then the 'Gui Configurator Popup' is visible
	When the user clicks on the 'Allow Null Open Icon'
	Then the 'Value Field' is visible
	When the user clicks on the 'Value Dropdown Icon'
	And the user clicks on the 'Value True Dropdown Option'
	And the user clicks on the 'Value Popup Ok Button'
	And the user clicks on Ok button on the popup 'Gui Configurator'
	Then the user validates 'Num 1 Mandatory Icon' is not visible