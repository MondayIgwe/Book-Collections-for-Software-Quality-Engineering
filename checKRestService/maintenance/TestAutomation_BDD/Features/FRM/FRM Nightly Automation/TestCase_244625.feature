Feature: TestCase_244625
	Validates the Configurable Object field in Field Examples Tab

@BDD_TC244625 @FRM_Nightly
Scenario: FRM_REFDOC_CONFIGURABLEOBJECT_001

    # Step 1 - 2 Login and Open any reference document
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '244625'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user clicks on the link with value 'ProgressiveValue' on the grid

    # Step 3 - Go to Field Examples Tab 
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'

    # Validation - Configurable Object field is displayed, not mandatory, disabled 
    Then the user validates that the 'Configurable Object Reference Field' is visible
    And the user validates the 'Configurable Object Reference Field' is disabled

    # Step 4 - Click on Edit button
    When the user clicks on 'Segmented Button' with value 'Edit'

    # Validation - Configurable Object field is enabled
    Then the user validates the 'Configurable Object Reference Field' is enabled

    # Step 5 - Open Configurable Object field and select "SM1.LogicalAboutPopup" object
    When the user select value 'SM1.LogicalAboutPopup' from dropdown list 'Configurable Object Reference'

    # Validation - Value is inserted in the input of Configurable Object Feld
    Then the user validates that 'Configurable Object Reference Field' is populated with 'SM1.LogicalAboutPopup'

    # Step 6 - Click on "three lines" button 
    When the user clicks on the 'Configurable Object Reference Open Trigger'

    # Validation - Info popup "Configurator is disabled on this component" is displayed
    Then the user validates that the 'Alert Dialog Message Box' is visible
    And the user validates that 'Alert Dialog Message Box' is populated with 'Configurator is disabled on this component'
