Feature: TestCase_565870
	Validates the 'Last Modifications' Rollback button functionality

@BDD_TC565870 @FRM_Weekly
Scenario: WEB_FRM_LAST_MODIFICATIONS_ROLLBACK_SNAPSHOT

    # Step 1 - Open to the Users navigator and open ACONST
    Given the user navigates to the 'Users' page
    When the user retrieves the username for the logged in user and saves it as 'Username'
    And the user manipulates the username 'Username' to the standard xtel format and saves it as 'ShortenedUser'
    And the user filters the column by column name 'User Code', Filter Type 'Like', Value 'ACONST'
    And the user clicks on 'ACONST' text on the grid

    # Step 2 - Edit  @Number= 3333,  @Juridical_Nature = SOCIETY, in division tab is present AUTOM1 for group TODO2,if not present add it then save the document
    And the user clicks on 'Button' with value 'Edit'
    And the user enters '<Number>' in field 'Input By Label Name' with value 'Number'
    And the user select value '<Juridical_Nature>' from dropdown list 'Juridical nature'
    And the user clicks on the 'Save Button'

    # Step 3 - 
    # Click on "Last Modification" Select the first snapshot already saved by you. 
    # It should be present in the grid as first one because the grid should be sorted by last modifications
    And the user clicks on 'Button' with value 'Last modifications'
    And the user sorts the 'Creation Date' column in 'ascending' order
    And the user selects row '1' on the 'Last Modifications' pop up table

    # Expected result - 
    # Once snapshots is selected the "Rollback" and "Open Snapshot" buttons are enabled. 
    Then the user validates that the 'Button' with value 'Rollback' is enabled
    And the user validates that the 'Button' with value 'Open Snapshot' is enabled

    # Step 4 - Click on the "Rollback" button
    When the user clicks on 'Button' with value 'Rollback'

    # Expected result - NUMBER = 1234, JURIDICAL NATURE= INDIVIDUAL, in division tab is present AUTOM1 for group TODO2
    Then the user validates that 'Input By Label Name' with value 'Number' has text '1234'
    And the user validates that 'Input By Label Name' with value 'Juridical nature' has text 'INDIVIDUAL'

    # Step 6 - Click on the back button
    When the user clicks on the 'Toolbar Close Button'

    # Step 7 - Open the ACONST and check the UI
    And the user clicks on 'ACONST' text on the grid

    # Expected result - 
    # NUMBER = 1234, JURIDICAL NATURE= INDIVIDUAL, in division tab is present AUTOM1 for group TODO2
    Then the user validates that 'Input By Label Name' with value 'Number' has text '1234'
    And the user validates that 'Input By Label Name' with value 'Juridical nature' has text 'INDIVIDUAL'

    # Step 8 - Click again on the "Last modifications" button
    When the user clicks on 'Button' with value 'Last modifications'

    # Expected result - 
    #The saved snapshot has the correct creation date and time, the correct user creator and the note attached for it is: "Snapshot on Rollback"
    Then the user validates that popup 'Last Modifications' column 'Notes' has 'Snapshot on Rollback' with row text 'ShortenedUser'


    Examples: 
    |  Number|Juridical_Nature|
    |  3333  |SOCIETY         |