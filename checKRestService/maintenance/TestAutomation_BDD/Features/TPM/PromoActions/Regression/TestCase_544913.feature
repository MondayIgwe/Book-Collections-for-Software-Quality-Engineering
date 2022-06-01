Feature: TestCase_544913

@BDD_544913 @PROMO_Regression @PromoActions
Scenario: WEB_TPM_SP_PROMODOCUMENT_WEEKLYSPLIT_NEGATIVE_VALUES_NOT_ALLOWED_001
	#Go to "Promo Action" navigator
	#Step 1 - 2
	Given the user navigates to the 'Promotional actions' page

	#Step 3 Create a new promo with:
	When the user creates a Promo with customer Level '<CUSTLEV>' customerCode: '<CUSTOMER>' confirmLevel: '<CONFIRMATIONLEVEL>'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '' sellOutEnd: '' mechanics: '<MECHANICS>'
	And the user clicks on side panel 'Products'
	And the user adds a product with productLevel: 'Product' productCodes: '<PROD1>'
	And the user adds a product with productLevel: 'Product' productCodes: '<PROD2>'
	And the user adds a product with productLevel: 'Display' productCodes: '<DISPLAY>'
	#Step 4 Go to Weekly Split tab
	And the user clicks on top panel 'Weekly Split'
	#5 Try to set a negative value for a weight (e.g. @negativeValue)  on the Aggregated Row related to the Family
	And the user enters '<negativeValue>' on Weekly Split column name 'W 1' for product code 'Family - 01 - ITALIAN WHITE (Default)' and row 'Weight'
	And the user moves the focus away from the element
	#A message is shown: @errorMessage and the weight is not changed
	Then the user validates that the element 'Main Toolbar Error Message Field' has text '<errorMessage>'
	And user validates that all products rowName: 'Weight' for column 'W 1' are set to '33.333'
	#6 Wait that the message disappears 
	And the user validates that the 'Text' with value '<errorMessage>' is not displayed
	#7 Try to set a negative value for a weight (e.g. @negativeValue)  on the a Row related to a product
	When the user enters '<negativeValue>' on Weekly Split column name 'W 1' for product code 'Product - 001 - BACCO ALBANA 0,75 lt' and row 'Weight'
	And the user moves the focus away from the element
	#A message is shown: @errorMessage and the weight is not changed
	Then the user validates that the element 'Main Toolbar Error Message Field' has text '<errorMessage>'
	And user validates that all products rowName: 'Weight' for column 'W 1' are set to '33.333'
    #8 Wait that the message disappears
	And the user validates that the 'Text' with value '<errorMessage>' is not displayed
    #9 Try to set a negative value for a weight (e.g. @negativeValue)  on the Aggregated Row related to the Display
	When the user enters '<negativeValue>' on Weekly Split column name 'W 1' for product code 'D001 - DISPLAY COCKTAIL' and row 'Weight'
	And the user moves the focus away from the element
	# A message is shown: @errorMessage and the weight is not changed
	Then the user validates that the element 'Main Toolbar Error Message Field' has text '<errorMessage>'
	And user validates that all products rowName: 'Weight' for column 'W 1' are set to '33.333'
	#10 Wait that the message disappears
	And the user validates that the 'Text' with value '<errorMessage>' is not displayed
	#11 Try to set a negative value for a weight (e.g. -50)  on the Aggregated Row related to the component of the  Display
	When the user enters '<negativeValue>' on Weekly Split column name 'W 1' for product code 'Product - 054 - ATENA WHITE GRAPPA 0.7 lt' and row 'Weight'
	And the user moves the focus away from the element
	# A message is shown: @errorMessage and the weight is not changed
	Then the user validates that the element 'Main Toolbar Error Message Field' has text '<errorMessage>'
	And user validates that all products rowName: 'Weight' for column 'W 1' are set to '33.333'
	#12 Close Promo W/O saving
	When the user closes all pages without saving the work done


Examples:
	| CUSTLEV | CUSTOMER | MECHANICS     | CONFIRMATIONLEVEL | SELLINSTART | SELLINEND | DESCRIPTION                   | PROD1 | PROD2 | DISPLAY | negativeValue | errorMessage                            |
	| Level 5 | EC86162  | TPR in Rate " | Holder level      | d+1/m/y     | d+15/m/y  | Weekly Split In Template Test | 001   | 002   | D001    | -50           | Negative weight values are not allowed! |
