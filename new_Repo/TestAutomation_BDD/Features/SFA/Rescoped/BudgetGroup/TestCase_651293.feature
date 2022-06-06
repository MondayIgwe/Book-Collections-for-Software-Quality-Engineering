Feature: TestCase_651293

@SFA_Nightly @BDD_651293
Scenario: WEB_SFA_SF_BUDGET_018_BUDGET_WORKFLOW
	#1 Create a new Budget group:
	Given the user navigates to the 'Budget Group' page
	When the user adds a new budget group where Budget Group Code is retrieved, Topology: '<TypologyValue>', Owner Level: '<OwnerLevelValue>',Description: '<BdgDescription1>', Measure Unit: '<MeasureUnitValue>'
	And the user retrieves text from element 'Input By Label Name' with value 'Code' and saves it as 'BudgetCode'
	And the user clicks on 'Side Panel Tab' with value 'Owners'
	And the user enters '<DefaultInitialValue>' in field 'Input By Label Name' with value 'Default initial value - PACKS'
	And the user clicks on 'Grid Checkbox' with value '<OwnerCode>'
	#2 Check the visibility of CODSTATUS field in top bar
	Then the user validates 'Top Panel Status' is not displayed
	#3 Move to  Workflow tab
	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	Then the user validates that 'Input By Label Name' with value 'Current status' has text 'Draft'
	#4 Change from Draft to Valid: Click on CURRENT STATUS arrow and select VALIDATE transition Confirm pop-up
	When the user changes the status to 'Validate'
	Then the user validates that 'Input By Label Name' with value 'Current status' has text 'Valid'
	# In History subtab 2 records are present and State column values are: >Draft >Valid
	And the user clicks on 'Top Tab' with value 'History'
	Then the user validates that the 'Text In Table Cell' with value 'Draft' is present
	And the user validates that the 'Text In Table Cell' with value 'Valid' is present
	#5 Save the Budget and exit from the Budget Group UI.
	When the user closes the page and saves the work done
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Code', 'Like', 'BudgetCode'
	Then the user validates that column 'Workflow Status' has 'Valid' with row text '<BdgDescription1>'
	#6 Go back to Budget group UI Change from Valid to Cancelled:
	When the user clicks on 'Indexed Row Link' with value '1'
	And the user clicks on 'Button' with value 'Edit'
	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	When the user changes the status to 'Cancel'
	And the user clicks on 'Top Tab' with value 'History'
	Then the user validates that the 'Text In Table Cell' with value 'Draft' is present
	And the user validates that the 'Text In Table Cell' with value 'Valid' is present
	And the user validates that the 'Text In Table Cell' with value 'Cancelled' is present
	#7 Save the Budget and exit from the Budget Group UI.
	When the user closes the page and saves the work done
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Code', 'Like', 'BudgetCode'
	Then the user validates that column 'Workflow Status' has 'Cancelled' with row text '<BdgDescription1>'
	#8 Create a new Budget group:
	When the user adds a new budget group where Budget Group Code is retrieved, Topology: '<TypologyValue>', Owner Level: '<OwnerLevelValue>',Description: '<BdgDescription2>', Measure Unit: '<MeasureUnitValue>'
	And the user retrieves text from element 'Input By Label Name' with value 'Code' and saves it as 'BudgetCode'
	And the user clicks on 'Side Panel Tab' with value 'Owners'
	And the user enters '<DefaultInitialValue>' in field 'Input By Label Name' with value 'Default initial value - PACKS'
	And the user clicks on 'Grid Checkbox' with value '<OwnerCode>'
	#9 Change from Draft to Valid:
	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	When the user changes the status to 'Validate'
	#10 Change from Valid to Draft:
	And the user changes the status to 'Suspend'
	And the user clicks on 'Top Tab' with value 'History' until 'Text In Table Cell' with value 'Draft' is present
	Then the user validates that the 'Text In Table Cell' with value 'Draft' is present
	And the user validates that the 'Text In Table Cell' with value 'Valid' is present
	And the user validates that the count for 'Text In Table Cell' with value 'Draft' is '2'
	#11 Save the Budget and exit from the Budget Group UI.
	When the user closes the page and saves the work done
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Code', 'Like', 'BudgetCode'
	Then the user validates that column 'Workflow Status' has 'Draft' with row text '<BdgDescription2>'
	#12 Go back to Budget group UI
	When the user clicks on 'Indexed Row Link' with value '1'
	And the user clicks on 'Button' with value 'Edit'
	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	When the user changes the status to 'Cancel'
	And the user clicks on 'Top Tab' with value 'History'
	Then the user validates that the 'Text In Table Cell' with value 'Draft' is present
	And the user validates that the 'Text In Table Cell' with value 'Valid' is present
	And the user validates that the 'Text In Table Cell' with value 'Cancelled' is present
	And the user validates that the count for 'Text In Table Cell' with value 'Draft' is '2'
	#13 Go to Notes tab
	And the user clicks on 'Side Panel Tab' with value 'Note / Attachments'
	Then the user validates that the 'Sub Tab Add Button Span' with value 'Notes' is disabled
	#14  Go to Attachments tab
	#15 Go to Owners tab
	When the user clicks on 'Side Panel Tab' with value 'Owners'
	Then the user validates that the 'Button' with value 'Import' is disabled
	#16 Go to General Info
	When the user clicks on 'Side Panel Tab' with value 'General Info' until 'Input By Label Name' with value 'Description' is present
	Then the user validates that the 'Input By Label Name' with value 'Description' is disabled
	And the user validates that the 'Section Add Button by sm1 id' with value 'Rules' is disabled
	#17 Change from status Cancelled 
	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Current status'
	Then the user validates that the 'Text' with value '<MSG>' is present
	When the user clicks on 'Popup Cancel Button' with value 'Change Status'
	#18 Save the Budget and exit from the Budget Group UI.
	And the user closes the page and saves the work done
	And the user clicks on the 'Refresh Button'
	And the user opens the Grid Settings Menu option: 'Columns'
	Then the user validates that the 'Text In Table Cell' with value '<StatusDescField>' is not present
	And the user validates that the 'Text In Table Cell' with value '<WkfStatusField>' is present
	When the user clicks on 'Popup Cancel Button' with value 'Columns Settings'
	#19 In Budget Group navigator select created budget and link to Budget Detailnavigator (@LinkBudgetDetail).
	And the user filters the column by column name 'Code', 'Like', 'BudgetCode'
	And the user clicks on 'Grid Checkbox' with value '<BdgDescription2>'
	And the user clicks on 'Button' with value 'Links'
	And the user clicks on 'Menu Item Text' with value 'Budget Detail'
	And the user opens the Grid Settings Menu option: 'Columns'
	Then the user validates that the 'Text In Table Cell' with value '<StatusDescField>' is not present
	And the user validates that the 'Text In Table Cell' with value '<StatusCodeField>' is not present
	And the user validates that the 'Text In Table Cell' with value '<WkfStatusField>' is present
	When the user clicks on 'Popup Cancel Button' with value 'Columns Settings'
	Then the user validates that the 'Column Heading' with value '<WkfStatusField>' is not displayed
	#20 Set  Workflow Status field as visible True.
	When the user makes all coumns visible
	Then the user validates that column 'Workflow Status' has 'Cancelled' with row text '<BdgDescription2>'


	Examples:
		| TypologyValue | OwnerLevelValue | BdgDescription1 | MeasureUnitValue | DefaultInitailValue | BdgDescription2 | MSG                      | StatusDescField | WkfStatusField  | LinkBudgetDetail | StatusCodeField | OwnerCode   |
		| Free goods    | Sales rep       | BDG_018_1       | PACKS            | 1000                | BDG_018_2       | No available transitions | Status Desc.    | Workflow Status | Budget Detail    | Status Code     | AANASTASIEI |