Feature: TestCase_987092

@BDD_987092 @SFA_Smoke
Scenario: Web_Customers_Attachments_And_Links
	#Step 1
	Given the user navigates to the 'Customer Master' page

	When the user filters the column by column name 'Level', Filter Type 'Like', Value 'Bill to + Ship to + POS'
	And the user opens the grid item in row '1'
	Then the user validates that the 'Side Panel Tab' with value 'Contact Info' is visible

	When the user retrieves the 'Input By Label Name' text with value 'Customer Code'
	And the user clicks on 'Side Panel Tab' with value 'Contact Info'
	Then the user validates that the 'Top Tab' with value 'Contacts' is visible

	When the user clicks on 'Top Tab' with value 'Contacts'
	Then the user validates that the 'Add Button' is visible

	When the user clicks on the 'Add Button'
	Then the user validates that the 'Input By Label Name' with value 'Title' is visible
	And the user validates that the 'Input By Label Name' with value 'Name' is visible

	And the user validates that the 'Input By Label Name' with value 'Last Name' is visible
	And the user validates that the 'Input By Label Name' with value 'Role 1' is visible

	When the user clicks on 'Input By Label Name' with value 'Title'
	And the user enters 'Mr.' in field 'Input By Label Name' with value 'Title'
	And the user presses the 'ENTER' key on the 'Input By Label Name' with the value 'Title'

	And the user clicks on 'Input By Label Name' with value 'Name'
	And the user enters 'Automation' in field 'Input By Label Name' with value 'Name'
	And the user presses the 'ENTER' key on the 'Input By Label Name' with the value 'Name'

	And the user clicks on 'Input By Label Name' with value 'Last Name'
	And the user enters 'Tester' in field 'Input By Label Name' with value 'Last Name'
	And the user presses the 'ENTER' key on the 'Input By Label Name' with the value 'Last Name'

	And the user clicks on 'Input By Label Name' with value 'Role 1'
	And the user enters 'Other' in field 'Input By Label Name' with value 'Role 1'
	And the user presses the 'ENTER' key on the 'Input By Label Name' with the value 'Role 1'
	
	# -------------------------------------------------------------------------------------------
	
	And the user clicks on 'Popup Ok Button' with value 'Contact'
	Then the user validates that the 'Text in Grid' with value 'Other' is visible

	When the user clicks on 'Side Panel Tab' with value 'Attachments'
	And the user clicks on 'Top Tab' with value 'Attachments'
	And the user clicks on the 'Add Button'

	Then the user validates that the 'Popup' with value 'Attach document' is visible
	And the user validates that the 'Input By Label Name' with value 'Subject' is visible

	When the user clicks on 'Input By Label Name' with value 'Subject'
	And the user enters 'Photo Uploaded' in field 'Input By Label Name' with value 'Subject'
	And the user presses the 'ENTER' key on the 'Input By Label Name' with the value 'Subject'

	And the user uploads the file 'SFA_Smoke_Pic.png' in the 'Input By Label Name' with value 'Choose file'

	Then the user validates that the 'Popup Ok Button' with value 'Attach document' is visible
	When the user clicks on 'Popup Ok Button' with value 'Attach document'
	Then the user validates that the 'Text in Grid Containing' with value 'Photo Uploaded' is visible

	When the user clicks on the 'Add Button'
	Then the user validates that the 'Popup' with value 'Attach document' is visible
	And the user validates that the 'Input By Label Name' with value 'Subject' is visible

	When the user clicks on 'Input By Label Name' with value 'Subject'
	And the user enters 'Video Uploaded' in field 'Input By Label Name' with value 'Subject'
	And the user presses the 'ENTER' key on the 'Input By Label Name' with the value 'Subject'

	And the user uploads the file 'SFA_Smoke_Gif.gif' in the 'Input By Label Name' with value 'Choose file'

	Then the user validates that the 'Popup Ok Button' with value 'Attach document' is visible
	When the user clicks on 'Popup Ok Button' with value 'Attach document'
	Then the user validates that the 'Text in Grid Containing' with value 'Video Uploaded' is visible

	# -------------------------------------------------------------------------------------------
	When the user clicks on 'Side Panel Tab' with value 'Contact Info'
	Then the user validates that the 'Top Tab' with value 'Contacts' is visible

	When the user clicks on 'Top Tab' with value 'Contacts'
	Then the user validates that the 'Add Button' is visible

	When the user clicks on 'Text in Grid' with value 'Other'
	And the user clicks on the 'Remove Button'

	Then the user validates that the 'Warning Popup Heading' with value 'Remove Rows' is visible
	And the user validates that the 'Warning Pop Up OK Button' is visible

	When the user clicks on the 'Warning Pop Up OK Button'
	And the user clicks on 'Top Tab' with value 'Calendars'

	And the user clicks on the 'Add Button'
	Then the user validates that the 'Input By Label Name' with value 'Calendar Type' is visible

	When the user clicks on 'Input By Label Name' with value 'Calendar Type'
	And the user enters 'Free text' in field 'Input By Label Name' with value 'Calendar Type'
	And the user presses the 'ENTER' key on the 'Input By Label Name' with the value 'Calendar Type'

	And the user clicks on 'Input By Label Name' with value 'Monday'
	And the user enters 'Text Smoke' in field 'Input By Label Name' with value 'Monday'
	And the user presses the 'ENTER' key on the 'Input By Label Name' with the value 'Monday'

	And the user clicks on 'Popup Ok Button' with value 'Calendar'
	Then the user validates that the 'Text in Grid' with value 'Text Smoke' is visible

	When the user clicks on 'Text in Grid' with value 'Text Smoke'
	And the user clicks on the 'Remove Button'
	Then the user validates that the 'Warning Popup Heading' with value 'Remove Rows' is visible
	And the user validates that the 'Warning Pop Up OK Button' is visible

	When the user clicks on the 'Warning Pop Up OK Button'
	And the user clicks on 'Side Panel Tab' with value 'Main Information'
	And the user clicks on 'Top Tab' with value 'Point of Sale'
	And the user clicks on 'Top Tab' with value 'Ship-to Customers'
	When the user clicks on the 'Add Button'
	And the user selects row '1' on the 'Ship-to Customers' pop up table
	And the user clicks on 'Popup Button' with value 'OK'
	And the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Customer Master - Main Information - Ship To Customers Sub Tab Grid Row' with value '2' is visible
	
	When the user clicks on 'Customer Master - Main Information - Ship To Customers Sub Tab Grid Row' with value '2'
	And the user clicks on the 'Remove Button'
	Then the user validates that the 'Warning Popup Heading' with value 'Remove Rows' is visible
	When the user clicks on the 'Warning Pop Up OK Button'
	And the user clicks on 'Button' with value 'Save'

	And the user clicks on 'Side Panel Tab' with value 'Notes'
	And the user clicks on the 'Add Button'

	Then the user validates that the 'Input By Label Name' with value 'Reason type' is visible
	When the user clicks on 'Input By Label Name' with value 'Reason type'
	And the user enters 'Notes on Invoice' in field 'Input By Label Name' with value 'Reason type'
	And the user presses the 'ENTER' key on the 'Input By Label Name' with the value 'Reason type'

	And the user clicks on 'Input By Label Name' with value 'Note'
	And the user enters 'Notes Invoice Smoke Automation' in field 'Input By Label Name' with value 'Note'
	And the user presses the 'TAB' key on the 'Input By Label Name' with the value 'Note'

	And the user clicks on 'Popup Ok Button' with value 'Add a New Note'
	Then the user validates that the 'Text in Grid' with value 'Notes on Invoice' is visible
	When the user clicks on 'Text in Grid' with value 'Notes on Invoice'

	And the user clicks on the 'Remove Button'
	Then the user validates that the 'Warning Popup Heading' with value 'Remove Rows' is visible

	When the user clicks on the 'Warning Pop Up OK Button'
	Then the user validates that the 'Text in Grid' with value 'Notes on Invoice' is not displayed
	
	When the user clicks on 'Button' with value 'Save'
	And the user clicks on 'Side Panel Tab' with value 'Linked information'

	Then the user validates that the 'Top Tab' with value 'Assets at Customers' is visible
	And the user validates that the 'Top Tab' with value 'Attachments' is visible

	And the user validates that the 'Top Tab' with value 'Reference Docs' is visible
	And the user validates that the 'Top Tab' with value 'PoS KPIs' is visible
	
	And the user validates that the 'Top Tab' with value 'Sales dashboard' is visible
	And the user validates that the 'Top Tab' with value 'Photos' is visible
	And the user validates that the 'Top Tab' with value 'Survey activities' is visible
	
	And the user validates that the 'Top Tab' with value 'Visits' is visible
	And the user validates that the 'Top Tab' with value 'Sales Rows' is visible
	And the user validates that the 'Top Tab' with value 'Sale Orders' is visible
	
	And the user validates that the 'Top Tab' with value 'Van Documents' is visible
	And the user validates that the 'Top Tab' with value 'Allocation' is visible
	And the user validates that the 'Top Tab' with value 'Valid promo action' is visible
	
	And the user validates that the 'Top Tab' with value 'Claims' is visible
	And the user validates that the 'Top Tab' with value 'Customer contacts' is visible

	When the user clicks on 'Button' with value 'New'
	And the user clicks on 'Customer Master New Dropdown Option' with value 'New Order'

	Then the user validates that the 'Popup Cancel Button' with value 'New Order' is visible
	When the user clicks on 'Popup Cancel Button' with value 'New Order'
	And the user closes the page and saves the work done

	And the user refreshes the browser
	Then the user is on the home page
	When the user navigates to the 'Customer Master' page

	When the user filters the column by column name 'Customer Code', Filter Type: 'Like' retrieved value
	And the user opens the grid item in row '1'
	Then the user validates that the 'Side Panel Tab' with value 'Attachments' is visible

	When the user clicks on 'Side Panel Tab' with value 'Attachments'
	And the user clicks on 'Top Tab' with value 'Attachments'

	Then the user validates that the 'Text in Grid Containing' with value 'Photo Uploaded' is visible
	And the user validates that the 'Text in Grid Containing' with value 'Video Uploaded' is visible

	#These Steps are added to make the test reusable
	When the user clicks on 'Text in Grid Containing' with value 'Photo Uploaded'
	And the user clicks on the 'Remove Button'
	Then the user validates that the 'Warning Popup Heading' with value 'Remove Rows' is visible

	When the user clicks on the 'Warning Pop Up OK Button'
	And the user clicks on 'Text in Grid Containing' with value 'Video Uploaded'
	And the user clicks on the 'Remove Button'

	Then the user validates that the 'Warning Popup Heading' with value 'Remove Rows' is visible
	When the user clicks on the 'Warning Pop Up OK Button'
	And the user closes the page and saves the work done