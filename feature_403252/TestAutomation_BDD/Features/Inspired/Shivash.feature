Feature: Shivash
	Test

@mytag
Scenario: Test

    #Step 1
    Given the user is on the 'Reference Docs' page
    When the user opens the grid item in row '3'
    And the user clicks on the 'Toolbar Configurator Switch'
    And the user clicks on the 'Manage Configurations Button'
    Then the user validates that 'K1' is in the grid
