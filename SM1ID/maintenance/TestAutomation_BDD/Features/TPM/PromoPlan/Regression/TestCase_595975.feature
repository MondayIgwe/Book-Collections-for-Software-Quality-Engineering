Feature: TestCase_595975

@BDD_595975 @PROMO_Regression @PromoActions
Scenario: WEB_TPM_SP_PROMODOCUMENT_WEEKLYSPLIT_IN_PROMOTION_CREATED_IN_PROMO_PLAN
	#1 Login to the promo and go to Default Weekly Split Drivers 
	Given the user navigates to the 'Default Week Split Driver' page
	When the user filters the column by column name 'Code', Filter Type 'Like', Value '<CUSTOMER>'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	#For @CUSTOMER Configure for @Family 10 - @WEEK
	And the user select value '<Family>' from dropdown list 'ACTIVE ATTRIBUTE'
	And the user enters '<Week1>' on Weekly Split driver for promo week row 'W1' and promo week column '3 Weeks'
	And the user moves the focus away from the element
	And the user enters '<Week2>' on Weekly Split driver for promo week row 'W2' and promo week column '3 Weeks'
	And the user moves the focus away from the element
	And the user enters '<Week3>' on Weekly Split driver for promo week row 'W3' and promo week column '3 Weeks'
	And the user moves the focus away from the element
	#3 Save and close
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#4 Go to Promo plan navigator
	And the user navigates to the 'Promo plan' page
	#5 Create a new promo:
	And the user filters the column by column name 'Customer Code', Filter Type 'Like', Value '<CUSTOMER>'
	And the user filters the column by column name 'Year of Reference', Filter Type 'Equal', Value '<REFYEAR>'
	And the user opens the grid item in row '1'
	Then the user validates that the Loading Mask is not present
	When the user creates a Promo with customerHLevel: '<CUSTLEV>' customerCode: '<CUSTOMER>'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '' sellOutEnd: '' mechanics: '<MECHANICS>'
	And the user adds a product with productLevel: 'Family' productCodes: '<ProdCode>'
	#6 Go to Products\Weekly Split tab
	And the user clicks on top panel 'Weekly Split'
	#Weights are automatically set to @WEEK (70, 20, 10)
	Then user validates that product code 'Family - 10 - RUM (Default)' with row 'Weight' for column 'W 1' is set to '<Week1>'
	And user validates that product code 'Family - 10 - RUM (Default)' with row 'Weight' for column 'W 2' is set to '<Week2>'
	And user validates that product code 'Family - 10 - RUM (Default)' with row 'Weight' for column 'W 3' is set to '<Week3>'
	#7 In the Aggregation row change the values: @NEW_WEEK
	When the user enters '<NEW_WEEK1>' on Weekly Split column name 'W 1' for product code 'Family - 10 - RUM (Default)' and row 'Weight'
	And the user enters '<NEW_WEEK2>' on Weekly Split column name 'W 2' for product code 'Family - 10 - RUM (Default)' and row 'Weight'
	And the user enters '<NEW_WEEK3>' on Weekly Split column name 'W 3' for product code 'Family - 10 - RUM (Default)' and row 'Weight'
	#8 Click on Reset to default split
	And the user clicks on 'Button Link' with value 'Reset to default split'
	And the user clicks on the 'Alert Dialog Yes Button'
	#Weights are automatically set to @WEEK (70, 20, 10)
	Then user validates that product code 'Family - 10 - RUM (Default)' with row 'Weight' for column 'W 1' is set to '<Week1>'
	And user validates that product code 'Family - 10 - RUM (Default)' with row 'Weight' for column 'W 2' is set to '<Week2>'
	And user validates that product code 'Family - 10 - RUM (Default)' with row 'Weight' for column 'W 3' is set to '<Week3>'
	#Close Promo W/O saving
	When the user closes all pages without saving the work done


Examples:
	| CUSTOMER | Family   | ProdCode | Week1  | Week2  | Week3  | CUSTLEV | MECHANICS | SELLINSTART    | SELLINEND      | DESCRIPTION        | NEW_WEEK1 | NEW_WEEK2 | NEW_WEEK3 | REFYEAR |
	| EC86235  | 10 - RUM | 10       | 70.000 | 20.000 | 10.000 | Level 3 | TPR in %  | Next Monday +0 | Next Sunday +3 | Weekly Split in PP | 50.000    | 40.000    | 10.000    | 2020    |