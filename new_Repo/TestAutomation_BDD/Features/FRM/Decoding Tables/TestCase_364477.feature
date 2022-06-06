Feature: TestCase_364477
	The information from new decoding table popup must be present also on the heder information of the Decoding Table UI


@BDD_364477 @FRM
Scenario: WEB_FRM_DECODING_TABLES_NEW_POPUP -Check the new table popup and the header info of decoding table UI

    # Open New Decoding Table popup and check every field
	Given the user navigates to the 'DECODING TABLE' page
	When the user clicks on the 'Add Button'
	Then the user validates that the 'Popup' with value 'NEW system table' is displayed
    And the user validates that the 'Input By Label Name' with value 'Configuration Type' is disabled
    And the user validates that the 'Configuration Type Mandatory Icon' is displayed
	And 'Configuration Type Field' is populated with 'SM1'
	And the user validates that the 'Input By Label Name' with value 'Creation Date' is disabled
	And the user validates the 'Creation Date' is not empty
	And the user validates that the 'Input By Label Name' with value 'Last Maintenance Date' is disabled
	And the user validates that the 'Last Maintenance Date Mandatory Icon' is displayed
    And the user validates the 'Last Maintenance Date Field' is not empty
	And the user validates that the 'Division Mandatory Icon' is displayed
	And the user validates that the 'Input By Label Name' with value 'Division' is enabled
	And the user validates the 'Division Field' is not empty
	And the user validates that the 'Table Code Mandatory Icon' is displayed
	And the user validates that the 'Input By Label Name' with value 'Table Code' is enabled
	And the user validates that the 'Description Mandatory Icon' is displayed
	And the user validates that the 'Input By Label Name' with value 'Description' is enabled
	And the user validates that the 'Input By Label Name' with value 'Process' is enabled
	And 'Process Field' is populated with 'COMM - Customizations - Default Module when table is created in SM1 system'
	And the user validates the 'OK Button' is disabled

	# Fill in the Table Code and Description fields
	When the user enters 'TEST AUTOMATION' in field 'Input By Label Name' with value 'Table Code'
	And the user clicks on the 'Process Field'
    Then the user validates the 'OK Button' is disabled
	When the user enters 'BDD AUTOMATION' in field 'Input By Label Name' with value 'Description'
	And the user clicks on the 'Process Field'
    Then the user validates the 'OK Button' is enabled
	And the user validates that 'Input By Label Name' with value 'Table Code' has text 'TEST AUTOMATION'
	And the user validates that 'Input By Label Name' with value 'Description' has text 'BDD AUTOMATION'

	# Click on OK button
	When the user clicks on the 'OK Button'

	# Verify the information shown in the header of the UI
	Then the user validates that the 'Input By Label Name' with value 'Configuration Type' is disabled
	And the user validates that the 'Input By Label Name' with value 'Creation Date' is disabled
	And the user validates that the 'Input By Label Name' with value 'Division' is disabled
	And the user validates that the 'Input By Label Name' with value 'Table Code' is disabled
    And the user validates that the 'Input By Label Name' with value 'Process' is disabled
	And the user validates that the 'Input By Label Name' with value 'Last Maintenance Date' is disabled
	And the user validates the 'Creation Date' is not empty
	And the user validates the 'Last Maintenance Date Field' is not empty
    And the user validates the 'Last Maintenance Date Field' is not empty
	And the user validates that the 'Division Mandatory Icon' is displayed
	And the user validates that the 'Last Maintenance Date Mandatory Icon' is displayed
	And the user validates that the 'Configuration Type Mandatory Icon' is displayed
	And the user validates that the 'Table Code Mandatory Icon' is displayed
	And the user validates that the 'Description Mandatory Icon' is displayed
    And the user validates that 'Input By Label Name' with value 'Process' has text 'COMM - Customizations - Default Module when table is created in SM1 system'
	And the user validates that 'Input By Label Name' with value 'Table Code' has text 'TEST AUTOMATION'
	And the user validates that 'Input By Label Name' with value 'DESCRIPTION' has text 'BDD AUTOMATION'
	And the user validates that 'Input By Label Name' with value 'CONFIGURATION TYPE' has text 'SM1'