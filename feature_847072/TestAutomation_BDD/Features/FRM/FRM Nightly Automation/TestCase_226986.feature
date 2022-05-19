Feature: TestCase_226986
	Validates the download of the amCharts in different formats

@BDD_TC226986 @FRM_Nightly
Scenario: FRM_REFDOC_EXPORTAMCHART_001

    # Step 1 - Login and create a new Reference doc from scratch and view it
    Given the user navigates to the 'Reference Docs' page
    When the user creates a Reference doc with Date 1: 'Today'  Date 2: 'Today' Textbox: 'Test' Combo: 'voice1' DatePicker: 'Today' Force Uppercase On Validation: '226986'
	And the user filters the column by column name 'Progressive', Filter Type 'Like', Value 'ProgressiveValue'
    And the user opens the grid item in row '1'
    And the user clicks on 'Button' with value 'Edit'
    
    # Step 2 - Go on Amcharts tab (e.q. dashboards with Amcharts)
    And the user clicks on 'Side Panel Tab' with value 'amCharts'
    And the user clicks on the 'Download Icon'
    And the user clicks on 'amCharts Download Link' with value 'Download as..'

    # Expected result - every chart show a dropdown action that gives possibility go to export the chart in different format PNG, SVG, PDF ,  JPG, CSV , XLSX
    Then the user validates that the 'amCharts Download Link' with value 'JPG' is displayed
    And the user validates that the 'amCharts Download Link' with value 'PNG' is displayed
    And the user validates that the 'amCharts Download Link' with value 'SVG' is displayed
    And the user validates that the 'amCharts Download Link' with value 'PDF' is displayed
    When the user clicks on 'amCharts Download Link' with value 'Save as..'
    Then the user validates that the 'amCharts Download Link' with value 'CSV' is displayed
    And the user validates that the 'amCharts Download Link' with value 'XLSX' is displayed

    # Step 3 - Go on "download as" and click on PNG 
    When the user clicks on 'amCharts Download Link' with value 'Download as..'
    And the user clicks on 'amCharts Download Link' with value 'PNG'

    # Expected result - PNG file downloaded
    Then the user validates that the File: 'Revenue x product line.png' is downloaded successfully
    

    # Step 4 - Go on "download as" and click on JPG
    When the user clicks on the 'Download Icon'
    And the user clicks on 'amCharts Download Link' with value 'Download as..'
    And the user clicks on 'amCharts Download Link' with value 'JPG'

    # Expected result - JPG file downloaded
    Then the user validates that the File: 'Revenue x product line.jpg' is downloaded successfully
    
    # Step 5 - Go on "download as" and click on SVG
    When the user clicks on the 'Download Icon'
    And the user clicks on 'amCharts Download Link' with value 'Download as..'
    And the user clicks on 'amCharts Download Link' with value 'SVG'

    # Expected result - SVG file downloaded
    Then the user validates that the File: 'Revenue x product line.svg' is downloaded successfully

    # Step 6 - Go on "download as" and click on SVG
    When the user clicks on the 'Download Icon'
    And the user clicks on 'amCharts Download Link' with value 'Download as..'
    And the user clicks on 'amCharts Download Link' with value 'PDF'

    # Expected result - PDF file downloade
    Then the user validates that the File: 'Revenue x product line.pdf' is downloaded successfully