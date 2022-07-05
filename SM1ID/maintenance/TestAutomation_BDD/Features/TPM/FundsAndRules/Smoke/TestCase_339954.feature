Feature: TestCase_339954

@BDD_339954 @PROMO_Regression @FundsAndRules @PROMO_Smoke
Scenario: TPM_FR_W_SMOKE_R81V1_0012 - F&R Switch In Edit
	#Step 1 - Open @FUND_1
	Given the user navigates to the 'Funds & Rules' page
	When the user filters the column by column name 'Funds & Rules code', Filter Type 'Like', Value '<FUND_1>'
	And the user opens the grid item in row '1'
	#2 Switch to Edit
	Then the user validates that the Loading Mask is not present
	When the user clicks on 'Button' with value 'Edit'
	Then the user validates that the 'Toolbar Error Icon' is present
	And the user validates that the 'Save Button' is visible
	When the user clicks on the 'Toolbar Error Icon'
	Then the user validates that the 'Containing Text In Table Cell' with value 'Constraint Code [1] - Family' is present
	And the user validates that the 'Containing Text In Table Cell' with value 'Customers' is not present
	When the user clicks on 'Popup Cancel Button' with value 'Notifications'
	#3 Change some fields in the Summary (eg. Change @Description, Add @Category Y in the selector, change Validity Period)
	And the user enters '<Description>' in field 'Input By Label Name' with value 'Description'
	And the user selects validity period from: 'd/m/y' to: 'd+1/m/y' on the 'Validity Period Start Date' field
	And the user clicks on the 'Alert Dialog Ok Button'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Product Groups'
	And the user clicks on 'PopUp Grid CheckBox' with value '<Category>'
	And the user clicks on 'Popup Ok Button' with value 'Product level' 
	Then the user validates that 'Start Date' with value 'Sell-in' has text 'd/m/y'
	And the user validates that 'End Date' with value 'Sell-in' has text 'd+1/m/y'
	And the user validates that 'Input By Label Name' with value 'Description' has text '<Description>'
	And the user validates that 'Input By Label Name' text with value 'Product Groups' contains '<Category>'
	#4 Change some fields in the Constraints tab (eg. Change Start, End date of costraints)
	When the user clicks on side panel 'Constraints'
	And the user opens the trigger on column 'Start Date' and Row '2,400.0000'
	And the user selects a date 'd/m/y' from grid calendar
	And the user moves the focus away from the element
	And the user opens the trigger on column 'End Date' and Row '2,400.0000'
	And the user selects a date 'd+1/m/y' from grid calendar
	And the user moves the focus away from the element
	And the user opens the trigger on column 'Start Date' and Row '1,200.0000'
	And the user selects a date 'd/m/y' from grid calendar
	And the user moves the focus away from the element
	And the user opens the trigger on column 'End Date' and Row '1,200.0000'
	And the user selects a date 'd+1/m/y' from grid calendar
	And the user moves the focus away from the element
	Then the user validates that column 'Start Date' has 'd/m/y' with row number '1'
	And the user validates that column 'End Date' has 'd+1/m/y' with row number '1'
	#5 From Summary, change WF, try to set the "Confirmed" status
	When the user clicks on side panel 'Summary'
	And the user changes the status to 'Confirm'
	#The transition is prevented because there are Expired Customers.
	Then the user validates that the 'Alert Dialog Message Box' is visible
	When the user clicks on the 'Error Popup Ok Button'
	And the user clicks on 'Popup Cancel Button' with value 'Change Status'
	#6 Try to save
	And the user clicks on the 'Save Button'
	Then the user validates that the 'Alert Dialog Message Box' is visible
	When the user clicks on the 'Error Popup Ok Button'
	#7 Close @FUND_1 w/o saving
	And the user closes all pages without saving the work done
	#8 Open @FUND_2
	When the user filters the column by column name 'Funds & Rules code', Filter Type 'Like', Value '<FUND_2>'
	And the user opens the grid item in row '1'
	#9 Switch to Edit
	Then the user validates that the Loading Mask is not present
	When the user clicks on 'Button' with value 'Edit'
	Then the user validates that the 'Save Button' is visible
	When the user changes the status to 'Modified'
	And the user clicks on side panel 'Summary'
	And the user enters '<Description>' in field 'Input By Label Name' with value 'Description'
	Then the user validates that 'Input By Label Name' with value 'Status' has text 'Draft'
	And the user validates that 'Input By Label Name' with value 'Description' has text '<Description>'
	#10 Close @FUND_2
	When the user closes all pages without saving the work done
	#11 Open @FUND_3
	When the user filters the column by column name 'Funds & Rules code', Filter Type 'Like', Value '<FUND_3>'
	And the user opens the grid item in row '1'
	#12 Switch to Edit
	Then the user validates that the Loading Mask is not present
	And the user validates that the 'Segmented Parent Button' is not displayed
	And the user validates that the 'Save Button' is not present
	And the user validates that the 'Input By Label Name' with value 'Description' is disabled
	#13 Close @FUND_3 
	When the user closes all pages without saving the work done
	#14 Open @FUND_4
	When the user filters the column by column name 'Funds & Rules code', Filter Type 'Like', Value '<FUND_4>'
	And the user opens the grid item in row '1'
	#15 Switch to Edit
	Then the user validates that the Loading Mask is not present
	When the user clicks on 'Button' with value 'Edit'
	Then the user validates that the 'Save Button' is visible
	#No msg is shown for Expired Customers.
	 Then the user validates that the 'Visible Toolbar Error Icon' is not present
	#16 Change some fields in the Summary (eg. Change @Description, Add @Category Y in the selector, change Validity Period)
	When the user enters '<Description>' in field 'Input By Label Name' with value 'Description'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Product Groups'
	And the user clicks on 'PopUp Grid CheckBox' with value '<Category>'
	And the user clicks on 'Popup Ok Button' with value 'Product level' 
	Then the user validates that 'Input By Label Name' with value 'Description' contains text '<Description>'
	And the user validates that 'Input By Label Name' text with value 'Product Groups' contains '<Category>'
	#17 Try to save
	When the user clicks on the 'Save Button'
	Then the user validates that the 'Toolbar Error Icon' is present
	When the user clicks on the 'Toolbar Error Icon'
	Then the user validates that the 'Containing Text In Table Cell' with value 'The following customers are not valid' is present
	When the user closes all pages without saving the work done


Examples:
	| FUND_1 | Description                   | Category | FUND_2 | FUND_3 | FUND_4 |
	| 30     | Some writing appeared here... | 09       | 32     | 33     | 34     |
