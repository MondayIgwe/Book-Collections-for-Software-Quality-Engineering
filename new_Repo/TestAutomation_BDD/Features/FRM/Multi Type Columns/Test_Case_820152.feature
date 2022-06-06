Feature: Test_Case_820152
	 
Given a multitype string column the user is able to filter data opening the filter popup 
which will have the layout of a text column filter popup with LIKE, NOTLIKE and IN field if enabled


Scenario: BDD_WEB_FRM_FILTERING_STRING_MULTITYPE_COLUMN 
   
    # Navigate to Reference Docs navigator and create a new reference document
    Given the user is on the 'Reference Docs' page
    When the user clicks on the 'Add Button'
    And the user selects 'Today' from calendar icon 'Date 1 Calendar Icon'
    And the user selects 'Today' from calendar icon 'Date 2 Calendar Icon'
    And the user clicks OK button in the 'Reference Doc Detail Popup' popup

    # select Grids Examples tab
    When the user clicks on the 'Grids Examples'

    # filter the grid by using this constraint StringMultiTypeColumn LIKE = E001
    And the user filters the column by column name 'StringMultiTypeColumn', 'like', 'E001'
    Then the user validates that the cell in row number '1' in column 'vCodDiv' has text 'E001 - MODERN TR.-E'

    # filter the grid by using this constraint StringMultiTypeColumn NOT LKE = US01
    When the user filters the column by column name 'StringMultiTypeColumn', 'Not like', 'US01'
    Then the user validates that the cell in row number '1' in column 'vCodDiv' has text 'E001 - MODERN TR.-E'

    # filter the grid by using this constraint StringMultiTypeColumn IN = E001;PHARMA
    When the user filters the column by column name 'StringMultiTypeColumn', 'In', 'E001;PHARMA1'
    Then the user validates that the cell in row number '1' in column 'vCodDiv' has text 'E001 - MODERN TR.-E'
    Then the user validates that the cell in row number '2' in column 'vCodDiv' has text 'PHARMA1 - MODERN TR.-PHARMA'