Feature: TestCase_209599
	Validates the functionality of the Switch Toggle Control

@BDD_TC209599 @FRM_Nightly
Scenario: FRM_REFDOC_SWITCHCONTROL_001

    # Step 1 - Open Reference Docs navigator -> Open a Reference Doc UI in read only
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '470101'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user clicks on the link with value 'ProgressiveValue' on the grid
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'

    # Step 2 - Go on Field Examples tab -> Click on top of the Switch Control
    # Expected result - Switch control is disabled and displayed in read only 
    Then the user validates that the 'Switch Toggle Button' is displayed
    And the user validates the 'Switch Toggle Button' is disabled

    # Step 3 - Press Edit button -> Click on top of the toggle control 
    When the user clicks on 'Button' with value 'Edit'
    And the user clicks on the 'Switch Toggle Button'

    # Expected result - Switch control is ON
    Then the user validates that the 'On Switch Toggle Button' is displayed

    # Step 4 - Click again on top of the toggle control 
    When the user clicks on the 'Switch Toggle Button'

    # Expected result - Switch control is OFF
    Then the user validates that the 'Off Switch Toggle Button' is displayed