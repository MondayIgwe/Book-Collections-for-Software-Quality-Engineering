Feature: TestCase_276881
	Edit a comment
@BDD_276881 @PLAN_Weekly @PLAN @Regression
Scenario: WEB_TPM_IBP_COMMENTS_002
	# Step 1 - Go To 'IBP Documents' navigator
	Given the user navigates to the 'IBP Documents' page

	# Step 2 - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear
	When the user filters the column by column name 'Process Year', Filter Type 'Like', Value '<DocProcessYear>'
	And the user filters the column by column name 'Month', Filter Type 'Equal', Value '<DocMonth>'
	And the user filters the column by column name 'Week', Filter Type 'Equal', Value '<DocWeek>'
	And the user filters the column by column name 'Document Shell Model', Filter Type 'Like', Value '<DocShellModel>'
	And the user clicks on '<DocumentID>' text on the grid
	
	# Step 3 - Select @SectionName from the list of sections
	Then the user validates that the user is on the 'Summary Tab' page
	When the user selects a section '<SectionName>' in IBP Summary Tab
	Then the user validates that the user is on the 'Shell Tab' page

	# Step 4 - Open the filter "F_String2", "F_String3" at section level @Filter1,@Filter2, Deselect all the choices, Select @Customer,@Month
	When the user changes the filter on Filter Name: '<Filter1>' to Filter Value: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter2>' to Filter Value: '<Month>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# Step 5 - In @GridName, select cell @Measure, @ProdCell1, @Customer, @Month, Right click on the cell. Select "Comment"
	And the user right clicks on the Aggrid Grid table at Row: '<Customer>' and Column: 'M2|STRING1' and Selects: 'Comment'

	# Step 6 - In the pop-up edit @Text
	And The user types '<Text>' into the 'Edit Value Popup Comment Textarea'

	# Step - 7 Click on OK button
	And the user clicks on 'Popup Button' with value 'OK'

	# Step 8 - Save and Close the document
	And the user closes the page and saves the work done

	# Step 9 - Repeat steps from 2 to 12
	# - Open IBP document with @DocShellModel, created for @DocWeek, @DocMonth, @DocProcessYear
	And the user clicks on '<DocumentID>' text on the grid
	
	# - Select @SectionName from the list of sections
	When the user selects a section '<SectionName>' in IBP Summary Tab

	# - Open the filter "F_String2", "F_String3" at section level @Filter1,@Filter2, Deselect all the choices, Select @Customer,@Month
	When the user changes the filter on Filter Name: '<Filter1>' to Filter Value: '<Customer>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	And the user changes the filter on Filter Name: '<Filter2>' to Filter Value: '<Month>' and filters with User Code: 'User Code', Filter Type: 'Like' in the IBP Shell Tab
	
	# - In @GridName, select cell @Measure, @ProdCell1, @Customer, @Month, Right click on the cell. Select "Comment"
	And the user right clicks on the Aggrid Grid table at Row: '<Customer>' and Column: 'M2|STRING1' and Selects: 'Comment'

	# - Delete the already existing text and edit @Text2
	And the user clears text on the 'Edit Value Popup Comment Textarea'
	And The user types '<Text2>' into the 'Edit Value Popup Comment Textarea'

	# - Click on OK button, Save and Close the document
	And the user clicks on 'Popup Button' with value 'OK'
	
	# Step - 12 Select "Comments" from the left side menu
	And the user clicks on side panel 'Comments'

	# Step - 13 The edited text @Text2 appears in the list under the column "Comment"  
	Then the user validates that the 'Text' with value '<Text2>' is displayed

	# Step 11 - Update and Close the document
	When the user closes all pages without saving the work done
	
	# Step 12 - Validate grid is visible before closing the browser
	Then the user validates that the 'Grid Name' with value 'GridContainer' is visible

	Examples:
	| DocProcessYear | DocShellModel | DocWeek | DocMonth | SectionName                 | Filter1     | Filter2     | ProdCell1 | Measure | Customer  | GridName         | Text | Text2   |  DocumentID | Month |
	| CBP_2020       | SHELL_STRING  | 10      | 3        | [GUIGWPLANDOC.SEC_STRING_1] | [F_STRING2] | [F_STRING3] | 101       | STRING2 | EC91603_4 | GRID_FR_STRING_1 | Test | Changed |  138        | M2    |