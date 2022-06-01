Feature: TestCase_406483
	Validate the Wizard with Validation popup

@BDD_406483 @FRM_Nightly
Scenario: FRM_REFDOC_WORKFLOW_002

    # Step 1 
    Given the user navigates to the 'Reference Docs' page

    # Step 2 
    When the user clicks on the 'Add Button'
    And the user enters '<Date1>' in field 'Input By Label Name' with value 'Date 1'
    And the user clicks on 'Generic Drop Down Trigger' with value 'Date 2'
    And the user clicks on the 'Today Button'
    And the user clicks on 'Popup Button' with value 'OK'

    # Step 3
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'
    And the user enters '<TextBox>' in field 'Input By Label Name' with value 'TEXTBOX'
    And the user select value '<Combo>' from dropdown list 'Combo'
    And the user clicks on 'Generic Drop Down Trigger' with value 'Entity Selector'
    And the user filters the column by column name 'Name', Filter Type 'Like', Value '<Entity>'
    And the user clicks on '<Entity>' text on the grid
    And the user clicks on 'Popup Button' with value 'OK'
    And the user clicks on 'Generic Drop Down Trigger' with value 'Date Picker'
    And the user clicks on the 'Today Button'
    And the user clicks on 'Horizontal Panel Tab' with value 'Field Validation'
    And the user enters '<ForceUpperCaseValidation>' in field 'Input By Label Name' with value 'Force Uppercase on validation'

    # Step 4
    And the user clicks on 'Side Panel Tab' with value 'Summary'
    And the user clicks on the 'Summary Current Status Trigger'
    Then the user validates that the 'Popup' with value 'Change Status' is displayed
    And the user validates that the 'Radio Button' with value 'Wf transition 1' is disabled

    # Step 5
    When the user clicks on 'Popup Button' with value 'Cancel'

    # Step 6
    And the user clicks on 'Side Panel Tab' with value 'Workflow'
    Then the user validates that the 'Workflow Current Status Trigger' is displayed

    When the user clicks on the 'Workflow Current Status Trigger'
    Then the user validates that the 'Popup' with value 'Change Status' is displayed
    And the user validates that the 'Radio Button' with value 'Wf transition 1' is disabled

    When the user clicks on 'Popup Button' with value 'Cancel'
    Then the user validates that column 'Description' has 'Anomaly Test2' with row text 'Anomaly Test2'

    # Step 7
    When the user clicks on 'Side Panel Tab' with value 'Summary'
    And the user enters '12/15/2030' in field 'Input By Label Name' with value 'Date 1'
    And the user enters '12/19/2030' in field 'Input By Label Name' with value 'Date 2'

    # Step 8
    And the user clicks on 'Side Panel Tab' with value 'Workflow'
    And the user clicks on the 'ReEvaluate Anomalies Button'
    Then the user validates that column 'Description' has 'Document description is missing' with row text 'Document description is missing'
    And the user validates that the grid has no text with value 'Anomaly Test2' on column 'Description'
    When the user clicks on the 'Workflow Current Status Trigger'
    Then the user validates that the 'Popup' with value 'Change Status' is displayed
    And the user validates that the 'Radio Button' with value 'Wf transition 1' is enabled
    
    # Step 9
    When the user clicks on 'Radio Button' with value 'Wf transition 1'
    And the user clicks on 'Popup Button' with value 'OK'
    Then the user validates that 'Workflow Current Status Textfield' is populated with 'Workflow state 2'
    And the user validates that the element 'Feedback Field' has text 'Transition successfully occured.'

    # Step 10
    When the user clicks on 'Side Panel Tab' with value 'Summary'
    And the user clicks on the 'Summary Current Status Trigger'
    Then the user validates that the 'Popup' with value 'Change Status' is displayed
    And the user validates that the 'Radio Button' with value 'Wf transition 3' is displayed
    And the user validates that the 'Radio Button' with value 'Wf transition 3' is disabled

    # Step 11
    When the user clicks on 'Popup Button' with value 'Cancel'

    # Step 12
    And the user clicks on 'Side Panel Tab' with value 'Workflow'
    And the user clicks on the 'ReEvaluate Anomalies Button'
    Then the user validates that column 'Description' has 'Document description is missing' with row text 'Document description is missing'

    # Step 13
    When the user clicks on 'Side Panel Tab' with value 'Summary'
    And the user clicks on the 'Summary Current Status Trigger'
    Then the user validates that the 'Popup' with value 'Change Status' is displayed
    And the user validates that the 'Radio Button' with value 'Wf transition 3' is disabled
    When the user clicks on 'Popup Button' with value 'Cancel'

    # Step 14
    And the user enters '<TextDescription>' in field 'Input By Label Name' with value 'D1'

    # Step 15
    And the user clicks on 'Side Panel Tab' with value 'Workflow'
    And the user clicks on the 'ReEvaluate Anomalies Button'

    # Step 16
    And the user clicks on the 'Workflow Current Status Trigger'
    Then the user validates that the 'Popup' with value 'Change Status' is displayed
    And the user validates that the 'Radio Button' with value 'Wf transition 3' is enabled

    # Step 17
    When the user clicks on 'Popup Button' with value 'Cancel'

    # Step 18
    And the user clicks on 'Side Panel Tab' with value 'Summary'
    And the user clicks on the 'Summary Current Status Trigger'
    Then the user validates that the 'Popup' with value 'Change Status' is displayed
    And the user validates that the 'Radio Button' with value 'Wf transition 3' is enabled

    # Step 19
    When the user clicks on 'Popup Button' with value 'Cancel'

    # Step 20
    And the user clears the text on the 'Input By Label Name' with value 'D1'

    # Step 21
    And the user clicks on the 'Summary Current Status Trigger'
    Then the user validates that the 'Popup' with value 'Change Status' is displayed
    And the user validates that the 'Radio Button' with value 'Wf transition 3' is enabled

    # Step 22
    When the user clicks on 'Popup Button' with value 'Cancel'

    # Step 23
    And the user clicks on 'Side Panel Tab' with value 'Workflow'
    And the user clicks on the 'ReEvaluate Anomalies Button'
    Then the user validates that column 'Description' has 'Document description is missing' with row text 'Document description is missing'

    # Step 24
    When the user clicks on the 'Workflow Current Status Trigger'
    Then the user validates that the 'Popup' with value 'Change Status' is displayed
    And the user validates that the 'Radio Button' with value 'Wf transition 3' is disabled

    # Step 25
    When the user clicks on 'Popup Button' with value 'Cancel'

    # Step 26
    And the user clicks on 'Side Panel Tab' with value 'Summary'
    And the user enters '<TextDescription>' in field 'Input By Label Name' with value 'D1'

    # Step 27
    And the user clicks on 'Side Panel Tab' with value 'Workflow'
    And the user clicks on the 'ReEvaluate Anomalies Button'
    Then the user validates that 'Toolbar Grid Record Count' is populated with '0/0'  

    # Step 28
    When the user clicks on 'Side Panel Tab' with value 'Summary'
    And the user clicks on the 'Summary Current Status Trigger'
    Then the user validates that the 'Radio Button' with value 'Wf transition 3' is displayed
    And the user validates that the 'Radio Button' with value 'Wf transition 3' is enabled

    # Step 29
    When the user clicks on 'Radio Button' with value 'Wf transition 3'
    And the user clicks on 'Popup Button' with value 'OK'
    Then the user validates that the element 'Feedback Field' has text 'Transition successfully occured.'

    Examples:
	| Anomalies1 | Anomalies2          | Date1      | Date2     | WFTransition1   | WFTransition2   | WFTransition3   | TextBox | Combo  | Entity             | DatePicker | ForceUpperCaseValidation | TextDescription |
	| TEXT 2     | MISSING_DESCRIPTION | 04/15/2020 |12/15/2022 | WF TRANSITION 1 | WF TRANSITION 2 | WF TRANSITION 3 | TEST    | voice1 | United Germany LTD | 12/15/2022 | TEST CHSTATE             | Test CHSTATE    |
