Feature: TestCase_826587
	Check the behavior of segmented buttons when the EDIT right is disabled


Scenario: SEGMENTED_BUTTON_EDIT_RIGHT_DISABLED - verify segmented button when edit right disabled


	# Open the Balances navigator (the one from Claims section)
	Given the user is on the 'Balances' page

	# Open an existing balance document
	When the user clicks on the 'Balances' column link value '<BalanceId>' on the grid

	# Verify if the segmented buttons are visible
	Then the 'View Segmented Button' is not visible
	And the 'Edit Segmented Button' is not visible
	And the 'Toolbar Save Button' is not visible
	
	When the user clicks on the 'Back Button'
	And the user clicks on the 'Add Button'
	And the user clicks OK button in the 'New Balance' popup
	And the user handles the loading screen

  # Verify if the segmented buttons are visible
    Then the user validates the 'View Segmented Button' is disabled
	And the 'Edit Segmented Button' is enabled
	And the 'Toolbar Save Button' is enabled 

	Examples:
		| BalanceId |
		| 1         |

