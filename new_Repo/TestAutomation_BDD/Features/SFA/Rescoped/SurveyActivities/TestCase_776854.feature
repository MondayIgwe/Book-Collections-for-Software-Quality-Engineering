Feature: TestCase_776854
	Test Case 776854

@BDD_776854 @SFA_Nightly
Scenario: WEB_SFA_SE_VISIT_021_DETAIL_SECTION_IN_ACTIVITY_TAB_ON_CUSTOMER_ACTIVITIES_BDD
	Given the user navigates to the 'Survey activities' page
	When the user opens the Grid Settings Menu option: 'Columns'
	And the user filter the pop up menu: 'Columns Settings' by column name 'Caption', 'Like', 'ID Visit'
	And the user clicks on 'Columns Settings' pop up table where 'Caption' column has the value:'ID Visit' and the checkbox is in column:'Visible' is turned:'on'
	And the user clicks on 'Popup Ok Button' with value 'Columns Settings'
	And the user filters the column by column name 'ID Visit', 'Like', '000000000000000210524111103764'
	And the user opens the grid item in row '1'
	Then the user is on the 'Summary Tab' page

	When the user clicks on 'Side Panel Tab' with value 'Asset Store Check - Asset for detail section EC89306 - (HQ)'
	Then the user validates that the 'Details Section' is visible
	And the user validates that the 'Details Section Expand Panel button' is visible
	
	When the user clicks on the 'Details Section Expand Panel button'
	Then the user validates that 'HQ notes field' type is '<TextArea>'
	And the user validates that 'Preparation notes field' type is '<TextArea>'
	And the user validates that 'Notes field' type is '<TextArea>'
	And the user validates that 'Last visit notes field' type is '<TextArea>'
	And the user validates that 'Time spent on activity label' type is 'label'
	And the user validates that 'Objective flag' type is '<CheckBox>'
	And the user validates that 'Previous Objective flag' type is '<CheckBox>'
	
	When 'HQ notes field' is populated with 'Test Note from HQ on detail section'
	Then the user validates that 'HQ notes field' type is '<TextArea>'
	And the user validates that 'Preparation notes field' type is '<TextArea>'
	And 'Notes field' is populated with 'V1 note on detail'
	And the user validates that 'Notes field' type is '<TextArea>'
	And the user validates that 'Last visit notes field' type is '<TextArea>'
	And 'Time spent on activity label' is populated with 'Time spent on activity: 1 h 1 m'
	And the user validates that 'Time spent on activity label' type is 'label'
	And the user validates that 'Objective flag' is marked as (true/false): 'true'
	And the user validates that 'Objective flag' type is '<CheckBox>'
	And the user validates that 'Previous Objective flag' is marked as (true/false): 'false'
	And the user validates that 'Previous Objective flag' type is '<CheckBox>'
	
	When the user closes all pages without saving the work done where there is no pop up
	And the user filters the column by column name 'ID Visit', 'Like', '000000000000000210524112427743'
	And the user opens the grid item in row '1'
	And the user is on the 'Summary Tab' page
	And the user clicks on 'Side Panel Tab' with value 'Asset Store Check'
	And the user clicks on the 'Details Section Expand Panel button'
	Then the user validates that 'HQ notes field' type is '<TextArea>'
	And 'Preparation notes field' is populated with 'V3 note on detail'
	And the user validates that 'Preparation notes field' type is '<TextArea>'
	And 'Notes field' is populated with 'V4 note on detail'
	And the user validates that 'Notes field' type is '<TextArea>'
	
	And the user validates that 'Last visit notes field' text contains '05/21/2021'
	And the user validates that 'Last visit notes field' text contains 'V3 note on detail'
	And the user validates that 'Last visit notes field' text contains '05/20/2021'
	And the user validates that 'Last visit notes field' text contains 'V2 note on detail'
	And the user validates that 'Last visit notes field' text contains '05/19/2021'
	And the user validates that 'Last visit notes field' text contains 'V1 note on detail'
	
	And the user validates that 'Last visit notes field' type is '<TextArea>'
	And 'Time spent on activity label' is populated with 'Time spent on activity: 1 m'
	And the user validates that 'Time spent on activity label' type is 'label'
	And the user validates that 'Objective flag' is marked as (true/false): 'true'
	And the user validates that 'Objective flag' type is '<CheckBox>'
	And the user validates that 'Previous Objective flag' is marked as (true/false): 'true'
	And the user validates that 'Previous Objective flag' type is '<CheckBox>'

	When the user closes all pages without saving the work done where there is no pop up
	And the user filters the column by column name 'ID Visit', 'Like', '000000000000000210524112845826'
	And the user opens the grid item in row '1'
	And the user is on the 'Summary Tab' page
	And the user clicks on 'Side Panel Tab' with value 'Asset Store Check'
	And the user clicks on the 'Details Section Expand Panel button'
	Then the user validates that 'HQ notes field' type is '<TextArea>'
	And 'Preparation notes field' is populated with 'V4 note on detail'
	And the user validates that 'Preparation notes field' type is '<TextArea>'

	And 'Notes field' is populated with 'V4 note on detail'
	And the user validates that 'Notes field' type is '<TextArea>'
	And the user validates that 'Last visit notes field' text contains '05/24/2021'
	And the user validates that 'Last visit notes field' text contains 'V4 note on detail'
	And the user validates that 'Last visit notes field' text contains '05/21/2021'
	And the user validates that 'Last visit notes field' text contains 'V3 note on detail'
	And the user validates that 'Last visit notes field' text contains '05/20/2021'
	And the user validates that 'Last visit notes field' text contains 'V2 note on detail'

	And the user validates that 'Last visit notes field' type is '<TextArea>'
	And 'Time spent on activity label' is populated with 'Time spent on activity: 2 m'
	And the user validates that 'Time spent on activity label' type is 'label'
	And the user validates that 'Objective flag' is marked as (true/false): 'false'
	And the user validates that 'Objective flag' type is '<CheckBox>'
	And the user validates that 'Previous Objective flag' is marked as (true/false): 'true'
	And the user validates that 'Previous Objective flag' type is '<CheckBox>'
	And the user closes all pages without saving the work done where there is no pop up

	Examples:
	| CheckBox  | TextArea  |
	| check box | text area |