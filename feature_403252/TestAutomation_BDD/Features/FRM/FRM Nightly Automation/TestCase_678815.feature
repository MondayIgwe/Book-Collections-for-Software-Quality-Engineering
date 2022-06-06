Feature: TestCase_678815
	Validates the functionality of the stateless column checkbox

@BDD_TC678815 @FRM_NoParr_Nightly @FRM
Scenario: WEB_FRM_CHECK_IN_OPERATION_FOR_TEXT_AREA

    # Step 1 - 3 - Open the Reference Doc Navigator and View Any Document
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc 'Today' 'Today' 'Test' 'voice1' 'Today' 'Test'
    And the user filters the column by column name 'Progressive', 'Like', 'ProgressiveValue'
    And the user opens the grid item in row '1'

    # Step 4 - Switch on the Gui Configurator from Off to On
    And the user clicks on the 'Gui Configurator Button'

    # Expected result - Gui Configurator is set in  from Off to On
    Then the user validates that the 'Switched On Gui Configurator' is displayed

    # Step 5 - Go on Grid Exemples tab
    When the user clicks on 'Side Panel Tab' with value 'Grids Examples'

    # Step 6 - Tap on a key settings for the Gui configurator
    And the user clicks on the 'Grids Examples Grid Settings Icon'

    # Step 7 - Scroll down to Columns and select the checkbox for a Logical Text Area Column
    And the user clicks on 'Grid Checkbox' with value 'v9'

    # Step 8 - Tap on Row Details
    And the user clicks on 'GUI Configurator Popup Button' with value 'Row Detail'

    # Step 9 - Check the Enable In Operator checkbox
    And the user checks the 'Checkbox By Label' with value 'Enable IN operator'

    # Step 10 - Tap on OK
    And the user clicks on the 'OK Button'

    # Step 11 - Tap on the Qtab for a Text Area Column
    And the user scrolls to the 'Grid Filter' with value 'Text Area'
    And the user clicks on 'Grid Filter' with value 'Text Area'

    # Expected result - The IN field is visible
    Then the user validates that the 'Input By Label Name' with value 'In' is displayed

    # Step 13 - Write 'test hello plain sab txt state' values  on the IN field  and Loose focus over the field
    When the user enters 'test hello plain sab txt state' in field 'Input By Label Name' with value 'In'
    And the user moves the focus away from 'Input By Label Name' with value 'In' by pressing tab key

    # Expected result - LIKE/NOT LIKE  fields are empty
    Then the user validates that 'Input By Label Name' with value 'In' has text 'test;hello;plain;sab;txt;state'
    And the user validates that the 'Input By Label Name' with value 'Like' has no text
    And the user validates that the 'Input By Label Name' with value 'Not Like' has no text

    # Step 15 - Tap OK
    When the user clicks on the 'OK Button'

    # Step 16 - Go on Grid Examples tab
    # Step 17 - Tap on a key settings for the Gui configurator
    And the user clicks on the 'Grids Examples Grid Settings Icon'

    # Step 18 - Scroll down to Columns and select the checkbox for a Logical Text Area Column
    And the user clicks on 'Grid Checkbox' with value 'v9'

    # Step 19 - Tap on Row Details
    And the user clicks on 'GUI Configurator Popup Button' with value 'Row Detail'

    # Step 20 - Uncheck the EnableInOperator and tap ok
    And the user unchecks the 'Checkbox By Label' with value 'Enable IN operator'
    And the user clicks on the 'OK Button'

    # Step 21 - Tap on the Qtab for a Text Area Column 
    And the user clicks on 'Grid Filter' with value 'Text Area'

    # Expected result - The IN field should not be visible anymore and LIKE/NOT LIKE fields are visible
    Then the user validates that the 'Input By Label Name' with value 'In' is not present
    And the user validates that the 'Input By Label Name' with value 'Like' is displayed
    And the user validates that the 'Input By Label Name' with value 'Not Like' is displayed

    # Switch off the configration
    When the user clicks on 'Button' with value 'Cancel'
    And the user switches the configurator 'off'
    Then the user validates that the 'Switched On Gui Configurator' is not present





    