Feature: Sandile
	Test

@mytag
Scenario: Test
	#Step 1
	Given the user has logged in with division '<DIVISION>'

	#Step 2
	When the user is on the 'Promo plan' page
	And the user filters the column by column name 'Promo Plan ID', 'like', '<PROMOPLANID>'
	And the user selects a row by smOneID 'CODCONTRACTOR', 'EC86224'

	And the user validates the 'Product Segment Responsibility Button' is enabled
	And the user clicks on the 'Product Segment Responsibility Button'

	Then the user is on the 'Product Segment Responsibility Matrix' page

	And the user clicks the edit button

	And the user assigns segments to user in responsibility matrix '<PRODLEV>' '<USERNAME>' '<SEGMENT>'

	Examples: 
	|DIVISION                               |  PROMOPLANID    | PRODLEV  | SEGMENT |Description | USERNAME | 
	|AUTOMATION 4 - TPM KA for AUTOM4 SHARED| BA796C2283E141D | Brand    | BREAK   |PRESTIGE    | current   |	