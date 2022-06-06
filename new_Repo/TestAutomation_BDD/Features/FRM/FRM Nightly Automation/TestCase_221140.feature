Feature: TestCase_221140
	Validates the 'Collapse' and 'Expand' icon functionality of the sections in the Available Fields sub tab

@BDD_TC221140 @FRM_Nightly
Scenario:  FRM_REFDOC_SECTION_001
    # Step 1 - Login , Open reference docs navigator and open reference doc GUI
    Given the user navigates to the 'Reference Docs' page
    When the user opens the grid item in row '2'

    # Step 2 - Go on 'Field Examples' tab
    And the user clicks on 'Side Panel Tab' with value 'Field Examples'

    # Expected result
    # "Available Fields" section is displayed
    #"New Dropdown section" section is displayed
    Then the user validates that the 'Section Panel' with value 'Available Fields' is displayed
    And the user validates that the 'Section Panel' with value 'New Dropdown section' is displayed

    # Step 4 - Collapse "Available Fields" and "New Dropdown section" sections 
    And the user validates that the 'Section Collapse Icon' with value 'Available Fields' is displayed
    When the user clicks on 'Section Collapse Icon' with value 'Available Fields'
    And the user clicks on 'Section Collapse Icon' with value 'New Dropdown section'

    # Expected result - "Available Fields" and "New Dropdown section" sections are collapsed
    Then the user validates that the 'Input By Label Name' with value 'TEXTBOX' is not displayed
    And the user validates that the 'Input By Label Name' with value '[GUIREFERENCEDOC.REFERENCEDOC.dropdownMandatory]' is not displayed

    # Step - expand  "Available Fields" and "New Dropdown section" sections 
    When the user clicks on 'Section Expand Icon' with value 'Available Fields'
    And the user clicks on 'Section Expand Icon' with value 'New Dropdown section'

    # Expected result - "Available Fields" and "New Dropdown section" sections are expanded
    Then the user validates that the 'Input By Label Name' with value 'TEXTBOX' is displayed
    And the user validates that the 'Input By Label Name' with value '[GUIREFERENCEDOC.REFERENCEDOC.dropdownMandatory]' is displayed
    And the user validates that the 'Input By Label Name' with value '[GUIREFERENCEDOC.REFERENCEDOC.dropdownMandatory]' is not displayed
