Feature: TestCase_323517

When the ALLOW NULL Property = TRUE set for Logical Field Combo, then the Logical Field Combo is mandatory
When the ALLOW NULL Property = FALSE set for Logical Field Combo, then the Text Box field is optional

Scenario: WEB_FRM_LOGICAL_FIELD_COMBO_ALLOW_NULL 

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
    When the user clicks on the 'Edit Segmented Button'
    And the user clicks on the 'Field Examples'
    Then the user is on the 'Available Fields Tab' page
    And the user validates that the 'Combo Field Mandatory Icon' is displayed
    And 'Combo Field' is populated with 'voice1'

	When the user clicks on the 'Configurator Button'
	Then the user validates that the 'GUI Configurator On' is displayed
	When the user clicks on the 'Combo Field Settings Icon'
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
	Then the user validates 'Combo Field Mandatory Icon' is not visible