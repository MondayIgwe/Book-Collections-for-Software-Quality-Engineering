Feature: TestCase_787641
	Test Case 787641

@BDD_787641 @SFA_Nightly
Scenario: WEB_SFA_SE_VISIT_005_MEASURES_SHOWN_IN_PRODUCT_ACTIVITY
	Given the user navigates to the 'Visits' page
	When the user filters the column by column name 'Id Visit', 'Like', '<FilterValue>'
	And the user opens the grid item in row '1'
	And the user clicks on 'Side Panel Tab' with value 'Product activity type'

	Then the user validates that the element 'SFA Products Activity Type Columns' with value 'TEXT BOX' is of type '<TextBox>'
	And the user validates that the 'SFA Products Activity Type' multigrid has the value '<Text1>' in the 'TEXT BOX' column in the row number '1'

	And the user validates that the element 'SFA Products Activity Type Columns' with value 'TEXT COMBO BOX' is of type '<ComboBox>'
	And the user validates that the 'SFA Products Activity Type' multigrid has the value '<Text2>' in the 'TEXT COMBO BOX' column in the row number '1'

	And the user validates that the element 'SFA Products Activity Type Columns' with value 'TEXT COMBO EMPTY' is of type '<ComboBox>'
	And the user validates that the 'SFA Products Activity Type' multigrid has the value '<Text3>' in the 'TEXT COMBO EMPTY' column in the row number '1'

	And the user validates that the element 'SFA Products Activity Type Columns' with value 'TEXT COMBO SPINNER' is of type '<ComboBox>'
	And the user validates that the 'SFA Products Activity Type' multigrid has the value '<Text4>' in the 'TEXT COMBO SPINNER' column in the row number '1'

	And the user validates that the element 'SFA Products Activity Type Columns' with value 'LNG FORMAT1' is of type '<NumericInteger>'
	And the user validates that the 'SFA Products Activity Type' multigrid has the value '<Text5>' in the 'LNG FORMAT1' column in the row number '1'

	And the user validates that the element 'SFA Products Activity Type Columns' with value 'LNG FORMAT2' is of type '<NumericInteger>'
	And the user validates that the 'SFA Products Activity Type' multigrid has the value '<Text5>' in the 'LNG FORMAT2' column in the row number '1'

	And the user validates that the element 'SFA Products Activity Type Columns' with value 'DBL CHECKBOX' is of type '<CheckBox>'
	And the user validates that the 'SFA Products Activity Type' multigrid has the checkbox cell is marked as '<FalseFlag>' in the 'DBL CHECKBOX' column in the row number '1'

	And the user validates that the element 'SFA Products Activity Type Columns' with value 'DBL FORMAT1' is of type '<NumericDecimal>'
	And the user validates that the 'SFA Products Activity Type' multigrid has the value '<Text6>' in the 'DBL FORMAT1' column in the row number '1'

	And the user validates that the element 'SFA Products Activity Type Columns' with value 'DBL FORMAT2' is of type '<NumericDecimal>'
	And the user validates that the 'SFA Products Activity Type' multigrid has the value '<Text7>' in the 'DBL FORMAT2' column in the row number '1'

	And the user validates that the element 'SFA Products Activity Type Columns' with value 'DBL NO FORMAT' is of type '<NumericDecimal>'
	And the user validates that the 'SFA Products Activity Type' multigrid has the value '<Text8>' in the 'DBL NO FORMAT' column in the row number '1'

	And the user validates that the element 'SFA Products Activity Type Columns' with value 'DATE CONTROL' is of type '<Date>'
	And the user validates that the 'SFA Products Activity Type' multigrid has the value '<Text9>' in the 'DATE CONTROL' column in the row number '1'

	And the user validates that the element 'SFA Products Activity Type Columns' with value 'FLAG CONTROL' is of type '<CheckBox>'
	And  the user validates that the 'SFA Products Activity Type' multigrid has the checkbox cell is marked as '<TrueFlag>' in the 'FLAG CONTROL' column in the row number '1'

	When the user clicks on 'Indexed Row Link' with value containing '1'
	Then the user is on the 'Main Information Tab' page
	And the user closes all pages without saving the work done where there is no pop up
	And the user closes all pages without saving the work done where there is no pop up

	Examples: 
	| FilterValue                    | TextBox  | ComboBox  | CheckBox  | Date | NumericDecimal  | NumericInteger  | Text1 | Text2                    | Text3   | Text4  | Text5      | Text6           | Text7         | Text8            | Text9      | TrueFlag | FalseFlag |
	| 000000000000000210717211740396 | text box | combo box | check box | date | numeric decimal | numeric integer | Test  | % Discount on Order Head | BACIOCK | Monday | 96,545,247 | 96,545,247.3457 | 96,545,247.35 | 96,545,247.34567 | 07/19/2021 | on       | off       |