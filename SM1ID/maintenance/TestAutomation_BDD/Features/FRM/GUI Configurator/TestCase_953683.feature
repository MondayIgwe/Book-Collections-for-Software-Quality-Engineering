Feature: TestCase_953683

User Story 891896: Dates and Periods - Programmatically set the date of calendar opening
	
AC1
Given: a document with data fields 
When: user enters into the configuration section
Then: can see and set the default date for data fields (data picker and/or period picker)
AC2:
Given: a document with data picker/Period picker set with default data
and: the data is not set by the user
When: user clicks on data picker
Then: the user can see the as selected the default data configured
AC3:
Given: a document with data picker/Period picker set with default data
and: the data is already set by the user
When: user clicks on data picker
Then: the user can see as selected the data previously set by the user
AC4:
Given: a document with data picker/Period picker set without default data
and: the data is not set by the user
When: user clicks on data picker
Then: the user can see selected the today data

Scenario: WEB_FRM_DATE_PICKER_DEFAULT_VALUE

    #Create new reference doc
	Given the user is on the 'Reference Docs' page
    When the user clicks on the 'Add Button'
    And the user selects 'Today' from calendar icon 'Date 1 Calendar Icon'
    And the user selects 'Today' from calendar icon 'Date 2 Calendar Icon'
    And the user clicks OK button in the 'Reference Doc Detail Popup' popup
    Then the user is on the 'Summary' page

	#Turn UI configurator ON and open the UI configurator popup of Date 2 field
	And the user clicks on the 'Configurator Button'
	Then the user validates that the 'GUI Configurator On' is displayed
	And the user clicks on the 'Date 2 Field Settings Icon'
	Then the 'Gui Configurator Popup' is visible

	#Open date default value property and set it with specific date like 01/01/2020
	When the user clicks on the 'Date Default Value Icon'
	And the user enters '01/01/2020' in the 'Value Calendar Field'
	And the user clicks on the 'Value Popup Ok Button'
	And the user clicks on Ok button on the popup 'Gui Configurator'
	When the user clicks on the 'Save Configuration Button'
	And the user clears the text from 'Date 2 Field' element
	When the user clicks on the 'Configurator Button'

	#When the user clicks on the 'Date 2 Calendar Icon' and select specific date
	When the user selects '01/10/2021' from calendar icon 'Date 2 Calendar Icon'
	Then 'Date 2 Field' is populated with '01/10/2021'

	#Write and set a new date in date 2 picker field. Then remove the value
	When the user enters '11/11/2021' in the 'Date 2 Field'
	Then 'Date 2 Field' is populated with '11/11/2021'
	When the user clears the text from 'Date 2 Field' element

	# Turn UI configurator ON and open the UI configurator popup of Date 2 field
	And the user clicks on the 'Configurator Button'
	Then the user validates that the 'GUI Configurator On' is displayed
	And the user clicks on the 'Date 2 Field Settings Icon'
	Then the 'Gui Configurator Popup' is visible

	#set date default value property = empty
	When the user clicks on the 'Date Default Value Icon'
    And the user clicks on the 'Value Popup Ok Button'
	And the user clicks on Ok button on the popup 'Gui Configurator'
	And the user clicks on the 'Save Configuration Button'
	And the user clicks on the 'Configurator Button'

    #Open date calender of date picker 2 and check if the TODAY date is selected
    When the user clears the text from 'Date 2 Field' element
	And the user clicks on the 'Date 2 Calendar Icon'
	Then the user validates that the date 'Today' is selected on the calendar