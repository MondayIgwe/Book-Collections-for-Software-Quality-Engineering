Feature: TestCase_1113782
	Check if Xtel.DynConfigsBtc.exe successfully run directly from the Jobs Monitor UI

@BDD_TC1113782 @FRM_Nightly
Scenario: WEB_FRM_SMOKE_DYNCONFIG_JOB

	Given the user is on the home page
    When the user clicks on the 'Jobs Monitor Button'
    Then the user validates that the user is on the 'Scheduled Jobs Tab' page
    When the user filters the column by column name 'Command Line', Filter Type 'Like', Value 'Xtel.DynConfigsBtc.exe'
        Then the user validates that from table with unique column 'Activity' column 'Command Line' has 'Xtel.DynConfigsBtc.exe' in row number '1'
    When the user clicks on the link with value 'Start Job' on the grid
    And the user retrieves the system date in the format 'MM/dd/yyyy HH:mm:ss' and saves it as 'date'
    And the user clicks on the 'Completed Jobs Tab'
    And the user filters the column by column name 'Command Line', Filter Type 'Like', Value 'Xtel.DynConfigsBtc.exe'
    And the user refreshes the grid with unique column 'End Date' until the column 'Start Date' has 'date' in row number '1'
    Then the user validates that from table with unique column 'End Date' column 'Status' has 'SUCCESS' in row number '1'