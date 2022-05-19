Feature: TestCase_1113782
	Check if Xtel.DynConfigsBtc.exe successfully run directly from the Jobs Monitor UI

@BDD_1113782 @FRM_Nightly
Scenario: WEB_FRM_SMOKE_DYNCONFIG_JOB

	Given the user is on the home page
    When the user clicks on the 'Jobs Monitor Button'
	Then the user validates that the user is on the 'Scheduled Jobs Tab' page
	When the user filters the column by column name 'Command Line', Filter Type 'Like', Value 'Xtel.DynConfigsBtc.exe'
	Then the user validates that the 'Contains Div Text in Grid' with value 'Xtel.DynConfigsBtc.exe' is visible
	When the user scrolls to the 'Text in Grid' with value 'Start Job'
	And the user select row and clicks on 'Start Job' text on the grid
	And the user clicks on the 'Completed Jobs Tab'
	Then the user validates that the user is on the 'Completed Jobs Tab' page
	When the user refreshes the grid for the data to load on the UI grid
	And the user filters the column by column name 'Command Line', Filter Type 'Like', Value 'Xtel.DynConfigsBtc.exe'
	Then the user validates that the 'Contains Div Text in Grid' with value 'Xtel.DynConfigsBtc.exe' is visible
	And the user validates that column 'Status' has 'SUCCESS' with row text 'Xtel.DynConfigsBtc.exe'