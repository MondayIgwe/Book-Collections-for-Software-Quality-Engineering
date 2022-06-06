Feature: TestCase_470435
	Validates the Gui Configurator 'Expanded' and 'Collapsible' checkbox functionality in the General Info sub tab
@BDD_TC470435 @FRM_NoParr_Nightly
Scenario: WEB_FRM_CONFIGURATOR_EXPANDED_CARD_SECTION_NOT_COLLAPSIBLE_02

    # Step 1 - Login and create a new Reference doc from scratch and view it
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc 'Today' 'Today' 'Test' 'voice1' 'Today' 'Test470435'
    And the user filters the column by column name 'Progressive', 'Like', 'ProgressiveValue'
    And the user opens the grid item in row '1'

    # Step 2 - Turn on the UI configurator 
    And the user clicks on the 'Gui Configurator Button'
    Then the user validates that the 'Switched On Gui Configurator' is displayed

    # Step 3 - Select "Summary" tab and then select "General Info" sub-tab
    When the user clicks on 'Side Panel Tab' with value 'Summary'
    And the user clicks on 'Top Tab' with value 'General Info'

    # Step 4 - Click on settings key icon of the "Main" card section
    And the user clicks on 'Top Tab Sub Section Settings Icon' with value 'Menu'

    # Step 5 - Set the "collapsible" property to FALSE 
    And the user unchecks the 'Checkbox By Label' with value 'Collapsible'

    # Expected result - 
    Then the user validates that the 'Checkbox By Label' with value 'Expanded' is disabled
    And the user validates that 'Checkbox By Label' with value 'Expanded' is marked as: 'true'

    # Step 6 - Apply the configuration
    When the user clicks on the 'OK Button'

    # Step 7 - Click again on settings key icon of the "Menu" card section
    And the user clicks on 'Top Tab Sub Section Settings Icon' with value 'Menu'

    # Expected result - The "expanded" property is read-only and always set to expanded (true)
    Then the user validates that the 'Checkbox By Label' with value 'Expanded' is disabled

    # Step 9 - Set the "collapsible" property to TRUE
    When the user checks the 'Checkbox By Label' with value 'Collapsible'

    # Expected result - 
    # The "Collapsible" property is set to TRUE (checked)
    # The "Expanded" property is enabled and always set to expanded (true)
    Then the user validates that the 'Checkbox By Label' with value 'Expanded' is enabled
    And the user validates that 'Checkbox By Label' with value 'Expanded' is marked as: 'true'

    # Step 10 - Set the "expanded" property to FALSE and leave the "collapsible" property to true
    When the user unchecks the 'Checkbox By Label' with value 'Expanded'
    Then the user validates that 'Checkbox By Label' with value 'Collapsible' is marked as: 'true'

    # Step 11 - apply the configuration
    When the user clicks on the 'OK Button'

    # Expected result - The "Menu" card section is collapsed
    Then the user validates that the 'Input By Label Name' with value 'D1' is not displayed
