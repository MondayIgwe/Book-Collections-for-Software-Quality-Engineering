Feature: TestCase_412486

@BDD_412486 @PLAN_Weekly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_CALENDAR_Scheduling_001
	# Step 1 - Go to IBP Planning Calendar
	Given the user navigates to the 'IBP Calendar' page

	# Step 2 - Click on the "+" button
	When the user clicks on the 'Add Button'
	
	# Step 3 - Fill @Description, Select @ProcessID, select @Type, Press on the "OK" button
	Then the user validates that the 'Popup' with value 'New Planning Calendar' is displayed
	When the user enters '<Description>' in field 'Input By Label Name' with value 'Description'
	And  the user clicks on 'Generic Drop Down Trigger' with value 'Process ID'
	And the user select value '<ProcessID>' from dropdown list 'Generic Drop Down Trigger'
	And  the user clicks on 'Generic Drop Down Trigger' with value 'Type'
	And the user select value '<Type>' from dropdown list 'Generic Drop Down Trigger'
	And the user clicks on 'Popup Ok Button' with value 'New Planning Calendar'
	
	# Step 4 -Press on the "+" button to add an activity
	And the user clicks on 'Button Acton link' with value containing 'add'

	# Step 5 - Add @Activity with @Frequency
	And the user filters the column by column name 'Activity', Filter Type 'Like', Value '<Activity>'
	And the user filters the column by column name 'Frequency', Filter Type 'Like', Value '<Frequency>'

	# Step 6 & 7 - Save and Close the calendar
	And the user closes all pages without saving the work done
	
	# Step 7 - Click on the "Refresh" button in the IBP Calendar navigator
	And the user clicks on 'Button Acton link' with value containing 'refresh'

	# Step 8 - Check the "Enable" button is disabled
	Then the user validates that the 'Button Acton link' with value 'ENABLE' is disabled

	# Step 9 - Select the calendar created above @Description, @ProcessID, @Type, @Division
	When the user filters the column by column name 'Division', Filter Type 'Like', Value '<Division>'
	And the user filters the column by column name 'Cod process', Filter Type 'Like', Value '<ProcessID>'
	And the user filters the column by column name 'Type', Filter Type 'Like', Value '<Type>'

	# Step 10 - Check the "Enable" button becomes disabled
	Then the user validates that the 'Button Acton link' with value 'ENABLE' is disabled

	Examples:
	| Description | ProcessID | Type      | Activity     | Frequency | Division | 
	| new7        | CBP       | On demand | Status Reset | Run once  | AUTOM2   | 