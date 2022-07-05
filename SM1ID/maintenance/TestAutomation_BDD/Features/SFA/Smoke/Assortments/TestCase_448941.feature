Feature: TestCase_448941

@BDD_448941 @SFA_Nightly @SFA_Smoke @SFA_Weekly
Scenario: WEB_SFA_SF_ASSO_003_Can_import_rows_in_an_assortment_on_8_2
	#Step1
	Given the user navigates to the 'Assortments' page
	When the user filters the column by column name 'Assortment Description', Filter Type 'Like', Value 'AUTOMATION TEST SFA'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'

	#Step2
	And the user clicks on 'Side Panel Tab' with value 'Products'
	And the user clicks on the 'Import Assortment'
	Then the user validates that the 'Popup' with value 'Import assortment details' is displayed

	#Step3
	When the user uploads the file 'Assortment_template.xlsx' in the 'Input Element by SM1Id' with value 'fileChooser'
	Then the user validates that the 'Popup' with value 'Import assortment details' is displayed

	#Step4
	When the user enters 'DATA' in field 'Input Element by SM1Id' with value 'worksheet'
	And the user moves the focus away from the element
	Then the user validates that the value 'Worksheet Field' is equal to 'DATA'

	#Step5
	When the user enters '2' in the 'Starting Row Field'
	And the user moves the focus away from the element
	Then the user validates that the value 'Starting Row Field' is equal to '2'

	#Step6
	When the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that 'Total Number Of Grid Rows' text contains '/5'

	#Fallback
	When the user closes all pages without saving the work done