Feature: TestCase_776720
	Test case: 776720

@BDD_776720 @SFA_Nightly
Scenario: WEB_SFA_SE_VISIT_004_MEASURES_SHOWN_IN_CUSTOMER_ACTIVITY_BDD
	Given the user navigates to the 'Visits' page
	When the user filters the column by column name 'Id Visit', 'Like', '<FilterValue>'
	And the user opens the grid item in row '1'
	And the user clicks on 'Side Panel Tab' with value 'Customer activity type'
	
	Then the user validates that the 'Customer Activity Type General Data Section' is displayed

	And the user validates that the 'Mandatory Icon' with value 'TEXT BOX' is displayed
	And the user validates that the element 'Input By Label Name' with value 'TEXT BOX' is of type '<TextBox>'

	And the user validates that the 'Mandatory Icon' with value 'TEXT COMBO BOX' is displayed
	And the user validates that the element 'Input By Label Name' with value 'TEXT COMBO BOX' is of type '<ComboBox>'

	And the user validates that the 'Mandatory Icon' with value 'TEXT COMBO EMPTY' is displayed
	And the user validates that the element 'Input By Label Name' with value 'TEXT COMBO EMPTY' is of type '<ComboBox>'

	And the user validates that the 'Mandatory Icon' with value 'TEXT COMBO SPINNER' is displayed
	And the user validates that the element 'Input By Label Name' with value 'TEXT COMBO SPINNER' is of type '<ComboBox>'

	And the user validates that the element 'Input By Label Name' with value 'LNG FORMAT1' is of type '<Integer>'
	And the user validates that the element 'Input By Label Name' with value 'LNG FORMAT2' is of type '<Integer>'
	
	And the user validates that the 'Checkbox By Label' with value 'DBL CHECKBOX' is displayed
	And the user validates that the element 'Checkbox By Label' with value 'DBL CHECKBOX' is of type '<CheckBox>'
	
	And the user validates that the 'Mandatory Icon' with value 'DBL FORMAT1' is displayed
	And the user validates that the element 'Input By Label Name' with value 'DBL FORMAT1' is of type '<Decimal>'

	And the user validates that the 'Mandatory Icon' with value 'DBL FORMAT2' is displayed
	And the user validates that the element 'Input By Label Name' with value 'DBL FORMAT2' is of type '<Decimal>'

	And the user validates that the 'Mandatory Icon' with value 'DBL NO FORMAT' is displayed
	And the user validates that the element 'Input By Label Name' with value 'DBL NO FORMAT' is of type '<Decimal>'
	
	And the user validates that the 'Mandatory Icon' with value 'DATE CONTROL' is displayed
	And the user validates that the element 'Input By Label Name' with value 'DATE CONTROL' is of type '<Date>'
	
	And the user validates that the 'Checkbox By Label' with value 'FLAG CONTROL' is displayed
	And the user validates that the element 'Checkbox By Label' with value 'FLAG CONTROL' is of type '<CheckBox>'

	And the user validates that 'Input By Label Name' with value 'TEXT BOX' has text '<Text1>'
	And the user validates that 'Input By Label Name' with value 'TEXT COMBO BOX' has text '<Text2>'

	And the user validates that 'Input By Label Name' with value 'TEXT COMBO EMPTY' has text '<Text3>'
	And the user validates that 'Input By Label Name' with value 'TEXT COMBO SPINNER' has text '<Text4>'

	And the user validates that 'Input By Label Name' with value 'LNG FORMAT1' has text '<Text5>'
	And the user validates that 'Input By Label Name' with value 'LNG FORMAT2' has text '<Text5>'

	And the user validates that 'Input By Label Name' with value 'DBL FORMAT1' has text '<Text6>'
	And the user validates that 'Input By Label Name' with value 'DBL FORMAT2' has text '<Text7>'
	
	And the user validates that 'Input By Label Name' with value 'DBL NO FORMAT' has text '<Text8>'
	And the user validates that 'Input By Label Name' with value 'DATE CONTROL' has text '<Text9>'

	And the user validates that the checkbox container 'sm1-tr contianer' with value 'DBL CHECKBOX' is set to the state: '<False>' 
	And the user validates that the checkbox container 'sm1-tr contianer' with value 'FLAG CONTROL' is set to the state: '<True>'

	When the user enters '<Text10>' in field 'Input By Label Name' with value 'LNG FORMAT1'
	Then the user validates that 'Input By Label Name' with value 'LNG FORMAT1' has text '<Text10>'

	And the user closes all pages without saving the work done where there is no pop up

	Examples: 
	| FilterValue                    | TextBox  | ComboBox  | CheckBox  | Date | Decimal         | Integer         | Text1           | Text2                    | Text3   | Text4  | Text5      | Text6           | Text7         | Text8            | Text9      | TextValue | Text10     | False | True |
	| 000000000000000001621945546021 | text box | combo box | check box | date | numeric decimal | numeric integer | Test text field | % Discount on Order Head | BACIOCK | Monday | 96,545,247 | 96,545,247.3457 | 96,545,247.35 | 96,545,247.34567 | 05/26/2021 | AbcdefG   | 96,545,247 | off   | on   |
