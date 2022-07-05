Feature: TestCase_412495

@BDD_412495 @PLAN_Weekly @PLAN @Regression @PLAN_Regression
Scenario: WEB_TPM_IBP_CALENDAR_Scheduling_005
	# Step 1 - Go to IBP Planning Calendar
	Given the user navigates to the 'IBP Calendar' page

	# Step 2 - Click on the "+" button
	When the user clicks on the 'Add Button'
	
	# Step 3 - Fill @Description, Select @ProcessID, select @Type, Press on the "OK" button
	Then the user validates that the 'Popup' with value 'New Planning Calendar' is displayed
	When the user enters '<Description>' in field 'Input By Label Name' with value 'Description'
	And  the user clicks on 'Generic Drop Down Trigger' with value 'Process ID'
	And the user select value containing '<ProcessID>' from dropdown list 'Generic Drop Down Trigger'
	And  the user clicks on 'Generic Drop Down Trigger' with value 'Type'
	And the user select value containing '<Type>' from dropdown list 'Generic Drop Down Trigger'
	And the user clicks on 'Popup Ok Button' with value 'New Planning Calendar'
	
	# Step 4 -Press on the "+" button to add an activity
	And the user clicks on 'Button Acton link' with value containing 'add'

	# Step 5 - Add @Activity with @Frequency
	And the user filters the column by column name 'Activity', Filter Type 'Like', Value '<Activity>'
	And the user filters the column by column name 'Frequency', Filter Type 'Like', Value '<Frequency>'

	# Step 6 & 7 - Save and Close the calendar
	And the user closes all pages without saving the work done
	
	# Step 8 - Click on the "Refresh" button in the IBP Calendar navigator
	And the user clicks on 'Button Acton link' with value containing 'refresh'

	# Step 9 - Repeat the steps from 2 to 10 for @Description1, @Type, @ProcessID, @Frequency, @Activity
	When the user clicks on the 'Add Button'
	Then the user validates that the 'Popup' with value 'New Planning Calendar' is displayed
	When the user enters '<Description1>' in field 'Input By Label Name' with value 'Description'
	And  the user clicks on 'Generic Drop Down Trigger' with value 'Process ID'
	And the user select value containing '<ProcessID>' from dropdown list 'Generic Drop Down Trigger'
	And  the user clicks on 'Generic Drop Down Trigger' with value 'Type'
	And the user select value containing '<Type>' from dropdown list 'Generic Drop Down Trigger'
	And the user clicks on 'Popup Ok Button' with value 'New Planning Calendar'
	And the user clicks on 'Button Acton link' with value containing 'add'
	And the user filters the column by column name 'Activity', Filter Type 'Like', Value '<Activity>'
	And the user filters the column by column name 'Frequency', Filter Type 'Like', Value '<Frequency>'
	And the user closes all pages without saving the work done

	# Step 10 - Click on the "Refresh" button in the IBP Calendar navigator
	And the user clicks on 'Button Acton link' with value containing 'refresh'

	# Step 11 - Check the states of the "Enabled", "Disable" The buttons are disabled
	Then the user validates that the 'Button Acton link' with value 'ENABLE' is disabled
	And the user validates that the 'Button Acton link' with value 'DISABLE' is disabled

	# Step 12 - Select the two calendars created above @Description, @ProcessID, @Type, @Division and @Description1, @ProcessID, @Type, @Division
	When the user filters the column by column name 'Description', Filter Type 'Like', Value '<Description>'
	And the user filters the column by column name 'Cod process', Filter Type 'Like', Value '<ProcessID>'
	And the user filters the column by column name 'Type', Filter Type 'Like', Value '<Type>'
	And the user filters the column by column name 'Division', Filter Type 'Like', Value '<Division>'

	And the user filters the column by column name 'Description', Filter Type 'Like', Value '<Description1>'
	And the user filters the column by column name 'Cod process', Filter Type 'Like', Value '<ProcessID>'
	And the user filters the column by column name 'Type', Filter Type 'Like', Value '<Type>'
	And the user filters the column by column name 'Division', Filter Type 'Like', Value '<Division>'

	# Step 13 - Check the states of the "Enabled", "Disable" The buttons are disabled
	Then the user validates that the 'Button Acton link' with value 'ENABLE' is disabled
	And the user validates that the 'Button Acton link' with value 'DISABLE' is disabled

	Examples:
	| Description | Description1 | ProcessID | Type      | Activity     | Frequency | Division |
	| NEW12       | NEW13        | CBP       | On demand | Status Reset | Run once  | AUTOM2   |