Feature: TestCase_470321
	Validates the Gui Configurator 'Expanded' checkbox functionality

@BDD_TC470321 @FRM_NoParr_Nightly
Scenario: WEB_FRM_CONFIGURATOR_EXPANDED_SECTION_COLLAPSIBLE_01

    # Step 1 - Login and create a new Reference doc from scratch and view it
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '470321'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user clicks on the link with value 'ProgressiveValue' on the grid

    # Step 2 - Turn on the UI configurator 
    And the user clicks on the 'Gui Configurator Button'

    # Step 3 - Select "Grids Examples" tab and then select "List Grid with Drag & Drop" sub-tab
    And the user clicks on 'Side Panel Tab' with value 'Grids Examples'
    And the user clicks on 'Top Tab' with value 'List Grid With Drag & Drop'

    # Step 4 - Click on settings key icon of the "SM1.LogicalListGrid 1" section
    And the user clicks on 'Top Tab Sub Section Settings Icon' with value 'SM1.LogicalListGrid 1'

    # Expected result - The "expanded" checkbox property is visible
    Then the user validates that the 'Checkbox By Label' with value 'Expanded' is displayed

    # Step 6 - Set the "expanded" property to TRUE and apply this configuration
    When the user checks the 'Checkbox By Label' with value 'Expanded'
    And the user clicks on the 'OK Button'

    # Expectd result - The "SM1.LogicalListGrid 1" section is expanded
    Then the user validates that the 'Logical ListGrid 1 Item' with value 'Position: 0' is displayed

    # Step 7 - Click again on settings key icon of the "SM1.LogicalListGrid 1" section
    When the user clicks on 'Top Tab Sub Section Settings Icon' with value 'SM1.LogicalListGrid 1'

    # Step 8 - Set the "expanded" property to FALSE and apply this configuration
    And the user unchecks the 'Checkbox By Label' with value 'Expanded'
    And the user clicks on the 'OK Button'

    # Expected result - The "SM1.LogicalListGrid 1" section is collapsed
    Then the user validates that the 'Logical ListGrid 1 Item' with value 'Position: 0' is not present

    # Step 9 - Save the configuration and the turn OFF the UI configurator
    When the user clicks on 'Button' with value 'Save'
    And the user clicks on the 'Gui Configurator Button'
    And the user switches the configurator 'off'

    # Step 10 - Close the UI and reopen it 
    And the user clicks on the 'Toolbar Close Button'
    And the user opens the grid item in row '1'

    # Step 10 - Select "Grids Examples" tab and then select "List Grid with Drag & Drop" sub-tab
    And the user clicks on 'Side Panel Tab' with value 'Grids Examples'
    And the user clicks on 'Top Tab' with value 'List Grid With Drag & Drop'

    # Expected result - The "SM1.LogicalListGrid 1" section is collapsed
    Then the user validates that the 'Logical ListGrid 1 Item' with value 'Position: 0' is not present
