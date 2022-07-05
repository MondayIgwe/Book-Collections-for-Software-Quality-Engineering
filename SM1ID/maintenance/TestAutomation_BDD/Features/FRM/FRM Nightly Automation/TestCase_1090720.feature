Feature: TestCase_1090720
	The scope of the test is to check if the status of the balance document can be changed when the document don't use anomalies

@BDD_TC1090720 @FRM_Nightly
Scenario: WEB_FRM_DOCUMENT_WORKFLOW_NO_ANOMALIES

     #Open Balances Navigator and click on Add
     Given the user navigates to the 'Balances' page
	 When the user clicks on the 'Add Button'

	 #Go to the new balance UI and change the workflow status of the document from New to Proposed
	 And the user clicks on the 'OK Button'
	 And the user clicks on 'Side Panel Tab' with value 'Workflow'
	 Then the user validates that 'Input By Label Name' with value 'Current status' has text 'New'
	 When the user changes the status to 'To be Approved'
	 Then the user validates that 'Input By Label Name' with value 'Current status' has text 'Proposed'