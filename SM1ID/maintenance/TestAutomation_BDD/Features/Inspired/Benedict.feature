Feature: Disabled date

@Disableddate
Scenario: Disabled date
	#Go to Promo Plan Navigator
	Given the user has logged in with division 'XTEL AUTOMATION 4 - Global Group SM1V4'
	And the user navigates to the 'Promo plan' page
	#Select the Promo Plan for @CUSTOMER and @REFYEAR
	Then the user validates that the 'First Row' is present
	When the user filters the column by column name 'Customer Code', Filter Type 'Like', Value 'EC86166'
	And the user filters the column by column name 'Year of Reference', Filter Type 'Equal', Value '2022'
	And the user opens the grid item in row '1'
	#From Promo Plan Document, Actions\new Create a new Promo with:
	When the user creates a Promo with segment 'Level 3' 'EC86166' '' '' 'FRENCH WINE'
	And the user validates that the date '01/30/2021' is disabled in field 'Validity Period Start Date'
	And the user creates a Promo with segment customerHLevel: '[string]' customerCode: '[string]' confirmLevel: '[string]' refYear: '[string]' productSegment: '[string]'
	And the user creates a Promo with customerHLevel: '[string]' customerCode: '[string]'
	And the user creates a new Promotional What If with description '[string]'
	And the user changes the status to '[string]'
	Then the user validates that the date field '[string]' has '[string]'
	When the user selects validity period from: '[string]' to: '[string]' on the '[string]' field
	And the user selects validity period from: '[string]' to: '[string]' on the '[string]' field
	Then the user validates that the date '01/30/2021' is disabled in field 'Validity Period Start Date'
	When the user checks on 'Mechanics CheckBox' with value '<MECH1>'
	When the user checks the 'Mechanics CheckBox' with value '<MECH1>'
	And the user checks the '[string]' with value '[string]'
	Then the user validates that the user is on the '[string]' page