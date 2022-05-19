Feature: TestCase_247897
	Validate the 'Translation' field functionality 

    @BDD_TC247897 @FRM_Nightly
Scenario: FRM_REFDOC_CONFIGURABLETRANSLATION_001

    #  Step 1 - 2 Login to the web application and open a Reference doc in read only
	Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '247897'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user opens the grid item in row '1'

    # Step 3 - Go to 'Field Examples' tab
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'

    # Validation - Validate that the 'SM1.LogicalFieldTranslation' is displayed and disabled
    Then the user validates that the 'Input By Label Name' with value 'Translation' is displayed
    And the user validates that the 'Input By Label Name' with value 'Translation' is disabled

    # Step 4 - Click on the 'Edit' button
    When the user clicks on 'Button' with value 'Edit'

    # Validation - Validate that the 'SM1.LogicalFieldTranslation' is enabled and has text 'Translation test'
    Then the user validates that the 'Input By Label Name' with value 'Translation' is enabled
    And the user validates that 'Input By Label Name' with value 'Translation' has text 'Translation test'

    # Step 5 - Click on button embedded in 'SM1.LogicalFieldTranslation'
    When the user clicks on 'Trigger By Field Name' with value 'Translation'

    # Validation - Translation popup is opened without any issues
    Then the user validates that the 'Popup' with value 'Translations' is displayed
  