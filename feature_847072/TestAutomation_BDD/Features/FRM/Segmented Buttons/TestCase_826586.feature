Feature: TestCase_826586

When the button is on VIEW, the document will be in read-only mode, and the Save button will be disabled.
When the button is on EDIT, the document will be locked, the fields and grids can be edited (according to the document status) and the Save button will be enabled.
When unlocking the document after editing and without saving, will appear a dialog box warning about unsaved changes, asking the user to save changes before switching on VIEW:
(YES) save changes and switch on VIEW
(NO) discard changes and switch on VIEW
(CANCEL) keep editing in the UI with the lock on


Scenario: SEGMENTED_BUTTON_VIEW/EDIT - Check segmented button's behavior
	
	# Step1 and 2
	Given the user is on the 'Users' page

	#Step 3
	When the user clicks on the 'User Code' column link value '<UserCodeExample>' on the grid

	#Step 4
	Then the user validates the 'View Segmented Button' is enabled
	And the user validates the 'Edit Segmented Button' is enabled

	#Step 5
	When the user clicks on the 'Edit Segmented Button'
	Then the user validates the 'Toolbar Save Button' is enabled

	When the user enters '<JuridicalNatureExample>' in the 'Juridical Nature Field'
	When the user clicks on the 'View Segmented Button'
	Then 'Save Warning Popup Text' is populated with 'There are unsaved changes.Do you want to save them before switching on VIEW mode?'

	When the user clicks on the 'Save Warning Popup No Button'
	Then the user validates that 'Juridical Nature Field' is read-only

	When the user clicks on the 'Edit Segmented Button'
	Then the user validates the 'Toolbar Save Button' is enabled

	When the user enters '<NumberExample>' in the 'Number Field'
	When the user clicks on the 'View Segmented Button'
	Then 'Save Warning Popup Text' is populated with 'There are unsaved changes.Do you want to save them before switching on VIEW mode?'

	When the user clicks on the 'Save Warning Popup Yes Button'
	Then the user validates that 'Number Field' is read-only
	And 'Number Field' is populated with '<NumberExample>'

	#Step 5
	When the user clicks on the 'Edit Segmented Button'
	Then the user validates the 'Toolbar Save Button' is enabled

	When the user enters '<FiscalCodeExample>' in the 'Fiscal Code Field'
	When the user clicks on the 'View Segmented Button'
	Then 'Save Warning Popup Text' is populated with 'There are unsaved changes.Do you want to save them before switching on VIEW mode?'

	When the user clicks on the 'Save Warning Popup Cancel Button'

	Then the user validates the 'Fiscal Code Field' is enabled
	And 'Fiscal Code Field' is populated with '<FiscalCodeExample>'
   	Then the user validates the 'Toolbar Save Button' is enabled

	Examples: 
	| UserCodeExample| JuridicalNatureExample   | NumberExample | FiscalCodeExample   |
	| ATALABA        | INDIVIDUAL               | 123445        | MTS SM1 84R11 Z144H |          

	
