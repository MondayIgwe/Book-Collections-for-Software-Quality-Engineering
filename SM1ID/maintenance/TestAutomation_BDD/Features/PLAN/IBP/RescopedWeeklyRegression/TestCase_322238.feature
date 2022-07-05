Feature: TestCase_322238
	
@BDD_322238 @PLAN_Weekly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_WORKFLOW-CONFIRMED to CANCELLED
	# Step 1 - Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'

	# Step 3 - Expected - Document opens correctly
	Then the user validates that column 'Process Year' contains '<DocProcessYear>' with row text '<DocProcessYear>'
	When the user clicks on the link with value '<DocumentID>' on the grid
	And the user clicks on side panel 'IBP Plan Workflow Tab'

	# Step 3 - Change the document workflow status in @NewWkfStatus. 
	When the user clicks on 'Trigger By Field Name' with value 'Current status'
	Then the user validates that the 'Popup' with value 'Change Status' is present
	When the user checks the 'Radio Button' with value '<NewWkfStatus>'
	And the user double clicks on 'Popup Ok Button' with value 'Change Status'
	
	# Step 4 - The document workflow status has changed into @ChangedWkfStatus.
	When the user clicks on 'Text' with value 'History'
	Then the user validates that 'Text' with value '<ChangedWkfStatus>' has text '<ChangedWkfStatus>'

	# Step 5 - Save and Close the document
	When the user clicks on the 'Save Button'
	And the user closes all pages without saving the work done

	# Step 6 - In the navigator
	When the user clicks on the 'Back Button' if it exists
	And the user navigates to the 'IBP Documents' page
	And the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'

	# Step 7 - the document has the new status
	Then the user validates that 'Text' with value '<ChangedWkfStatus>' has text '<ChangedWkfStatus>'

	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | NewWkfStatus | ChangedWkfStatus | DocumentID |
	| CBP_2020       | SHELL_DEMO2_2 | 2       | 1        | Cancel       | Terminated       | 135        |